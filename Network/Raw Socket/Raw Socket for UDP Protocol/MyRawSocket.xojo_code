#tag Class
Protected Class MyRawSocket
Inherits RAWSocketMBS
	#tag Event
		Sub DataAvailable()
		  log CurrentMethodName
		  
		  
		  // simply log what we read
		  if false then
		    
		    // using ReadAll
		    dim m as MemoryBlock = me.ReadAll
		    dim s as string = DefineEncoding(m, encodings.UTF8)
		    log s
		    
		  else
		    // using ReadDatagram
		    
		    dim d as DatagramMBS = me.ReadDatagram
		    dim s as string = DefineEncoding(d.Data, encodings.UTF8)
		    log "Received: "+s
		    log "from "+d.Address+":"+str(d.Port)
		    
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendComplete()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  MainWindow.log s
		  
		End Sub
	#tag EndMethod


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
