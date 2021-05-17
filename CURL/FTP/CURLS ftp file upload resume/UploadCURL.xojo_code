#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if ultotal=0 then
		    log "Uploading..."
		  else
		    log "Uploading "+Format(ulnow/ultotal,"-0%")+" "+stR(ulnow,"0")+" of "+str(ultotal,"0")
		  end if
		  
		  Return cancelled
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Read(count as integer) As string
		  dim p as int64 = stream.Position
		  dim s as string = stream.Read(count)
		  
		  log "Read "+str(lenb(s),"0")+" of "+str(count,"0")+" at "+str(p,"0")
		  
		  Return s
		  
		End Function
	#tag EndEvent

	#tag Event
		Function RestartRead() As boolean
		  log "Restart Read"
		  
		  stream.position=0
		  Return false // no error
		End Function
	#tag EndEvent

	#tag Event
		Function Seek(pos as Int64, whence as integer) As Integer
		  dim result as integer = kSeekReturnFail
		  
		  Select case whence
		  case kSeekOriginCurrent
		    stream.Position = stream.Position + pos
		    result = kSeekReturnOk
		  case kSeekOriginEnd
		    stream.Position = stream.Length + pos
		    result = kSeekReturnOk
		  case kSeekOriginSet
		    stream.Position = pos
		    result = kSeekReturnOk
		  end Select
		  
		  log "Seeked to "+str(stream.Position,"0")
		  
		  Return result
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  // store messages in array
		  messages.append s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cancelled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Messages() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		stream As binaryStream
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
			Name="cancelled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
