#tag Class
Protected Class MyCocoaStatusItemMBS
Inherits NSStatusItemMBS
	#tag Event
		Sub Action()
		  System.DebugLog "Statusitem.Action"
		  run
		End Sub
	#tag EndEvent

	#tag Event
		Sub DoubleAction()
		  System.DebugLog "Statusitem.DoubleAction"
		  MsgBox "Double Click!"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub run()
		  dim d as date
		  d=new date
		  window1.Lastclick.text=d.LongTime
		End Sub
	#tag EndMethod


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
