#tag Class
Protected Class MyNSEventMonitor
Inherits NSEventMonitorMBS
	#tag Event
		Sub GlobalEvent(e as NSEventMBS)
		  window1.List.AddRow "Global: "+e.description
		  window1.List.ScrollPosition = window1.List.ListCount
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function LocalEvent(e as NSEventMBS) As NSEventMBS
		  window1.List.AddRow "Local: "+e.description
		  window1.List.ScrollPosition = window1.List.ListCount
		  
		  // Return nil to block event
		  
		  Finally
		    
		    // Return event, because else your app can't do anything
		    Return e
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
