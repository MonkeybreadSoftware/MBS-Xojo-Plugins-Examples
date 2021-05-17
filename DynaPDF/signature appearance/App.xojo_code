#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  dim sigField, sh as integer
		  dim outfile as FolderItem=SpecialFolder.Desktop.Child("signature ap.pdf")
		  
		  call pdf.CreateNewPDF(nil) // The output file is created later
		  call pdf.SetDocInfo(pdf.kdiCreator, "C Test application")
		  call pdf.SetDocInfo(pdf.kdiTitle, "Custom digital signature appearance")
		  
		  call pdf.SetCompressionLevel(pdf.kclNone)
		  
		  call pdf.Append
		  call pdf.SetFont("Arial",  pdf.kfsNone, 14.0, true, pdf.kcp1252)
		  call pdf.WriteFText(pdf.ktaLeft, "This file is digitally signed with a self sign certificate."+_
		  "The appearance of the signature field is created with normal DynaPDF functions. However, it "+_
		  "would also be possible to import a PDF page, an EMF file, or an image into the "+_
		  "appearance template."+EndOfLine.UNIX+EndOfLine.UNIX+_
		  "When creating an individual signature appearance make sure to place the validation icon "+_
		  "properly with PlaceSigFieldValidateIcon(). The appearance of the validation icon "+_
		  "depends on the Acrobat version with which the file is opened. However, the unscaled size "+_
		  "of that icon is always 100.0 x 100.0 Units. It can be scaled to every size you want "+_
		  "but it is usually best to preserve the aspect ratio and the icon must be placed fully "+_
		  "inside the appearance template.")
		  
		  ' /* ---------------------- Signature field appearance ---------------------- */
		  
		  sigField = pdf.CreateSigField("Signature", -1, 200.0, 500.0, 200.0, 80.0)
		  call pdf.SetFieldColor(sigField, pdf.kfcBorderColor, pdf.kcsDeviceRGB, pdf.kNO_COLOR)
		  // Place the validation icon on the left side of the signature field.
		  call pdf.PlaceSigFieldValidateIcon(sigField, 0.0, 15.0, 50.0, 50.0)
		  
		  'This function creates a template into which you can draw whatever you want. The template
		  'is already opened when calling the function; it must be closed when finish with EndTemplate().
		  'An appearance template of a signature field is reserved for this field. It must not be placed
		  'on another page!
		  '
		  'In addition, it makes no sense to create an appearance template when the file is not digitally
		  'signed later. Empty signature fields cannot contain a user defined appearance.
		  
		  call pdf.CreateSigFieldAP(sigField)
		  
		  call pdf.SaveGraphicState
		  call pdf.Rectangle(0.0, 0.0, 200.0, 80.0, pdf.kfmNoFill)
		  call pdf.ClipPath(pdf.kcmWinding, pdf.kfmNoFill)
		  sh = pdf.CreateAxialShading(0.0, 0.0, 200.0, 0.0, 0.5, PDF.RGB(120, 120, 220), pdf.kPDF_WHITE, true, true)
		  call pdf.ApplyShading(sh)
		  call pdf.RestoreGraphicState
		  
		  call pdf.SaveGraphicState
		  call pdf.Ellipse(50.5, 1.0, 148.5, 78.0, pdf.kfmNoFill)
		  call pdf.ClipPath(pdf.kcmWinding,pdf.kfmNoFill)
		  sh = pdf.CreateAxialShading(0.0, 0.0, 0.0, 78.0, 2.0, pdf.kPDF_WHITE, PDF.RGB(120, 120, 220), true, true)
		  call pdf.ApplyShading(sh)
		  call pdf.RestoreGraphicState
		  
		  call pdf.SetFont("Arial", BitwiseOr(pdf.kfsBold,pdf.kfsUnderlined), 11.0, true, pdf.kcp1252)
		  call pdf.SetFillColor(PDF.RGB(120, 120, 220))
		  call pdf.WriteFTextEx(50.0, 60.0, 150.0, -1.0, pdf.ktaCenter, "Digitally signed by:")
		  call pdf.SetFont("Arial", BitwiseOr(pdf.kfsBold,pdf.kfsItalic), 18.0, true, pdf.kcp1252)
		  call pdf.SetFillColor(PDF.RGB(100, 100, 200))
		  call pdf.WriteFTextEx(50.0, 45.0, 150.0, -1.0,pdf.ktaCenter, "Jens Boschulte")
		  
		  call pdf.EndTemplate // Close the appearance template.
		  
		  
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if (not pdf.OpenOutputFile(outFile)) then
		      MsgBox "Make sure that you have write access to the project folder!"
		      quit
		    end if
		    
		    dim filepath as folderitem=FindFile("test_cert.pfx")
		    
		    
		    
		    if (not pdf.CloseAndSignFile(filePath, "123456", "Test", "")) then
		      
		      // Note: If the certificate cannot be found or when using a wrong password the PDF file is still
		      // in memory. This is required to enable entering another password or certificate file.
		      quit
		    end if
		  end if
		  
		  outFile.Launch
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
