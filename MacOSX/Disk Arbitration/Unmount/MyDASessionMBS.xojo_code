#tag Class
Protected Class MyDASessionMBS
Inherits DASessionMBS
	#tag Event
		Sub Unmounted(disk as DADiskMBS, dissenter as DADissenterMBS)
		  dim dic as Dictionary = disk.Description
		  dim name as string = dic.Value(disk.kDADiskDescriptionVolumeNameKey)
		  
		  if dissenter = nil then
		    MsgBox "Disk "+name+" unmounted."
		  else
		    MsgBox "Failed to unmount disk "+name+EndOfLine+str(dissenter.Status)+": "+dissenter.StatusString
		  end if
		  
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
