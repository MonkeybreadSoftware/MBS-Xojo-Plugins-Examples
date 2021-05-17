#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim bmk,i,font as integer
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem=SpecialFolder.Desktop.Child("Create PDF with bookmarks.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  dim h as integer = pdf.SetFont("Wingdings", pdf.kfsNone, 40, true, pdf.kcp1252)
		  call pdf.SetListFont h
		  
		  call pdf.SetFont("Times", pdf.kfsItalic, 40, true, pdf.kcp1252)
		  
		  call pdf.WriteFText(pdf.ktaLeft, "How to create a list..."+chr(13)+_
		  "and there is a superscript \TR[15]\FS[20]2\FS[40]\TR[0] number"+chr(13)+_
		  "\LI[10,1001]This is a numbered list!\EL#"+_
		  "\LD[0]\LI[10,1002]\LD[40]List number incremented..."+chr(13)+_
		  "Additional text in the same list level that breaks down to the next line...\EL#"+chr(13)+_
		  "\LD[0]\LI[10]\LD[40]This is a normal list!\EL#"+_
		  "\LD[0]\LI[10]\LD[40]Second item\EL#"+_
		  "\LD[0]\LI[10]\LD[40]Third item\EL#"+_
		  "End")
		  
		  // We use "\LD[0]\LI[10]\LD[40]" instead of "\LI[10]" to avoid empty lines.
		  
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
