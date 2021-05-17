#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim f as FolderItem=SpecialFolder.Desktop.Child("clip.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF f
		  
		  // Open an existing PDF file
		  dim file as FolderItem = FindFIle("taxform.pdf")
		  
		  
		  call pdf.OpenImportFile(file, pdf.kptOpen, "")
		  // Import the fist page as template
		  dim tmpl as integer = pdf.ImportPage(1)
		  
		  call pdf.Append
		  // make page a fixed size
		  call pdf.SetPageWidth(300)
		  call pdf.SetPageHeight(300)
		  
		  // now we clip to even smaller
		  
		  call pdf.Rectangle(50, 50, 200, 200, pdf.kfmNoFill)
		  call pdf.ClipPath(pdf.kcmWinding, pdf.kfmFill)
		  
		  call pdf.PlaceTemplate( Tmpl, -100, -100, 0.0, 0.0)
		  
		  
		  call pdf.EndPage
		  
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
