#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const Compressed = false
		  
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with hidden data.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // disable compression of PDF, so we can read stuff in editor
		  if Compressed then
		    call pdf.SetCompressionLevel(pdf.kclMax)
		  else
		    call pdf.SetCompressionLevel(pdf.kclNone)
		  end if
		  
		  call pdf.Append
		  
		  
		  // hide data in ICC profile
		  dim prof as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateSRGBProfile // from LCMS2 Plugin
		  dim sigm as MemoryBlock = "TEST"
		  dim sigd as MemoryBlock = "This is hidden text appended to ICC Profile."
		  call prof.WriteRawTag( sigm.Int32Value(0), sigd)
		  
		  dim data as string = prof.SaveProfileToString
		  
		  dim h as integer = pdf.CreateICCBasedColorSpaceEx(data)
		  call pdf.SetExtColorSpace(h)
		  
		  
		  // write something on page
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "My first Xojo output!"
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 180.0, "File created: " + d.LongDate
		  
		  call pdf.EndPage
		  
		  // attach file
		  
		  // put attachment there without compression
		  call pdf.AttachFileEx("This is hidden text in an attached file.", "attachment.txt", "", Compressed)
		  
		  
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
