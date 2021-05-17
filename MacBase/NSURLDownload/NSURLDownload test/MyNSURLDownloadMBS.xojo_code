#tag Class
Protected Class MyNSURLDownloadMBS
Inherits NSURLDownloadMBS
	#tag Event
		Function canAuthenticateAgainstProtectionSpace(protectionSpace as NSURLProtectionSpaceMBS) As boolean
		  List.AddRow CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub decideDestinationWithSuggestedFilename(filename as string)
		  List.AddRow CurrentMethodName
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child(filename)
		  
		  me.setDestination file, false
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didBegin()
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didCancelAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didCreateDestination(path as string, file as folderitem)
		  List.AddRow CurrentMethodName
		  List.AddRow "path: "+path
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFailWithError(error as NSErrorMBS)
		  List.AddRow CurrentMethodName
		  List.AddRow "Error: "+error.localizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinish()
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveDataOfLength(length as UInt64)
		  List.AddRow CurrentMethodName
		  List.AddRow "length: "+str(length)
		  
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
		Function shouldDecodeSourceDataOfMIMEType(encodingType as string) As boolean
		  List.AddRow CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function shouldUseCredentialStorage() As boolean
		  List.AddRow CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub willResumeWithResponse(response as NSURLResponseMBS, startingByte as Int64)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function willSendRequest(request as NSURLRequestMBS, redirectResponse as NSURLResponseMBS) As NSURLRequestMBS
		  List.AddRow CurrentMethodName
		  List.AddRow "URL: "+request.URL
		  
		  // we don't modify it
		  Return request
		  
		End Function
	#tag EndEvent


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
