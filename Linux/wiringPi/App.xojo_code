#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  #if not TargetLinux then
		    // this is for Linux ARM
		    break
		  #endif
		  
		  dim f as FolderItem = FindFile("libwiringPi.so.2.25")
		  
		  if WiringPiMBS.LoadLibrary(f) then
		    print "Library loaded"
		  else
		    print "Failed to load library: "+WiringPiMBS.LoadError
		    return 1
		  end if
		  
		  print "micros: "+str(WiringPiMBS.micros)
		  print "millis: "+str(WiringPiMBS.millis)
		  
		  print "BoardRev: "+str(WiringPiMBS.piBoardRev)
		  
		  dim model as Integer
		  dim Rev as Integer
		  dim Mem as Integer
		  dim Maker as Integer
		  dim OverVolted as Integer
		  WiringPiMBS.piBoardId(model, rev, mem, maker, OverVolted)
		  
		  print "Model: "+str(model)
		  print "Rev: "+str(Rev)
		  print "Mem: "+str(Mem)
		  print "Maker: "+str(Maker)
		  print "OverVolted: "+str(OverVolted)
		  
		  print "Model name: "+WiringPiMBS.piModelNames(model)
		  print "Rev name: "+WiringPiMBS.piRevisionNames(rev)
		  print "Maker name: "+WiringPiMBS.piMakerNames(Maker)
		  
		  
		  
		  
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


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
