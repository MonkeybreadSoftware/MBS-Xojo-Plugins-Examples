#tag Class
Protected Class MyNetFSMountMBS
Inherits NetFSMountMBS
	#tag Event
		Sub MountURLAsyncCompleted(status as Integer, URL as String, mountpoints() as String)
		  log CurrentMethodName
		  log "URL: "+url
		  log "Status: "+str(status)
		  
		  for each m as string in MountPoints
		    log m
		  next
		  
		  wheel.Visible = false
		  CancelButton.Enabled = false
		  MountAsyncButton.Enabled = true
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  List.ScrollPosition = List.ListCount
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CancelButton As PushButton
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		MountAsyncButton As PushButton
	#tag EndProperty

	#tag Property, Flags = &h0
		Untitled As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		wheel As ProgressWheel
	#tag EndProperty


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
		#tag ViewProperty
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
