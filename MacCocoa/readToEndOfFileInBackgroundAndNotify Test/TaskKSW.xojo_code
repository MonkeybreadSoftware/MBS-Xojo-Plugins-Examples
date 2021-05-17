#tag Class
Protected Class TaskKSW
	#tag Method, Flags = &h21
		Private Sub ReadInTimer(tt as timer)
		  xPipe = New NSPipeMBS
		  xPipeError = New NSPipeMBS
		  
		  me.Result = ""
		  
		  FTool = PathToFolderItemMBS(toolpath)
		  If FTool = Nil or Not FTool.Exists Then
		    me.Result = "Failed to execute the command was the tool was not found: " + toolpath
		    HadError = true
		    Return
		  End If
		  
		  xFileHandleStandard = xPipe.fileHandleForReading
		  xFileHandleError = xPipeError.fileHandleForReading
		  
		  xTask.LaunchPath = toolpath
		  xTask.setArguments(toolargs)
		  xTask.setStandardOutput(xPipe)
		  xTask.setStandardError(xPipeError)
		  Try
		    xTask.Launch()
		  Catch xError As NSExceptionMBS
		    me.Result = xError.Reason +EndOfLine + EndOfLine + _
		    xError.Name
		    HadError = true
		    Return
		  End Try
		  
		  xFileHandleStandard.readToEndOfFileInBackgroundAndNotify()
		  xFileHandleError.readToEndOfFileInBackgroundAndNotify()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(_toolpath As String, _toolargs() As String, ChangeEncoding As Boolean = True)
		  me.ToolPath = _toolpath
		  me.ToolArgs = _toolargs
		  
		  HadError = False
		  me.SetupObservers()
		  
		  Dim xRunLoop as NSRunLoopMBS = NSRunLoopMBS.currentRunLoop
		  xRunLoop.AddDummyPort // required to keep xRunLoop looping
		  xRunLoop.Run(0.01)
		  
		  me.SetupObservers()
		  
		  xTask = New NSTaskMBS
		  xTheTimer = New Timer
		  xTheTimer.Period = 0
		  xTheTimer.Mode = Timer.ModeSingle
		  AddHandler xTheTimer.Action, AddressOf ReadInTimer
		  
		  Do Until Not xTask.isRunning
		    If HadError Then
		      me.ErrorCode = -1
		      Return
		    End If
		    Call xRunLoop.runMode(NSRunLoopMBS.NSDefaultRunLoopMode, 0.01)
		  Loop
		  
		  //Obtain Result
		  Do Until xFileHandleStandard<>nil and Observer.DataForHandle.HasKey(xFileHandleStandard.Handle)
		    Call xRunLoop.runMode NSRunLoopMBS.NSDefaultRunLoopMode, 0.01
		  Loop
		  me.Result = Observer.DataForHandle.Value(xFileHandleStandard.Handle)
		  If ChangeEncoding Then
		    me.Result = DefineEncoding(me.Result,Encodings.UTF8)
		    me.Result = ReplaceLineEndings(me.Result,EndOfLine)
		  End If
		  
		  //Obtain Error
		  Dim sError As String
		  Do Until Observer.DataForHandle.HasKey(xFileHandleError.Handle)
		    Call xRunLoop.runMode(NSRunLoopMBS.NSDefaultRunLoopMode, 0.01)
		  Loop
		  sError = Observer.DataForHandle.Value(xFileHandleError.Handle)
		  If ChangeEncoding Then
		    sError = DefineEncoding(sError,Encodings.UTF8)
		    sError = ReplaceLineEndings(sError,EndOfLine)
		  End If
		  
		  Dim iReason As Integer = xTask.terminationReason
		  me.ErrorCode = xTask.terminationStatus
		  
		  If me.ErrorCode <> 0 and Len(me.Result) = 0 Then me.Result = sError
		  Exception xError As NSExceptionMBS
		    me.Result = xError.Reason +EndOfLine + EndOfLine + _
		    xError.Name
		    me.HadError = True
		    me.ErrorCode = -1
		    Return
		    
		  Finally
		    xTask = Nil
		    xFileHandleError = nil
		    xFileHandleStandard = nil
		    xPipe = Nil
		    xPipeError = nil
		    xTheTimer = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupObservers()
		  if Center <> Nil Then Return
		  
		  Center = NSNotificationCenterMBS.defaultCenter
		  Observer = New MyNSNotificationObserverMBS
		  
		  Center.addObserver(Observer, NSFileHandleMBS.NSFileHandleReadToEndOfFileCompletionNotification,xFileHandleStandard)
		  Center.addObserver(Observer, NSFileHandleMBS.NSFileHandleReadToEndOfFileCompletionNotification,xFileHandleError)
		  
		  'Center.addObserver(Observer, NSFileHandleMBS.NSFileHandleReadCompletionNotification,xFileHandleStandard)
		  'Center.addObserver(Observer, NSFileHandleMBS.NSFileHandleReadCompletionNotification,xFileHandleError)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Center As NSNotificationCenterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorCode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FTool As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		HadError As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Observer As MyNSNotificationObserverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ToolArgs() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ToolPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xFileHandleError As NSFileHandleMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xFileHandleStandard As NSFileHandleMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xPipe As NSPipeMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xPipeError As NSPipeMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xTask As NSTaskMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private xTheTimer As Timer
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
		#tag ViewProperty
			Name="Result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HadError"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
