#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil // The output file is opened later
		  call pdf.SetDocInfo pdf.kdiTitle, "Custom digital signature appearance"
		  
		  // We want to use top-down coordinates 
		  call pdf.Append
		  
		  
		  call pdf.SetFont "Arial", pdf.kfsNone, 12.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaJustify, Message
		  
		  //* ---------------------- Signature field appearance ---------------------- */
		  
		  dim sigField as integer = pdf.CreateSigField( "Signature", -1, 200.0, 500.0, 200.0, 80.0)
		  call pdf.SetFieldColor(sigField, pdf.kfcBorderColor, pdf.kcsDeviceRGB, pdf.kNO_COLOR)
		  // Place the validation icon on the left side of the signature field.
		  call pdf.PlaceSigFieldValidateIcon(sigField, 0.0, 15.0, 50.0, 50.0)
		  
		  // This function creates a template into which you can draw whatever you want. The template
		  // is already opened when calling the function; it must be closed when finish with EndTemplate().
		  // An appearance template of a signature field is reserved for this field. It must not be placed
		  // on another page!
		  // 
		  // In addition, it makes no sense to create an appearance template when the file is not digitally
		  // signed later. Empty signature fields cannot contain a user defined appearance.
		  
		  call pdf.CreateSigFieldAP(sigField)
		  
		  call pdf.SaveGraphicState
		  call pdf.Rectangle(0.0, 0.0, 200.0, 80.0, pdf.kfmNoFill)
		  call pdf.ClipPath(pdf.kcmWinding, pdf.kfmNoFill)
		  dim sh as integer = pdf.CreateAxialShading( 0.0, 0.0, 200.0, 0.0, 0.5, PDF.RGB(120, 120, 220), pdf.kPDF_WHITE, true, true)
		  call pdf.ApplyShading(sh)
		  call pdf.RestoreGraphicState
		  
		  call pdf.SaveGraphicState
		  call pdf.Ellipse(50.5, 1.0, 148.5, 78.0, pdf.kfmNoFill)
		  call pdf.ClipPath(pdf.kcmWinding, pdf.kfmNoFill)
		  sh = pdf.CreateAxialShading( 0.0, 0.0, 0.0, 78.0, 2.0, PDF.kPDF_WHITE, PDF.RGB(120, 120, 220), true, true)
		  call pdf.ApplyShading(sh)
		  call pdf.RestoreGraphicState
		  
		  call pdf.SetFont("Arial", pdf.kfsBold + pdf.kfsUnderlined, 11.0, true, pdf.kcp1252)
		  call pdf.SetFillColor(PDF.RGB(120, 120, 220))
		  call pdf.WriteFTextEx(50.0, 60.0, 150.0, -1.0, pdf.ktaCenter, "Digitally signed by:")
		  call pdf.SetFont( "Arial", pdf.kfsBold + pdf.kfsItalic, 18.0, true, pdf.kcp1252)
		  call pdf.SetFillColor(PDF.RGB(100, 100, 200))
		  call pdf.WriteFTextEx( 50.0, 45.0, 150.0, -1.0, pdf.ktaCenter, "DynaPDF")
		  
		  call pdf.EndTemplate // Close the appearance template.
		  
		  //* ------------------------------------------------------------------------ */
		  
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Signature.pdf")
		    
		    
		    // Now we can sign the PDF file
		    
		    // In this example we load a PFX certificate file
		    const password = "123456"
		    
		    if false then
		      // read from file
		      dim filePath as FolderItem = SpecialFolder.Desktop.Child("testcert.pfx")
		      dim b as BinaryStream = BinaryStream.Open(filePath)
		      dim certificateData as string = b.Read(b.Length)
		      
		      // sign
		      call pdf.CloseAndSignPDFFile(f, certificateData, password)
		      
		    else
		      // You can also use an arbitrary certificate of a certificate store.
		      call pdf.CloseAndSignPDFFileWithDialog(f)
		      
		    end if
		    
		    f.Launch
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = Message, Type = String, Dynamic = False, Default = \"This file was digitally signed with the Windows CryptAPI using a PKCS#12 certificate. It is also possible to use an arbitrary certificate of the user\'s certificate store. This could be a hardware or software certificate. The CryptAPI function calls are in both cases the same. Nothing special must be considered.\r\rThe appearance of the signature field was created with normal DynaPDF functions. However\x2C it would also be possible to import a PDF page\x2C an EMF file\x2C or an image into the appearance template. When creating an individual signature appearance make sure to place the validation icon properly with PlaceSigFieldValidateIcon(). The appearance of the validation icon depends on the Acrobat version with which the file is opened. However\x2C the unscaled size of that icon is always 100.0 x 100.0 Units. It can be scaled to every size you want but it is usually best to preserve the aspect ratio and the icon must be placed fully inside the appearance template.", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
