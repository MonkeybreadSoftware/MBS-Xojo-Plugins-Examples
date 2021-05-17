#tag Class
Protected Class MyCGEventTapMBS
Inherits CGEventTapMBS
	#tag Event
		Function GotEvent(Proxy as Ptr, type as Integer, e as CGEventMBS) As CGEventMBS
		  dim t as string
		  dim i as string
		  
		  Select case e.Type
		  case CGEventMBS.kCGEventKeyDown
		    t = "KeyDown"
		    i = e.UnicodeString
		  case CGEventMBS.kCGEventKeyUp
		    t = "KeyUp"
		    i = e.UnicodeString
		  case CGEventMBS.kCGEventFlagsChanged
		    t = "FlagsChanged"
		    i = hex(e.Flags)
		  case CGEventMBS.kCGEventNull
		    t = "Null"
		  case CGEventMBS.kCGEventLeftMouseDown
		    t = "LeftMouseDown"
		    
		  case CGEventMBS.kCGEventLeftMouseDragged
		    t = "LeftMouseDragged"
		    
		  case CGEventMBS.kCGEventLeftMouseUp
		    t = "LeftMouseUp"
		    
		  case CGEventMBS.kCGEventMouseMoved
		    return e // don't report as this gives a lot of events!
		    t = "MouseMoved"
		    
		  case 8
		    t = "MouseEnter"
		    
		  case 9
		    t = "MouseExit"
		    
		  case CGEventMBS.kCGEventOtherMouseDown
		    t = "OtherMouseDown"
		    
		  case CGEventMBS.kCGEventOtherMouseDragged
		    t = "OtherMouseDragged"
		    
		  case CGEventMBS.kCGEventOtherMouseUp
		    t = "OtherMouseUp"
		    
		  case CGEventMBS.kCGEventRightMouseDown
		    t = "RightMouseDown"
		    
		  case CGEventMBS.kCGEventRightMouseDragged
		    t = "RightMouseDragged"
		    
		    
		  case CGEventMBS.kCGEventRightMouseUp
		    t = "RightMouseUp"
		    
		    
		  case CGEventMBS.kCGEventScrollWheel
		    t = "ScrollWheel"
		    
		    
		  case CGEventMBS.kCGEventTabletPointer
		    t = "TabletPointer"
		    
		    
		  case CGEventMBS.kCGEventTabletProximity
		    t = "TabletProximity"
		    
		    
		  case CGEventMBS.kCGEventTapDisabledByTimeout
		    t = "TapDisabledByTimeout"
		    
		    
		  case CGEventMBS.kCGEventTapDisabledByUserInput
		    t = "TapDisabledByUserInput"
		    
		    // ignore some internal events
		  case 13
		    return e
		  case 14
		    return e
		  case 15
		    return e
		    
		  end Select
		  
		  dim ee as string = "Got "+t+" ("+str(type)+") event"
		  
		  if i = "" then
		    l.AddRow ee
		  else
		    l.AddRow ee+": "+i
		  end if
		  
		  return e
		  
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		l As Listbox
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
