#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // extracts all embedded files
		  
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem = FindFile("zugferd_2p0_BASIC_Einfach.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil
		  
		  call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		  call pdf.OpenImportFile(f)
		  call pdf.ImportPDFFile(1)
		  
		  dim count as integer = pdf.GetEmbeddedFileCount
		  if count < 1 then
		    MsgBox "No embedded file!?"
		  else
		    
		    for i as integer = 0 to count-1
		      dim fs as DynaPDFFileSpecMBS
		      if pdf.GetEmbeddedFile(i, fs, true) then
		        dim Data as string = fs.Buffer
		        
		        if fs.MIMEType = "text/xml" then
		          // data now contains invoice xml
		          Break
		        end if
		        
		        f = SpecialFolder.Desktop.Child(fs.FileName)
		        dim b as BinaryStream = BinaryStream.Create(f, true)
		        b.Write Data
		        
		      end if
		    next
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
