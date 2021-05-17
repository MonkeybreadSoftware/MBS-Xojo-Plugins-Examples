#tag Class
Protected Class MyForwardSampler
Inherits LCMS2StageSamplerMBS
	#tag Event
		Function SamplerInteger(InValues as Ptr, OutValues as Ptr, InputChannels as integer, OutputChannels as integer) As boolean
		  
		  call hLab2sRGB.Transform(InValues, rgb, 1)
		  
		  // this is a very bad way to make cmy from rgb
		  dim c as double = 1.0 - rgb.DoubleValue(0)
		  dim m as double = 1.0 - rgb.DoubleValue(8)
		  dim y as double = 1.0 - rgb.DoubleValue(16)
		  
		  dim k as double 
		  
		  if c < m then
		    k = min(c, y)
		  else
		    k = min(m, y)
		  end if
		  
		  // NONSENSE WARNING!: I'm doing this just because this is a test
		  // profile that may have ink limit up to 400%. There is no UCR here
		  // so the profile is basically useless for anything but testing.
		  
		  cmyk.doubleValue( 0) = c
		  cmyk.doubleValue( 8) = m
		  cmyk.doubleValue(16) = y
		  cmyk.doubleValue(24) = k
		  
		  call hIlimit.Transform(cmyk, OutValues, 1)
		  
		  return true
		  
		  
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
