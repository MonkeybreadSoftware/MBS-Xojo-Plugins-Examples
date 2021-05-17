#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  dim InputFile as FolderItem = FindFile("dynapdf_help.pdf")
		  
		  
		  dim OutputFile as FolderItem=SpecialFolder.Desktop.Child("Watermark PDF.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF OutputFile
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Realbasic output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Realbasic test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Realbasic output"
		  
		  /// If the imported document should be edited then avoid
		  // the conversion of pages to templates (see SetImportFlags()
		  // for further information).
		  call pdf.SetImportFlags(bitwiseOr(pdf.kifImportAll,pdf.kifImportAsPage))
		  
		  // Import the PDF file so that it can be edited
		  call pdf.OpenImportFile(InputFile,pdf.kptOpen,"")
		  
		  dim pageCount as integer = pdf.ImportPDFFile(1, 1.0, 1.0) // If DestPage is 1, the return value is the new number of pages
		  
		  call pdf.CloseImportFile
		  
		  msgBox str(pageCount)+" pages imported."
		  
		  if (pageCount < 0) then
		    return  // Import failed
		  end if
		  
		  // If you prefer top down coordinates
		  call pdf.SetPageCoords(pdf.kpcTopDown)
		  
		  for i as integer=1 to pagecount
		    call pdf.EditPage(i)
		    call pdf.SetFont("Arial", pdf.kfsNone, 12.0, true, pdf.kcp1252)
		    call pdf.WriteText(100.0, 100.0, "Some Text...")
		    call pdf.EndPage
		  next
		  
		  call pdf.CloseFile
		  
		  OutputFile.Launch
		  
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
