#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Self.AutoQuit = True //  quit app when done
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("LABcolorchart.tif")
		  dim o as FolderItem = SpecialFolder.Desktop.Child("output.jpg")
		  
		  if f.Exists then
		    run f,o
		  else
		    break // Please put lab tiff on desktop
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Run(InputFile as FolderItem, OutputFile as FolderItem, outputQuality as integer = 90)
		  // inputFile must be a TIFF image in gray mode. Other modes are not handled.
		  // TiffPictureMBS is used to read TIFF files
		  // LCMS2 is used to convert the image to the sRGB colour space
		  // JPEGExporterMBS is used to save the JPEG, discarding the ICC profile to reduce file size
		  
		  dim i, rowBytes, pictureWidth, pictureHeight as Integer
		  dim outputPicture as Picture
		  dim convertProfile, sourceCMYK as Boolean
		  dim rawPictureData, rawPictureRowData as MemoryBlock
		  dim jpegExporter as JPEGExporterMBS
		  dim tiffImporter as TiffPictureMBS
		  dim ct as LCMS2TransformMBS
		  dim sourceProfile, outputProfile as LCMS2ProfileMBS
		  dim inputBitmap, outputBitmap as LCMS2BitmapMBS
		  
		  if inputFile = Nil then Return
		  if not inputFile.Exists then Return
		  if outputFile = Nil then Return
		  
		  convertProfile = True
		  outputProfile = LCMS2ProfileMBS.CreateSRGBProfile
		  
		  
		  // Use TiffPictureMBS to read the image
		  
		  tiffImporter = New TiffPictureMBS
		  tiffImporter.YieldTicks = 1
		  if not tiffImporter.Open( inputFile ) then
		    MsgBox( "Unable to open TIFF: "+inputFile.Name )
		    Return
		  end if
		  
		  // Read the ICC profile from the image
		  sourceProfile = LCMS2ProfileMBS.OpenProfileFromMemory( tiffImporter.GetColorProfile )
		  If sourceProfile = Nil Then
		    
		    If True Then
		      // generate one
		      sourceProfile = LCMS2ProfileMBS.CreateLab2Profile
		      
		    else
		      // read in default profile
		      Dim f As FolderItem = SpecialFolder.Desktop.Child("Generic Lab Profile.icc")
		      sourceProfile = LCMS2ProfileMBS.OpenProfileFromFile(f)
		      If sourceProfile = Nil Then
		        Break
		        MsgBox "Please provide a default Lab profile."
		        Return
		      End If
		    end if
		  End If
		  
		  
		  pictureWidth  = tiffImporter.Width
		  pictureHeight = tiffImporter.Height
		  
		  Dim BitsPerSample   As Integer = tiffImporter.BitsPerSample
		  Dim SamplesPerPixel As Integer = tiffImporter.SamplesPerPixel
		  Dim PlanarConfig    As Integer = tiffImporter.PlanarConfig
		  
		  If SamplesPerPixel <> 3 Then
		    Break // lab must have 3
		  End If
		  
		  // We read the TIFF into a MemoryBlock so that we can convert it later
		  rowBytes = tiffImporter.BytesPerRow
		  rawPictureData = tiffImporter.Scanlines(0, pictureHeight)
		  
		  
		  // Lab are differently encoded in Tiff, so change for LCMS
		  Dim h As Integer = pictureHeight - 1
		  Dim w As Integer = pictureWidth - 1 
		  For y As Integer = 0 To h
		    Dim o As Integer = y * rowBytes
		    
		    For x As Integer = 0 To w
		      Dim v As Integer
		      o = o + 1
		      
		      v = rawPictureData.Int8Value(o)
		      rawPictureData.UInt8Value(o) = v + 128
		      
		      o = o + 1
		      
		      v = rawPictureData.Int8Value(o)
		      rawPictureData.UInt8Value(o) = v + 128
		      
		      o = o + 1
		    Next
		  Next
		  
		  
		  // Create Lab input picture from the MemoryBlock
		  inputBitmap = New LCMS2BitmapMBS( pictureWidth, pictureHeight, LCMS2MBS.kcmsSigLabData, rowBytes, rawPictureData )
		  // Create RGB output image at same size
		  outputBitmap = New LCMS2BitmapMBS( pictureWidth, pictureHeight, LCMS2MBS.kcmsSigRgbData )
		  
		  // Transform the Lab image to RGB
		  Dim InputFormat  As Integer = sourceProfile.FormatterForColorspace( 1 )
		  Dim OutputFormat As Integer = outputProfile.FormatterForColorspace( 1 )
		  
		  ct = LCMS2TransformMBS.CreateTransform( sourceProfile, InputFormat, outputProfile, OutputFormat, LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, LCMS2MBS.kcmsFLAGS_BLACKPOINTCOMPENSATION )
		  if ct.Transform( inputBitmap, outputBitmap ) then
		    // ok
		  else
		    MsgBox( "Unable to convert color profile: "+inputFile.Name )
		    Return
		  end if
		  
		  
		  // Set up exporter
		  jpegExporter = New JPEGExporterMBS
		  jpegExporter.File = outputFile
		  jpegExporter.ProfileData = outputProfile.SaveProfileToString
		  jpegExporter.Quality = outputQuality
		  jpegExporter.ExportRGB(outputBitmap.Data, outputBitmap.Width, outputBitmap.Height, outputBitmap.RowBytes)
		  
		  
		  MsgBox "OK"
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
