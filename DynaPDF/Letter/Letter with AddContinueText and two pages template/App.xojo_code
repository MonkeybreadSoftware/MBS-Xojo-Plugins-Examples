#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  dim outFile as folderitem=SpecialFolder.Desktop.Child("Letter.pdf")
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(outFile)
		  
		  dim file as FolderItem = FindFile("letter-template.pdf")
		  
		  
		  // open import file
		  call pdf.openimportFile(file, pdf.kptopen, "")
		  
		  pdf.StartFirstPage
		  
		  // use SetLeading to change line height
		  call pdf.SetLeading 15
		  
		  
		  
		  for i as integer = 1 to 100
		    if i = 10 then
		      // underline line 10
		      call pdf.ChangeFontStyle(pdf.kfsUnderlined)
		    end if
		    
		    call pdf.AddContinueText "Line "+str(i)
		    
		    if pdf.GetLastTextPosY<150 then
		      // need page change due to limited space left on page
		      
		      pdf.StartNewPage
		    elseif i = 90 then
		      // make a change after line 90
		      
		      pdf.StartNewPage
		    elseif i = 10 then
		      // underline off
		      call pdf.ChangeFontStyle(0)
		    end if
		  next
		  
		  
		  call pdf.EndPage
		  call pdf.closefile
		  
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
