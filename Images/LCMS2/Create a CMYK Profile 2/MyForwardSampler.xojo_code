#tag Class
Protected Class MyForwardSampler
Inherits LCMS2StageSamplerMBS
	#tag Event
		Function SamplerInteger(InValues as Ptr, OutValues as Ptr, InputChannels as integer, OutputChannels as integer) As boolean
		  dim L as double = InValues.UInt16(0) / 655.350
		  dim A as double = ((InValues.UInt16(2) / 65535.0)-0.5)*256.0
		  dim B as double = ((InValues.UInt16(4) / 65535.0)-0.5)*256.0
		  
		  // L 0 to 100
		  // A -128 to 128
		  // B -128 to 128
		  
		  // simply take LAB as CMY
		  dim C as Double = L / 100.0
		  dim M as Double = (A+128.0)/ 256.0
		  dim Y as Double = (B+128.0)/ 256.0
		  dim K as Double = 0
		  
		  t.WriteLine str(L, "-0.00")+" "+str(A, "-0.00")+" "+str(B, "-0.00")+" -> "+str(C, "-0.00")+" "+str(m, "-0.00")+" "+str(y, "-0.00")+" "+str(k, "-0.00")
		  
		  // C 0 to 1
		  
		  OutValues.UInt16(0) = C * 65535.0
		  OutValues.UInt16(2) = M * 65535.0
		  OutValues.UInt16(4) = Y * 65535.0
		  OutValues.UInt16(8) = K * 65535.0
		  
		  return true
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("forward.txt")
		  t = TextOutputStream.Create(f)
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		t As TextOutputStream
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
