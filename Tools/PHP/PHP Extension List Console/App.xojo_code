#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  Start
		  
		  
		End Function
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

	#tag Method, Flags = &h1
		Protected Sub Start()
		  dim f as FolderItem
		  
		  if TargetWin32 then
		    f=FindFile("php5ts.dll")
		  elseif TargetMachO then
		    f=FindFile("libphp5.mac.dylib")
		  elseif TargetLinux then
		    if Target64Bit then
		      f=FindFile("libphp5.linux64.so")
		    else
		      f=FindFile("libphp5.linux32.so")
		    end if
		  else
		    MsgBox "Unsupported Platform."
		    quit
		  end if
		  
		  if not PHPMBS.LoadLibrary(f) then
		    MsgBox "Failed to load php library."
		  end if
		  
		  
		  p = new MYPHP
		  if p.Inited then
		    update
		    
		    dim n as Boolean
		    // better NativePath or UnixPathMBS here!
		    
		    n = p.LoadExtension("ext/php_soap.dll")
		    
		    if n then
		      MsgBox "Loaded extension"
		      
		      update
		    else
		      MsgBox "Failed to load extension."
		    end if
		    
		    
		  else
		    MsgBox "Failed to initialize."
		    quit(1)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub update()
		  p.out=""
		  
		  call p.Run "print_r(get_loaded_extensions());"
		  
		  print ReplaceLineEndings(p.out,EndOfLine)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p As MyPHP
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
