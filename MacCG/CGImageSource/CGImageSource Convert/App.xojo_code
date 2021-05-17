#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'test "CMYKImage.tif"
		  test "test.jpg"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Convert(img as CGImageMBS, colorspace as CGColorSpaceMBS) As CGImageMBS
		  Const BitsPerComponent = 8
		  
		  Dim NumberOfComponents As Integer = colorspace.NumberOfComponents
		  
		  Dim AlphaInfo As Integer 
		  If NumberOfComponents = 1 Then
		    AlphaInfo = img.kCGImageAlphaNone
		  Else
		    AlphaInfo = img.kCGImageAlphaPremultipliedFirst
		    NumberOfComponents = 4
		  End If
		  
		  Dim RowBytes As Integer =  ((img.Width * BitsPerComponent * NumberOfComponents) + 7) /8
		  
		  // align to 8 bytes
		  While RowBytes Mod 8 <> 0
		    RowBytes = RowBytes + 1
		  Wend
		  
		  Dim bitmap As CGBitmapContextMBS = CGBitmapContextMBS.Create(Nil, img.Width, img.Height, BitsPerComponent, 0, ColorSpace, AlphaInfo)
		  
		  // draw old in new, which converts
		  bitmap.DrawPicture(img, CGMakeRectMBS(0, 0, img.Width, img.Height))
		  
		  Dim image As CGImageMBS = bitmap.CreateImage
		  
		  
		  Return image
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test(name as string)
		  
		  Dim fi As FolderItem = SpecialFolder.desktop.child(name)
		  If Not fi.Exists Then
		    Break
		    MsgBox "No such file on desktop: "+fi.name
		    Return
		  End If
		  
		  Dim options As New Dictionary
		  
		  // load image
		  Dim ci As New CGImageSourceMBS(fi, options)
		  
		  // get as Xojo picture
		  Dim img As CGImageMBS = ci.CreateImageAtIndex(0, options)
		  Dim metadata As Dictionary = ci.PropertiesAtIndex(0)
		  Dim pic As Picture = img.Picture
		  Dim type As String = ci.Type
		  Dim col As CGColorSpaceMBS = img.ColorSpace
		  
		  MainWindow.Title = fi.name + "  " + col.Name
		  MainWindow.Backdrop = pic
		  
		  
		  
		  // save with same type
		  Dim fo1 As FolderItem = SpecialFolder.Desktop.Child("copy "+fi.name)
		  Dim cd1 As CGImageDestinationMBS = CGImageDestinationMBS.CreateWithFile(fo1, ci.Type)
		  
		  cd1.AddImageFromSource(ci, 0, options)
		  If Not cd1.Finalize Then
		    MsgBox "Failed to write. "+fo1.Name
		  Else
		    'MsgBox "OK"
		  End If
		  
		  
		  Dim RGBColorSpace  As CGColorSpaceMBS = CGColorSpaceMBS.CreateWithName(CGColorSpaceMBS.kCGColorSpaceGenericRGB)
		  Dim GrayColorSpace As CGColorSpaceMBS = CGColorSpaceMBS.CreateWithName(CGColorSpaceMBS.kCGColorSpaceGenericGray)
		  Dim CMYKColorSpace As CGColorSpaceMBS = CGColorSpaceMBS.CreateWithName(CGColorSpaceMBS.kCGColorSpaceGenericCMYK)
		  
		  Dim RGBImage  As CGImageMBS
		  Dim GrayImage As CGImageMBS
		  Dim CMYKImage As CGImageMBS
		  
		  Select Case col.Model
		  Case col.kCGColorSpaceModelRGB
		    RGBImage = img
		    GrayImage = Convert(img, GrayColorSpace)
		    CMYKImage = Nil 
		  Case col.kCGColorSpaceModelCMYK
		    CMYKImage = img
		    GrayImage = Convert(img, GrayColorSpace)
		    RGBImage  = Convert(img, RGBColorSpace)
		  Case col.kCGColorSpaceModelMonochrome
		    GrayImage = img
		    RGBImage  = Convert(img, RGBColorSpace)
		    CMYKImage = Nil 
		  Else
		    Break
		  End Select
		  
		  
		  
		  
		  
		  // save with same type, but RGB
		  Dim fo2 As FolderItem = SpecialFolder.Desktop.Child("rgb "+fi.name)
		  Dim cd2 As CGImageDestinationMBS = CGImageDestinationMBS.CreateWithFile(fo2, ci.Type)
		  
		  metadata.Value(CGImageSourceMBS.kCGImagePropertyColorModel) = CGImageSourceMBS.kCGImagePropertyColorModelRGB
		  
		  cd2.AddImage(RGBImage, metadata)
		  If Not cd2.Finalize Then
		    MsgBox "Failed to write. "+fo2.Name
		  Else
		    'MsgBox "OK"
		  End If
		  
		  
		  
		  
		  // save with same type, but Gray
		  Dim fo3 As FolderItem = SpecialFolder.Desktop.Child("gray "+fi.name)
		  Dim cd3 As CGImageDestinationMBS = CGImageDestinationMBS.CreateWithFile(fo3, ci.Type)
		  
		  metadata.Value(CGImageSourceMBS.kCGImagePropertyColorModel) = CGImageSourceMBS.kCGImagePropertyColorModelGray
		  
		  cd3.AddImage(GrayImage, metadata)
		  If Not cd3.Finalize Then
		    MsgBox "Failed to write. "+fo3.Name
		  Else
		    'MsgBox "OK"
		  End If
		  
		  
		  // save with same type, but CMYK
		  
		  If CMYKImage <> Nil Then
		    Dim fo5 As FolderItem = SpecialFolder.Desktop.Child("cmyk "+fi.name)
		    Dim cd5 As CGImageDestinationMBS = CGImageDestinationMBS.CreateWithFile(fo5, ci.Type)
		    
		    metadata.Value(CGImageSourceMBS.kCGImagePropertyColorModel) = CGImageSourceMBS.kCGImagePropertyColorModelGray
		    
		    cd5.AddImage(CMYKImage, metadata)
		    If Not cd5.Finalize Then
		      MsgBox "Failed to write. "+fo5.Name
		    Else
		      'MsgBox "OK"
		    End If
		  end if
		  
		  
		  
		  
		  // save with as PNG, but RGB
		  Dim fo4 As FolderItem = SpecialFolder.Desktop.Child(fi.name+".png")
		  Dim cd4 As CGImageDestinationMBS = CGImageDestinationMBS.CreateWithFile(fo4, UTTypeMBS.kUTTypePNG)
		  
		  metadata.Value(CGImageSourceMBS.kCGImagePropertyColorModel) = CGImageSourceMBS.kCGImagePropertyColorModelRGB
		  
		  cd4.AddImage(RGBImage, metadata)
		  If Not cd4.Finalize Then
		    MsgBox "Failed to write. "+fo4.Name
		  Else
		    'MsgBox "OK"
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod


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
