#tag Class
Protected Class MyReverseSampler
Inherits LCMS2StageSamplerMBS
	#tag Event
		Function SamplerInteger(InValues as Ptr, OutValues as Ptr, InputChannels as integer, OutputChannels as integer) As boolean
		  
		  
		  dim c as double = InValues.UInt16(0) / 65535.0
		  dim m as double = InValues.UInt16(2) / 65535.0
		  dim y as double = InValues.UInt16(4) / 65535.0
		  dim k as double = InValues.UInt16(6) / 65535.0
		  
		  if k = 0 then
		    
		    rgb.doublevalue( 0) = Clip(1 - c)
		    rgb.doublevalue( 8) = Clip(1 - m)
		    rgb.doublevalue(16) = Clip(1 - y)
		    
		  else
		    if k = 1 then
		      
		      rgb.doublevalue( 0) = 0
		      rgb.doublevalue( 8) = 0
		      rgb.doublevalue(16) = 0
		      
		    else
		      
		      rgb.doublevalue( 0) = Clip((1 - c) * (1 - k))
		      rgb.doublevalue( 8) = Clip((1 - m) * (1 - k))
		      rgb.doublevalue(16) = Clip((1 - y) * (1 - k))
		    end if
		  end if
		  
		  call sRGB2Lab.Transform(rgb, OutValues, 1)
		  
		  
		  Return true
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Function Clip(v as Double) As Double
		  if v < 0.0 then
		    Return 0
		  end if
		  
		  if v > 1.0 then
		    Return 1
		  end if
		  
		  Return v
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  rgb = new MemoryBlock(4*8)
		  cmyk = new MemoryBlock(4*8)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		cmyk As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		hIlimit As LCMS2TransformMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		hLab2sRGB As LCMS2TransformMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		rgb As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		sRGB2Lab As LCMS2TransformMBS
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
	#tag EndViewBehavior
End Class
#tag EndClass
