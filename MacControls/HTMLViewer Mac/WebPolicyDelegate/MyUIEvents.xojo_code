#tag Class
Protected Class MyUIEvents
Inherits WebPolicyDelegateMBS
	#tag Event
		Sub Close()
		  'MsgBox "Close"
		End Sub
	#tag EndEvent

	#tag Event
		Function decidePolicyForMIMEType(type as string,request as NSURLRequestMBS, frame as WebFrameMBS, decisionListener as WebPolicyDecisionListenerMBS) As boolean
		  
		  System.DebugLog "decide policy for mime type "+type
		  
		  if w.RadioButton1.Value then
		    w.List.InsertRow 0,"use "+type
		    decisionListener.use
		  elseif w.RadioButton2.Value then
		    w.List.InsertRow 0,"download "+type
		    decisionListener.download
		  elseif w.RadioButton3.Value then
		    w.List.InsertRow 0,"ignore "+type
		    decisionListener.ignore
		  end if
		  
		  Return true // disable old handler from Xojo
		  
		End Function
	#tag EndEvent

	#tag Event
		Function decidePolicyForNavigationAction(request as NSURLRequestMBS, frame as WebFrameMBS, decisionListener as WebPolicyDecisionListenerMBS, NavigationType as integer, ModifierFlags as integer, OriginalURL as string) As boolean
		  System.DebugLog "decide policy for navigation "+request.URL
		  
		  if w.RadioButton1.Value then
		    w.List.InsertRow 0,"use "+request.URL
		    decisionListener.use
		  elseif w.RadioButton2.Value then
		    w.List.InsertRow 0,"download "+request.URL
		    decisionListener.download
		  elseif w.RadioButton3.Value then
		    w.List.InsertRow 0,"ignore "+request.URL
		    decisionListener.ignore
		  end if
		  
		  Return true // disable old handler from Xojo
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function decidePolicyForNewWindowAction(request as NSURLRequestMBS, framename as string, decisionListener as WebPolicyDecisionListenerMBS, NavigationType as integer, ModifierFlags as integer, OriginalURL as string) As boolean
		  System.DebugLog "decide policy for new window "+request.URL
		  
		  if w.RadioButton1.Value then
		    w.List.InsertRow 0,"use "+request.URL
		    decisionListener.use
		  elseif w.RadioButton2.Value then
		    w.List.InsertRow 0,"download "+request.URL
		    decisionListener.download
		  elseif w.RadioButton3.Value then
		    w.List.InsertRow 0,"ignore "+request.URL
		    decisionListener.ignore
		  end if
		  
		  Return true // disable old handler from Xojo
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  'MsgBox "Open"
		End Sub
	#tag EndEvent

	#tag Event
		Function unableToImplementPolicyWithError(errorString as string, frame as WebFrameMBS) As boolean
		  System.DebugLog "unable to implement policy error "+errorString
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		w As mainwindow
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
