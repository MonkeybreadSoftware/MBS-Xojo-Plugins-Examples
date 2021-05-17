#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim ti as integer = ticks
		  
		  dim file as FolderItem = FindFile("dynapdf_help.pdf")
		  
		  dim sourcePDFdata as string = ReadFile(file)
		  
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("test")
		  folder.CreateAsFolder
		  
		  split sourcePDFdata, folder
		  
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
		Function ReadFile(f as FolderItem) As string
		  dim b as BinaryStream = f.OpenAsBinaryFile(false)
		  
		  ' in newer versions of Real Studio:
		  'dim b as BinaryStream = BinaryStream.open(f, false)
		  
		  Return b.Read(b.Length)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub split(sourcePDFdata as string, folder as FolderItem)
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  call pdf.SetUseGlobalImpFiles(true) // keep imported file in memory
		  
		  // open file from memory
		  call pdf.OpenImportBuffer(sourcePDFdata, pdf.kptOpen, "")
		  
		  pageCount = pdf.GetInPageCount
		  
		  for i as integer = 1 to pageCount
		    
		    // create new PDF in memory
		    call pdf.CreateNewPDF nil
		    
		    // add page
		    call pdf.Append
		    // import page data
		    call pdf.ImportPageEx(i,1.0,1.0)
		    // close page
		    call pdf.EndPage
		    
		    // close pdf
		    call pdf.CloseFile
		    
		    // get PDF data
		    dim outputPDFData as string = pdf.GetBuffer
		    
		    call pdf.FreePDF
		    
		    // and write to file
		    dim dest as FolderItem = folder.Child("page "+str(i)+".pdf")
		    dim b as BinaryStream = dest.CreateBinaryFile("")
		    if b<>Nil then
		      b.Write outputPDFData
		      b.Close
		    end if
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
