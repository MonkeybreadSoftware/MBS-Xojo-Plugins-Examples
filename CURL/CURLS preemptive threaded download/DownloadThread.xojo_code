#tag Class
Protected Class DownloadThread
Inherits Thread
	#tag Event
		Sub Run()
		  dim e as integer
		  dim s as string
		  dim f as FolderItem
		  dim b as BinaryStream
		  
		  s=NthField(url,"/",CountFields(url,"/"))
		  
		  f = SpecialFolder.Desktop.Child("CURL Test - "+s)
		  
		  d = new CURLSMBS
		  d.OptionURL=url
		  d.YieldTime=true
		  d.OptionFollowLocation = true
		  d.OptionMaxRedirs = 3
		  d.OptionVerbose=true
		  
		  if not d.CreateMTOutputFile(f) then
		    Break // failed to create output file
		  end if
		  
		  f = SpecialFolder.Desktop.Child("CURL Debug - "+s+".txt")
		  if not d.CreateMTDebugOutputFile(f) then
		    Break // failed to create debug file
		  end if
		  
		  e=d.PerformMT
		  
		  d.CloseMTDebugOutputFile
		  d.CloseMTInputFile
		  
		  if d.Cancel then
		    f.Delete
		  end if
		  
		  
		  DoneMessage = "Finished. "+Format(d.GetInfoSizeDownload/1024,"0")+" kilobytes"
		  DoneMessageNew = true
		  
		  d = nil
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Cancel()
		  if d<>Nil then
		    // if something is running, cancel it
		    d.Cancel = true
		    
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		d As CURLSMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		DoneMessage As string
	#tag EndProperty

	#tag Property, Flags = &h0
		DoneMessageNew As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		listindex As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		url As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="url"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="listindex"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoneMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoneMessageNew"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
