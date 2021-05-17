#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim w as WindowsShortCutMBS
		  dim f as FolderItem
		  
		  if targetwin32 then
		    
		    MsgBox "YOU must remove this msgbox and change the link in the source code!"
		    
		    f=SpecialFolder.Desktop.TrueChild("sol.exe.lnk") // you need to change this!
		    
		    if f=nil or f.Exists=false then // cancel
		      quit
		    end if
		    
		    MsgBox f.NativePath
		    
		    w=new WindowsShortCutMBS
		    
		    w.Location=f.NativePath
		    
		    if w.ResolveShortCut then
		      MainWindow.showlink w
		    else
		      msgBox "Failed to resolve shortcut."
		      quit
		    end if
		    
		  else
		    MsgBox "This example is only for Windows."
		    quit
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
