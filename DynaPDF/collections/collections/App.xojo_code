#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  dim ef as integer
		  dim outFile as FolderItem=SpecialFolder.Desktop.Child("collections.pdf")
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  // We create the output file later if no error occurred.
		  call pdf.CreateNewPDF(nil)
		  call pdf.SetDocInfo(pdf.kdiAuthor, "Jens Boschulte")
		  call pdf.SetDocInfo(pdf.kdiCreator, "C test application")
		  call pdf.SetDocInfo(pdf.kdiKeywords, "PDF Collections; PDF Packages")
		  call pdf.SetDocInfo(pdf.kdiTitle, "PDF Collections")
		  // The page of this file is shown when opening the file with an older version of Adobe's Acrobat.
		  // Otherwise, the default document of the collection is opened. Click on "Cover sheet" to view the
		  // contents of this page.
		  call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  
		  dim filePath as FolderItem=FindFile("collection_en.pdf")
		  
		  
		  
		  if (pdf.OpenImportFile(filePath, pdf.kptOpen, "") < 0) then
		    msgbox "Input file """+filePath.Name+""" not found!"
		    quit
		  end if
		  
		  call pdf.ImportPDFFile(1, 1.0, 1.0)
		  call pdf.CloseImportFile
		  
		  call pdf.CreateCollection(pdf.kcivTile)
		  
		  filePath=FindFile("taxform.pdf")
		  
		  
		  
		  ef = pdf.AttachFile(filePath, "A PDF file...", true)
		  call pdf.SetColDefFile(ef) // This file is opened when viewing the file Acrobat 8 or later
		  
		  filePath=FindFile("fulltest.emf")
		  
		  
		  call pdf.AttachFile(filePath, "An EMF file...", true)
		  filePath=FindFile("sample.txt")
		  
		  
		  call pdf.AttachFile(filePath, "A text file...", true)
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if (not pdf.OpenOutputFile(outFile)) then
		      MsgBox "Make sure that you have write access the project folder."
		      quit
		    end if
		  end if
		  
		  call pdf.CloseFile
		  
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
