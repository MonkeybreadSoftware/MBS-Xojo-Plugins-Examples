#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim f as FolderItem
		  
		  if TargetWin32 then
		    f=FindFile("php5ts.dll")
		  elseif TargetMachO then
		    f=FindFile("libphp5.mac.dylib")
		  elseif TargetLinux then
		    f=FindFile("libphp5.so")
		  else
		    MsgBox "Unsupported Platform."
		    quit
		  end if
		  
		  if not PHPMBS.LoadLibrary(f) then
		    MsgBox "Failed to load php library."
		  end if
		  
		  dim p1 as new PHPMBS
		  dim p2 as new PHPMBS
		  
		  if p1.Inited and p2.inited then
		    p1.setVariable "test","XojoTest"
		    
		    MsgBox p1.getVariable("test")
		    
		    p1.setVariable "test","XojoTest 2"
		    
		    MsgBox p1.getVariable("test")
		    MsgBox p2.getVariable("test") // same global variables!
		    
		    MsgBox p1.Execute("echo ""Hello World $test"";")
		    
		    MsgBox p1.Execute("echo ""PHP Version: "".phpversion();")
		    
		  else
		    msgBox "Failed to initialize two PHP runtime environments."
		  end if
		  
		  
		  quit
		  
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
