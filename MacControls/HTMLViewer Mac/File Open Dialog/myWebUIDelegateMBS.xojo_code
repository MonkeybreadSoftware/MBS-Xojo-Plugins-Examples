#tag Class
Protected Class myWebUIDelegateMBS
Inherits WebUIDelegateMBS
	#tag Event
		Function runOpenPanelForFileButtonWithResultListener(listener as WebOpenPanelResultListenerMBS, allowMultipleFiles as boolean) As boolean
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  if f = nil then
		    listener.cancel
		  else
		    listener.chooseFilename f.UnixpathMBS
		  end if
		  
		End Function
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
