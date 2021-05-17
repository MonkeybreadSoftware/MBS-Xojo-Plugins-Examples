#tag Class
Protected Class MyWebPolicyDelegateMBS
Inherits WebPolicyDelegateMBS
	#tag Event
		Function decidePolicyForMIMEType(type as string,request as NSURLRequestMBS, frame as WebFrameMBS, decisionListener as WebPolicyDecisionListenerMBS) As boolean
		  Select case type
		    
		    // show html file
		  case "text/html"
		    decisionListener.use
		    Return true
		    
		    // download files and PDFs
		  case "application/octet-stream"
		    decisionListener.download
		    Return true
		  case "application/pdf"
		    decisionListener.download
		    Return true
		    
		  else
		    break
		  end Select
		  
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
