#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim f as FolderItem
		  dim p as Picture = LogoMBS(500)
		  
		  f = SpecialFolder.Desktop.Child("test1"+filenamePostfix+".png")
		  call f.SaveAsPNGMBS(p, 0)
		  
		  dim n as new NSImageMBS(p)
		  
		  dim xx as string = n.JPEGRepresentation
		  f = SpecialFolder.Desktop.Child("test2"+filenamePostfix+".png")
		  dim b as BinaryStream = BinaryStream.Create(f,true)
		  b.Write xx
		  b.Close
		  
		  dim x as Picture = n.CopyPicture
		  
		  f = SpecialFolder.Desktop.Child("test3"+filenamePostfix+".png")
		  call f.SaveAsPNGMBS(x, 0)
		  
		  
		End Function
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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
