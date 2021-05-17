#tag Class
Protected Class MyQuery
Inherits MDQueryMBS
	#tag Event
		Sub Finish()
		  MainWindow.UpdateTimer.Mode = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Progress(AddedItems() as MDItemMBS, ChangedItems() as MDItemMBS, RemovedItems() as MDItemMBS)
		  MainWindow.UpdateTimer.Mode = 1
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Update(AddedItems() as MDItemMBS, ChangedItems() as MDItemMBS, RemovedItems() as MDItemMBS)
		  MainWindow.UpdateTimer.Mode = 1
		  
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
