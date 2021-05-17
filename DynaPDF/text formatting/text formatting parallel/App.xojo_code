#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  // The structure TOutRect holds all required variables to calculate
		  // the output rectangle. We use it to avoid the usage of global
		  // variables.
		  dim r as new TOutRect
		  
		  dim outfile as FolderItem=SpecialFolder.Desktop.Child("text formatting parallel.pdf")
		  
		  // The text is stored in a file
		  dim filepath as FolderItem=FindFile("sample.txt")
		  
		  
		  dim fText as string = GetFileBuffer(filePath)
		  if lenb(fText)=0 then
		    MsgBox "Cannot open input file: "+filepath.Name
		    quit
		  end if
		  
		  // fText=ReplaceLineEndings(fText,EndOfLine.UNIX)
		  
		  call pdf.CreateNewPDF(nil) // The output file is created later
		  
		  
		  r.ColCount = 3    // Set the number of columns
		  r.Distance = 10.0 // Distance between two columns
		  r.PosY     = 50.0
		  r.Height   = pdf.GetPageHeight - 100.0
		  r.Width    = (pdf.GetPageWidth - 100.0 - (r.ColCount -1) * r.Distance) / r.ColCount
		  pdf.current=r
		  
		  // first column
		  call pdf.Append
		  r.Column   = 0    // Current column
		  r.page = 1
		  r.PosX     = 50.0
		  
		  // Set the output rectangle first
		  call pdf.SetTextRect(r.PosX, r.PosY+r.Height, r.Width, r.Height)
		  
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 10.0, true, pdf.kcp1252)
		  call pdf.WriteFText(pdf.ktaJustify, fText) // Now we can print the text
		  
		  call pdf.EndPage // Close the last page
		  
		  // second column
		  
		  call pdf.EditPage(1)
		  
		  r.page = 1
		  r.Column   = 1    // Current column
		  r.PosX     = 50.0 + r.Column * (r.Width + r.Distance)
		  pdf.current=r
		  
		  // Set the output rectangle first
		  call pdf.SetTextRect(r.PosX, r.PosY+r.Height, r.Width, r.Height)
		  
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 12.0, true, pdf.kcp1252)
		  call pdf.WriteFText(pdf.ktaJustify, fText) // Now we can print the text
		  
		  call pdf.EndPage // Close the last page
		  
		  
		  // third column
		  
		  call pdf.EditPage(1)
		  
		  r.page = 1
		  r.Column   = 2    // Current column
		  r.PosX     = 50.0 + r.Column * (r.Width + r.Distance)
		  pdf.current=r
		  
		  // Set the output rectangle first
		  call pdf.SetTextRect(r.PosX, r.PosY+r.Height, r.Width, r.Height)
		  
		  call pdf.SetFont("Helvetica", pdf.kfsNone, 9.0, true, pdf.kcp1252)
		  call pdf.WriteFText(pdf.ktaJustify, fText) // Now we can print the text
		  
		  call pdf.EndPage // Close the last page
		  
		  // No fatal error occurred?
		  if pdf.HaveOpenDoc then
		    // OK, now we can open the output file.
		    if ( not pdf.OpenOutputFile(outFile)) then
		      MsgBox "Make sure that you have write access to the project folder."
		    end if
		    
		    if pdf.CloseFile then
		      outfile.Launch
		    end if
		    
		  end if
		  
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
		Function GetFileBuffer(file as folderitem) As string
		  dim b as BinaryStream
		  
		  b=file.OpenAsBinaryFile(False)
		  if b<>Nil then
		    return b.Read(b.Length, encodings.WindowsANSI)
		  end if
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
