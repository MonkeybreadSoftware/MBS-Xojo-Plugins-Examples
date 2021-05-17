#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Create target PDF
		  
		  dim pdf as new MyDynapdfMBS
		  dim tf as FolderItem = SpecialFolder.Desktop.Child("Target.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF tf
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  
		  call pdf.SetTextRect(50, 50, 500, 50)
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "This is the target PDF."
		  call pdf.EndPage
		  call pdf.CloseFile
		  
		  // Create Link PDF
		  
		  pdf = new MyDynapdfMBS
		  dim lf as FolderItem = SpecialFolder.Desktop.Child("Link.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF lf
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  call pdf.SetTextRect(50, 50, 500, 50)
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "This is the link PDF."
		  
		  // with folderitem (absolute path) is often a bad idea
		  'call pdf.FileLink(50, 50, 500, 50, tf)
		  
		  // better with relative path
		  call pdf.FileLink(50, 50, 500, 50, "Target.pdf")
		  
		  call pdf.EndPage
		  call pdf.CloseFile
		  
		  lf.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
