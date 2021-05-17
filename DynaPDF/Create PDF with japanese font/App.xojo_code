#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if not TargetMacOS then
		    MsgBox "Please change font names for Windows or Linux."
		  end if
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with japanese font.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  'call pdf.AddFontSearchPath SpecialFolder.Desktop.Child("fonts"),true
		  
		  call pdf.SetFont "Zapfino", pdf.kfsItalic, 40.0, true, pdf.kcpUnicode
		  call pdf.WriteFText pdf.ktaCenter, "My first Xojo output in Zapfino!"
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteText 50.0, 200.0, "File created: " + d.LongDate
		  
		  call pdf.SetFont "STHeiti", pdf.kfsNone, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteText 50.0, 300.0, "ウェブ全体から検索"
		  
		  call pdf.SetFont "STSong", pdf.kfsBold, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteText 50.0, 400.0, "日本語のページを検索"
		  
		  call pdf.SetFont "STKaiti", pdf.kfsBold, 20.0, true, pdf.kcpUnicode
		  call pdf.WriteText 50.0, 500.0, "広告掲載"
		  
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
