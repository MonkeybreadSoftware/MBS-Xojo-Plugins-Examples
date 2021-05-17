#tag Class
Protected Class CarbonApplicationEvents
Inherits CarbonApplicationEventsMBS
	#tag Event
		Sub ApplicationLaunched(ProcessSerial as memoryblock)
		  
		  // An application launched, this is Option-Fkeys for the system preferences or some hacker attack.
		  // Maybe a filter should be added for special applications like spell checking.
		  
		  dim p as new ProcessMBS
		  
		  p.GetCurrentProcess
		  dim x as MemoryBlock = p.MacProcessSerial
		  
		  if x.Int64Value(0) = ProcessSerial.Int64Value(0) then
		    // ourself
		  else
		    
		    p.GetProcess ProcessSerial
		    
		    MainWindow.list.AddRow "Launched: "+p.Name+" ("+p.MacCreator+")"
		    
		    if p.QuitProcess=0 then // quit it.
		      // ok
		    else
		      if p.KillProcess=0 then // else kill it
		        
		      end if
		    end if
		    
		    app.FrontmostMBS=true // move me to front
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ApplicationSwitched(ProcessSerial as memoryblock)
		  #pragma unused ProcessSerial
		  
		  app.FrontmostMBS=true
		  
		  MainWindow.list.AddRow "Switched application"
		End Sub
	#tag EndEvent

	#tag Event
		Sub VolumeMounted(VolumeRefNum as integer, VolumeRoot as FolderItem)
		  #pragma unused VolumeRoot
		  
		  dim i as integer
		  dim c as integer
		  dim f as FolderItem
		  
		  c=VolumeCount-1
		  for i=0 to c
		    f=volume(i)
		    if f.MacVRefNum=VolumeRefNum then
		      // found
		      
		      MainWindow.list.AddRow "Volume mounted."
		      
		      if f.UnMountVolumeMBS=0 then
		        // unmounted
		      end if
		      Return
		    end if
		  next
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
