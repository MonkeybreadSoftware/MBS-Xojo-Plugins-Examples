#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Highlight.pdf")
		  
		  'pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // import big PDF
		  dim file as FolderItem = FindFile("dynapdf_help.pdf")
		  
		  call pdf.OpenImportFile(file)
		  call pdf.ImportPDFFile(1)
		  
		  // now highlight DynaPDF on page 2
		  
		  call pdf.EditPage(2)
		  call pdf.HighlightOnCurrentPage "DynaForms", &c00FFFF, false
		  call pdf.HighlightOnCurrentPage "Apple", &c00FFFF, true
		  call pdf.EndPage
		  
		  
		  call pdf.HighlightOnAllPages "Return values:", &cFF, false
		  call pdf.HighlightOnAllPages "DynaPDF", &c00FFFF, true
		  
		  
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
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
