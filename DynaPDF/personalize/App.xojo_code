#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  
		  dim outfile as FolderItem=SpecialFolder.Desktop.Child("personalize.pdf")
		  
		  // Error messages and warnings are passed to the callback function.
		  call pdf.CreateNewPDF(nil) // The output file is created later
		  call pdf.SetDocInfo(pdf.kdiCreator, "REALbasic Example Project")
		  call pdf.SetDocInfo(pdf.kdiSubject, "How to Edit an existing pdf file")
		  call pdf.SetDocInfo(pdf.kdiTitle, "Edititing pdf files")
		  call pdf.SetDocInfo(pdf.kdiAuthor, "Jens Boschulte")
		  call pdf.SetViewerPreferences(pdf.kvpDisplayDocTitle, pdf.kavNone)
		  // Conversion of pages to templates is normally not required. Templates are required if
		  // the page should be scaled or used multiple times in a document, e.g. as background.
		  // See help file for further information.
		  call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  
		  dim filepath as FolderItem=FindFile("taxform.pdf")
		  
		  
		  
		  if (pdf.OpenImportFile(filePath, pdf.kptOpen, "") < 0) then
		    MsgBox "Input file not found: "+filepath.name
		    quit
		    Return
		  end if
		  
		  call pdf.ImportPDFFile(1, 1.0, 1.0)
		  
		  call pdf.EditPage(1)
		  // We use the 14 standard fonts only because they are always available. However, in a real
		  // project you should use fonts which can be embedded.
		  call pdf.SetFont("Courier", pdf.kfsBold, 14.0, false, pdf.kcp1252)
		  
		  call pdf.WriteText(72.5, 748.5, "X")
		  call pdf.WriteText(74.0, 701.0, "Musterstadt")
		  call pdf.WriteText(74.0, 677.0, "252/1062/3323")
		  
		  call pdf.BeginContinueText(74.0, 628.0)
		  call pdf.SetLeading(24.0)
		  call pdf.SetCharacterSpacing(5.8)
		  call pdf.AddContinueText("Mustermann")
		  call pdf.AddContinueText("Hermann")
		  call pdf.AddContinueText("22021963keineKaufmann")
		  call pdf.AddContinueText("Musterstraße 145")
		  call pdf.AddContinueText("12345Musterstadt")
		  call pdf.SetCharacterSpacing(0.0)
		  call pdf.SetFont("Courier", pdf.kfsBold, 10.0, false, pdf.kcp1252)
		  call pdf.SetLeading(47.5)
		  call pdf.AddContinueText("04.05.1994")
		  call pdf.SetFont("Courier", pdf.kfsBold, 14.0, false, pdf.kcp1252)
		  call pdf.SetCharacterSpacing(5.8)
		  call pdf.AddContinueText("Sabine")
		  call pdf.AddContinueText("18121966 ev  Hausfrau")
		  call pdf.EndContinueText
		  
		  call pdf.WriteText(72.5, 365.0, "X")
		  call pdf.WriteText(396.0, 365.0, "X")
		  
		  call pdf.BeginContinueText(74.0, 316.0)
		  call pdf.SetLeading(24.0)
		  call pdf.AddContinueText("2346256780     76834560")
		  call pdf.AddContinueText("Sparkasse Musterstadt")
		  call pdf.EndContinueText
		  
		  call pdf.WriteText(72.5, 269.0, "X")
		  call pdf.SetCharacterSpacing(0.0)
		  call pdf.SetFont("Courier", pdf.kfsNone, 10.0, false, pdf.kcp1252)
		  
		  dim d as new date
		  dim buf as string = d.ShortDate
		  
		  call pdf.WriteText(53.0, 48.0, buf)
		  call pdf.SetFillColor(PDF.RGB(&hFF, &h66, &h66))
		  call pdf.SetFont("Helvetica", pdf.kfsBold, 22.0, false, pdf.kcp1252)
		  call pdf.WriteText(340, 70, "www.dynaforms.de")
		  call pdf.SetLineWidth(0.0)
		  call pdf.SetLinkHighlightMode(pdf.khmPush)
		  call pdf.SetAnnotFlags(pdf.kafReadOnly)
		  call pdf.WebLink(340, 64, 204, 22, "http://www.dynaforms.de")
		  call pdf.EndPage
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if not pdf.OpenOutputFile(outFile) then
		      MsgBox "Make sure that you have write access to the project folder."
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
