#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  const superScriptOn  = "\TR[-4]\FS[9]"
		  const superScriptOff = "\TR[0]\FS[14]"
		  
		  call pdf.SetFont "Times", pdf.kfsNone, 14.0, true, pdf.kcp1252
		  call pdf.WriteFTextEx 50.0, 100.0, 200.0, 20.0, pdf.ktaLeft, "Water: H"+superScriptOn+"2"+superScriptOff+"O"
		  call pdf.WriteFTextEx 50.0, 120.0, 200.0, 20.0, pdf.ktaLeft, "Phosphorus pentoxide: P"+superScriptOn+"2"+superScriptOff+"O"+superScriptOn+"5"+superScriptOff
		  call pdf.WriteFTextEx 50.0, 140.0, 200.0, 20.0, pdf.ktaLeft, "Oxygen: O"+superScriptOn+"2"+superScriptOff
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
