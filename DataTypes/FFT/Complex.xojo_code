#tag Class
Protected Class Complex
	#tag Method, Flags = &h0
		Function Abs() As double
		  // Absolute Value of a complex number
		  
		  // abs(z)  =  sqrt(norm(z))
		  
		  return sqrt(me.Norm)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mImag = 0
		  mReal = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Real as double, Imag as double)
		  mImag = Imag
		  mReal = Real
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Exp() As complex
		  // complex exponential
		  
		  // exp(x + i*y)  =  exp(x) * ( cos(y) + i * sin(y) )
		  
		  dim cp as new Complex
		  
		  cp.Real = exp(mReal) * cos(mImag)
		  cp.Imag = exp(mReal) * sin(mImag)
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Imag() As double
		  Return mImag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Imag(assigns im as double)
		  mImag = im
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Norm() As double
		  // Square of the "length" of a complex number
		  
		  // norm(x + i*y)  =  x*x + y*y
		  
		  return mReal^2 + mImag^2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(c as complex) As complex
		  // Sum of two Complex numbers
		  
		  // (a + i*b) + (c + i*d)  =  ((a+c) + i*(b+d))
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal + c.Real
		  cp.Imag = mImag + c.Imag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(d as double) As complex
		  // Sum of a complex number and a real number
		  
		  // (a + i*b) + d  =  ((a+d) + i*b)
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal + d
		  cp.Imag = mImag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(c as complex) As complex
		  // Division of two Complex numbers
		  
		  // (a + i*b) / (c + i*d)  =  ( (a*c) + (b*d) + i*((b*c) - (a*d)) ) / norm(c + i*d)
		  
		  dim cp as new Complex
		  
		  cp.Real = (mReal * c.Real + mImag * c.Imag) / (c.Real^2 + c.Imag^2)
		  cp.Imag = (mImag * c.Real - mReal * c.Imag) / (c.Real^2 + c.Imag^2)
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(d as double) As complex
		  // Product of a complex number and a real number
		  
		  // (a + i*b) / d  =  ( (a/d) + i*(b/d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal / d
		  cp.Imag = mImag / d
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(c as complex) As complex
		  // Product of two Complex numbers
		  
		  // (a + i*b) * (c + i*d)  =  ( (a*c) - (b*d) + i*((a*d) + (b*c)) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal * c.Real - mImag * c.Imag
		  cp.Imag = mReal * c.Imag + mImag * c.Real
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(d as double) As complex
		  // Product of a complex number and a real number
		  
		  // (a + i*b) * d  =  ( (a*d) + i*(b*d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal * d
		  cp.Imag = mImag * d
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_MultiplyRight(d as double) As complex
		  // Product of a complex number and a real number
		  
		  // (a + i*b) * d  =  ( (a*d) + i*(b*d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal * d
		  cp.Imag = mImag * d
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(c as complex) As complex
		  // Difference of two Complex numbers
		  
		  // (a + i*b) - (c + i*d)  =  ((a-c) + i*(b-d))
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal - c.Real
		  cp.Imag = mImag - c.Imag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(d as double) As complex
		  // Difference of a complex number and a real number
		  
		  // (a + i*b) - d  =  ((a-d) + i*b)
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal - d
		  cp.Imag = mImag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Real() As double
		  Return mReal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Real(assigns re as double)
		  mReal = re
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mImag As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReal As Double
	#tag EndProperty


	#tag Constant, Name = Pi, Type = Double, Dynamic = False, Default = \"3.141592653589793238462643383279502884197169399375105820974944592", Scope = Public
	#tag EndConstant


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
