#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  
		  dim outfile as FolderItem=SpecialFolder.Desktop.Child("edit text.pdf")
		  
		  call pdf.CreateNewPDF outfile 
		  
		  dim filepath as FolderItem=FindFile("taxform.pdf")
		  
		  
		  
		  // We import the contents only without conversion of pages to templates
		  call pdf.SetImportFlags(BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  if pdf.OpenImportFile(filePath, pdf.kptOpen, "")<>0 then
		    MsgBox "Input file """+ filePath.name+""" not found!"
		    quit
		  end if
		  
		  call pdf.ImportPDFFile(1, 1.0, 1.0)
		  call pdf.CloseImportFile
		  
		  dim editor as new MyDynaPDFEditTextMBS(pdf)
		  
		  dim found as integer
		  dim pageCount as integer = pdf.GetPageCount
		  for i as integer = 1 to pageCount
		    // DynaPDF error messages are already handled in the error callback function!
		    if pdf.EditPage(i) then
		      
		      // disable font errors while editing. The class handles them
		      
		      pdf.IgnoreFontWarnings = true
		      'The function FindPattern() searches for a string.
		      
		      found = editor.FindPattern("2002")
		      
		      'ReplacePattern() replaces the text with a new one or deletes it if the new string
		      'is an empty string. The new text is written in red color so that you can better
		      'find it. Take a look into the event PrepareWrite if you want to
		      'write the text in the orignal color...
		      
		      editor.ReplacePattern("2010")
		      pdf.IgnoreFontWarnings = false
		      
		      call pdf.EndPage
		    end if
		  next
		  
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
