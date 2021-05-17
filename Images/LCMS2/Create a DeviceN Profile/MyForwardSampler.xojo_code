#tag Class
Protected Class MyForwardSampler
Inherits LCMS2StageSamplerMBS
	#tag Event
		Function SamplerInteger(InValues as Ptr, OutValues as Ptr, InputChannels as integer, OutputChannels as integer) As boolean
		  // Lab to DeviceN
		  
		  // get input
		  dim c1 as integer = InValues.UInt16(0)
		  dim c2 as integer = InValues.UInt16(2)
		  dim c3 as integer = InValues.UInt16(4)
		  
		  // set output
		  
		  OutValues.UInt16(0) = c1
		  OutValues.UInt16(2) = c1
		  OutValues.UInt16(4) = c2
		  OutValues.UInt16(6) = c2
		  OutValues.UInt16(8) = c3
		  OutValues.UInt16(10) = c3
		  
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
