#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // get a picture
		  dim pic as Picture = LogoMBS(500)
		  dim w as integer = pic.Width
		  dim h as integer = pic.Height
		  
		  dim p1 as new PictureMBS(pic)
		  show p1, "original RGB"
		  
		  // now make it 8bit gray
		  dim p2 as new PictureMBS(w, h, PictureMBS.ImageFormatG)
		  if not p2.CopyPixels(p1, 0, 0, w, h, 0, 0) then
		    Break
		  end if
		  show p2, "gray 8 bit"
		  
		  // now make it 16bit gray
		  dim p3 as new PictureMBS(w, h, PictureMBS.ImageFormatGray16)
		  if not p3.CopyPixels(p2, 0, 0, w, h, 0, 0) then
		    Break
		  end if
		  show p3, "gray 16 bit"
		  
		  // scale up
		  dim p4 as new PictureMBS(w*2, h*2, PictureMBS.ImageFormatGray16)
		  if not p4.Scale(p3, nil, PictureMBS.ScaleCubic, w*2, h*2) then
		    Break
		  end if
		  show p4, "gray 16 bit, scaled to 200%"
		  
		  // scale down
		  dim p5 as new PictureMBS(w/2, h/2, PictureMBS.ImageFormatGray16)
		  if not p5.Scale(p3, nil, PictureMBS.ScaleCubic, w/2, h/2) then
		    Break
		  end if
		  show p5, "gray 16 bit, scaled to 50%"
		  
		  // now make it 8bit gray again
		  dim p6 as new PictureMBS(w, h, PictureMBS.ImageFormatG)
		  if not p6.CopyPixels(p3, 0, 0, w, h, 0, 0) then
		    Break
		  end if
		  show p6, "gray 8 bit again"
		  
		  // invert
		  p3.Invert
		  show p3, "gray 16 bit, inverted"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Show(p as PictureMBS, title as string)
		  dim w as new PicWindow
		  w.Backdrop = p.CopyPicture
		  w.Title = title
		  w.show
		  
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
