#tag Class
Protected Class MyNSWindowDelegateMBS
Inherits NSWindowDelegateMBS
	#tag Event
		Sub encodeRestorableStateWithCoder(win as NSWindowMBS, coder as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  
		  dim d as new date
		  dim s as string = "Hello World "+ d.LongTime
		  
		  coder.encodeString(s, "title")
		  
		  
		  MainWindow.Listbox1.AddRow "Encoded state."
		  
		  Exception n as NSExceptionMBS
		    System.DebugLog "Exception: "+n.message
		    
		End Sub
	#tag EndEvent

	#tag Event
		Sub restoreStateWithCoder(win as NSWindowMBS, coder as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  
		  dim s as string = coder.decodeString("title")
		  System.DebugLog "Title: "+s
		  
		  MainWindow.Title = s
		  
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
