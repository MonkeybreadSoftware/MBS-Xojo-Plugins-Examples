#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // open template PDF, so we can draw a page from there in our new page
		  dim templateFile as FolderItem = FindFile("template.pdf")
		  dim templateDoc as new PDFDocumentMBS(templateFile)
		  dim templatePage as PDFPageMBS = templateDoc.pageAtIndex(0)
		  
		  // now create new PDF
		  dim doc as new PDFDocumentMBS
		  dim page as new MyPDFPageMBS
		  
		  page.templatePage = templatePage
		  
		  // set page size
		  dim r as new NSRectMBS(0, 0, 595, 842) // DIN A4 paper
		  page.boundsForBox(page.kPDFDisplayBoxMediaBox) = r
		  
		  
		  // add page
		  doc.insertPage(page, 0)
		  
		  // write page
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		  if doc.write(file) then
		    file.Launch
		  else
		    MsgBox "Failed to write file."
		  end if
		  
		  
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


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
