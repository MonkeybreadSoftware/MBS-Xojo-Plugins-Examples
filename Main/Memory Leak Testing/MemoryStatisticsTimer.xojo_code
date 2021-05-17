#tag Class
Protected Class MemoryStatisticsTimer
Inherits Timer
	#tag Event
		Sub Action()
		  // this stats show in Terminal when app runs as Standalone or you may see in debugger in messages
		  
		  System.DebugLog Str(Runtime.ObjectCount)+" objects using "+Str(runtime.MemoryUsed / 1024, "0.0")+" KB"
		  
		  counter = counter + 1
		  
		  If counter Mod 10 = 0 Then
		    // show stats every 10 seconds
		    DumpObjects
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DumpObjects()
		  // find all objects
		  Dim objects() As Variant 
		  
		  Dim RuntimeObjectIterator As Runtime.ObjectIterator = Runtime.IterateObjects
		  While RuntimeObjectIterator.MoveNext
		    objects.append RuntimeObjectIterator.Current
		  Wend
		  
		  // for macOS, iOS and Linux compact memory and print stats
		  #If Not TargetWindows
		    Dim m As New MemoryStatisticsMBS
		    
		    m.Compact
		    System.DebugLog Str(m.bytesFree)+" free, "+Str(m.bytesTotal)+" total"
		    // free bytes shows how much space is available to be reassigned for new objects without requesting new memory pages from OS
		  #EndIf
		  
		  
		  // make a table with statistics
		  Dim counts As New Dictionary
		  Dim tab As String = Chr(9)
		  
		  For Each o As Variant In objects
		    
		    Dim t As Introspection.TypeInfo = Introspection.GetType(o)
		    Dim s As String 
		    
		    If t = Nil Then
		      
		      // internal objects
		      s = "internal"
		      
		    Elseif o.IsArray Then
		      
		      s = "array"
		      
		    Else
		      
		      s = t.name
		      
		    End If
		    
		    Dim key As String = Str(VarType(o))+tab+s
		    
		    
		    counts.Value(key) = counts.Lookup(key, 0).IntegerValue  + 1
		    
		  Next
		  
		  // make lines and sort, then print
		  Dim lines() As String
		  
		  For Each key As Variant In counts.keys
		    
		    lines.Append key.StringValue + tab + counts.value(key)
		    
		  Next
		  
		  lines.Sort
		  
		  For Each line As String In lines
		    
		    Print line
		    
		  Next
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private counter As Integer
	#tag EndProperty


	#tag ViewBehavior
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
			Name="RunMode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="RunModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
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
			InitialValue=""
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
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
