#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim x as Picture
		  dim f as FolderItem
		  dim p as Picture = LogoMBS(500)
		  dim m as Picture = p.Mask
		  dim g as Graphics = m.Graphics
		  
		  g.forecolor = &cFFFFFF
		  g.fillrect 0,0,500,500
		  g.forecolor = &c000000
		  g.filloval 0,0,500,500
		  
		  f = SpecialFolder.Desktop.Child("testmask1"+filenamePostfix+".png")
		  call f.SaveAsPNGMBS(p, 0)
		  
		  dim n as new NSImageMBS(p,m)
		  
		  dim xx as string = n.PNGRepresentation
		  f = SpecialFolder.Desktop.Child("testmask2"+filenamePostfix+".png")
		  dim b as BinaryStream = BinaryStream.Create(f,true)
		  b.Write xx
		  b.Close
		  
		  x = n.CopyPicture
		  
		  f = SpecialFolder.Desktop.Child("testmask3"+filenamePostfix+".png")
		  call f.SaveAsPNGMBS(x, 0)
		  
		  x = n.CopyMask
		  f = SpecialFolder.Desktop.Child("testmask4"+filenamePostfix+".png")
		  call f.SaveAsPNGMBS(x, 0)
		  
		  x = n.CopyPictureWithMask
		  f = SpecialFolder.Desktop.Child("testmask5"+filenamePostfix+".png")
		  call f.SaveAsPNGMBS(x, 0)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function filenamePostfix() As string
		  dim name as string = "-"+RBVersionString
		  
		  if TargetCocoa then
		    name = name + "-Cocoa"
		  else
		    name = name + "-Carbon"
		  end if
		  
		  if TargetConsole then
		    name = name + "-Console"
		  else
		    name = name + "-GUI"
		  end if
		  
		  if TargetX86 then
		    name = name + "-x86"
		  else
		    name = name + "-PPC"
		  end if
		  
		  Return name
		  
		End Function
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
