#tag Class
Protected Class MyReverseSampler
Inherits LCMS2StageSamplerMBS
	#tag Event
		Function SamplerInteger(InValues as Ptr, OutValues as Ptr, InputChannels as integer, OutputChannels as integer) As boolean
		  // DeviceN to Lab
		  
		  // get input
		  
		  dim c1 as integer = InValues.UInt16(0)
		  dim c2 as integer = InValues.UInt16(2)
		  dim c3 as integer = InValues.UInt16(4)
		  dim c4 as integer = InValues.UInt16(6)
		  dim c5 as integer = InValues.UInt16(8)
		  dim c6 as integer = InValues.UInt16(10)
		  
		  // set output
		  
		  OutValues.UInt16(0) = (c1+c2)/2
		  OutValues.UInt16(2) = (c3+c4)/2
		  OutValues.UInt16(4) = (c5+c6)/2
		  
		  Return true
		  
		  
		End Function
	#tag EndEvent


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
