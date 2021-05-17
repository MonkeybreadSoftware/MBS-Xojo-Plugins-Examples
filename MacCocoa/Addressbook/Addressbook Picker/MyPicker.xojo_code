#tag Class
Protected Class MyPicker
Inherits ABPickerMBS
	#tag Event
		Sub GroupDoubleClicked()
		  MainWindow.List.InsertRow 0,"Group Double Clicked"
		End Sub
	#tag EndEvent

	#tag Event
		Sub GroupSelectionChanged()
		  MainWindow.List.InsertRow 0,"Group Selection Changed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameDoubleClicked()
		  MainWindow.List.InsertRow 0,"Name Double Clicked"
		End Sub
	#tag EndEvent

	#tag Event
		Sub NameSelectionChanged()
		  MainWindow.List.InsertRow 0,"Name Selection Changed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub ValueSelectionChanged()
		  MainWindow.List.InsertRow 0,"Value Selection Changed"
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
