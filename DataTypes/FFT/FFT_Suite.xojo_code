#tag Module
Protected Module FFT_Suite
	#tag Method, Flags = &h0
		Function FFT(x() as complex, N as integer = -1) As Complex()
		  // Zero-pad the data to length N if necessary and return an empty array array if the number of elements
		  // in the input array is not a power of 2
		  dim M as integer = Ubound(x) + 1
		  
		  if N > M then
		    if not IsPowerof2(N) then
		      dim c() as Complex
		      return c
		    else
		      x = ZeroPad(x, N)
		    end if
		  else
		    if not IsPowerOf2(M) then
		      dim c() as Complex
		      return c
		    end if
		  end if
		  
		  // Calculate the FFT
		  return FFT_int(x)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FFT(x() as double, N as integer = -1) As Complex()
		  // FFT using real numbers as input
		  
		  //Calculate the smallest power of 2 greater than the upper bound of x
		  if n = -1 then
		    dim powerof2 as integer = 2
		    dim ub as integer = UBound(x)
		    while powerof2 < ub
		      powerof2 = powerof2 * 2
		    wend
		    n = powerof2
		  end if
		  
		  // Convert input array to Complex
		  dim M as integer = UBound(x)
		  dim c() as Complex
		  for k as integer = 0 to M
		    c.Append new Complex(x(k),0)
		  next
		  
		  return FFT(c, N)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FFT_int(x() as complex) As Complex()
		  // Radix-2 Decimation in Time FFT algorithm (Cooley-Tukey)
		  // Source: http://en.wikipedia.org/wiki/Cooley-Tukey_FFT_algorithm
		  
		  //#pragma DisableBackgroundTasks
		  
		  // If the input array only contains 1 element then we've reached the end of the recursion
		  dim N as integer = UBound(x) ' number of elements - 1 in the input array
		  if N = 0 then
		    return x
		  end if
		  
		  // Split the input array in to Even and Odd, each with half the elements
		  dim Even() as Complex
		  dim Odd() as Complex
		  dim N2 as integer = (N+1) \ 2 - 1
		  redim Even(N2)
		  redim Odd(N2)
		  for k as integer = 0 to N2
		    Odd(k) = x(2*k)
		    Even(k) = x(2*k + 1)
		  next
		  
		  // Recursively calculate the FFT for Even and Odd
		  dim Even_() as Complex = FFT_int(Even)
		  dim Odd_() as Complex = FFT_int(Odd)
		  
		  // Multiply elements of Odd_ with the Twiddle-Factors e^(-2 * pi * j / (N+1) * k)
		  dim j as Complex = new Complex(0,1) 
		  dim W as Complex = -2 * pi * j / (N+1)
		  for k as integer = 0 to N2
		    Odd_(k) = Odd_(k) * Complex(W * k).Exp
		  next
		  
		  // Reconstruct FFT from Even_ and Odd_
		  dim X_() as Complex // Output Array
		  redim X_(N)
		  for k as integer = 0 to N2
		    X_(k) = Even_(k) + Odd_(k)
		    X_(k + N2 + 1) = Even_(k) - Odd_(k)
		  next
		  
		  Return X_
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsPowerOf2(N as integer) As boolean
		  // if a number n is a power of 2, only one bit is set, all the others are cleared.
		  // In that case (n - 1) is the bitwise NOT of n. I.e. if and only if x is a power of 2, n AND (n-1) must be 0
		  
		  if (N and (N-1)) = 0 then return true
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ZeroPad(c() as Complex, N as integer) As Complex()
		  // extends the vector c() with zeros to the length of N
		  
		  dim M as integer = UBound(c) + 1
		  for k as integer = M to N - 1
		    c.Append new Complex
		  next
		  
		  Return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ZeroPad(x() as double, N as integer) As double()
		  // extends the vector x() with zeros to the length of N
		  
		  dim M as integer = UBound(x) + 1
		  for k as integer = M to N - 1
		    x.Append 0
		  next
		  
		  return x
		End Function
	#tag EndMethod


	#tag Constant, Name = pi, Type = Double, Dynamic = False, Default = \"3.141592653589793238462643383279502884197169399375105820974944592", Scope = Public
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
End Module
#tag EndModule
