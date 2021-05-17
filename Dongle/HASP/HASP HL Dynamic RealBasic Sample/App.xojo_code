#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // You get required libraries with HASP HL SDK
		  // Once you created your own libraries, change the names here:
		  
		  dim file as FolderItem
		  
		  #if TargetMacOS then
		    file = FindFile("hasp_darwin_demo.dylib")
		  #elseif TargetWin32 then
		    file = FindFile("hasp_windows_demo.dll")
		  #elseif TargetLinux then
		    file = FindFile("libhasp_linux_demo.so")
		  #endif
		  
		  if HASPHLDMBS.LoadLibrary(file) then
		    // ok
		  else
		    MsgBox "Failed to load library."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
