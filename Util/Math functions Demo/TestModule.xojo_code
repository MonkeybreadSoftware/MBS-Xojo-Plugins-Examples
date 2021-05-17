#tag Module
Protected Module TestModule
	#tag Method, Flags = &h0
		Sub assert(assertion as Boolean, msg as String)
		  if not assertion then
		    MsgBox "The following function does not work as expected:" + chr(13) + msg
		    quit
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestIntOps()
		  // This routine tests the Integer methods
		  
		  Dim i, j, k as Integer
		  
		  i = BitValMBS(5) // = 32
		  assert(i = 32, "BitVal")
		  
		  i = BitInclMBS(6, 0)
		  assert(i = 7, "BitIncl #1")
		  i = BitInclMBS(i, 2)
		  assert(i = 7, "BitIncl #2")
		  
		  i = BitExclMBS(6, 0)
		  assert(i = 6, "BitExcl #1")
		  i = BitExclMBS(6, 1)
		  assert(i = 4, "BitExcl #2")
		  
		  assert(BitIsSetMBS(1, 0), "BitIsSet #1")
		  assert(not BitIsSetMBS(1, 1), "BitIsSet #2")
		  
		  i = ArithmeticShiftMBS(2, 1)
		  assert(i = 4, "ArithmeticShift #1")
		  i = ArithmeticShiftMBS(1, 31)
		  assert(i = BitValMBS(31), "ArithmeticShift #2")
		  i = ArithmeticShiftMBS(4, -1)
		  assert(i = 2, "ArithmeticShift #3")
		  i = ArithmeticShiftMBS(4, -3)
		  assert(i = 0, "ArithmeticShift #4")
		  i = ArithmeticShiftMBS(-4, -1)
		  assert(i = -2, "ArithmeticShift #5")
		  
		  i = LogicalShiftMBS(2, 1)
		  assert(i = 4, "LogicalShift #1")
		  i = LogicalShiftMBS(1, 31)
		  assert(i = BitValMBS(31), "LogicalShift #2")
		  i = LogicalShiftMBS(4, -1)
		  assert(i = 2, "LogicalShift #3")
		  i = LogicalShiftMBS(4, -3)
		  assert(i = 0, "LogicalShift #4")
		  i = LogicalShiftMBS(BitValMBS(31), -1)
		  assert(i = BitValMBS(30), "LogicalShift #5")
		  
		  i = BitwiseNotMBS(-2)
		  assert(i = 1, "BitwiseNot")
		  
		  i = BitwiseRotateMBS(&H0110, 1, 0, 16)
		  assert(i = &H0220, "BitwiseRotate #1")
		  i = BitwiseRotateMBS(&H0220, -1, 0, 32)
		  assert(i = &H0110, "BitwiseRotate #2")
		  i = BitwiseRotateMBS(&HF0100, -1, 0, 32)
		  assert(i = &H78080, "BitwiseRotate #3")
		  i = BitwiseRotateMBS(&HF0100, -1, 0, 16)
		  assert(i = &HF0080, "BitwiseRotate #4")
		  i = BitwiseRotateMBS(&HF0100, 1, 0, 17)
		  assert(i = &HE0201, "BitwiseRotate #5")
		  i = BitwiseRotateMBS(&HE0201, -1, 1, 16)
		  assert(i = &HE0101, "BitwiseRotate #6")
		  i = BitwiseRotateMBS(&HE0103, 1, 1, 16)
		  assert(i = &HE0205, "BitwiseRotate #7")
		  
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule
