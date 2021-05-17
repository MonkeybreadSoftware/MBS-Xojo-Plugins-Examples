#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim doc as new PDFDocumentMBS
		  dim page as new MyPDFPageMBS
		  
		  // set page size
		  dim r as new NSRectMBS(0, 0, 595, 842) // DIN A4 paper
		  page.boundsForBox(page.kPDFDisplayBoxMediaBox) = r
		  
		  dim m as new MyPDFAnnotationStampMBS(200, 300, 80, 100)
		  
		  page.addAnnotation m
		  
		  // add page
		  doc.insertPage(page, 0)
		  
		  
		  // write page
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		  if doc.write(file) then
		    file.Launch
		    quit
		  else
		    MsgBox "Failed to write file."
		  end if
		  
		  
		End Sub
	#tag EndEvent


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
