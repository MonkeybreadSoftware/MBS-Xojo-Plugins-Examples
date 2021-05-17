#tag Class
Protected Class JSONItem_MBS
	#tag Method, Flags = &h0
		Sub Append(v as Variant)
		  // for arrays we use array node instead of object node
		  // so we need to switch the internal JSONMBS object
		  
		  If (Not Me.IsArray) Then
		    mJSON = JSONMBS.NewArrayNode
		  End If
		  
		  Dim p As JSONMBS = ToJSON(v)
		  mJSON.AddItemToArray(p)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(index As Integer) As JSONItem_MBS
		  Return Me.Value(index)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // start with a new object
		  mJSON = JSONMBS.NewObjectNode
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(c As JSONMBS)
		  // wrap a JSONMBS
		  Self.mJSON = c
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(data As String)
		  // parse and raise exception on error
		  // raise exception also if data could be parsed partially
		  mJSON = New JSONMBS(data)
		  
		  If (mJSON.Handle = 0) or (mJSON.ParseError <> "") Then
		    Raise New JSONException("JSONMBS ParseError: " + mJSON.ParseError, mJSON.Handle)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FromJSON(pJSON as JSONMBS) As Variant
		  If (pJSON = Nil) Then Return Nil
		  
		  Select Case pJSON.Type
		    
		  Case JSONMBS.kTypeArray, JSONMBS.kTypeObject
		    Dim r As New JSONItem_MBS(pJSON)
		    r.DecimalFormat = Me.DecimalFormat
		    Return r
		    
		  Case JSONMBS.kTypeFalse
		    Return False
		    
		  Case JSONMBS.kTypeNull
		    Return Nil
		    
		  Case JSONMBS.kTypeNumber
		    If pJSON.IsInt64 Then Return pJSON.ValueInteger
		    Return pJSON.ValueDouble
		    
		  Case JSONMBS.kTypeString
		    Return pJSON.ValueString
		    
		  Case JSONMBS.kTypetrue
		    Return True
		    
		  End Select
		  
		  // Hmm...
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasName(psName As String) As Boolean
		  Dim s() As String
		  Dim c As JSONMBS = mJSON.ChildNode
		  If (c = Nil) Then Return False
		  
		  If (StrComp(c.Name, psName, REALbasic.StrCompCaseSensitive) = 0) Then Return True
		  
		  While (c <> mJSON.LastChildNode)
		    c = c.NextNode
		    If (StrComp(c.Name, psName, REALbasic.StrCompCaseSensitive) = 0) Then Return True
		  Wend
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(key as Variant, defaultValue as Variant) As Variant
		  Select Case mJSON.Type
		    
		  Case JSONMBS.kTypeArray
		    Dim n As Integer = key.IntegerValue
		    Dim c As JSONMBS = mJSON.ArrayItem(n)
		    If (c = Nil) Then
		      Return defaultValue
		    Else
		      Return FromJSON(c)
		    End If
		    
		  Case JSONMBS.kTypeObject
		    Dim l As String = key.StringValue
		    Dim c As JSONMBS = mJSON.Child(l)
		    If (c = Nil) Then
		      Return defaultValue
		    Else
		      Return FromJSON(c)
		    End If
		    
		  Else
		    // Hmm...
		    Break
		  End Select
		  
		  Return defaultValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(index as Integer) As String
		  Dim c As JSONMBS = mJSON.ChildNode
		  
		  For i As Integer = 1 To index
		    If (c = Nil) Then Return ""
		    c = c.NextNode
		  Next
		  
		  If (c = Nil) Then Return ""
		  Return c.Name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Names() As String()
		  Dim s() As String
		  Dim c As JSONMBS = mJSON.ChildNode
		  If (c = Nil) Then Return s
		  s.Append(c.Name)
		  
		  While (c <> mJSON.LastChildNode)
		    c = c.NextNode
		    If (c = Nil) Then Exit 'Loop
		    s.Append(c.Name)
		  Wend
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ToJSON(v as Variant) As JSONMBS
		  // get a JSONItem for Variant
		  
		  If (v = Nil) Then Return JSONMBS.NewNullNode
		  If (v IsA JSONItem_MBS) Then Return JSONItem_MBS(v).mJSON
		  If (v IsA JSONMBS) Then Return v
		  
		  Select Case v.Type
		    
		  Case Variant.TypeString
		    Return JSONMBS.NewStringNode(v.StringValue)
		    
		  Case Variant.TypeBoolean
		    Return JSONMBS.NewBoolNode(v.BooleanValue)
		    
		  Case Variant.TypeDouble, Variant.TypeSingle
		    Return JSONMBS.NewNumberNode(Str(v.DoubleValue, Me.DecimalFormat))
		    
		  Case Variant.TypeInt64, Variant.TypeInt32
		    Return JSONMBS.NewInt64Node(v.Int64Value)
		    
		  Else
		    If v.IsArray Then
		      
		      Select Case v.ArrayElementType
		      Case Variant.TypeDouble
		        Dim a As JSONMBS = JSONMBS.NewArrayNode
		        Dim arr() As Double = v
		        For i As Integer = 0 To arr.Ubound
		          a.AddItemToArray(ToJSON(arr(i)))
		        Next
		        Return a
		        
		      Case Variant.TypeSingle
		        Dim a As JSONMBS = JSONMBS.NewArrayNode
		        Dim arr() As Single = v
		        For i As Integer = 0 To arr.Ubound
		          a.AddItemToArray(ToJSON(arr(i)))
		        Next
		        Return a
		        
		      Case Variant.TypeObject
		        Dim a As JSONMBS = JSONMBS.NewArrayNode
		        Dim arr() As Object = v
		        For i As Integer = 0 To arr.Ubound
		          a.AddItemToArray(ToJSON(arr(i)))
		        Next
		        Return a
		        
		      Else
		        //Use Convert to handle Array values
		        Return JSONMBS.Convert(v)
		      End Select
		      
		    End If
		  End Select
		  
		  // Hmm... that kind of Variant is not (yet) implemented
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(key as Variant) As Variant
		  Select Case mJSON.Type
		    
		  Case JSONMBS.kTypeArray
		    Dim n As Integer = key
		    Dim c As JSONMBS = mJSON.ArrayItem(n)
		    If (c = Nil) Then
		      Dim k As New KeyNotFoundException
		      k.Message = "Item "+Str(n)+" not found."
		      Raise k
		    Else
		      Return FromJSON(c)
		    End If
		    
		  Case JSONMBS.kTypeObject
		    Dim l As String = key
		    Dim c As JSONMBS = mJSON.Child(l)
		    If (c = Nil) Then
		      Dim k As New KeyNotFoundException
		      k.Message = "Key "+l+" not found."
		      Raise k
		    Else
		      Return FromJSON(c)
		    End If
		    
		  End Select
		  
		  // Hmm...
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(key as Variant, assigns value as Variant)
		  mJSON.AddItemToObject(key, ToJSON(Value))
		End Sub
	#tag EndMethod


	#tag Note, Name = KnownIssues
		DecimalFormat
		-------------
		- is only respected when adding Double values
		  -> you have to set the DecimalFormat before adding values
		- no effect if you are changing the DecimalFormat later (e.g. before .ToString)
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		Compact As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mJSON.ArraySize
			End Get
		#tag EndGetter
		Count As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DecimalFormat As String = "-0.0##############"
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return (mJSON.Type = JSONMBS.kTypeArray)
			End Get
		#tag EndGetter
		IsArray As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mJSON As JSONMBS
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mJSON.toString(Not Me.Compact)
			End Get
		#tag EndGetter
		ToString As String
	#tag EndComputedProperty


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
			Name="ToString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Count"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsArray"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Compact"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DecimalFormat"
			Visible=false
			Group="Behavior"
			InitialValue="-0.0##############"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
