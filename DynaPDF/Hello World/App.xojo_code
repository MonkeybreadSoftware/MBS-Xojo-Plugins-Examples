#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim outFile as FolderItem=SpecialFolder.Desktop.Child("helloworld.pdf")
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil) // The output file is created later
		  call pdf.SetDocInfo(pdf.kdiCreator, "C++ Test application")
		  call pdf.SetDocInfo(pdf.kdiTitle, "My first PDF output")
		  
		  call pdf.Append
		  call pdf.SetFont("Arial", pdf.kfsItalic, 20.0, true, pdf.kcp1252)
		  call pdf.WriteFText(pdf.ktaCenter, "My first PDF output...")
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    call pdf.OpenOutputFile(outFile)
		  end if
		  call pdf.CloseFile
		  
		  outFile.Launch
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
