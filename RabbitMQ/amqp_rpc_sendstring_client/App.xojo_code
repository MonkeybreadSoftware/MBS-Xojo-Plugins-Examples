#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  Const hostname = "192.168.2.70"
		  Const port = 5672
		  Const InputExchange = "test"
		  Const InputRoutingkey = "test"
		  Const InputMessageBody = "Hello World"
		  
		  Dim conn As New RabbitMQConnectionMBS
		  
		  If Not conn.NewTCPSocket Then
		    MsgBox "Failed to create TCP socket"
		    Return
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
		  
		  // create Private reply_to queue
		  
		  Dim QueueDeclareResult As Dictionary
		  Const passive = False
		  Const durable = False
		  Const exclusive = False
		  Const autoDelete = True
		  Dim arguments As Dictionary = Nil
		  const queue = ""
		  
		  QueueDeclareResult = conn.QueueDeclare(channel, queue, passive, durable, exclusive, autoDelete, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  Dim ReplyQueueName As String = QueueDeclareResult.Value("Queue")
		  Log "ReplyQueueName: "+ReplyQueueName
		  
		  // send the message
		  
		  Dim props As New RabbitMQBasicPropertiesMBS
		  props.Flags = props.kFlagContentType or props.kFlagDeliveryMode or props.kFlagReplyTo or props.kFlagCorrelationId
		  props.ContentType = "text/plain"
		  props.DeliveryMode = 2 // persistent delivery mode
		  props.ReplyTo = ReplyQueueName
		  props.CorrelationId = "1"
		  
		  // publish
		  
		  Dim BasicPublishResult As Integer
		  
		  Const mandatory = False
		  Const immediate = False
		  
		  BasicPublishResult = conn.BasicPublish(channel, InputExchange, InputRoutingkey, mandatory, immediate, props, InputMessageBody)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  
		  // wait an answer
		  
		  Const noLocal = False
		  Const noAck = False
		  Const ConsumerTag = ""
		  
		  Call conn.BasicConsume(channel, ReplyQueueName, ConsumerTag, noLocal, noAck, exclusive, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  
		  dim frame as new RabbitMQFrameMBS
		  
		  While True
		    
		    Dim result As Integer = conn.SimpleWaitFrame(frame)
		    
		    Log "Result: "+Str(result)
		    If result < 0 Then
		      Exit
		    End If
		    
		    Log "Frame type: "+Str(frame.FrameType)
		    Log "Channel: "+Str(frame.channel)
		    
		    If frame.frameType <> frame.kFrameMethod Then
		      Continue
		    end if
		    
		    Log "Method: " + RabbitMQConnectionMBS.MethodName(frame.MethodID)
		    
		    Const AMQP_BASIC_DELIVER_METHOD = &h003C003C
		    If frame.MethodID <> AMQP_BASIC_DELIVER_METHOD Then
		      Continue
		    end if
		    
		    Dim d As Dictionary = frame.MethodDecoded
		    
		    Dim delivery_tag As Int64 = d.Value("deliveryTag")
		    Dim exchange     As String = d.Value("exchange")
		    Dim routing_key  As String = d.Value("routingKey")
		    
		    
		    result = conn.SimpleWaitFrame(frame)
		    If result < 0 Then
		      Exit
		    End If
		    
		    Const AMQP_FRAME_HEADER = 2
		    If frame.frameType <> AMQP_FRAME_HEADER Then
		      Log "Expected header!"
		      Exit
		    End If
		    
		    Dim p As Dictionary = frame.MethodDecoded
		    Dim flags As Integer = p.Value("flags")
		    If BitwiseAnd(flags, RabbitMQBasicPropertiesMBS.kFlagContentType) <> 0 Then
		      Dim ContentType As String = p.Value("ContentType")
		      Log "Content-type: "+ContentType
		    End If
		    
		    Dim BodySize As Integer = frame.BodySize
		    Dim bodyReceived As Integer = 0
		    
		    While bodyReceived < BodySize
		      result = conn.SimpleWaitFrame(frame)
		      If result < 0 Then
		        Exit
		      End If
		      
		      Const AMQP_FRAME_BODY = 3
		      If frame.frameType <> AMQP_FRAME_BODY Then
		        Log "Expected body!"
		        exit
		      End If
		      
		      bodyReceived = bodyReceived + frame.BodyFragmentSize
		      
		      If bodyReceived > BodySize Then
		        Log "Body too big!"
		        Break
		        Exit
		      End If
		      
		      Dim BodyFragment As String = frame.BodyFragment
		      Log "Received: "+BodyFragment
		      
		    wend
		    
		    If bodyReceived <> BodySize then
		      //* Can only happen when amqp_simple_wait_frame returns <= 0 */
		      //* We Break here To close the connection */
		      Exit
		    end if
		    
		    // everything was fine, we can Quit now because we received the reply */
		    Exit
		  Wend
		  
		  
		  // closing
		  
		  r = conn.ChannelClose(channel, RabbitMQRPCReplyMBS.kReplySuccess)
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
