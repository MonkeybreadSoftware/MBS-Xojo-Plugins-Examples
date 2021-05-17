#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim w as WindowsInternetShortcutMBS
		  
		  w=new WindowsInternetShortcutMBS
		  
		  w.Command=3
		  w.Icon=WindowsSystemFolderMBS.child("shell32.dll").NativePath
		  w.iconID=41
		  w.Location=SpecialFolder.Desktop.child("A new link to explorer.url").NativePath
		  w.URL="http://www.monkeybreadsoftware.de"
		  w.WorkingDirectory=volume(0).NativePath
		  
		  if w.Createinternetshortcut then
		    msgBox "Internet Shortcut created."
		  else
		    msgBox "Failed to create internet shortcut."
		  end if
		  
		  quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
