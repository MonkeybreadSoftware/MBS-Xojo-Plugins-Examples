#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim ti as integer = ticks
		  
		  dim file as FolderItem = FindFile("dynapdf_help.pdf")
		  
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("dynapdf_help")
		  
		  folder.CreateAsFolder
		  
		  split file,folder
		  
		  folder.Launch
		  
		  ti = ticks-ti
		  
		  MsgBox Format(ti/60.0, "0.0")+" seconds for "+str(pageCount)+" pages"
		  
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

	#tag Method, Flags = &h0
		Sub split(file as FolderItem, folder as FolderItem)
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  call pdf.SetUseGlobalImpFiles(true) // keep imported file in memory
		  
		  // open pdf file for importing
		  call pdf.OpenImportFile(file, pdf.kptOpen, "")
		  
		  pageCount = pdf.GetInPageCount
		  
		  for i as integer = 1 to pageCount
		    dim dest as FolderItem = folder.Child("page "+str(i)+".pdf")
		    
		    // create new PDF with file
		    call pdf.CreateNewPDF dest
		    
		    call pdf.ImportPDFPage(i)
		    
		    '// add page
		    'call pdf.Append
		    '// import page data
		    'call pdf.ImportPageEx(i,1.0,1.0)
		    '// close page
		    'call pdf.EndPage
		    
		    // write and close file
		    call pdf.CloseFile
		    
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pageCount As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="pageCount"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
