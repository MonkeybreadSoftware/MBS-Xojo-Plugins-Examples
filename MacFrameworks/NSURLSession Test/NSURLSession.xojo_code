#tag Class
Protected Class NSURLSession
Inherits NSURLSessionMBS
	#tag Event
		Sub dataTaskDidBecomeDownloadTask(dataTask as NSURLSessionDataTaskMBS, downloadTask as NSURLSessionDownloadTaskMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub dataTaskDidBecomeStreamTask(dataTask as NSURLSessionDataTaskMBS, downloadTask as NSURLSessionStreamTaskMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub dataTaskDidReceiveData(dataTask as NSURLSessionDataTaskMBS, data as MemoryBlock)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function dataTaskDidReceiveResponse(dataTask as NSURLSessionDataTaskMBS, response as NSURLResponseMBS) As Integer
		  Log CurrentMethodName
		  Log "MimeType: "+response.MIMEType
		  Log "expectedContentLength: "+Str(response.expectedContentLength)
		  
		  Return Me.ResponseAllow
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function dataTaskWillCacheResponse(dataTask as NSURLSessionDataTaskMBS, proposedResponse as NSCachedURLResponseMBS) As NSCachedURLResponseMBS
		  Log CurrentMethodName
		  
		  // allow caching
		  Return proposedResponse
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub didBecomeInvalid(error as NSErrorMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveChallenge(challenge as NSURLAuthenticationChallengeMBS, byref disposition as Integer, byref credential as NSURLCredentialMBS)
		  Log CurrentMethodName
		  
		  // here you could provide password or check SSL certificates
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub downloadTaskDidFinishDownloadingToURL(downloadTask as NSURLSessionDownloadTaskMBS, location as String, file as FolderItem)
		  Log CurrentMethodName
		  Log "location: "+location
		  
		  
		  If file <> Nil Then
		    Dim p As Picture = Picture.Open(file)
		    If p <> Nil Then
		      Dim w As New picWindow
		      w.backdrop = p
		      w.Title = downloadTask.response.suggestedFilename
		    End If
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub downloadTaskDidResumeAtOffset(downloadTask as NSURLSessionDownloadTaskMBS, fileOffset as Int64, expectedTotalBytes as Int64)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub downloadTaskDidWriteData(downloadTask as NSURLSessionDownloadTaskMBS, bytesWritten as Int64, totalBytesWritten as Int64, totalBytesExpectedToWrite as Int64)
		  Log CurrentMethodName+" "+Str(bytesWritten)+" or "+Str(totalBytesExpectedToWrite)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub streamTaskReadClosedForStreamTask(streamTask as NSURLSessionStreamTaskMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub streamTaskWriteClosedForStreamTask(streamTask as NSURLSessionStreamTaskMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub taskDidCompleteWithError(task as NSURLSessionTaskMBS, error as NSErrorMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub taskDidFinishCollectingMetrics(task as NSURLSessionTaskMBS, metrics as NSURLSessionTaskMetricsMBS)
		  Log CurrentMethodName
		  Log "redirectCount: "+Str(metrics.redirectCount)
		  
		  Dim transactionMetrics() As NSURLSessionTaskTransactionMetricsMBS = metrics.transactionMetrics
		  
		  For Each transactionMetric As NSURLSessionTaskTransactionMetricsMBS In transactionMetrics 
		    
		    'Log "remoteAddress: " + transactionMetric.remoteAddress
		    'Log "remotePort: " + Str(transactionMetric.remotePort)
		    Log "networkProtocolName: " + transactionMetric.networkProtocolName
		    
		  Next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub taskDidSendBodyData(task as NSURLSessionTaskMBS, bytesSent as Int64, totalBytesSent as Int64, totalBytesExpectedToSend as Integer)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub taskIsWaitingForConnectivity(task as NSURLSessionTaskMBS)
		  Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function taskWillPerformHTTPRedirection(task as NSURLSessionTaskMBS, response as NSURLResponseMBS, request as NSURLRequestMBS) As NSURLRequestMBS
		  Log CurrentMethodName
		  log "URL: "+request.URL
		  
		  Return request
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		StreamInputStream As NSInputStreamMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		StreamOutputStream As NSOutputStreamMBS
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
