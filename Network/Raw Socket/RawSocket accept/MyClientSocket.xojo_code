#tag Class
Protected Class MyClientSocket
Inherits RAWSocketMBS
	#tag Event
		Sub DataAvailable()
		  // read what is coming
		  
		  dim s as string = me.ReadAll
		  
		  log "Received "+str(len(s))+" bytes"
		  
		  // we always answer here wiht HTTP answer
		  dim lines( )as string
		  
		  
		  lines.append "HTTP/1.0 200 OK"
		  lines.append "Date: Sat, 28 Nov 2009 04:36:25 GMT"
		  lines.append "Server: test"
		  lines.append "Connection: close"
		  lines.append "Content-Type: text/plain"
		  lines.Append ""
		  lines.Append "Hello World"
		  
		  dim m as MemoryBlock = Join(lines,EndOfLine.Windows)
		  call me.Send(m, m.size)
		  
		  
		  // close connection, so browser doesn't wait
		  me.Close
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  break
		  
		End Sub
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
