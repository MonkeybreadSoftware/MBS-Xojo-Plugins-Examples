#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  Const hostname = "192.168.2.70"
		  Const port = 5672
		  Const exchange = "amq.direct"
		  Const bindingkey = "test queue"
		  Const messagebody = "Hello World"
		  
		  Dim conn As New RabbitMQConnectionMBS
		  
		  If Not conn.NewTCPSocket Then
		    MsgBox "Failed to create TCP socket"
		    return
		  End If
		  
		  Dim status As Integer
		  
		  status = conn.OpenSocket(hostname, port)
		  If status <> 0 then
		    MsgBox "Failed to open TCP socket"
		    Return
		  End If
		  
		  
		  Dim r As RabbitMQRPCReplyMBS
		  
		  r = conn.LoginPlain("/", 0, 131072, 0, "test", "test")
		  If Failed(r) Then Return
		  
		  Const channel = 1
		  
		  Call conn.ChannelOpen(channel)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  Const passive = False
		  Const durable = False
		  Const exclusive = False
		  Const autoDelete = true
		  Dim arguments As Dictionary
		  
		  Dim d As Dictionary = conn.QueueDeclare(channel, "", passive, durable, exclusive, autoDelete, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  Dim queuename As String = d.Value("queue")
		  
		  d = conn.QueueBind(channel, queuename, exchange, bindingkey, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  Const consumerTag = ""
		  Const noLocal = False
		  Const noAck = True
		  
		  d = conn.BasicConsume(channel, queuename, consumerTag, noLocal, noAck, exclusive, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  MainWindow.show
		  
		  Run conn
		  
		  
		  
		  // close
		  
		  r = conn.ChannelClose(1, RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		  
		  r = conn.ConnectionClose(RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Failed(r as RabbitMQRPCReplyMBS) As Boolean
		  If r = Nil Then
		    Return True
		  End If
		  
		  Select Case r.Type
		  Case r.ResponseTypeNone
		    Break
		  Case r.ResponseTypeNormal
		    Return False // okay
		  Case r.ResponseTypeLibraryException
		    MsgBox "Library error: "+Str(r.LibraryError)+" "+RabbitMQConnectionMBS.ErrorString(r.LibraryError)
		    
		    Return True
		  Case r.ResponseTypeServerException
		    Dim d As Dictionary = r.MethodDecoded
		    Dim c As String = d.Lookup("ReplyCode", "")
		    Dim t As String = d.Lookup("ReplyText", "")
		    MsgBox "Server error "+c+": "+t
		    
		    If t = "" Then Break
		    
		    Return True
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  System.DebugLog s
		  MainWindow.List.AddRow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(conn as RabbitMQConnectionMBS)
		  Const SUMMARY_EVERY_US = 1000000
		  
		  Dim start_time As Double = Microseconds
		  dim received as integer
		  dim previous_received as integer
		  Dim previous_report_time As Double = start_time
		  Dim next_summary_time As Double = start_time + SUMMARY_EVERY_US
		  
		  Dim frame as RabbitMQFrameMBS
		  
		  dim now as Double
		  
		  While True
		    
		    dim ret as RabbitMQRPCReplyMBS
		    dim envelope as RabbitMQEnvelopeMBS
		    
		    now = Microseconds
		    If now > next_summary_time then
		      Dim countOverInterval As Double = received - previous_received
		      Dim intervalRate As Double = countOverInterval / ((now - previous_report_time) / 1000000.0)
		      Dim ms As Double = (now - start_time)/ 1000.0
		      
		      Log Str( ms,"0")+" ms: Received "+Str(received)+". "+Str(countOverInterval)+" since last report ("+Str(intervalRate)+")"
		      
		      previous_received = received
		      previous_report_time = now
		      next_summary_time = next_summary_time + SUMMARY_EVERY_US
		    end if
		    
		    
		    ret = conn.ConsumeMessage(envelope, 0.01)
		    
		    If ret.ResponseTypeNormal = ret.Type Then
		      // got data
		      
		      received = received + 1
		      
		    Else
		      
		      If ret.ResponseTypeLibraryException = ret.Type And conn.kStatusUnexpectedState = ret.LibraryError Then
		        
		        Dim r As Integer = conn.SimpleWaitFrame(frame)
		        
		        If conn.kStatusOk <> r Then
		          Return
		        End If
		        
		        If frame.kFrameMethod = frame.FrameType Then
		          Select Case frame.MethodID
		          Case frame.kBasicAckMethod
		            //* If we've turned publisher confirms on, and we've published a
		            //* message here Is a message being confirmed.
		            //*/
		            
		          Case frame.kBasicReturnMethod
		            //* If a published message couldn't be routed and the mandatory
		            //* flag was set this Is what would be returned. The message Then
		            //* needs To be read.
		            //*/
		            
		            Dim message As RabbitMQMessageMBS
		            
		            ret = conn.ReadMessage(frame.channel, message)
		            If ret.ResponseTypeNormal <> ret.type Then
		              Return
		            End If
		            
		          Case frame.kChannelCloseMethod
		            //* a channel.close method happens when a channel Exception occurs,
		            //* this can happen by publishing To an exchange that doesn't exist
		            //* For example.
		            //*
		            //* In this Case you would need To open another channel redeclare
		            //* any queues that were declared Auto-delete, And restart any
		            //* consumers that were attached To the previous channel.
		            //*/
		            return
		            
		          Case frame.kConnectionCloseMethod
		            //* a connection.close method happens when a connection Exception
		            //* occurs, this can happen by trying To use a channel that isn't
		            //* open For example.
		            //*
		            //* In this Case the whole connection must be restarted.
		            //*/
		            return
		            
		          Else
		            
		            log "An unexpected method was received "+str(frame.MethodID)
		            
		            Return
		          end Select
		        End If
		      End If
		      
		    End If
		    
		    // evil, but this is a GUI app for console code
		    app.DoEvents
		  Wend
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
