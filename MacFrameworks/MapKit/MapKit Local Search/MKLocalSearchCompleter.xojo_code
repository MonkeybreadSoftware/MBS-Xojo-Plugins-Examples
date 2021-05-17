#tag Class
Protected Class MKLocalSearchCompleter
Inherits MKLocalSearchCompleterMBS
	#tag Event
		Sub DidFailWithError(error as NSErrorMBS)
		  ErrorLabel.text = error.LocalizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateResults()
		  Dim results() As MKLocalSearchCompletionMBS = Self.results
		  
		  ' SuggestionsList.DeleteAllRows 
		  
		  If results <> Nil Then
		    
		    For Each item As MKLocalSearchCompletionMBS In results
		      
		      SuggestionsList.AddRow item.title, item.subtitle
		      SuggestionsList.RowTag(SuggestionsList.LastIndex) = item
		      
		    Next
		    
		  End If
		  
		  ErrorLabel.text = ""
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ErrorLabel As label
	#tag EndProperty

	#tag Property, Flags = &h0
		SuggestionsList As listbox
	#tag EndProperty


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
