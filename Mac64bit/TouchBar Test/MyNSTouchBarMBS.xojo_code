#tag Class
Protected Class MyNSTouchBarMBS
Inherits NSTouchBarMBS
	#tag Event
		Sub Hidden()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function makeItemForIdentifier(identifier as string) As NSTouchBarItemMBS
		  System.DebugLog CurrentMethodName+": "+identifier
		  
		  // we build items on the fly
		  Select case identifier
		  case "test"
		    dim b as new MyNSButtonMBS("test")
		    
		    dim m as new MyNSCustomTouchBarItemMBS(identifier)
		    
		    m.Button = b
		    m.customizationLabel = "Test Item"
		    m.view = b
		    m.visibilityPriority = m.PriorityHigh
		    
		    items.Append m
		    Return m
		    
		  case "print"
		    dim b as new MyNSButtonMBS("Print")
		    
		    dim m as new MyNSCustomTouchBarItemMBS(identifier)
		    
		    m.Button = b
		    m.customizationLabel = "Print Report"
		    m.view = b
		    m.visibilityPriority = m.PriorityNormal
		    
		    items.Append m
		    Return m
		    
		  case "testWindow" // for window
		    dim b as new MyNSButtonMBS("Click")
		    b.bezelColor = NSColorMBS.colorWithDeviceRGB(0.35, 0.61, 0.35, 1.00)
		     
		    dim m as new MyNSCustomTouchBarItemMBS(identifier)
		    
		    m.Button = b
		    m.customizationLabel = "Click me"
		    m.view = b
		    m.visibilityPriority = m.PriorityNormal
		    
		    items.Append m
		    Return m
		    
		  end Select
		End Function
	#tag EndEvent

	#tag Event
		Sub Shown()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Items() As NSTouchBarItemMBS
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
