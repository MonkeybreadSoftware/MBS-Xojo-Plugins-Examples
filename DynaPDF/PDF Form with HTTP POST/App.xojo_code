#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem=SpecialFolder.Desktop.Child("submit.pdf")
		  
		  'pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 12.0, true, pdf.kcp1252
		  
		  ' --- Create button ---
		  call pdf.SetBorderStyle(pdf.kbsBevelled)
		  call pdf.SetFieldBackColor(pdf.kPDF_SILVER)
		  Dim Button As Integer = pdf.CreateButton("button", "Send", -1, 50, 300, 100, 20)
		  
		  ' --- create action ---
		  dim url as string = "http://www.monkeybreadsoftware.de/cgi-bin/pdfformmailer.php"
		  
		  Dim Action As Integer = pdf.CreateSubmitAction(DynaPDFMBS.ksfHTML, url)
		  
		  ' --- Add action for button ---
		  Dim Result As Boolean = pdf.AddActionToObj(DynaPDFMBS.kotField, DynaPDFMBS.koeOnMouseUp, Action, Button)
		  
		  ' --- Create fields ---
		  Dim Field1 As Integer = pdf.CreateTextField("to", -1, false, -1, 50, 100, 500, 20)
		  Dim Field2 As Integer = pdf.CreateTextField("text", -1, True, -1, 50, 150, 500, 100)
		  
		  call pdf.SetFieldBorderStyle(Field1, pdf.kbsSolid)
		  call pdf.SetFieldBorderStyle(Field2, pdf.kbsSolid)
		  call pdf.SetFieldBorderWidth(Field1, 2)
		  call pdf.SetFieldBorderWidth(Field2, 2)
		  call pdf.SetTextFieldValue(field1, "zivi@mac.com", "", pdf.ktaLeft)
		  call pdf.SetTextFieldValue(field2, "Hello World", "", pdf.ktaLeft)
		  
		  ' --- Feld zu Aktion hinzufügen ---
		  Result = pdf.AddFieldToFormAction(Action, Field1, True)
		  Result = pdf.AddFieldToFormAction(Action, Field2, True)
		  
		  call pdf.EndPage
		  call pdf.CloseFile
		  
		  // show PDF and close app when done
		  f.Launch
		  
		  AutoQuit = true
		  
		  
		  // Please open PDF in browser to test this!
		  
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = MBS_LICNAME, Type = String, Dynamic = False, Default = \"Richard Grafl", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
