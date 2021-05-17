#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.pdf)
		  if f=nil then quit
		  
		  dim timeStart as integer = ticks
		  dim pdf as new MyDynapdfMBS
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil) // We do not produce a PDF file in this example!
		  
		  // External cmaps should always be loaded when extracting text from PDF files.
		  // See the description of ParseContent() for further information.
		  
		  dim folder as FolderItem = FindFile("CMap")
		  
		  if folder<> nil then
		    call pdf.SetCMapDir(folder, pdf.klcmRecursive)
		  end if
		  
		  call pdf.SetImportFlags(BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage))
		  
		  if pdf.OpenImportFile(f, pdf.kptOpen, "") < 0 then
		    MsgBox "Failed to load input pdf"+EndOfLine+EndOfLine+f.NativePath
		    quit
		  end if
		  
		  // import all pages and close file
		  call pdf.ImportPDFFile(1, 1.0, 1.0)
		  call pdf.CloseImportFile
		  
		  // We flatten markup annotations and form fields so that we can extract the text from these objects too.
		  call pdf.FlattenAnnots(pdf.kaffMarkupAnnots)
		  call pdf.FlattenForm
		  
		  dim out as FolderItem = SpecialFolder.Desktop.Child(f.name+".txt")
		  dim parser as new TextExtraction(out, pdf)
		  
		  dim count as integer = pdf.GetPageCount
		  
		  for i as integer = 1 to count
		    
		    call pdf.EditPage(i)
		    // We write a page identifier to the file so that we know from which page comes the text.
		    parser.WritePageIdentifier(i)
		    parser.ParsePage
		    call pdf.EndPage
		  next
		  
		  timeStart = ticks - timeStart
		  
		  MsgBox str(timeStart/60)+" seconds needed."
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
