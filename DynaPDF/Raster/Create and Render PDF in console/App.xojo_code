#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  // load CharacterMaps if you want to correctly process asian fonts
		  'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		  
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  #if RBVersion > 2010.04 then // picture class is only available in RS 2010r4 and newer
		    dim pic as Picture = LogoMBS(500) // Needs Main Plugin
		    
		    call pdf.InsertPicture(pic, 50, 200, 200, 200)
		  #endif
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "My first Xojo output!"
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 180.0, "File created: " + d.LongDate
		  
		  call pdf.EndPage
		  
		  #if RBVersion > 2010.04 then
		    dim out as Picture = pdf.RenderPagePicture(1)
		    
		    if out = nil then
		      print "Error: picture is nil."
		      Return 1
		    end if
		    
		    dim outfile as FolderItem = SpecialFolder.Desktop.Child("Create and Render PDF in console.jpg")
		    
		    out.Save(outfile, out.SaveAsJPEG)
		  #endif
		  
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
