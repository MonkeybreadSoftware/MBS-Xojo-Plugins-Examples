#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  if TargetMachO then
		    f=FindFile("Phidget21.framework")
		    
		    if LoadPhidgetFrameworkMBS(f) then
		      ' MsgBox "Framework loaded"
		    else
		      MsgBox "Failed to load framework"
		    end if
		  elseif TargetWin32 then
		    if LoadPhidgetWindowsDLLMBS("Phidget21.dll") then
		      ' MsgBox "DLL loaded"
		    else
		      MsgBox "Failed to load DLL"
		    end if
		  end if
		  
		  // use LoadPhidgetWindowsDLLMBS on Windows
		  // use LoadPhidgetLinuxLibraryMBS on Linux
		  
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
