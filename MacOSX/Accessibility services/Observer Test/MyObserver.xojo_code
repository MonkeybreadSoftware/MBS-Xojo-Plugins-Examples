#tag Class
Protected Class MyObserver
Inherits AXObserverMBS
	#tag Event
		Sub Action(element as AXUIElementMBS, notification as CFStringMBS)
		  dim a2 as AXValueMBS
		  dim s as String
		  dim c as CFStringMBS
		  
		  a2=element.AttributeValue(AccessibilityMBS.kAXTitleAttribute)
		  if a2<>nil and a2.Type=kCFStringMBSTypeID then
		    c=a2.CFStringMBS
		    if c<>nil then
		      s=c.str
		    end if
		  end if
		  
		  if notification=nil then
		    mainWindow.List.InsertRow 0,"? ("+s+")"
		  else
		    mainWindow.List.InsertRow 0,notification.str+" ("+s+")"
		  end if
		  
		  
		  
		  Exception
		    
		    
		End Sub
	#tag EndEvent


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
