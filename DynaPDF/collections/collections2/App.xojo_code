#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim ef as integer
		  dim outFile as FolderItem=SpecialFolder.Desktop.Child("collections2.pdf")
		  
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
		  
		  // We add a user defined field Index to the list so that we can sort it in every order we want.
		  ef = pdf.CreateCollectionField(pdf.kcisCustomNumber, 0, "File index", "Index", false, true)
		  call pdf.SetColSortField(ef, true)
		  
		  call pdf.CreateCollectionField(pdf.kcisFileName, 1, "File name", "", true, true)
		  // The creation date is documented in the PDF Reference and a valid field in a file specification
		  // but Acrobat 8 ignores it. Maybe it works when the next update of Acrobat is available...
		  //pdfCreateCollectionField(cisCreationDate, 4, "Creation date", NULL, true, false);
		  call pdf.CreateCollectionField(pdf.kcisSize, 2, "File size", "", true, false)
		  call pdf.CreateCollectionField(pdf.kcisModDate, 3, "Modification date", "", true, false)
		  
		  filepath=FindFile("taxform.pdf")
		  
		  
		  
		  ef = pdf.AttachFile(filePath, "A PDF file...", true)
		  call pdf.SetColDefFile(ef) // This file is opened when viewing the file with Acrobat 8 or later
		  call pdf.CreateColItemNumber(ef, "Index", 0.0, "")
		  
		  filepath=FindFile("fulltest.emf")
		  
		  
		  
		  ef = pdf.AttachFile(filePath, "An EMF file...", true)
		  call pdf.CreateColItemNumber(ef, "Index", 1.0, "")
		  
		  filepath=FindFile("sample.txt")
		  
		  
		  
		  ef = pdf.AttachFile(filePath, "A text file...", true)
		  call pdf.CreateColItemNumber(ef, "Index", 2.0, "")
		  
		  // Let's check whether the collection is valid.
		  // We know that the collection is valid in this example, but when editing an imported collection
		  // this function can be very helpful.
		  call pdf.CheckCollection
		  
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
