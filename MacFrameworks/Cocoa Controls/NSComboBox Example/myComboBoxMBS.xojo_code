#tag Class
Protected Class myComboBoxMBS
Inherits NSComboBoxMBS
	#tag Event
		Sub Action()
		  
		  if list<>Nil then
		    list.InsertRow 0, "Action event: "+me.StringValue
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function textShouldBeginEditing(fieldEditor as NSTextMBS) As boolean
		  
		  if list<>Nil then
		    list.InsertRow 0, "textShouldBeginEditing event: "+me.StringValue
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function textShouldEndEditing(fieldEditor as NSTextMBS) As boolean
		  
		  if list<>Nil then
		    list.InsertRow 0, "textShouldEndEditing event: "+me.StringValue
		  end if
		  Return true
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		Changed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
