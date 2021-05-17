#tag Module
Protected Module UtilModule
	#tag Method, Flags = &h0
		Sub add(extends p as PopupMenu, title as string, tag as Variant)
		  p.AddRow title
		  p.RowTag(p.ListCount-1) = tag
		  
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub NotiifcationDelegate(notification as NSNotificationMBS)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function SelectedTag(extends p as PopupMenu) As Variant
		  if p.ListIndex>=0 then
		    Return p.RowTag(p.ListIndex)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetByTag(extends p as PopupMenu, value as Variant)
		  dim u as integer = p.ListCount-1
		  
		  for i as integer = 0 to u
		    dim tag as Variant = p.RowTag(i)
		    if tag = value then
		      
		      // avoid change event if it's already set
		      if p.ListIndex <> i then 
		        p.ListIndex = i
		      end if
		      
		      Return
		    end if
		  next
		  
		  // not found
		  
		  if p.ListIndex <> -1 then
		    p.ListIndex = -1
		  end if
		  
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
