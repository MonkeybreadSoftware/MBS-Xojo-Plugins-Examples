#tag Class
Protected Class MyReverseSampler
Inherits LCMS2StageSamplerMBS
	#tag Event
		Function SamplerInteger(InValues as Ptr, OutValues as Ptr, InputChannels as integer, OutputChannels as integer) As boolean
		  
		  
		  dim c as double = InValues.UInt16(0) / 65535.0
		  dim m as double = InValues.UInt16(2) / 65535.0
		  dim y as double = InValues.UInt16(4) / 65535.0
		  dim k as double = InValues.UInt16(6) / 65535.0
		  
		  // simply take CMY as LAB
		  dim L as Double = C * 100.0
		  dim A as Double = M*256.0-128.0
		  dim B as Double = Y*256.0-128.0
		  
		  t.WriteLine str(c, "-0.00")+" "+str(m, "-0.00")+" "+str(y, "-0.00")+" "+str(k, "-0.00")+" -> "+str(L, "-0.00")+" "+str(A, "-0.00")+" "+str(B, "-0.00")
		  
		  OutValues.UInt16(0) = L * 655.350
		  OutValues.UInt16(2) = (128+A) / 256.0 * 65535.0
		  OutValues.UInt16(4) = (128+B) / 256.0 * 65535.0
		  
		  
		  Return true
		  
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("reverse.txt")
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
