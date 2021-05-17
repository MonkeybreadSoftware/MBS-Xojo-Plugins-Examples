#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim sigField, sh as integer
		  dim outfile as FolderItem=SpecialFolder.Desktop.Child("signed pdfa.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil) // The output file is created later
		  call pdf.SetDocInfo(pdf.kdiCreator, "REALbasic Test application")
		  call pdf.SetDocInfo(pdf.kdiTitle, "PDF/A and digital signatures")
		  
		  call pdf.Append
		  call pdf.SetFont("Arial", pdf.kfsNone, 10.0, true, pdf.kcp1252)
		  
		  call pdf.WriteFText(pdf.ktaLeft, "This is a PDF/A 1b compatible PDF file that was digitally signed with "+_
		  "a self sign certificate. Because PDF/A requires that all fonts are embedded it is important "+_
		  "to avoid the usage of the 14 Standard fonts."+EndOfLine.unix+EndOfLine.unix+_
		  "When signing a PDF/A compliant PDF file with the default settings (without creation of a user "+_
		  "defined appearance) the font Arial must be available on the system because it is used to print "+_
		  "the certificate properties into the signature field."+EndOfLine.unix+EndOfLine.unix+_
		  "The font Arial must also be available if an empty signature field was added to the file "+_
		  "without signing it when closing the PDF file. Yes, it is still possible to sign a PDF/A "+_
		  "compliant PDF file later with Adobe's Acrobat. The signed PDF file is still compatible "+_
		  "to PDF/A. If you use a third party solution to digitally sign the PDF file then test "+_
		  "whether the signed file is still valid with the PDF/A 1b preflight tool included in Acrobat 8 "+_
		  "Professional."+EndOfLine.unix+EndOfLine.unix+_
		  "Signature fields must be visible and the print flag must be set (default). CheckConformance() "+_
		  "adjusts these flags if necessary and produces a warning if changes were applied. If no changes "+_
		  "should be allowed, just return -1 in the error callback function. If the error callback function "+_
		  "returns 0, DynaPDF assumes that the prior changes were accepted and processing continues."+EndOfLine.unix+EndOfLine.unix+_
		  "\FC[255]Notice:\FC[0]"+EndOfLine.unix+_
		  "It makes no sense to execute CheckConformance() without an error callback function or error event "+_
		  "in VB. If you cannot see what happens during the execution of CheckConformance(), it is "+_
		  "completely useless to use this function!"+EndOfLine.unix+EndOfLine.unix+_
		  "CheckConformance() should be used to find the right settings to create PDF/A compatible PDF files. "+_
		  "Once the the settings were found it is usually not longer recommended to execute this function. "+_
		  "However, it is of course possible to use CheckConformance() as a general approach to make sure "+_
		  "that files created with DynaPDF are PDF/A compatible.")
		  
		  ' /* ---------------------- Signature field appearance ---------------------- */
		  
		  sigField = pdf.CreateSigField("Signature", -1, 200.0, 400.0, 200.0, 80.0)
		  //pdf.SetFieldColor(sigField, fcBorderColor, csDeviceRGB, NO_COLOR)
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
		  call pdf.ClipPath(pdf.kcmWinding, pdf.kfmNoFill)
		  sh = pdf.CreateAxialShading(0.0, 0.0, 0.0, 78.0, 2.0, pdf.kPDF_WHITE, PDF.RGB(120, 120, 220), true, true)
		  call pdf.ApplyShading(sh)
		  call pdf.RestoreGraphicState
		  
		  call pdf.SetFont("Arial", BitwiseOr(pdf.kfsBold, pdf.kfsUnderlined), 11.0, true, pdf.kcp1252)
		  call pdf.SetFillColor(PDF.RGB(120, 120, 220))
		  call pdf.WriteFTextEx(50.0, 60.0, 150.0, -1.0, pdf.ktaCenter, "Digitally signed by:")
		  call pdf.SetFont("Arial", BitwiseOr(pdf.kfsBold,pdf.kfsItalic), 18.0, true, pdf.kcp1252)
		  call pdf.SetFillColor(PDF.RGB(100, 100, 200))
		  call pdf.WriteFTextEx(50.0, 45.0, 150.0, -1.0, pdf.ktaCenter, "Jens Boschulte")
		  
		  call pdf.EndTemplate // Close the appearance template.
		  
		  '/* ------------------------------------------------------------------------ */
		  
		  call pdf.EndPage
		  // Check whether the file is compatible to PDF/A 1b
		  select case pdf.CheckConformance(pdf.kctPDFA_1b_2005,0)
		    
		  case 1 // RGB
		  case 3 // Gray
		    dim iccpath as folderitem = FindFile("ColorMatchRGB.icc")
		    
		    call pdf.AddOutputIntent(iccpath)
		    
		  case 2 // CMYK
		    MsgBox("CMYK output is not configured in this example.")
		    quit
		    
		  end Select
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if not pdf.OpenOutputFile(outFile) then
		      MsgBox "Make sure that you have write access to the project folder."
		      quit
		    end if
		    
		    dim filepath as folderitem = FindFile("test_cert.pfx")
		    
		    
		    if not pdf.CloseAndSignFile(filePath, "123456", "Test", "") then
		      
		      // Note: If the certificate cannot be found or when using a wrong password the PDF file is still
		      // in memory. This is required to enable entering another password or certificate file.
		      quit
		    end if
		    
		    outfile.Launch
		  end if
		  
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
