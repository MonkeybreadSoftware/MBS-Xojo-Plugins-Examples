#tag Class
Protected Class MyPortAudioPlaybackStreamMBS
Inherits PortAudioStreamMBS
	#tag Event
		Function Callback(InputBuffer as memoryblock, outputBuffer as memoryblock, FrameCount as integer, inputBufferAdcTime as double, currentTime as double, outputBufferDacTime as double, statusFlags as integer) As integer
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  #pragma StackOverflowChecking false
		  
		  // Using unsafe threading requires all the pragmas above and
		  // you are now allowed to call a function
		  // not even object locking, so no strings!
		  
		  const paComplete=1
		  const paContinue=0
		  
		  dim n,i,o as integer
		  dim f as Single
		  
		  FrameCount=FrameCount*channelCount // mono or stereo?
		  
		  n=FrameCount
		  if n>SampleCount then
		    n=SampleCount
		  end if
		  
		  o=0
		  for i=1 to n
		    
		    f=data.SingleValue(Offset)
		    Offset=Offset+4
		    SampleCount=SampleCount-1
		    
		    outputBuffer.SingleValue(o)=f
		    o=o+4
		    
		  next
		  
		  if SampleCount<1 then
		    Return paComplete
		  else
		    Return paContinue
		  end if
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		channelCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		data As memoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		Offset As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SampleCount As integer
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
		#tag ViewProperty
			Name="SampleCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Offset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="channelCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
