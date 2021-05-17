#tag Class
Protected Class MyNSAppleEventHandlerMBS
Inherits NSAppleEventHandlerMBS
	#tag Event
		Sub handleAppleEvent(theEvent as NSAppleEventDescriptorMBS, replyEvent as NSAppleEventDescriptorMBS)
		  
		  // get direct parameter
		  dim p as NSAppleEventDescriptorMBS = theEvent.paramDescriptorForKeyword("----")
		  
		  MsgBox CurrentMethodName+": "+p.stringValue
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
