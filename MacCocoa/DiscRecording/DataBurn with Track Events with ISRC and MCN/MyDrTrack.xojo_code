#tag Class
Protected Class MyDrTrack
Inherits DRTrackMBS
	#tag Event
		Sub cleanupTrackAfterBurn()
		  System.DebugLog "cleanupTrackAfterBurn"
		End Sub
	#tag EndEvent

	#tag Event
		Function prepareTrack(burn as DRBurnMBS) As boolean
		  System.DebugLog "prepareTrack"
		  
		  Return true // success
		  
		End Function
	#tag EndEvent

	#tag Event
		Function produceDataForTrack(buffer as memoryblock, Bufferlen as uint32, address as uint64, blocksize as uint32, byref flags as uint32) As uint32
		  const SampleRate=48000.0
		  const fL=440.0 // C
		  const fR=440.0
		  
		  dim offset as integer
		  dim l,r as integer
		  
		  system.DebugLog "produceDataForTrack"
		  
		  buffer.LittleEndian=true
		  
		  while offset<Bufferlen
		    
		    l= 32767.0 * 0.25 * sin((timeIndex) * 2.0 * 3.1415926 * fL / SampleRate)
		    r= 32767.0 * 0.25 * sin((timeIndex) * 2.0 * 3.1415926 * fR / SampleRate)
		    timeIndex=timeIndex+1
		    
		    buffer.Short(offset)=l
		    offset=offset+2
		    buffer.Short(offset)=r
		    offset=offset+2
		    
		  wend
		  
		  System.DebugLog str(offset)+" of "+stR(Bufferlen)+" bytes produced"
		  Return offset
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.length=new DRMSFMBS(10000)
		  me.BlockSize=2352
		  me.DataForm=0
		  me.SessionFormat=0
		  me.TrackMode=0
		  me.BlockType=0
		End Sub
	#tag EndMethod


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
