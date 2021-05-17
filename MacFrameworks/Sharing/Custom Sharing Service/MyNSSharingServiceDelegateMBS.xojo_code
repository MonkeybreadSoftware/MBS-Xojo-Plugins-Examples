#tag Class
Protected Class MyNSSharingServiceDelegateMBS
Inherits NSSharingServiceDelegateMBS
	#tag Event
		Sub didFailToShareItems(service as NSSharingServiceMBS, items as NSSharingServiceItemsMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didShareItems(service as NSSharingServiceMBS, items as NSSharingServiceItemsMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub willShareItems(service as NSSharingServiceMBS, items as NSSharingServiceItemsMBS)
		  System.DebugLog CurrentMethodName
		  
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
