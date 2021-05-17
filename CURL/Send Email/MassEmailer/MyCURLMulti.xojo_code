#tag Class
Protected Class MyCURLMulti
Inherits CURLSMultiMBS
	#tag Event
		Sub TransferFinished(curl as CURLSMBS, result as Integer, RemainingFinishedTransfers as Integer)
		  dim mycurl as MyCURL = MyCURL(curl)
		  
		  mycurl.Finished = true
		  
		  if result = 0 then
		    WriteEmailSent mycurl.destEmail
		    MassEmailWindow.log mycurl.destEmail+" sent."
		    
		    
		  else
		    
		    MassEmailWindow.log "Error "+str(result)+" for "+mycurl.destEmail, true
		    mycurl.failed = true
		    
		  end if
		  
		  try
		    
		    dim debugData as string = curl.DebugData
		    
		    if CURLLog = nil then
		      dim d as new date
		      dim s as string = d.SQLDateTime.ReplaceAll(":", "-")
		      dim f as FolderItem = GetFolderItem("curl " + s + ".log")
		      CURLLog = TextOutputStream.Append(f)
		    end if
		    
		    if CURLLog <> nil then
		      debugData = ReplaceLineEndings(debugData, EndOfLine)
		      
		      dim d as new date
		      CURLLog.WriteLine d.SQLDateTime
		      CURLLog.WriteLine debugData
		      CURLLog.WriteLine
		      CURLLog.Flush
		    end if
		    
		    
		  catch io as IOException
		    
		    // ignore
		    Break
		  end try
		  
		  
		  counter = counter - 1
		  
		  if UBound(queue) >= 0 then
		    dim c as MyCURL = queue.Pop
		    
		    if not me.AddCURL(C) then
		      Break
		    end if
		    
		    me.counter = me.counter + 1
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub TransfersFinished()
		  MassEmailWindow.Finished
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(c as MyCURL)
		  
		  if me.Counter < 4 then
		    if not me.AddCURL(C) then
		      Break
		    end if
		    
		    me.counter = me.counter + 1
		    
		  else
		    queue.Append c
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteEmailSent(email as string)
		  if EmailsSentLogFile = nil then
		    dim d as new date
		    dim s as string = d.SQLDateTime.ReplaceAll(":", "-")
		    dim f as FolderItem = GetFolderItem("EmailsSent " + s + ".txt")
		    EmailsSentLogFile = TextOutputStream.Append(f)
		  end if
		  
		  
		  if EmailsSentLogFile <> nil then
		    
		    EmailsSentLogFile.WriteLine email
		    EmailsSentLogFile.Flush
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CURLLog As TextOutputStream
	#tag EndProperty

	#tag Property, Flags = &h0
		EmailsSentLogFile As TextOutputStream
	#tag EndProperty

	#tag Property, Flags = &h0
		queue() As MyCURL
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
			Name="Counter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
