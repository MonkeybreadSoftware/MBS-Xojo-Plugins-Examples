#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  self.AutoQuit = true //  quit app when done
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("input.tif")
		  dim o as FolderItem = SpecialFolder.Desktop.Child("output.jpg")
		  
		  if f.Exists then
		    run f,o
		  else
		    break // Please put grayscale tiff on desktop
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Run(InputFile as FolderItem, OutputFile as FolderItem, outputQuality as integer = 90)
		  // inputFile must be a TIFF image in gray mode. Other modes are not handled.
		  //TiffPictureMBS is used to read TIFF files
		  // LCMS2 is used to convert the image to the sRGB colour space
		  // GMImageMBS is used to resize the image, and can be expanded to add borders, watermarks, etc
		  // JPEGExporterMBS is used to save the JPEG, discarding the ICC profile to reduce file size
		  
		  dim i, rowBytes, pictureWidth, pictureHeight as Integer
		  dim outputPicture as Picture
		  dim convertProfile as Boolean
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
		  if sourceProfile = nil then
		    // read in default profile
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Generic Gray Profile.icc")
		    sourceProfile = LCMS2ProfileMBS.OpenProfileFromFile(f)
		    if sourceProfile = nil then
		      Break
		      MsgBox "Please provide a default gray profile."
		      return
		    end if
		    
		  end if
		  
		  
		  pictureWidth = tiffImporter.Width
		  pictureHeight = tiffImporter.Height
		  
		  
		  // We read the TIFF into a MemoryBlock so that we can convert it later
		  rowBytes = tiffImporter.BytesPerRow
		  rawPictureData = tiffImporter.Scanlines(0, pictureHeight)
		  
		  
		  // Create gray input picture from the MemoryBlock
		  inputBitmap = New LCMS2BitmapMBS( pictureWidth, pictureHeight, LCMS2MBS.kcmsSigGrayData, rowBytes, rawPictureData )
		  // Create RGB output image at same size
		  outputBitmap = New LCMS2BitmapMBS( pictureWidth, pictureHeight, LCMS2MBS.kcmsSigRgbData )
		  // Transform the Gray image to RGB
		  ct = LCMS2TransformMBS.CreateTransform( sourceProfile, sourceProfile.FormatterForColorspace( 1 ), outputProfile, outputProfile.FormatterForColorspace( 1 ), LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, LCMS2MBS.kcmsFLAGS_BLACKPOINTCOMPENSATION )
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
