#tag Class
Protected Class CustomNSURLDownloadMBS
Inherits NSURLDownloadMBS
	#tag Event
		Function canAuthenticateAgainstProtectionSpace(protectionSpace as NSURLProtectionSpaceMBS) As boolean
		  //hide this event
		End Function
	#tag EndEvent

	#tag Event
		Sub decideDestinationWithSuggestedFilename(filename as string)
		  Me.setDestination(Me.File, Me.Overwrite)
		End Sub
	#tag EndEvent

	#tag Event
		Sub didBegin()
		  //hide this event
		End Sub
	#tag EndEvent

	#tag Event
		Sub didCancelAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  //hide this event
		End Sub
	#tag EndEvent

	#tag Event
		Sub didCreateDestination(path as string, file as folderitem)
		  //hide this event
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFailWithError(error as NSErrorMBS)
		  RaiseEvent DownloadFailed(error.code, error.localizedDescription)
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinish()
		  RaiseEvent DownloadComplete(Me.File)
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveAuthenticationChallenge(challenge as NSURLAuthenticationChallengeMBS)
		  //hide this event
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveDataOfLength(length as UInt64)
		  Me.ReceivedBytes = Me.ReceivedBytes + length
		  
		  RaiseEvent DownloadProgress(Me.ReceivedBytes, Me.TotalBytes, (Me.ReceivedBytes / Me.TotalBytes) * 100)
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveResponse(response as NSURLResponseMBS)
		  Me.TotalBytes = response.expectedContentLength()
		  
		  RaiseEvent DownloadStarted(Me.TotalBytes)
		End Sub
	#tag EndEvent

	#tag Event
		Function shouldDecodeSourceDataOfMIMEType(encodingType as string) As boolean
		  //hide this event
		End Function
	#tag EndEvent

	#tag Event
		Function shouldUseCredentialStorage() As boolean
		  //hide this event
		End Function
	#tag EndEvent

	#tag Event
		Sub willResumeWithResponse(response as NSURLResponseMBS, startingByte as Int64)
		  //hide this event
		End Sub
	#tag EndEvent

	#tag Event
		Function willSendRequest(request as NSURLRequestMBS, redirectResponse as NSURLResponseMBS) As NSURLRequestMBS
		  //hide this event
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CancelDownload(DeleteFile as Boolean)
		  Me.deletesFileUponFailure = DeleteFile
		  
		  Me.cancel()
		  
		  RaiseEvent DownloadCancelled()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(URL as String, File as FolderItem, Overwrite as Boolean = True)
		  Me.Reset()
		  
		  Me.URL = URL
		  Me.File = File
		  Me.Overwrite = Overwrite
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PauseDownload()
		  Me.deletesFileUponFailure = False
		  
		  Me.cancel()
		  
		  RaiseEvent DownloadPaused(Me.resumeData())
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reset()
		  Me.deletesFileUponFailure = False
		  Me.cancel()
		  
		  Me.File = Nil
		  Me.Overwrite = True
		  Me.ReceivedBytes = 0
		  Me.TotalBytes = 0
		  Me.URL = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResumeDownload()
		  Super.Constructor(Me.ResumeData, Me.File)
		  
		  RaiseEvent DownloadResumed()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartDownload()
		  Super.Constructor(new NSURLRequestMBS(Me.URL))
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DownloadCancelled()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadComplete(File as FolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadFailed(ErrorCode as Integer, ErrorMessage as String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadPaused(ResumeData as MemoryBlock)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadProgress(ReceivedBytes as UInt64, TotalBytes as UInt64, PercentComplete as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadResumed()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadStarted(TotalBytes as UInt64)
	#tag EndHook


	#tag Property, Flags = &h21
		Private File As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Overwrite As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReceivedBytes As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResumeData As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TotalBytes As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private URL As String
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
