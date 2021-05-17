#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  AppRandom = New Random
		  
		  Dim iChoice As Integer = Val(me.TutorialChoice())
		  
		  select case iChoice
		    
		  case 1
		    me.Tutorial_1_Receive()
		    
		  case 2
		    me.Tutorial_2_Send()
		    
		  case 3
		    me.Tutorial_3_RPC_Server()
		    
		  case 4
		    me.Tutorial_4_RPC_Client()
		    
		  end select
		  
		  DoEvents(100)
		  call me.WaitKeyInput("Press <enter> to exit.")
		  Quit(0)
		  
		  
		End Function
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
		    me.Output("Library error: "+Str(r.LibraryError)+" "+RabbitMQConnectionMBS.ErrorString(r.LibraryError))
		    Return True
		  Case r.ResponseTypeServerException
		    Dim d As Dictionary = r.MethodDecoded
		    Dim c As String = d.Lookup("ReplyCode", "")
		    Dim t As String = d.Lookup("ReplyText", "")
		    me.Output("Server error "+c+": "+t)
		    If t = "" Then Break
		    Return True
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Fib(n As Integer) As Integer
		  If n < 2 Then Return n
		  Return Fib(n - 1) + Fib(n - 2)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetGUID() As String
		  //HACKY... don't use for production
		  
		  eiGuidNr = eiGuidNr + 1
		  
		  return Format(eiGuidNr, "00000000") + "-" + _
		  Format(eiGuidNr, "0000") + "-" + _
		  Format(eiGuidNr, "0000") + "-" + _
		  Format(eiGuidNr, "0000") + "-" + _
		  Format(eiGuidNr, "000000000000") + "-"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Output(psText As String)
		  StdOut.WriteLine(ReplaceLineEndings(psText, " "))
		  stdout.Flush()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TutorialChoice() As String
		  Dim conn As New RabbitMQConnectionMBS
		  
		  me.Output("MBS Xojo RabbitMQ Plugin")
		  me.Output("************************")
		  me.Output("RabbitMQConnectionMBS.Version: " + conn.Version)
		  me.Output("")
		  me.Output("RabbitMQ Tutorials")
		  me.Output("------------------")
		  me.Output("https://www.rabbitmq.com/getstarted.html")
		  me.Output("")
		  me.Output("1 - Hello World - Receive")
		  me.Output("2 - Hello World - Send")
		  me.Output("3 - RPC         - Server")
		  me.Output("4 - RPC         - Client")
		  me.Output("")
		  
		  return me.WaitKeyInput("Choice: ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Tutorial_1_Receive()
		  Dim conn As New RabbitMQConnectionMBS
		  
		  If Not conn.NewTCPSocket Then
		    me.Output("RabbitMQConnectionMBS: Failed to create TCP socket")
		    Return
		  End If
		  
		  Dim status As Integer = conn.OpenSocket(constHostname, constPort)
		  If status <> 0 Then
		    me.Output("RabbitMQConnectionMBS: Failed to open TCP socket")
		    Return
		  End If
		  
		  
		  me.Output("- conn.LoginPlain")
		  Dim r As RabbitMQRPCReplyMBS = conn.LoginPlain("/", 0, 131072, 0, constLoginUsername, constLoginPassword)
		  If Failed(r) Then Return
		  
		  
		  me.Output("- conn.ChannelOpen")
		  Call conn.ChannelOpen(constChannel)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  Const passive = False
		  Const durable = False
		  Const exclusive = False
		  Const autoDelete = False
		  Dim arguments As Dictionary = Nil
		  
		  Dim frame as RabbitMQFrameMBS
		  
		  
		  me.Output("- conn.QueueDeclare")
		  Dim QueueDeclareResult As Dictionary = conn.QueueDeclare(constChannel, constQueue_HelloWorld, passive, durable, exclusive, autoDelete, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  Dim queuename As String = QueueDeclareResult.Value("queue")
		  If queuename.Len = 0 Then Break // failed?
		  me.Output("  -> Queuename: "+queuename)
		  
		  Const consumerTag = ""
		  Const noLocal = False
		  Const noAck = true
		  
		  me.Output("- conn.QueueBind")
		  Dim QueueBindResult As Dictionary = conn.QueueBind(constChannel, queuename, constExchange, constBindingKey, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  me.Output("- conn.BasicConsume")
		  Dim BasicConsumeResult As Dictionary = conn.BasicConsume(constChannel, queuename, consumerTag, noLocal, noAck, exclusive, arguments)
		  '* Synchonously polls the broker for a message in a queue, and
		  '* retrieves the message if a message is in the queue.
		  '*
		  '* \param [in] state the connection object
		  '* \param [in] channel the channel identifier to use
		  '* \param [in] queue the queue name to retrieve from
		  '* \param [in] no_ack if true the message is automatically ack'ed
		  '*              if false amqp_basic_ack should be called once the message
		  '*              retrieved has been processed
		  '* \return amqp_rpc_reply indicating success or failure
		  
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  me.Output("- listening...")
		  
		  While True
		    Dim res As RabbitMQRPCReplyMBS
		    dim envelope as RabbitMQEnvelopeMBS
		    
		    res = conn.ConsumeMessage(envelope, 0.01)
		    
		    If res.Type = res.ResponseTypeNormal Then
		      // got data
		      me.Output("")
		      me.Output("- conn.ConsumeMessage -> got data")
		      
		      me.Output("Envelope.DeliveryTag: "+Str(envelope.DeliveryTag))
		      me.Output("Envelope.Exchange: "+envelope.Exchange)
		      me.Output("Envelope.Routingkey: "+envelope.Routingkey)
		      
		      Dim properties As RabbitMQBasicPropertiesMBS = envelope.message.properties
		      
		      'Dim Flags As Integer = properties.flags
		      'If BitwiseAnd(Flags, RabbitMQBasicPropertiesMBS.kFlagContentType) = RabbitMQBasicPropertiesMBS.kFlagContentType Then
		      
		      
		      me.Output("Envelope.Message.Properties.AppId: " + properties.AppId)
		      me.Output("Envelope.Message.Properties.ContentType: " + properties.ContentType)
		      me.Output("Envelope.Message.Properties.ContentEncoding: " + properties.ContentEncoding)
		      me.Output("Envelope.Message.Properties.Expiration: " + properties.Expiration)
		      
		      Dim BodyString As String = envelope.Message.Body
		      me.Output("Envelope.Message.Body: " + BodyString)
		      
		    else
		      
		      If res.ResponseTypeLibraryException = res.Type And conn.kStatusUnexpectedState = res.LibraryError Then
		        
		        Dim ir As Integer = conn.SimpleWaitFrame(frame)
		        
		        If conn.kStatusOk <> ir Then
		          me.Output("conn.kStatusOk <> ir")
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
		            
		            res = conn.ReadMessage(frame.channel, message)
		            If res.ResponseTypeNormal <> res.type Then
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
		            
		            me.Output "An unexpected method was received: "+str(frame.MethodID)
		            
		            Return
		          end Select
		        End If
		      End If
		    end if
		    
		    app.DoEvents(100)
		  wend
		  
		  
		  me.Output("- conn.ConnectionClose")
		  r = conn.ConnectionClose
		  If Failed(r) Then Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Tutorial_2_Send()
		  Const messagebody = "Hello RabbitMQ World from Xojo"
		  Const routingkey = "hello"
		  
		  Dim conn As New RabbitMQConnectionMBS
		  
		  If Not conn.NewTCPSocket Then
		    me.Output("RabbitMQConnectionMBS: Failed to create TCP socket")
		    Return
		  End If
		  
		  Dim status As Integer = conn.OpenSocket(constHostname, constPort)
		  If status <> 0 Then
		    me.Output("RabbitMQConnectionMBS: Failed to open TCP socket")
		    Return
		  End If
		  
		  
		  me.Output("- conn.LoginPlain")
		  Dim r As RabbitMQRPCReplyMBS = conn.LoginPlain("/", 0, 131072, 0, constLoginUsername, constLoginPassword)
		  If Failed(r) Then Return
		  
		  
		  me.Output("- conn.ChannelOpen")
		  Call conn.ChannelOpen(constChannel)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  Dim props As New RabbitMQBasicPropertiesMBS
		  props.Flags = props.kFlagContentType Or props.kFlagDeliveryMode or props.kFlagContentEncoding
		  props.ContentType = "text/plain"
		  props.ContentEncoding = "UTF8"
		  props.DeliveryMode = props.kDeliveryPersistent
		  
		  
		  Dim ErrorCode As Integer = conn.BasicPublish(constChannel, constExchange, routingkey, False, False, props, messagebody)
		  If ErrorCode <> 0 Then
		    me.Output("- conn.BasicPublish: Failed to publish.")
		    Return
		  Else
		    me.Output("- conn.BasicPublish: sent")
		  End If
		  
		  me.Output("- conn.ChannelClose")
		  r = conn.ChannelClose(constChannel, RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		  
		  me.Output("- conn.ConnectionClose")
		  r = conn.ConnectionClose(RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Tutorial_3_RPC_Server()
		  Dim conn As New RabbitMQConnectionMBS
		  
		  If Not conn.NewTCPSocket Then
		    me.Output("RabbitMQConnectionMBS: Failed to create TCP socket")
		    Return
		  End If
		  
		  Dim status As Integer = conn.OpenSocket(constHostname, constPort)
		  If status <> 0 Then
		    me.Output("RabbitMQConnectionMBS: Failed to open TCP socket")
		    Return
		  End If
		  
		  
		  me.Output("- conn.LoginPlain")
		  Dim r As RabbitMQRPCReplyMBS = conn.LoginPlain("/", 0, 131072, 0, constLoginUsername, constLoginPassword)
		  If Failed(r) Then Return
		  
		  
		  me.Output("- conn.ChannelOpen")
		  Call conn.ChannelOpen(constChannel)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  me.Output("- conn.BasicQOS")
		  call conn.BasicQOS(constChannel, 0, 1, false) //param4 -> global
		  
		  Const passive = False
		  Const durable = False
		  Const exclusive = False
		  Const autoDelete = False
		  Dim arguments As Dictionary = Nil
		  
		  Dim frame as RabbitMQFrameMBS
		  
		  
		  me.Output("- conn.QueueDeclare")
		  Dim QueueDeclareResult As Dictionary = conn.QueueDeclare(constChannel, constQueue_RPC, passive, durable, exclusive, autoDelete, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  Dim queuename As String = QueueDeclareResult.Value("queue")
		  If queuename.Len = 0 Then Break // failed?
		  me.Output("  -> Queuename: "+queuename)
		  
		  Const consumerTag = ""
		  Const noLocal = False
		  Const noAck = False
		  
		  me.Output("- conn.QueueBind")
		  Dim QueueBindResult As Dictionary = conn.QueueBind(constChannel, queuename, constExchange, constBindingKey, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  me.Output("- conn.BasicConsume")
		  Dim BasicConsumeResult As Dictionary = conn.BasicConsume(constChannel, queuename, consumerTag, noLocal, noAck, exclusive, arguments)
		  '* Synchonously polls the broker for a message in a queue, and
		  '* retrieves the message if a message is in the queue.
		  '*
		  '* \param [in] state the connection object
		  '* \param [in] channel the channel identifier to use
		  '* \param [in] queue the queue name to retrieve from
		  '* \param [in] no_ack if true the message is automatically ack'ed
		  '*              if false amqp_basic_ack should be called once the message
		  '*              retrieved has been processed
		  '* \return amqp_rpc_reply indicating success or failure
		  
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  me.Output("- Awaiting RPC requests...")
		  
		  While True
		    
		    Dim res As RabbitMQRPCReplyMBS
		    dim envelope as RabbitMQEnvelopeMBS
		    
		    res = conn.ConsumeMessage(envelope, 0.01)
		    
		    If res.Type = res.ResponseTypeNormal Then
		      // got data
		      
		      'Read Request
		      '************
		      me.Output("")
		      me.Output("- conn.ConsumeMessage -> got data")
		      
		      Dim iDeliveryTag As UInt64 = envelope.DeliveryTag
		      me.Output("Envelope.DeliveryTag: "+Str(envelope.DeliveryTag))
		      me.Output("Envelope.Exchange: "+envelope.Exchange)
		      me.Output("Envelope.Routingkey: "+envelope.Routingkey)
		      
		      Dim properties As RabbitMQBasicPropertiesMBS = envelope.message.properties
		      
		      'Dim Flags As Integer = properties.flags
		      'If BitwiseAnd(Flags, RabbitMQBasicPropertiesMBS.kFlagContentType) = RabbitMQBasicPropertiesMBS.kFlagContentType Then
		      
		      
		      me.Output("Envelope.Message.Properties.AppId: " + properties.AppId)
		      me.Output("Envelope.Message.Properties.ContentType: " + properties.ContentType)
		      me.Output("Envelope.Message.Properties.ContentEncoding: " + properties.ContentEncoding)
		      me.Output("Envelope.Message.Properties.Expiration: " + properties.Expiration)
		      Dim sCorrelationId As String = properties.CorrelationId
		      me.Output("Envelope.Message.Properties.CorrelationId: " + properties.CorrelationId)
		      Dim sReplyTo As String = properties.ReplyTo
		      me.Output("Envelope.Message.Properties.ReplyTo: " + properties.ReplyTo)
		      Dim BodyString As String = envelope.Message.Body
		      me.Output("Envelope.Message.Body: " + BodyString)
		      
		      'Process Request
		      '***************
		      
		      me.Output("")
		      me.Output("- FIB(" + BodyString + ")")
		      Dim fib As Integer = me.Fib(Val(BodyString))
		      me.Output("  -> " + Str(fib))
		      
		      
		      'Send Confirmation Reply
		      '***********************
		      Dim replyProps As New RabbitMQBasicPropertiesMBS
		      replyProps.Flags = replyProps.kFlagContentType Or replyProps.kFlagDeliveryMode or replyProps.kFlagContentEncoding or replyProps.kFlagCorrelationId
		      replyProps.ContentType = "text/plain"
		      replyProps.ContentEncoding = "UTF8"
		      replyProps.DeliveryMode = replyProps.kDeliveryPersistent
		      replyProps.CorrelationId = sCorrelationId
		      
		      Dim sMessagebody As String = Str(fib)
		      
		      Dim ErrorCode As Integer = conn.BasicPublish(constChannel, "", sReplyTo, False, False, replyProps, sMessagebody)
		      If ErrorCode <> 0 Then
		        me.Output("- conn.BasicPublish: Failed to publish.")
		        Return
		      Else
		        me.Output("- conn.BasicPublish: sent")
		      End If
		      
		      me.Output("- conn.BasicAck: " + Str(iDeliveryTag))
		      call conn.BasicAck(constChannel, iDeliveryTag, false)
		      
		      
		      
		    else
		      
		      If res.ResponseTypeLibraryException = res.Type And conn.kStatusUnexpectedState = res.LibraryError Then
		        
		        Dim ir As Integer = conn.SimpleWaitFrame(frame)
		        
		        If conn.kStatusOk <> ir Then
		          me.Output("conn.kStatusOk <> ir")
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
		            
		            res = conn.ReadMessage(frame.channel, message)
		            If res.ResponseTypeNormal <> res.type Then
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
		            
		            me.Output "An unexpected method was received: "+str(frame.MethodID)
		            
		            Return
		          end Select
		        End If
		      End If
		    end if
		    
		    app.DoEvents(100)
		  wend
		  
		  
		  me.Output("- conn.ChannelClose")
		  r = conn.ChannelClose(constChannel, RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		  
		  me.Output("- conn.ConnectionClose")
		  r = conn.ConnectionClose(RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Tutorial_4_RPC_Client()
		  Dim iRandom As Integer = AppRandom.InRange(10, 32)
		  Dim sGuid As String = me.GetGUID()
		  
		  Dim conn As New RabbitMQConnectionMBS
		  
		  If Not conn.NewTCPSocket Then
		    me.Output("RabbitMQConnectionMBS: Failed to create TCP socket")
		    Return
		  End If
		  
		  Dim status As Integer = conn.OpenSocket(constHostname, constPort)
		  If status <> 0 Then
		    me.Output("RabbitMQConnectionMBS: Failed to open TCP socket")
		    Return
		  End If
		  
		  
		  me.Output("- conn.LoginPlain")
		  Dim r As RabbitMQRPCReplyMBS = conn.LoginPlain("/", 0, 131072, 0, constLoginUsername, constLoginPassword)
		  If Failed(r) Then Return
		  
		  
		  me.Output("- conn.ChannelOpen")
		  Call conn.ChannelOpen(constChannel)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  me.Output("- conn.QueueDeclare")
		  Dim QueueDeclareResult As Dictionary = conn.QueueDeclare(constChannel, "", false, false, true, true, nil)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  Dim sReplyQueueName As String = QueueDeclareResult.Value("queue")
		  If sReplyQueueName.Len = 0 Then Break // failed?
		  me.Output("  -> Queuename: "+ sReplyQueueName)
		  
		  
		  Dim props As New RabbitMQBasicPropertiesMBS
		  props.Flags = props.kFlagContentType Or props.kFlagDeliveryMode or props.kFlagContentEncoding or props.kFlagCorrelationId or props.kFlagReplyTo
		  props.ContentType = "text/plain"
		  props.ContentEncoding = "UTF8"
		  props.DeliveryMode = props.kDeliveryPersistent
		  props.CorrelationId = sGuid
		  props.ReplyTo = sReplyQueueName
		  
		  me.Output("- props.CorrelationId: " + props.CorrelationId)
		  me.Output("- MessageBody: " + Str(iRandom))
		  
		  Dim messagebody As String = Str(iRandom)
		  Dim ErrorCode As Integer = conn.BasicPublish(constChannel, "", constQueue_RPC, False, false, props, messagebody)
		  If ErrorCode <> 0 Then
		    me.Output("- conn.BasicPublish: Failed to publish.")
		    Return
		  Else
		    me.Output("- conn.BasicPublish: sent")
		  End If
		  
		  
		  Const consumerTag = ""
		  Const noLocal = False
		  Const noAck = true
		  const exclusive = false
		  
		  me.Output("- conn.BasicConsume")
		  Dim BasicConsumeResult As Dictionary = conn.BasicConsume(constChannel, sReplyQueueName, consumerTag, noLocal, noAck, exclusive, nil)
		  '* Synchonously polls the broker for a message in a queue, and
		  '* retrieves the message if a message is in the queue.
		  '*
		  '* \param [in] state the connection object
		  '* \param [in] channel the channel identifier to use
		  '* \param [in] queue the queue name to retrieve from
		  '* \param [in] no_ack if true the message is automatically ack'ed
		  '*              if false amqp_basic_ack should be called once the message
		  '*              retrieved has been processed
		  '* \return amqp_rpc_reply indicating success or failure
		  
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  me.Output("- listening...")
		  Dim frame as RabbitMQFrameMBS
		  
		  While True
		    Dim res As RabbitMQRPCReplyMBS
		    dim envelope as RabbitMQEnvelopeMBS
		    
		    res = conn.ConsumeMessage(envelope, 0.01)
		    
		    If res.Type = res.ResponseTypeNormal Then
		      // got data
		      me.Output("")
		      me.Output("- conn.ConsumeMessage -> got data")
		      
		      me.Output("Envelope.DeliveryTag: "+Str(envelope.DeliveryTag))
		      me.Output("Envelope.Exchange: "+envelope.Exchange)
		      me.Output("Envelope.Routingkey: "+envelope.Routingkey)
		      
		      Dim properties As RabbitMQBasicPropertiesMBS = envelope.message.properties
		      
		      'Dim Flags As Integer = properties.flags
		      'If BitwiseAnd(Flags, RabbitMQBasicPropertiesMBS.kFlagContentType) = RabbitMQBasicPropertiesMBS.kFlagContentType Then
		      
		      
		      me.Output("Envelope.Message.Properties.AppId: " + properties.AppId)
		      me.Output("Envelope.Message.Properties.ContentType: " + properties.ContentType)
		      me.Output("Envelope.Message.Properties.ContentEncoding: " + properties.ContentEncoding)
		      me.Output("Envelope.Message.Properties.Expiration: " + properties.Expiration)
		      
		      Dim BodyString As String = envelope.Message.Body
		      me.Output("Envelope.Message.Body: " + BodyString)
		      
		      exit 'Loop
		      
		    else
		      
		      If res.ResponseTypeLibraryException = res.Type And conn.kStatusUnexpectedState = res.LibraryError Then
		        
		        Dim ir As Integer = conn.SimpleWaitFrame(frame)
		        
		        If conn.kStatusOk <> ir Then
		          me.Output("conn.kStatusOk <> ir")
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
		            
		            res = conn.ReadMessage(frame.channel, message)
		            If res.ResponseTypeNormal <> res.type Then
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
		            
		            me.Output "An unexpected method was received: "+str(frame.MethodID)
		            
		            Return
		          end Select
		        End If
		      End If
		    end if
		    
		    app.DoEvents(100)
		  wend
		  
		  
		  
		  me.Output("- conn.ChannelClose")
		  r = conn.ChannelClose(constChannel, RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		  
		  me.Output("- conn.ConnectionClose")
		  r = conn.ConnectionClose(RabbitMQRPCReplyMBS.kReplySuccess)
		  If Failed(r) Then Return
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function WaitKeyInput(psOutput As String = "Weiter mit Return") As String
		  if (psOutput <> "") then
		    StdOut.Write(psOutput)
		    stdout.Flush()
		  end if
		  
		  
		  Dim sResult As String
		  
		  Dim m As Double = Microseconds + 100000 'discard any "wait-to-be-read input"
		  while (Microseconds < m)
		    sResult = StdIn.Read(1)
		  wend
		  
		  return sResult
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		RabbitMQ Tutorial project provided by Jürg Otter
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private AppRandom As Random
	#tag EndProperty

	#tag Property, Flags = &h21
		Private eiGuidNr As Integer
	#tag EndProperty


	#tag Constant, Name = constBindingKey, Type = String, Dynamic = False, Default = \"hello", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constChannel, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constExchange, Type = String, Dynamic = False, Default = \"amq.direct", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constHostname, Type = String, Dynamic = False, Default = \"localhost", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constLoginPassword, Type = String, Dynamic = False, Default = \"guest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constLoginUsername, Type = String, Dynamic = False, Default = \"guest", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constPort, Type = Double, Dynamic = False, Default = \"5672", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constQueue_HelloWorld, Type = String, Dynamic = False, Default = \"hello", Scope = Private
	#tag EndConstant

	#tag Constant, Name = constQueue_RPC, Type = String, Dynamic = False, Default = \"rpc_queue", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
