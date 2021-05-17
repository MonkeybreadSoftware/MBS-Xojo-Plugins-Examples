#tag Class
Protected Class MyWebResourceLoadDelegateMBS
Inherits WebResourceLoadDelegateMBS
	#tag Event
		Function identifierForInitialRequest(request as NSURLRequestMBS, dataSource as WebDataSourceMBS) As string
		  count = count + 1
		  
		  Return str(count)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function willSendRequest(id as string, request as NSURLRequestMBS, redirectResponse as NSURLResponseMBS, dataSource as WebDataSourceMBS) As NSURLRequestMBS
		  window1.List.AddRow "Load "+request.URL
		  
		  Return request
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		count As Integer
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
		#tag ViewProperty
			Name="count"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
