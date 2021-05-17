#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const NSColorRenderingDefault = 0
		  const NSColorRenderingAbsoluteColorimetric = 1
		  const NSColorRenderingRelativeColorimetric = 2
		  const NSColorRenderingPerceptual = 3
		  const NSColorRenderingSaturation = 4
		  
		  
		  // pick a file
		  // e.g. CMYK tiff file
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  if f = nil then 
		    quit
		  end if
		  
		  // load picture
		  dim n as new NSImageMBS(f)
		  // get first representation
		  dim reps() as NSImageRepMBS = n.representations
		  
		  // get as bitmap object
		  dim v as Variant = reps(0)
		  dim bitmap as NSBitmapImageRepMBS = v
		  
		  // get target color space
		  Dim sRGBColorSpace as NSColorSpaceMBS = NSColorSpaceMBS.sRGBColorSpace
		  
		  // convert to SRGB
		  dim NewBitmap as NSBitmapImageRepMBS = bitmap.bitmapImageRepByConvertingToColorSpace(sRGBColorSpace, NSColorRenderingDefault)
		  dim NewImage as new NSImageMBS
		  
		  NewImage.addRepresentation NewBitmap
		  
		  // make JPEG
		  dim JPEGData as string = NewImage.JPEGRepresentationWithCompressionFactor(0.9)
		  
		  // and save to file
		  dim ff as FolderItem = GetFolderItem("RGBImage.jpg")
		  dim b as BinaryStream = BinaryStream.Create(ff, true)
		  b.Write JPEGData
		  
		  dim w as new PictureWindow
		  W.Backdrop = NewImage.CopyPictureWithAlpha
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
