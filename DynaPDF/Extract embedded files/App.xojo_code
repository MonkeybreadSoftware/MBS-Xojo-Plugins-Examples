#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  dim ef as integer
		  dim File as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  
		  if file = nil then
		    quit
		    Return
		  end if
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  // We create the output file later if no error occurred.
		  call pdf.CreateNewPDF(nil)
		  
		  // import all and as page
		  call pdf.SetImportFlags BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  
		  if (pdf.OpenImportFile(file) < 0) then
		    msgbox "Input file """+file.Name+""" not found or not a PDF!"
		    quit
		  end if
		  
		  call pdf.ImportPDFFile(1)
		  
		  dim c as integer = pdf.GetEmbeddedFileCount
		  for i as integer = 0 to c-1
		    dim e as DynaPDFFileSpecMBS
		    if pdf.GetEmbeddedFile(i, e, true) then
		      
		      dim name as string = str(i+1)+" "+e.UnicodeFileName
		      
		      name = ReplaceAll(name,":", "")
		      name = ReplaceAll(name,"\", "")
		      name = ReplaceAll(name,"/", "")
		      
		      dim f as FolderItem = SpecialFolder.Desktop.Child(name)
		      dim b as BinaryStream = BinaryStream.Create(f, false)
		      
		      b.Write e.Buffer
		      b.Close
		      
		      Break
		    end if
		  next
		  
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  
		  quit
		  
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
