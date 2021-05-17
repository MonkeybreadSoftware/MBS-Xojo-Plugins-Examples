#tag Class
Protected Class MyServerSocket
Inherits RAWSocketMBS
	#tag Event
		Sub DataAvailable()
		  dim a as MyClientSocket 
		  
		  do
		    
		    dim RemoteAddress as string
		    dim RemotePort as integer
		    
		    dim c as new MyClientSocket(MyClientSocket.AddressFamilyINet, MyClientSocket.SocketTypeStream, MyClientSocket.ProtocolTCP)
		    
		    dim v as Variant = me.Accept(RemoteAddress, RemotePort, c)
		    a = v
		    
		    if a <> nil then
		      log "Accepted connection from "+RemoteAddress+" on port "+str(RemotePort)
		      MainWindow.Clients.Append a
		    end if
		    
		    
		  loop until a = nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  log CurrentMethodName
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
