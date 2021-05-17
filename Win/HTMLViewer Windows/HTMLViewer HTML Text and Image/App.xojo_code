#tag Class
Protected Class App
Inherits Application
	#tag MenuHandler
		Function FileHTML() As Boolean Handles FileHTML.Action
			dim w as new WindowHTML
			w.TextArea1.Text = WindowTest.HTMLViewer1.IEHTMLTextMBS
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePicture() As Boolean Handles FilePicture.Action
			dim w as new Windowpic
			w.BackDrop = WindowTest.HTMLViewer1.IEImageMBS
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileText() As Boolean Handles FileText.Action
			dim w as new WindowText
			w.TextArea1.Text = WindowTest.HTMLViewer1.IETextMBS
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
