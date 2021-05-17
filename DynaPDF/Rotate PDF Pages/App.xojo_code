#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim ti As Integer = Ticks
		  
		  Dim file As FolderItem = FindFile("license.pdf")
		  
		  
		  Dim out As FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		  
		  process file,out
		  
		  ti = Ticks-ti
		  
		  MsgBox Format(ti/60.0, "0.0")+" seconds."
		  
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
		Sub Process(file as FolderItem, out as FolderItem)
		  Dim pdf As New MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  Call pdf.CreateNewPDF(out)
		  
		  call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  
		  // open pdf file for importing
		  call pdf.OpenImportFile(file, pdf.kptOpen, "")
		  
		  Call pdf.ImportPDFFile(1)
		  
		  
		  Dim pagecount As Integer = pdf.GetPageCount
		  
		  For i As Integer = 1 To pageCount
		    
		    If pdf.EditPage(i) Then
		      
		      Dim o As Integer = pdf.GetOrientation
		      // rotate to 90° or back
		      If o = 0 Then
		        o = 90
		      Else
		        o = 0
		      End If
		      
		      call pdf.SetOrientation(o)
		      
		      Call pdf.EndPage
		    End If
		    
		  Next
		  
		  Call pdf.CloseFile
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
