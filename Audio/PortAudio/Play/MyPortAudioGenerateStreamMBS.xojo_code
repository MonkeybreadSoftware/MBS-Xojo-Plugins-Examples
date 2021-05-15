#tag Class
Protected Class MyPortAudioGenerateStreamMBS
Inherits PortAudioStreamMBS
	#tag Event
		Function Callback(InputBuffer as memoryblock, outputBuffer as memoryblock, FrameCount as integer, inputBufferAdcTime as double, currentTime as double, outputBufferDacTime as double, statusFlags as integer) As integer
		  #pragma StackOverflowChecking false
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  const delta=0.01000
		  
		  dim n,c,i as integer
		  dim f as single
		  
		  System.DebugLog str(FrameCount)+" frames"
		  
		  c=FrameCount-1
		  for i=0 to c
		    f= 0.25 * sin( timeIndex * 2.0 * 3.1415926 * 920.0 / 48000.0)
		    timeIndex=timeIndex+1
		    
		    outputBuffer.SingleValue(n)=f // left
		    n=n+4
		    outputBuffer.SingleValue(n)=f // right
		    n=n+4
		    
		  next
		End Function
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected leftphase As single
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected rightphase As single
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected timeIndex As integer
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
