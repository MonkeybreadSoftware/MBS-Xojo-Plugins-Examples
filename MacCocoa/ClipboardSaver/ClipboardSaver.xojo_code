#tag Class
Protected Class ClipboardSaver
	#tag Method, Flags = &h0
		Sub Constructor()
		  #if TargetWin32
		    
		    dim w as new WindowsClipboardMBS
		    dim types(-1) as integer = w.ClipboardFormats
		    
		    for each type as integer in types
		      dim d as string = w.GetData(type)
		      
		      me.wtype.Append type
		      me.data.Append d
		    next
		    
		  #elseif TargetMacOS
		    
		    dim p as new NSPasteboardMBS
		    dim types(-1) as string = p.types
		    
		    for each type as string in types
		      me.mtype.Append type
		      me.data.Append p.dataForType(type)
		    next
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Restore()
		  #if TargetWin32
		    dim w as new WindowsClipboardMBS
		    
		    w.Clear
		    
		    dim u as integer = UBound(Data)
		    for i as integer = 0 to u
		      
		      call w.SetData(wtype(i), data(i))
		      
		    next
		    
		  #elseif TargetMacOS
		    dim p as new NSPasteboardMBS
		    
		    call p.declareTypes(mtype)
		    
		    dim u as integer = UBound(Data)
		    for i as integer = 0 to u
		      
		      p.dataForType(mtype(i))=data(i)
		      
		    next
		  #endif
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		data(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		mtype(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		wtype(-1) As Integer
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
