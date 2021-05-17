#tag Class
Protected Class MyNSMetadataQueryMBS
Inherits NSMetadataQueryMBS
	#tag Event
		Sub DidFinishGathering(n as NSNotificationMBS)
		  
		  me.disableUpdates
		  
		  // got some data
		  dim list as listbox = MainWindow.List
		  
		  List.AddRow "Search finished."
		  
		  dim items() as NSMetadataItemMBS = me.results
		  List.AddRow str(UBound(items)+1)+" items found"
		  
		  for each item as NSMetadataItemMBS in items
		    list.AddRow item.DisplayName+", "+item.FileName+", "+str(item.FileSize/1000, "0")+" KB"
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidStartGathering(n as NSNotificationMBS)
		  // search started
		  MainWindow.List.AddRow "Search started."
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
