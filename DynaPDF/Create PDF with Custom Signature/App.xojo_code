#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil // The output file is opened later
		  call pdf.SetDocInfo pdf.kdiTitle, "Custom digital signature"
		  
		  // We want to use top-down coordinates 
		  call pdf.Append
		  
		  
		  call pdf.SetFont "Arial", pdf.kfsNone, 12.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaJustify, Message
		  //* ------------------------------------------------------------------------ */
		  
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Custom Signature.pdf")
		    if pdf.OpenOutputFile(f) then
		      
		      // Now we can sign the PDF file
		      
		      // In this example we load a PFX certificate file
		      const password = "123456"
		      
		      
		      // read from file
		      dim filePath as FolderItem = SpecialFolder.Desktop.Child("test.pfx")
		      dim b as BinaryStream = BinaryStream.Open(filePath)
		      dim certificateData as string = b.Read(b.Length)
		      
		      // load PKCS12 file to get private key
		      dim cert as X509MBS
		      dim certs() as X509MBS
		      dim pkey as PKeyMBS
		      if X509MBS.ReadFromPkcs12(certificateData, password, pkey, cert, certs) then
		        
		        // get private key as text
		        dim PrivateKey as string = pkey.PrivateKeyData
		        
		        // sign something so we know length
		        dim DummySignature as string = OpenSSLMBS.PKCS7SignData(cert, pkey, certs, SHA1MBS.Hash("test"), 0)
		        
		        // sign parameters
		        dim p as new DynaPDFSigParmsMBS
		        
		        p.ContactInfo = "Call MBS for help."
		        p.Reason = "Signed for demo purpose"
		        p.Signer = "TestApp"
		        p.HashType = DynaPDFMBS.khtSHA1
		        p.PKCS7ObjLen = lenb(DummySignature)
		        
		        // now assemble PDF and leave room for signature
		        if pdf.CloseAndSignFileExt(p) then
		          
		          // sign the Hash
		          dim Signature as string = OpenSSLMBS.PKCS7SignData(cert, pkey, certs, p.Range1, 0)
		          
		          // add hash to file and launch in PDF reader
		          if pdf.FinishSignature(Signature) then
		            f.Launch
		          end if
		        end if
		      else
		        MsgBox "Failed to read PKCS12 file"
		      end if
		    end if
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = Message, Type = String, Dynamic = False, Default = \"This file was digitally signed.", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
