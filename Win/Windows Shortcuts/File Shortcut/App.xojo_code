#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim w as WindowsShortCutMBS
		  
		  w=new WindowsShortCutMBS
		  
		  w.Arguments="c:"
		  w.Command=3
		  w.Icon=WindowsSystemFolderMBS.child("shell32.dll").NativePath
		  w.iconID=41
		  w.Location=SpecialFolder.Desktop.child("A new link to explorer.lnk").NativePath
		  w.Target=WindowsFolderMBS.child("explorer.exe").NativePath
		  w.WorkingDirectory=volume(0).NativePath
		  
		  if w.CreateShortCut then
		    msgBox "Created shortcut."
		  else
		    msgBox "Failed to create shortcut."
		  end if
		  
		  quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
