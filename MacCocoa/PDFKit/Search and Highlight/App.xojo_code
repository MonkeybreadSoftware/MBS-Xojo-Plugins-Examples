#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim i,c as integer
		  dim f as FolderItem = FindFile("test.pdf")
		  
		  if not f.Exists then
		    MsgBox "Please put test.pdf on desktop."
		    quit
		  end if
		  
		  dim p as new PDFDocumentMBS(f)
		  
		  if p.pageCount=0 then
		    MsgBox "Failed to load the PDF."
		    quit
		  end if
		  
		  const NSCaseInsensitiveSearch=1
		  
		  dim options as integer = NSCaseInsensitiveSearch
		  dim sa() as PDFSelectionMBS = p.findString("Plugin", options)
		  
		  if ubound(sa) < 0 then
		    MsgBox "no item found."
		  else
		    MsgBox str(ubound(sa)+1)+" items found."
		  end if
		  
		  // take first selection
		  dim s as PDFSelectionMBS = sa(0)
		  
		  // extend to whole words
		  s.extendSelectionAtEnd(0)
		  s.extendSelectionAtStart(0)
		  
		  // get text?
		  dim t as string= s.stringValue
		  
		  // what page is that?
		  Dim pages() As PDFPageMBS = s.pages()
		  dim page as PDFPageMBS = pages(0)
		  
		  // Rectangle on page?
		  dim bounds as NSRectMBS = s.boundsForPage(page)
		  MsgBox t + " at position "+Format(bounds.X,"0.00")+"/"+Format(bounds.Y,"0.00")+" with size "+Format(bounds.Width,"0.00")+"/"+Format(bounds.Height,"0.00")
		  
		  // make annotation for that recatnlge
		  dim annotation As new PDFAnnotationMarkupMBS(bounds.X,bounds.Y,bounds.Width,bounds.Height)
		  annotation.markupType = PDFAnnotationMarkupMBS.kPDFMarkupTypeHighlight
		  annotation.userName= ""
		  annotation.colorValue = NSColorMBS.magentaColor.colorWithAlphaComponent(0.5)
		  
		  // add annotation to the page
		  page.addAnnotation(annotation)
		  
		  // and save
		  dim destfile as FolderItem= SpecialFolder.Desktop.Child("sample.pdf")
		  
		  //file saved
		  if p.write(destfile) then
		    destfile.Launch
		  else
		    MsgBox "Failed to write PDF file."
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


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"\xE5\x89\x8A\xE9\x99\xA4", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\xE5\x89\x8A\xE9\x99\xA4"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"\xE5\x89\x8A\xE9\x99\xA4"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"\xE7\xB5\x82\xE4\xBA\x86", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\xE7\xB5\x82\xE4\xBA\x86"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
