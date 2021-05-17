#tag Class
Protected Class MyNSURLConnectionFilterMBS
Inherits NSURLConnectionFilterMBS
	#tag Event
		Function FilterConnection(request as NSURLRequestMBS) As NSURLRequestMBS
		  log CurrentMethodName
		  log "URL: "+request.URL
		  
		  dim newRequest as NSMutableURLRequestMBS = request.mutableCopy
		  
		  
		  // change to 10 minutes
		  newRequest.setTimeoutInterval 600
		  
		  dim oldTimeout as Double =    request.timeoutInterval
		  dim newTimeout as Double = newRequest.timeoutInterval
		  
		  log "oldTimeout: "+str(oldTimeout)
		  log "newTimeout: "+str(newTimeout)
		  
		  return newRequest
		  
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
