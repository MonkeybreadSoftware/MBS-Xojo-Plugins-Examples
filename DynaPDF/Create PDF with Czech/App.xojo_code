#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  dim pdf as new MyDynapdfMBS
		  
		  dim d as new date
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Czech.pdf")
		  call pdf.CreateNewPDF f
		  pdf.IgnoreWarnings = true
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  // set a font, so we have one if Helvetica can't be loaded
		  call pdf.SetFont "Arial", pdf.kfsNone, 14.0, true, pdf.kcp1252
		  
		  // on the PDF you see that 1252 will not work for Czech characters!
		  
		  // On Windows Helvetica is font1 type, so cpUnicode will not work there.
		  // 1252 does not support most characters, so you will see ? there
		  
		  
		  // Unicode mapping
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 14.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextEx 100, 100, 500, -1, pdf.ktaCenter, "Helvetica with Unicode: áÁčČďĎéÉěĚíÍňŇóÓřŘšŠťŤúÚůŮžŽ"
		  
		  call pdf.SetFont "Arial", pdf.kfsNone, 14.0, true, pdf.kcpUnicode
		  call pdf.WriteFTextEx 100, 200, 500, -1, pdf.ktaCenter, "Arial with Unicode: áÁčČďĎéÉěĚíÍňŇóÓřŘšŠťŤúÚůŮžŽ"
		  
		  // 1252 = Windows ANSI
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 14.0, true, pdf.kcp1252
		  call pdf.WriteFTextEx 100, 300, 500, -1, pdf.ktaCenter, "Helvetica with Codepage 1252: áÁčČďĎéÉěĚíÍňŇóÓřŘšŠťŤúÚůŮžŽ"
		  
		  call pdf.SetFont "Arial", pdf.kfsNone, 14.0, true, pdf.kcp1252
		  call pdf.WriteFTextEx 100, 400, 500, -1, pdf.ktaCenter, "Arial with Codepage 1252: áÁčČďĎéÉěĚíÍňŇóÓřŘšŠťŤúÚůŮžŽ"
		  
		  // 1250 = Windows East Europe 
		  call pdf.SetFont "Helvetica", pdf.kfsNone, 14.0, true, pdf.kcp1250
		  call pdf.WriteFTextEx 100, 500, 500, -1, pdf.ktaCenter, "Helvetica with CodePage 1250: áÁčČďĎéÉěĚíÍňŇóÓřŘšŠťŤúÚůŮžŽ"
		  
		  call pdf.SetFont "Arial", pdf.kfsNone, 14.0, true, pdf.kcp1250
		  call pdf.WriteFTextEx 100, 600, 500, -1, pdf.ktaCenter, "Arial with CodePage 1250: áÁčČďĎéÉěĚíÍňŇóÓřŘšŠťŤúÚůŮžŽ"
		  
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
