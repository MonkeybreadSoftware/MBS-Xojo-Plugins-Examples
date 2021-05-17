#tag Window
Begin Window wConvertImage
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   140
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   640161127
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Convert Image to RGB JPEG"
   Visible         =   True
   Width           =   360
   Begin PushButton pbConvertImage
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Convert Image to RGB JPEG"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   64
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   60
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   233
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub generateRGBJPEG(inputFile as FolderItem, outputFile as FolderItem, outputSize as Integer, Optional dontScaleUp as Boolean = False, Optional outputQuality as Integer = 60)
		  // inputFile must be a JPEG or TIFF image in either RGB or CMYK mode. Other modes (e.g. greyscale) are not handled.
		  // JPEGImporterMBS is used to read JPEG files, TiffPictureMBS is used to read TIFF files
		  // LCMS2 is used to convert the image to the sRGB colour space
		  // GMImageMBS is used to resize the image, and can be expanded to add borders, watermarks, etc
		  // JPEGExporterMBS is used to save the JPEG, discarding the ICC profile to reduce file size
		  
		  dim sourceFormat as String
		  dim i, rowBytes, pictureWidth, pictureHeight as Integer
		  dim outputPicture as Picture
		  dim convertProfile, sourceCMYK as Boolean
		  dim rawPictureData, rawPictureRowData as MemoryBlock
		  dim jpegImporter as JPEGImporterMBS
		  dim jpegExporter as JPEGExporterMBS
		  dim tiffImporter as TiffPictureMBS
		  dim gmImage as GMImageMBS
		  dim ct as LCMS2TransformMBS
		  dim sourceProfile, outputProfile as LCMS2ProfileMBS
		  dim inputBitmap, outputBitmap as LCMS2BitmapMBS
		  
		  if inputFile = Nil then Return
		  if not inputFile.Exists then Return
		  if outputFile = Nil then Return
		  
		  convertProfile = True
		  outputProfile = LCMS2ProfileMBS.CreateSRGBProfile
		  
		  if (inputFile.NameExtensionMBS = "jpeg") or (inputFile.NameExtensionMBS = "jpg") then
		    sourceFormat = "JPEG"
		    
		    // Use jpegImporterMBS to read the image
		    jpegImporter = New JPEGImporterMBS
		    try
		      jpegImporter.YieldTicks = 1
		      jpegImporter.ReadMarkers = True
		      jpegImporter.ReadProfileData = True
		      jpegImporter.File = inputFile
		      jpegImporter.Import
		    catch err
		      if err isa OutOfMemoryException then
		        MsgBox( "Couldn't read image from JPEG because we ran out of memory: "+inputFile.Name )
		        Return
		      end if
		    end try
		    if jpegImporter.Picture = Nil then
		      MsgBox( "Couldn't read image from JPEG: "+inputFile.Name )
		      Return
		    end if
		    pictureWidth = jpegImporter.Width
		    pictureHeight = jpegImporter.Height
		    
		    // Read the ICC profile from the image
		    sourceProfile = LCMS2ProfileMBS.OpenProfileFromMemory( jpegImporter.ProfileData )
		    sourceCMYK = ((jpegImporter.ColorSpace = jpegImporter.ColorSpaceCMYK) or (jpegImporter.ColorSpace = jpegImporter.ColorSpaceYCCK))
		    if sourceCMYK then 
		      // We have to read the TIFF into a MemoryBlock so that we can convert it from CMYK to RGB later on
		      jpegImporter.Mode = jpegImporter.ModeRaw
		      jpegImporter.Import
		      rawPictureData = jpegImporter.PictureData
		      pictureWidth = jpegImporter.Width
		      pictureHeight = jpegImporter.Height
		      rawPictureData.InvertBytesMBS( 0, rawPictureData.size )  // Swap bytes
		    else  // Assume that the image is RGB and pass it to GraphicsMagick
		      gmImage = New GMImageMBS( jpegImporter.Picture )
		    end if
		    
		    
		  elseif (inputFile.NameExtensionMBS = "tiff") or (inputFile.NameExtensionMBS = "tif") then
		    sourceFormat = "TIFF"
		    
		    // Use TiffPictureMBS to read the image
		    try
		      tiffImporter = New TiffPictureMBS
		      tiffImporter.YieldTicks = 1
		      if not tiffImporter.Open( inputFile ) then
		        MsgBox( "Unable to open TIFF: "+inputFile.Name )
		        Return
		      end if
		      if not tiffImporter.ReadRGB then
		        MsgBox( "Unable to read TIFF: "+inputFile.Name )
		        Return
		      end if
		      pictureWidth = tiffImporter.Width
		      pictureHeight = tiffImporter.Height
		      
		      // Read the ICC profile from the image
		      sourceProfile = LCMS2ProfileMBS.OpenProfileFromMemory( tiffImporter.GetColorProfile )
		      
		      if tiffImporter.SamplesPerPixel = 4 then  // It looks like we've got a CMYK image
		        sourceCMYK = True
		        // We have to read the TIFF into a MemoryBlock so that we can convert it from CMYK to RGB later on
		        rowBytes = tiffImporter.BytesPerRow
		        rawPictureData = New MemoryBlock( pictureHeight * rowBytes )
		        for i=0 to pictureHeight -1
		          rawPictureRowData = tiffImporter.Scanline( i )
		          rawPictureData.StringValue( i * rowBytes, rowBytes ) = rawPictureRowData
		        next
		      else  // Assume that the image is RGB and pass it to GraphicsMagick
		        gmImage = new GMImageMBS( tiffImporter.Pict )
		      end if
		    catch err
		      if err isa OutOfMemoryException then
		        MsgBox( "Couldn't read image from TIFF because we ran out of memory: "+inputFile.Name )
		        Return
		      end if
		    end try
		    
		  else
		    Return  // Not a file extension that we can work with.
		  end if
		  
		  if convertProfile and (sourceProfile <> Nil) then  // Convert the image to sRGB
		    if sourceCMYK then  // Use LCMS2 with a MemoryBlock to convert the image from CMYK to an RGB image in the sRGB colourspace
		      rowBytes = pictureWidth * 4
		      // Create CMYK input picture from the MemoryBlock
		      inputBitmap = New LCMS2BitmapMBS( pictureWidth, pictureHeight, LCMS2MBS.kcmsSigCMYKData, rowBytes, rawPictureData )
		      // Create RGB output image at same size
		      outputBitmap = New LCMS2BitmapMBS( pictureWidth, pictureHeight, LCMS2MBS.kcmsSigRgbData )
		      // Transform the CMYK image to RGB
		      ct = LCMS2TransformMBS.CreateTransform( sourceProfile, sourceProfile.FormatterForColorspace( 1 ), outputProfile, outputProfile.FormatterForColorspace( 1 ), LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, 0 )
		      if ct.Transform( inputBitmap, outputBitmap ) then
		        gmImage = New GMImageMBS( outputBitmap.Picture )
		        outputBitmap = Nil
		        inputBitmap = Nil
		      else
		        MsgBox( "Unable to convert colour profile: "+inputFile.Name )
		      end if
		    else  // Assume RGB, so a straightforward conversion to the sRGB colourspace
		      ct = LCMS2TransformMBS.CreateTransform( sourceProfile, sourceProfile.FormatterForColorspace(1, false), outputProfile, outputProfile.FormatterForColorspace(1, false), 1 )  // 1 = relative colorimetric intent
		      outputBitmap = New LCMS2BitmapMBS( gmImage.CopyPicture )
		      if ct.Transform( outputBitmap ) then
		        gmImage = New GMImageMBS( outputBitmap.Picture )
		      else
		        MsgBox( "Unable to convert colour profile: "+inputFile.Name )
		      end if
		    end if
		  end if
		  
		  // Resize image
		  if (gmImage.Height > outputSize) or (gmImage.Width > outputSize) or (not dontScaleUp) then  // If the image is larger than the target size, or we're happy to scale it up, scale it down or up to the target size
		    gmImage.Scale( New GMGeometryMBS( outputSize, outputSize ) )
		  end if
		  outputPicture = gmImage.CopyPicture
		  
		  // Set up exporter
		  jpegExporter = New JPEGExporterMBS
		  jpegExporter.File = outputFile
		  jpegExporter.Picture = outputPicture
		  jpegExporter.Quality = outputQuality
		  jpegExporter.Export
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events pbConvertImage
	#tag Event
		Sub Action()
		  dim openDlg as OpenDialog
		  dim saveDlg as New SaveAsDialog
		  dim inputFile, outputFile as FolderItem
		  
		  openDlg = New OpenDialog
		  openDlg.InitialDirectory = SpecialFolder.Desktop
		  openDlg.Title = "Select an RGB or CMYK JPEG or TIFF file"
		  openDlg.MultiSelect = False
		  inputFile = openDlg.ShowModal
		  if inputFile = Nil then Return
		  
		  if (inputFile.NameExtensionMBS <> "jpg") and (inputFile.NameExtensionMBS <> "jpeg") _
		    and (inputFile.NameExtensionMBS <> "tif") and (inputFile.NameExtensionMBS <> "tiff") then
		    MsgBox( "This method only works with JPEG or TIFF files." )
		    Return
		  end if
		  
		  saveDlg.InitialDirectory = inputFile.Parent
		  saveDlg.Title = "Where do you want to save your sRGB JPEG?"
		  saveDlg.SuggestedFileName = "Output sRGB image.jpg"
		  outputFile = saveDlg.ShowModal
		  If outputFile = Nil then Return
		  
		  generateRGBJPEG( inputFile, outputFile, 500 )
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
