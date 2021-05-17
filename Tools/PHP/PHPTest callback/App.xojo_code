#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim n as integer
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
		  
		  dim p as new MYPHP
		  
		  if p.Inited then
		    if p.Run("echo callRealbasic();") then
		      MsgBox "Ok"
		    else
		      MsgBox "fail"
		    end if
		    
		    if p.Run("echo callRealbasic(1.0,2);") then
		      MsgBox "Ok"
		    else
		      MsgBox "fail"
		    end if
		    
		    if p.Run("echo callRealbasic('php','callback');") then
		      MsgBox "Ok"
		    else
		      MsgBox "fail"
		    end if
		    
		    if p.Run("echo callRealbasic(true,2);") then
		      MsgBox "Ok"
		    else
		      MsgBox "fail"
		    end if
		  else
		    MsgBox "Failed to initialize."
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
