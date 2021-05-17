#tag Class
Protected Class RandomWalk
Inherits Thread
	#tag Event
		Sub Run()
		  Dim currentTime As Int64 = 0
		  Dim nextTime As Int64 = 0
		  
		  // Random walk variables
		  
		  Dim series0 As Double = 32
		  Dim series1 As Double = 63
		  Dim upperLimit As Double = 94
		  Dim scaleFactor As Double = Sqrt(interval * 0.3)
		  Dim r As New Random
		  
		  // Variables to keep track of the timing
		  Dim startTime As Int64 = Microseconds
		  
		  
		  While Not stoppedThread
		    
		    // Compute the next data value
		    currentTime = Microseconds - startTime
		    
		    series0 = Abs(series0 + (r.Number - 0.5) * scaleFactor)
		    If (series0 > upperLimit) Then
		      series0 = upperLimit * 2 - series0
		    End If
		    
		    series1 = Abs(series1 + (r.Number - 0.5) * scaleFactor)
		    If (series1 > upperLimit) Then
		      series1 = upperLimit * 2 - series1
		    end if
		    
		    // Call the handler
		    Dim milliseconds As Double = currentTime / 1000.0
		    Dim seconds As Double = milliseconds / 1000.0
		    RaiseEvent GotNewValues(seconds, series0, series1)
		    'System.DebugLog Str(milliseconds, "0.0")+" "+Str(series0)+" "+Str(series1)
		    
		    // Sleep until next walk
		    nextTime = nextTime + interval
		    If (nextTime <= currentTime) Then
		      nextTime = currentTime + interval
		    End If
		    
		    Dim delta As Int64 = (nextTime - currentTime)
		    Me.Sleep delta
		    
		    
		  Wend
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub stopThread()
		  stoppedThread = True
		  app.YieldToNextThread
		  
		  // wait for ending
		  While Me.State = Me.Running
		    app.YieldToNextThread
		  Wend
		  
		  
		  stoppedThread = False
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event GotNewValues(currentTime as double, value1 as double, value2 as Double)
	#tag EndHook


	#tag Property, Flags = &h0
		#tag Note
			// The period of the data series in milliseconds. This random series implementation just use the 
			// windows timer for timing. In many computers, the default windows timer resolution is 1/64 sec,
			// or 15.6ms. This means the interval may not be exactly accurate.
			
		#tag EndNote
		interval As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		stoppedThread As Boolean
	#tag EndProperty


	#tag ViewBehavior
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="stoppedThread"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="interval"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
