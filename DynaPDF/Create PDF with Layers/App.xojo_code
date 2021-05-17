#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Layers.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates 
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  // We use three layers in this example
		  dim oc1 as integer = pdf.CreateOCG("Anything", true, true, pdf.koiView)
		  dim oc2 as integer = pdf.CreateOCG("Text and Annotations", true, true, pdf.koiView)
		  dim oc3 as integer = pdf.CreateOCG("Images", true, true, pdf.koiView)
		  
		  call pdf.Append
		  
		  // The main layer controls the visibility of all three layers in this 
		  // example. 
		  
		  call pdf.BeginLayer(oc1)
		  
		  call pdf.BeginLayer(oc2)
		  call pdf.SetFont("Arial", pdf.kfsRegular, 12.0, true, pdf.kcp1252)
		  dim someText as string = "Some text with a link!!!"
		  
		  call pdf.WriteText(50.0, 50.0, someText)
		  dim tw as double = pdf.GetTextWidth(someText)
		  
		  // To reflect the same nesting as the text layer we must 
		  // use an OCMD for the annotation because the visibility of the 
		  // layer oc2 depends on oc1 at this position. 
		  call pdf.SetBorderStyle(pdf.kbsUnderline)
		  call pdf.SetStrokeColor(pdf.kPDF_BLUE)
		  
		  dim annot as integer = pdf.WebLink(50, 51, tw, 12, "http://www.dynaforms.com/")
		  dim ocgs(-1) as integer
		  ocgs.Append oc1
		  ocgs.Append oc2
		  
		  dim ocmd as integer = pdf.CreateOCMD(pdf.kovAllOn, ocgs)
		  call pdf.AddObjectToLayer(ocmd, pdf.kooAnnotation, annot)
		  call pdf.EndLayer
		  call pdf.BeginLayer(oc3)
		  
		  dim pic as Picture = LogoMBS(500)
		  dim imagefile as FolderItem = SpecialFolder.Temporary.Child("test.jpg")
		  imagefile.SaveAsJPEG pic
		  
		  call pdf.InsertImageEx(50.0, 70.0, 250.0, 250.0, imagefile, 1)
		  call pdf.EndLayer
		  call pdf.EndLayer
		  call pdf.WriteText(50.0, 300.0, "This text is not part of a layer!")
		  
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
