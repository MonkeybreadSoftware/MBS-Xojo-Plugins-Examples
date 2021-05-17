#tag Class
Protected Class LeakFinder
	#tag Method, Flags = &h0
		Sub AddAllObjects()
		  Dim o As Runtime.ObjectIterator = Runtime.IterateObjects
		  While o.MoveNext
		    Call AddObject o.Current
		  Wend
		  
		  Processed = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddObject(value as variant) As LeakObject
		  // ignore a few things. Same code in AddObject and AddReference
		  
		  
		  // ignore ourselves
		  If value IsA leakfinder Then Return Nil
		  If value IsA leakobject Then Return Nil
		  
		  // ignore introspection
		  If value IsA Introspection.AttributeInfo   Then Return Nil
		  If value IsA Introspection.ConstructorInfo Then Return Nil
		  If value IsA Introspection.MemberInfo      Then Return Nil
		  If value IsA Introspection.MethodInfo      Then Return Nil
		  If value IsA Introspection.ParameterInfo   Then Return Nil
		  If value IsA Introspection.PropertyInfo    Then Return Nil
		  If value IsA Introspection.TypeInfo        Then Return Nil
		  
		  // ignore data classes
		  #If XojoVersion >= 2020 Then
		    If value IsA Xojo.Rect   Then Return Nil
		    If value IsA Xojo.Size   Then Return Nil
		    If value IsA Xojo.Point  Then Return Nil
		    If value IsA dateTime    Then Return Nil
		    If value IsA TimeZone    Then Return Nil
		  #endif
		  
		  If value IsA WeakRef     Then Return Nil
		  If value IsA date        Then Return Nil
		  If value IsA MemoryBlock Then Return Nil
		  If value Is  objects     Then Return Nil
		  
		  
		  
		  // now store this one
		  Dim l As New LeakObject(value)
		  objects.value(value) = l
		  
		  Processed = False
		  
		  Return l
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  
		  For Each v As Variant In Objects.Keys
		    If v IsA LeakObject Then
		      Dim obj As LeakObject = v
		      obj.clear
		    end if
		  Next
		  
		  objects.Clear
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearVisited()
		  
		  Dim objectsValues() As Variant = objects.values
		  For Each obj As LeakObject In objectsValues
		    obj.visited = False
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  objects = New Dictionary
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		  // clear anything if there is something left
		  For Each obj As LeakObject In objects.values
		    obj.clear
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindLeaks()
		  // no objects, so add them all!
		  If objects.Count = 0 Then
		    AddAllObjects
		  End If
		  
		  // process if not yet done
		  If Not Processed Then
		    Process
		  End If
		  
		  
		  Dim FoundPath() As LeakObject
		  Dim objectsValues() As Variant = objects.values
		  For Each obj As LeakObject In objectsValues
		    
		    Redim FoundPath(-1)
		    
		    ClearVisited
		    Dim found As Boolean = FindLeaksIn(obj, FoundPath)
		    
		    If found Then
		      FoundPath.Append obj
		      
		      RaiseEvent FoundLeak FoundPath
		      
		      Dim names() As String
		      
		      For Each f As LeakObject In FoundPath
		        names.Insert 0, f.ClassName
		      Next
		      
		      System.DebugLog Join(names, " -> ")
		      
		    End If
		    
		  Next
		  
		  // cleanup
		  Clear
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function FindLeaksIn(obj As LeakObject, FoundPath() As LeakObject) As Boolean
		  obj.visited = True
		  
		  For Each ref As LeakObject In obj.references
		    
		    If ref.visited Then
		      // found it
		      
		      FoundPath.Append ref
		      Return True
		      
		    Else
		      
		      Dim found As Boolean = FindLeaksIn(ref, FoundPath)
		      
		      If found Then
		        FoundPath.Append ref
		        Return True
		      End If
		      
		    End If
		    
		    
		  Next
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Process()
		  Processed = True
		  
		  // clear references
		  Dim objectsValues() As Variant = objects.values
		  For Each o As LeakObject In objectsValues
		    Redim o.references(-1)
		  Next
		  
		  // find references
		  For Each o As LeakObject In objectsValues
		    
		    Dim target As Variant = o.target
		    
		    // Handle a few special cases for classes
		    
		    #If TargetWeb Then
		      If target IsA Webstyle Then
		        Continue // ignore
		      End If
		      
		    #ElseIf TargetDesktop
		      If target IsA RectControl Then
		        Dim r As RectControl = target
		        If r.Handle = 0 Then
		          // found leaked control!
		          FoundLeak Array(o)
		          Continue 
		        End If
		        
		      End If
		      
		      If target IsA Window Then
		        // window checks controls
		        Dim win As Window = target
		        Dim c As Integer = win.ControlCount-1
		        For i As Integer = 0 To c
		          Dim v As Variant = win.Control(i)
		          o.AddReference Self, v
		        Next
		        
		      Elseif target IsA Listbox Then
		        // Tags of Listbox
		        Dim list As Listbox = target
		        
		        Dim columnUbound As Integer = list.ColumnCount-1
		        For col As Integer = 0 To columnUbound
		          Dim v As Variant = list.ColumnTag(col)
		          o.AddReference Self, v
		        Next
		        
		        #If XojoVersion >= 2020 Then
		          Dim rowUbound As Integer = list.RowCount-1
		        #Else
		          Dim rowUbound As Integer = list.ListCount-1
		        #EndIf
		        
		        For row As Integer = 0 To rowUbound
		          Dim v As Variant = list.RowTag(row)
		          o.AddReference Self, v
		          
		          For col As Integer = 0 To columnUbound
		            v = list.CellTag(row, col)
		            o.AddReference Self, v
		          Next
		        Next
		      end if
		      
		    #EndIf
		    
		    #If XojoVersion >= 2020 Then
		      If target IsA RowSet Then
		        Dim r As RowSet = target
		        Dim c As Integer = r.ColumnCount-1
		        For i As Integer = 0 To c
		          Dim v As Variant = r.ColumnAt(i)
		          o.AddReference Self, v
		        Next
		      end if
		    #EndIf
		    
		    // dictionary
		    If target IsA Dictionary Then
		      Dim d As Dictionary = target
		      
		      For Each key As Variant In d.keys
		        
		        o.AddReference Self, key
		        
		        Dim value As Variant = d.Value(key)
		        o.AddReference Self, value
		        
		      Next
		      
		    Elseif target IsA RecordSet Then
		      Dim r As RecordSet = target
		      Dim c As Integer = r.fieldcount
		      For i As Integer = 1 To c // one-based
		        Dim v As Variant = r.IdxField(i)
		        o.AddReference Self, v
		      Next
		    End If
		    
		    // object arrays
		    If target.Type = Variant.TypeArray + Variant.TypeObject Then
		      
		      Dim type As Introspection.TypeInfo = Introspection.GetType(target)
		      If type <> Nil Then // internal objects will not have Introspection!
		        
		        If type.Name = "Object()" Then
		          // array with one dimension
		          
		          Dim values() As Object = target
		          For Each value As Variant In values
		            o.AddReference Self, value
		          Next
		          
		        Elseif type.Name = "Object(,)" Then
		          // array with two dimensions
		          
		          Dim values(-1,-1) As Object = target
		          
		          Dim u1 As Integer = UBound(values, 1)
		          Dim u2 As Integer = UBound(values, 2)
		          
		          For i1 As Integer = 0 To u1
		            For i2 As Integer = 0 To u2
		              Dim value As Variant = values(i1, i2)
		              o.AddReference Self, value
		            Next
		          Next
		        Elseif type.Name = "Object(,,)" Then
		          // array with three dimensions
		          
		          Dim values(-1,-1,-1) As Object = target
		          
		          Dim u1 As Integer = UBound(values, 1)
		          Dim u2 As Integer = UBound(values, 2)
		          Dim u3 As Integer = UBound(values, 3)
		          
		          For i1 As Integer = 0 To u1
		            For i2 As Integer = 0 To u2
		              For i3 As Integer = 0 To u3
		                Dim value As Variant = values(i1, i2, i3)
		                o.AddReference Self, value
		              Next
		            next
		          Next
		          
		        Else
		          Break // more dimensions?
		        End If
		        
		      Else
		        Break
		      End If
		      
		      
		      Continue
		    End If
		    
		    // properties
		    Dim type As Introspection.TypeInfo = Introspection.GetType(target)
		    If type <> Nil Then // internal objects will not have Introspection!
		      If type.name = "PropertyInfoImp" Then 
		        // private internal class
		        Continue
		      End If
		      
		      
		      // handle non-weak delegates with AddressOf
		      If type.name = "delegate" Then
		        Dim weak As Boolean = GetDelegateWeakMBS(o.target)
		        If Not weak Then
		          Dim t As Variant = GetDelegateTargetMBS(o.target)
		          If t <> Nil Then
		            o.AddReference Self, t
		          End If
		        End If
		      End If
		      
		      
		      Dim properties() As Introspection.PropertyInfo = type.GetProperties
		      
		      #If TargetDesktop Then
		        If target IsA RectControl Then
		          // special handle for controls for the window property pointing to parent window, which is not a leak
		          For Each PropertyInfo As Introspection.PropertyInfo In properties
		            
		            If PropertyInfo.Name = "window" Then
		              // skip for controls
		            Else
		              #Pragma BreakOnExceptions False
		              Try
		                Dim value As Variant = PropertyInfo.Value(target)
		                o.AddReference Self, value
		              Catch r As RuntimeException
		                // ignore exception
		              End Try
		              #Pragma BreakOnExceptions Default
		            End If
		          Next
		          Continue
		        End If
		      #endif
		      
		      
		      For Each PropertyInfo As Introspection.PropertyInfo In properties
		        #Pragma BreakOnExceptions False
		        Try
		          Dim value As Variant = PropertyInfo.Value(target)
		          
		          #If TargetWeb
		            // skip computed properties, which may show up often
		            If o.target IsA WebFile And PropertyInfo.Name = "session" Then
		              // ignore
		              Continue
		            Elseif o.target IsA WebPage And PropertyInfo.Name = "session" Then
		              // ignore
		              Continue
		            Elseif o.target IsA WebControl And (PropertyInfo.Name = "page" Or PropertyInfo.Name = "parent") Then
		              // ignore
		              Continue
		            end if
		          #EndIf
		          
		          o.AddReference Self, value
		        Catch r As RuntimeException
		          // ignore exception
		        End Try
		        #Pragma BreakOnExceptions Default
		      Next
		    End If
		    
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FoundLeak(Path() as LeakObject)
	#tag EndHook


	#tag Note, Name = About
		
		Written 2020 by Christian Schmitz
		
	#tag EndNote


	#tag Property, Flags = &h0
		Objects As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Processed As Boolean
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
