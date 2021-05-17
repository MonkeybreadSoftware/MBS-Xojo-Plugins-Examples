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
		  
		  call pdf.setfont "Times",pdf.kfsNone, 14, true, pdf.kcp1252
		  
		  // start horizontal 130 from left
		  // start veritical 600 from bottom
		  // width is page width minus 130 pixels left and 50 right
		  // height is page height minus 100 on bottom and 250 on top
		  
		  call pdf.settextrect 130,600,pdf.getpageWidth-130-50,pdf.getpageHeight-100-250
		  call pdf.writeftext(pdf.ktajustify, window1.editfield1.text)
		  
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
