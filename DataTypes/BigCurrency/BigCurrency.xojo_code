#tag Class
Protected Class BigCurrency
	#tag Method, Flags = &h0
		Sub Constructor()
		  // initialize with empty value
		  Self.value = New LargeNumberMBS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as BigCurrency)
		  
		  If value = Nil Then
		    // initialize with empty value
		    Self.value = New LargeNumberMBS
		  Else
		    
		    // copy value
		    Self.value = New LargeNumberMBS(value.value) 
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as Currency)
		  Dim v As LargeNumberMBS = LargeNumberWithCurrencyValue(value)
		  
		  Self.value = v.Multiply(Factor / CurrencyFactor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as Double)
		  // todo
		  
		  'value = value * Factor
		  'Self.value = LargeNumberMBS.NumberWithDouble(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as Integer)
		  Dim v As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(value)
		  
		  Self.value = v.Multiply(factor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(value as LargeNumberMBS)
		  Self.value = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as string)
		  // todo
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function LargeNumberWithCurrencyValue(value as Currency) As LargeNumberMBS
		  Static m As New MemoryBlock(8)
		  
		  // get value out of currency, which gives value * 10000 
		  m.CurrencyValue(0) = value
		  Dim n As Int64 = m.Int64Value(0)
		  
		  Return LargeNumberMBS.NumberWithInt64(n)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = self.value + other.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_Add(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Dim r As New BigCurrency
		  
		  r.value = Self.value + o.Multiply(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_AddRight(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = other.value + self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_AddRight(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_AddRight(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_AddRight(other as Integer) As BigCurrency
		  Dim r As New BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  
		  r.value = o.multiply(factor) + self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(other as BigCurrency) As Integer
		  Return Self.value.Operator_Compare(other.value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(other as Currency) As Integer
		  Dim b As New BigCurrency(other)
		  Return Operator_Compare(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(other as Integer) As Integer
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Return Self.value.Operator_Compare(o.multiply(factor))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Double
		  return self.doubleValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Int64
		  Return Self.IntegerValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  return self.stringValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert(value as Double) As BigCurrency
		  Return New BigCurrency(value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert(value as Integer) As BigCurrency
		  Return New BigCurrency(value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert(value as string) As BigCurrency
		  Return New BigCurrency(value)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = Self.value.Multiply(factor) / other.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_Divide(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(other as Integer) As BigCurrency
		  Dim r As New BigCurrency
		  
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  r.value = Self.value / o
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_DivideRight(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = other.value.Multiply(factor) / Self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_DivideRight(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_DivideRight(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_DivideRight(other as Integer) As BigCurrency
		  Dim r As New BigCurrency
		  
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  r.value = o / Self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_IntegerDivide(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  // this will do integer divide and round down!
		  Dim v As LargeNumberMBS = Self.value / other.value
		  
		  // multiply for 8 digits after decimal point
		  r.value = v.Multiply(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_IntegerDivide(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_IntegerDivide(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_IntegerDivide(other as Integer) As BigCurrency
		  
		  // this will do integer divide and round down!
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Dim r As LargeNumberMBS = Self.value / o
		  
		  // multiply for 8 digits after decimal point
		  Return new BigCurrency(r)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_IntegerDivideRight(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  // this will do integer divide and round down!
		  Dim v As LargeNumberMBS = other.value / self.value
		  
		  // multiply for 8 digits after decimal point
		  r.value = v.Multiply(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_IntegerDivideRight(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_IntegerDivideRight(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_IntegerDivideRight(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  
		  // this will do integer divide and round down!
		  Dim r As LargeNumberMBS = o / Self.value
		  
		  Return New BigCurrency(r)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Modulo(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = Self.value.Multiply(factor) mod other.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Modulo(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_Modulo(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Modulo(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Dim r As New BigCurrency
		  
		  r.value = Self.value.Multiply(factor) mod o.Multiply(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_ModuloRight(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = other.value.Multiply(factor) mod self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_ModuloRight(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_ModuloRight(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_ModuloRight(other as Integer) As BigCurrency
		  Dim r As New BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  
		  r.value = o.Multiply(factor).Multiply(factor) Mod Self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  Dim t As LargeNumberMBS = Self.value * other.value
		  r.value = t.Divide(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_Multiply(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Dim r As LargeNumberMBS = Self.value * o
		  Return new BigCurrency(r)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_MultiplyRight(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  Dim t As LargeNumberMBS = other.value * Self.value
		  r.value = t.Divide(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_MultiplyRight(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_MultiplyRight(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_MultiplyRight(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Dim r As LargeNumberMBS = o * Self.value
		  Return New BigCurrency(r)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Negate() As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = -Self.value
		  
		  Return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = Self.value - other.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_Subtract(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  Dim r As New BigCurrency
		  
		  r.value = Self.value - o.Multiply(factor)
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_SubtractRight(other as BigCurrency) As BigCurrency
		  Dim r As New BigCurrency
		  
		  r.value = other.value - Self.value
		  
		  Return r
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_SubtractRight(other as Currency) As BigCurrency
		  Dim b As New BigCurrency(other)
		  Return Operator_SubtractRight(b)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_SubtractRight(other as Integer) As BigCurrency
		  Dim o As LargeNumberMBS = LargeNumberMBS.NumberWithInteger(other)
		  dim r As New BigCurrency
		  
		  r.value = o.Multiply(factor) - Self.value
		  
		  Return r
		End Function
	#tag EndMethod


	#tag Note, Name = Readme
		
		BigCurrency class to replace Currency in Xojo and provide more digits precision
		
		 
		
		To change precision, please change factor and digits constants.
		As we use UInt32 functions, please use maximum 9 digits.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim d As Double = Self.value.DoubleValue
			  
			  Return d / Factor
			End Get
		#tag EndGetter
		doubleValue As double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  // no rounding!
			  Dim v As LargeNumberMBS = Self.value.Divide(factor)
			  
			  Return v.Int64Value
			End Get
		#tag EndGetter
		IntegerValue As Int64
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim s As String = Me.value
			  Dim t As String
			  Dim minus As Boolean = False
			  
			  If Left(s, 1) = "-" Then
			    minus = True
			    s = Mid(s,2)
			  End If
			  
			  
			  If Len(s) > Digits Then
			    
			    t = Left(s, Len(s) - Digits) + "." + Right(s, Digits)
			    
			  Else
			    
			    t = s
			    While Len(t) < digits
			      t = "0" + t
			    Wend
			    
			    t = "0."+t
			    
			  End If
			  
			  
			  If minus Then
			    t = "-" + t
			  End If
			  
			  Return t
			End Get
		#tag EndGetter
		StringValue As string
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private value As LargeNumberMBS
	#tag EndProperty


	#tag Constant, Name = CurrencyFactor, Type = Double, Dynamic = False, Default = \"10000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Digits, Type = Double, Dynamic = False, Default = \"8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = Factor, Type = Double, Dynamic = False, Default = \"100000000", Scope = Private
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
		#tag ViewProperty
			Name="StringValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="doubleValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IntegerValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Int64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
