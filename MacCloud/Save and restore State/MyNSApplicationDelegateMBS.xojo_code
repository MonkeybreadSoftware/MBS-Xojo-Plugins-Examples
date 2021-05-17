#tag Class
Protected Class MyNSApplicationDelegateMBS
Inherits NSApplicationDelegateMBS
	#tag Event
		Sub applicationDidDecodeRestorableState(coder as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  
		  dim s as string = coder.decodeString("lastrun")
		  System.DebugLog "Got text: "+s
		  app.lastrun = s
		  
		  window1.Listbox1.AddRow "Got State with Lastrun="+s
		  
		  Exception n as NSExceptionMBS
		    System.DebugLog "Exception: "+n.message
		    
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationDidFinishLaunching(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillEncodeRestorableState(coder as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  
		  System.DebugLog "allowsKeyedCoding: "+str(coder.allowsKeyedCoding)
		  
		  dim d as new date
		  dim s as string = d.LongTime
		  
		  coder.encodeString(s, "lastrun")
		  
		  
		  window1.Listbox1.AddRow "Encoded state."
		  
		  Exception n as NSExceptionMBS
		    System.DebugLog "Exception: "+n.message
		    
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillTerminate(Notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
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
