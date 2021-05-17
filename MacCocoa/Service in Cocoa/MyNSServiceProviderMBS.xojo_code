#tag Class
Protected Class MyNSServiceProviderMBS
Inherits NSServiceProviderMBS
	#tag Event
		Function readSelectionFromPasteboard(pboard as NSPasteboardMBS) As Boolean
		  System.DebugLog CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub ServiceInvoked(pboard as NSPasteboardMBS, userData as string, byref error as string)
		  
		  Dim s As String = pboard.stringForType(pboard.NSPasteboardTypeString)
		  
		  MainWindow.TextArea1.Text = s
		  
		  
		  s = "“"+s+"”"
		  
		  call pboard.clearContents
		  pboard.stringForType(pboard.NSPasteboardTypeString) = s
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function validRequestor(sendType as String, returnType as String) As Boolean
		  System.DebugLog CurrentMethodName
		End Function
	#tag EndEvent

	#tag Event
		Function writeSelectionToPasteboard(pboard as NSPasteboardMBS, types() as String) As Boolean
		  System.DebugLog CurrentMethodName
		End Function
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
