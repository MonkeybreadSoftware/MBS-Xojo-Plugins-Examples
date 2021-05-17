#tag Class
Protected Class MyPortAudioRecordStreamMBS
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
		  
		  o=0
		  n=SpaceLeft
		  if n>FrameCount then
		    n=FrameCount
		  end if
		  
		  for i=1 to n
		    
		    f=InputBuffer.SingleValue(o)
		    o=o+4
		    
		    data.SingleValue(offset)=f
		    offset=offset+4
		    SpaceLeft=SpaceLeft-1
		    
		  next
		  
		  if SpaceLeft<=0 then
		    call me.Abort
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
		offset As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		size As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SpaceLeft As integer
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
			Name="offset"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="size"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SpaceLeft"
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
