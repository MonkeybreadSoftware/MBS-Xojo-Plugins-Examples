#tag Class
Protected Class MyNSKeyValueObserverMBS
Inherits NSKeyValueObserverMBS
	#tag Event
		Function observedValueForKeyPathChanged(keyPath as string, target as variant, change as dictionary, context as variant, ChangeNSDictionaryRef as Integer) As boolean
		  dim kind as integer = change.Lookup(me.NSKeyValueChangeKindKey, -1)
		  dim newValue as Variant = change.lookup(me.NSKeyValueChangeNewKey, nil)
		  dim oldValue as Variant = change.lookup(me.NSKeyValueChangeOldKey, nil)
		  dim newString as string
		  dim oldString as string 
		  
		  if newValue isa NSWindowMBS then
		    dim w as NSWindowMBS = newValue
		    newString = "window with title "+w.title
		  elseif newValue isa NSViewMBS then
		    dim v as NSViewMBS = newValue
		    newString = "view of class "+v.className
		  else
		    newString = newValue.StringValue
		  end if
		  
		  if oldValue isa NSWindowMBS then
		    dim w as NSWindowMBS = oldValue
		    oldString = "window with title "+w.title
		  elseif oldValue isa NSViewMBS then
		    dim v as NSViewMBS = oldValue
		    oldString = "view of class "+v.className
		  else
		    oldString = oldValue.StringValue
		  end if
		  
		  if oldString = "" then
		    oldString = "nothing"
		  end if
		  
		  select case kind
		  case me.kChangeInsertion
		    list.AddRow keyPath+" inserted "+newString
		  case me.kChangeRemoval
		    list.AddRow keyPath+" removed "+oldString
		  case me.kChangeReplacement
		    list.AddRow keyPath+" changed from "+oldString+" to "+newString
		  case me.kChangeSetting
		    list.AddRow keyPath+" set from "+oldString+" to "+newString
		  end Select
		  
		  Return true
		  
		End Function
	#tag EndEvent


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
	#tag EndViewBehavior
End Class
#tag EndClass
