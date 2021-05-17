#tag Class
Protected Class MyNSURLConnectionMBS
Inherits NSURLConnectionMBS
	#tag Event
		Function canAuthenticateAgainstProtectionSpace(protectionSpace as NSURLProtectionSpaceMBS) As boolean
		  List.AddRow CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub didCancelAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFailWithError(error as NSErrorMBS)
		  List.AddRow CurrentMethodName
		  List.AddRow "Error: "+error.localizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinishLoading()
		  List.AddRow CurrentMethodName
		  
		  dim d as MemoryBlock = me.data
		  if d<>Nil then
		    dim pic as Picture = JPEGStringToPictureMBS(d, true)
		    
		    window1.canvas1.Backdrop = pic
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveData(newData as Memoryblock)
		  List.AddRow CurrentMethodName
		  List.AddRow "length: "+str(Data.Size)
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveResponse(response as NSURLResponseMBS)
		  List.AddRow CurrentMethodName
		  
		  List.AddRow "expectedContentLength: "+str(response.expectedContentLength)
		  List.AddRow "suggestedFilename: "+response.suggestedFilename
		  List.AddRow "MIMEType: "+response.MIMEType
		  List.AddRow "statusCode: "+str(response.statusCode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub didSendBodyData(bytesWritten as Int64, totalBytesWritten as Int64, totalBytesExpectedToWrite as Int64)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function shouldUseCredentialStorage() As boolean
		  List.AddRow CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function willSendRequest(request as NSURLRequestMBS, redirectResponse as NSURLResponseMBS) As NSURLRequestMBS
		  List.AddRow CurrentMethodName
		  List.AddRow "URL: "+request.URL
		  
		  // we don't modify it
		  Return request
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub willSendRequestForAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		data As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
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
