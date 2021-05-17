#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  Const hostname = "192.168.2.70"
		  Const port = 5672
		  Const exchange = "test"
		  Const bindingkey = "test"
		  Const queuename = "test"
		  
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
		  
		  
		  Const consumerTag = ""
		  Const noLocal = False
		  Const noAck = False
		  Const exclusive = False
		  
		  Dim arguments As Dictionary = Nil
		  
		  Dim BasicConsumeResult As Dictionary = conn.BasicConsume(channel, queuename, consumerTag, noLocal, noAck, exclusive, arguments)
		  r = conn.RPCReply
		  If Failed(r) Then Return
		  
		  
		  While True
		    
		    
		    Dim res As RabbitMQRPCReplyMBS
		    dim envelope as RabbitMQEnvelopeMBS
		    
		    res = conn.ConsumeMessage(envelope, 0.01)
		    
		    If res.Type = res.ResponseTypeNormal Then
		      
		      Log "Delivery: "+Str(envelope.DeliveryTag)
		      Log "Exchange: "+envelope.Exchange
		      Log "Routingkey: "+envelope.Routingkey
		      
		      If BitwiseAnd(envelope.message.properties.flags, RabbitMQBasicPropertiesMBS.kFlagType) <> 0 Then
		        Log "Content-type: "+envelope.Message.Properties.ContentType
		        
		        Dim BodyString As String = envelope.Message.Body
		        Log "Body: "+BodyString
		      End If
		    end if
		    
		    app.DoEvents
		  wend
		  
		  
		  
		  r = conn.ConnectionClose
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
