#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  
		  // This is older example
		  // for new projects, please check the code in the "edit text" project.
		  // the new DynaPDFEditTextMBS class works on higher level.
		  
		  dim outfile as FolderItem=SpecialFolder.Desktop.Child("replace text.pdf")
		  
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
		  
		  dim result as Boolean
		  
		  dim pageCount as integer = pdf.GetPageCount
		  for i as integer = 1 to pageCount
		    // DynaPDF error messages are already handled in the error callback function!
		    call pdf.EditPage(i)
		    
		    dim s as DynaPDFStackMBS
		    
		    call pdf.InitStack(s)
		    dim found as Boolean = false
		    
		    do
		      result=pdf.GetPageText(s)
		      
		      if result then
		        if instr(s.text,"2002")>0 then
		          System.DebugLog "found"
		          if not pdf.ReplacePageText(ReplaceAll(s.text,"2002","2010"),s) then
		            System.DebugLog "failed."
		          else
		            System.DebugLog "found."
		            found = true
		          end if
		          
		        end if
		      end if
		      
		    loop until not result
		    
		    if found then
		      call pdf.FlushPageContent(s)
		    end if
		    
		    call pdf.EndPage
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
