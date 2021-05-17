#tag Class
Protected Class MyPortAudioInputLevelStreamMBS
Inherits PortAudioStreamMBS
	#tag Event
		Function Callback(InputBuffer as memoryblock, outputBuffer as memoryblock, FrameCount as integer, inputBufferAdcTime as double, currentTime as double, outputBufferDacTime as double, statusFlags as integer) As integer
		  Dim n As Integer
		  dim m as MemoryBlock
		  dim size as integer
		  dim i as integer
		  dim sum,f as Single
		  dim y,h,w as integer
		  
		  if g<>nil then
		    
		    size=FrameCount*4
		    m=InputBuffer
		    
		    n=0
		    for i=1 to FrameCount
		      f=m.SingleValue(n)
		      if f>0 then
		        sum=sum+f
		      else
		        sum=sum-f
		      end if
		      n=n+4
		    next
		    
		    h=g.Height-1
		    w=g.Width-1
		    
		    y=h-sum*h/FrameCount
		    
		    if y<0 then
		      y=0
		    elseif y>h then
		      y=h
		    end if
		    
		    g.ForeColor=&c00FF00
		    g.DrawLine pos,y-1,pos,y+2
		    g.ForeColor=&c000000
		    g.DrawLine pos,0,pos,y
		    g.ForeColor=&c0000FF
		    g.DrawLine pos,y,pos,h
		    
		    pos=pos+1
		    if pos=w then
		      pos=0
		    end if
		    
		    g.ForeColor=&cFF0000
		    g.DrawLine pos,0,pos,h
		    
		    OutCanvas.Invalidate
		  End If
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		g As graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		OutCanvas As Canvas
	#tag EndProperty

	#tag Property, Flags = &h0
		pos As integer
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
			Name="pos"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
