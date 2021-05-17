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
		  If status <> 0 Then
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
		  
		  Const rate_limit = 5
		  const message_count = 20
		  
		  sendBatch(conn, "test queue", rate_limit, message_count)
		  
		  
		  
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
		Sub sendBatch(conn as RabbitMQConnectionMBS, QueueName as string, rate_limit as Integer, message_count as Integer)
		  Const SUMMARY_EVERY_US = 1000000
		  
		  Dim start_time As Double = Microseconds
		  Dim sent As Integer = 0
		  Dim previous_sent As Integer
		  Dim previous_report_time As Double = start_time
		  Dim next_summary_time As Double = start_time + SUMMARY_EVERY_US
		  
		  Dim message As New MemoryBlock(256)
		  
		  For i As Integer = 0 To 255
		    message.Byte(i) = i
		  Next
		  
		  Dim MessageBytes As String = message
		  
		  Const channel = 1
		  Const exchange = "amq.direct"
		  Const mandatory = False
		  Const immediate = False
		  
		  For i As Integer = 0 To message_count
		    Dim now As Double = Microseconds
		    
		    Dim properties As RabbitMQBasicPropertiesMBS = Nil
		    Dim r As Integer = conn.BasicPublish(channel, exchange, QueueName, mandatory, immediate, properties, MessageBytes)
		    
		    If r <> conn.kStatusOk Then
		      Break
		      Return
		    end if
		    
		    sent = sent + 1
		    
		    If now > next_summary_time then
		      Dim countOverInterval As Integer = sent - previous_sent
		      Dim intervalRate As Double = countOverInterval / ((now - previous_report_time) / 1000000.0)
		      Dim ms As Double = (now - start_time) / 1000.0
		      
		      Log Str(ms, "0")+" ms: Sent "+Str(sent)+" - "+Str(countOverInterval)+" since last report ("+Str(intervalRate)+" Hz)"
		      
		      previous_sent = sent
		      previous_report_time = now
		      next_summary_time = next_summary_time + SUMMARY_EVERY_US
		    end if
		    
		    While (((i * 1000000.0) / (now - start_time)) > rate_limit) 
		      app.DoEvents(10)
		      now = Microseconds
		    Wend
		  next
		  
		  
		  Dim stop_time As Double = Microseconds
		  Dim total_delta As Integer = (stop_time - start_time)
		  
		  Log "PRODUCER - Message count: " + Str(message_count)
		  Log "Total time, milliseconds: " + Str(total_delta / 1000)
		  Log "Overall messages-per-second: " + Str(message_count / (total_delta / 1000000.0))
		  
		  
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
