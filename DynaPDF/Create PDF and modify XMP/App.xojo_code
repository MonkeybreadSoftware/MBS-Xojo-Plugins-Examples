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
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo PDF output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo PDF output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "My first Xojo PDF output!"
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 180.0, "File created: " + d.LongDate
		  
		  call pdf.EndPage
		  
		  call pdf.SetPDFVersion(pdf.kpvPDF_1_4)
		  
		  // get XMP
		  dim xmpOld as string = pdf.GetMetadata(pdf.kmdoCatalog, -1)
		  
		  // quick and dirty modification:
		  'dim xmpNew as string = Replace(xmpOld, "</x:xmpmeta>", "<x:test>test</x:test></x:xmpmeta>")
		  
		  // better with MBS XMP Plugin
		  dim m as new XMPMetaMBS(xmpOld)
		  
		  // add some custom namespace and custom tags with custom values
		  dim NS as string = "http://test.test/namespaces/test"
		  dim NSPrefix as string = "Test"
		  if not m.RegisterNamespace(NS, NSPrefix, NSPrefix) then
		    Break // error?
		  end if
		  
		  m.SetProperty ( NS, "TestString", "Hello World" )
		  m.SetPropertyInteger(NS, "TestInteger", 1234)
		  dim now as new date
		  dim da as new XMPDateTimeMBS
		  da.Year = now.Year
		  da.Month = now.Month
		  da.day = now.day
		  da.hasDate = true
		  m.SetPropertyDate(NS, "TestDate", da)
		  
		  dim xmpNew as string = m.SerializeToBuffer
		  
		  // put XMP back
		  call pdf.SetMetadata(pdf.kmdoCatalog, -1, xmpNew)
		  
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
