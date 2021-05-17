#tag Class
Protected Class MyFrameEvents
Inherits WebFrameLoadDelegateMBS
	#tag Event
		Sub Close()
		  System.DebugLog "Close"
		End Sub
	#tag EndEvent

	#tag Event
		Function didCancelClientRedirectForFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "did cancel client redirection for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didChangeLocationWithinPageForFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "did chance location withing page for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didCommitLoadForFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "did commit load for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didFailLoadWithError(ErrorString as string, frame as WebFrameMBS) As boolean
		  w.List.AddRow "did fail load for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didFailProvisionalLoadWithError(ErrorString as string, frame as WebFrameMBS) As boolean
		  w.List.AddRow "did fail provisional load for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didFinishLoadForFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "did finish load for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didReceiveIcon(image as NSImageMBS, frame as WebFrameMBS) As boolean
		  w.List.AddRow "did receive icon for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didReceiveServerRedirectForProvisionalLoadForFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "did receive server redirect for provisional load for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didReceiveTitle(title as string, frame as WebFrameMBS) As boolean
		  w.List.AddRow "did receive title """+title+""" for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function didStartProvisionalLoadForFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "did start provisional load for frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  System.DebugLog "Open"
		End Sub
	#tag EndEvent

	#tag Event
		Function willCloseFrame(frame as WebFrameMBS) As boolean
		  w.List.AddRow "Will close frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function willPerformClientRedirectToURL(URL as String, delay as double, fireDate as Date, frame as WebFrameMBS) As boolean
		  w.List.AddRow "will perform client redirect to url frame "+hex(Frame.Handle)
		End Function
	#tag EndEvent

	#tag Event
		Function windowScriptObjectAvailable(windowScriptObject as WebScriptObjectMBS) As boolean
		  w.List.AddRow "window script object available"
		  
		  // Install an Object called "MyBrowser" on the javascript document object
		  // Any function call inside will tricker callback event
		  windowScriptObject.setWebScriptCallback "MyBrowser", app.callback
		  
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
