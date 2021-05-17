#tag Class
Protected Class MyDRFileMBS
Inherits DRFileMBS
	#tag Event
		Function calculateSizeOfFile(fork as integer, estimating as boolean) As uint64
		  if fork=1 then // ResourceFork
		    Return 0
		  else
		    Return 12345678
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function prepareFileForBurn() As boolean
		  position=0
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function prepareFileForVerification() As boolean
		  position=0
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function produceFile(fork as integer, buffer as memoryblock, Bufferlen as uint32, address as uint64, blocksize as uint32) As uint32
		  dim offset as integer
		  
		  if fork=0 then // data fork
		    
		    while offset<Bufferlen
		      buffer.Byte(offset)=(65+offset mod 26)
		      offset=offset+1
		    wend
		  end if
		  
		  Return offset
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		position As Integer
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
			Name="position"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
