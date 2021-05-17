#tag Class
Protected Class myCoreAudioPlayer
Inherits CoreAudioPlayerMBS
	#tag Method, Flags = &h0
		Sub ContinuePlaying()
		  const BUFSIZE = 8000
		  
		  dim p,n as integer
		  dim m as MemoryBlock
		  
		  if timeIndex<totalTime then
		    if FreeSpace>0 then
		      p=0
		      m=NewMemoryBlock(BUFSIZE*4)
		      for n=1 to BUFSIZE
		        m.Long(p) = 65536.0 * 32767.0 * 0.25 * sin((timeIndex) * 2.0 * 3.1415926 * frequency / SampleRate)
		        timeIndex=timeIndex+1
		        
		        p=p+4
		      next
		      
		      if not me.PlayAudio(m,0,m.Size,31) then
		        MsgBox "Failed to add audio!"
		      end if
		      
		      
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  
		  timeIndex=0 // how much is already played
		  
		  SampleRate = 8000.0
		  NumberOfChannels=1
		  
		  totalTime = SampleRate * 10.0  // 10 seconds
		  frequency = 920.0
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected frequency As single
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected timeIndex As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected totalTime As Integer
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
