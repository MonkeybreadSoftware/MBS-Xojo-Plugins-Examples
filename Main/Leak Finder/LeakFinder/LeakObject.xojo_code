#tag Class
Protected Class LeakObject
	#tag Method, Flags = &h0
		Sub AddReference(LeakFinder as LeakFinder, value as Variant)
		  // ignore a few things. Same code in AddObject and AddReference
		  
		  
		  // ignore ourselves
		  If value IsA leakfinder Then Return
		  If value IsA leakobject Then Return
		  
		  // ignore introspection
		  If value IsA Introspection.AttributeInfo   Then Return
		  If value IsA Introspection.ConstructorInfo Then Return 
		  If value IsA Introspection.MemberInfo      Then Return 
		  If value IsA Introspection.MethodInfo      Then Return 
		  If value IsA Introspection.ParameterInfo   Then Return 
		  If value IsA Introspection.PropertyInfo    Then Return 
		  If value IsA Introspection.TypeInfo        Then Return 
		  
		  // ignore data classes
		  #if XojoVersion >= 2020 then
		    If value IsA Xojo.Rect   Then Return 
		    If value IsA Xojo.Size   Then Return 
		    If value IsA Xojo.Point  Then Return 
		    If value IsA dateTime    Then Return 
		    If value IsA TimeZone    Then Return 
		  #EndIf
		  
		  If value IsA WeakRef     Then Return
		  If value IsA date        Then Return 
		  If value IsA MemoryBlock Then Return
		  
		  // skip if we find our own stuf here
		  If value Is LeakFinder.Objects Then
		    Return
		  End If
		  
		  If value Is references Then
		    Return
		  End If
		  
		  
		  // now add objects
		  
		  Dim vt As Integer = VarType(value)
		  If vt = Variant.TypeObject Or vt = (Variant.TypeArray Or Variant.TypeObject) Then
		    
		    Dim l As LeakObject = LeakFinder.Objects.Lookup(value, Nil)
		    
		    If l <> Nil Then
		      references.Append l
		    Else
		      
		      // add missings
		      Dim n As LeakObject = LeakFinder.AddObject(value)
		      If n <> Nil Then
		        references.Append n
		      Else
		        Break
		      End If
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub clear()
		  references = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(value as Variant)
		  self.target = value
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Introspection.GetType(target).name
			  
			End Get
		#tag EndGetter
		ClassName As string
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		references() As LeakObject
	#tag EndProperty

	#tag Property, Flags = &h0
		target As variant
	#tag EndProperty

	#tag Property, Flags = &h0
		visited As Boolean
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
		#tag ViewProperty
			Name="visited"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ClassName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
