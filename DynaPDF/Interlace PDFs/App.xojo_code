#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim ti As Integer = Ticks
		  
		  // take one page from each and loop over all pages
		  
		  Dim file1 As FolderItem = FindFile("dynapdf_help.pdf")
		  Dim file2 As FolderItem = FindFile("license.pdf")
		  
		  
		  Dim destFile As FolderItem = SpecialFolder.Desktop.Child("output.pdf")
		  
		  Interlace file1, file2, destFile
		  
		  ti = ticks-ti
		  
		  MsgBox Format(ti/60.0, "0.0")+" seconds for "+str(pageCount)+" pages"
		  
		  destFile.Launch
		  Quit
		  
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
		Sub Interlace(file1 as FolderItem, file2 as FolderItem, destFile as FolderItem)
		  Dim pdf As New DynapdfMBS
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  Call pdf.CreateNewPDF destFile
		  
		  Call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  
		  // allow multiple open files
		  Call pdf.SetImportFlags2 pdf.kif2UseProxy
		  
		  // keep imported file in memory
		  Call pdf.SetUseGlobalImpFiles(True) 
		  
		  
		  // open pdf file for importing
		  Dim ImportHandle1 As Integer = pdf.OpenImportFile(file1, pdf.kptOpen, "")
		  Dim PageCount1 As Integer = pdf.GetInPageCount
		  // ImportHandle1 should be zero
		  
		  Dim ImportHandle2 As Integer = pdf.OpenImportFile(file2, pdf.kptOpen, "")
		  Dim PageCount2 As Integer = pdf.GetInPageCount
		  // ImportHandle1 should be one
		  
		  Dim page As Integer = 1
		  
		  While page <= pageCount1 Or page <= pageCount2
		    
		    // import a page
		    If page <= pageCount1 Then
		      
		      Call pdf.ReOpenImportFile(ImportHandle1)
		      Call pdf.ImportPDFPage(page)
		      
		    end if
		    
		    
		    If page <= pageCount2 Then
		      
		      Call pdf.ReOpenImportFile(ImportHandle2)
		      Call pdf.ImportPDFPage(page)
		      
		    End If
		    
		    page = page + 1
		  Wend
		  
		  pageCount = pdf.GetPageCount
		  
		  // write and close file
		  Call pdf.CloseFile
		  
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
