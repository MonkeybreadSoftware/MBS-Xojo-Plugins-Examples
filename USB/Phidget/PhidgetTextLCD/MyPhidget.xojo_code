#tag Class
Protected Class MyPhidget
Inherits PhidgetTextLCDMBS
	#tag Event
		Sub Attach()
		  
		  window1.ListBox1.AddRow "Attached"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Detach()
		  
		  window1.ListBox1.AddRow "Detached"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(errorCode as integer, errorDescription as string)
		  window1.ListBox1.AddRow "Error "+str(errorCode)+": "+errorDescription
		  
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
