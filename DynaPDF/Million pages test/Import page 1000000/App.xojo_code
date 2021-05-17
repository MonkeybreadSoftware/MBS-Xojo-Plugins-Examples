#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ' Register DynaPDF
		  
		  // with DynaPDF 3 expect a time less than one second and less than 100 MB of memory used
		  // with DynaPDF 2.5 expect a few seconds (depending on hard disk speed) and over 1 GB of memory used
		  
		  dim inputfile as FolderItem = SpecialFolder.Desktop.child("PDF with 1000000 pages.pdf")
		  
		  dim pdf as new MyDynapdfMBS
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test "+DynaPDFMBS.kDYNAPDF_VERSIONSTRING+".pdf")
		  
		  dim t as integer = ticks
		  call pdf.CreateNewPDF file
		  
		  /// If the imported document should be edited then avoid
		  // the conversion of pages to templates (see SetImportFlags()
		  // for further information).
		  'call pdf.SetImportFlags(bitwiseOr(pdf.kifImportAll,pdf.kifImportAsPage))
		  
		  // Import the PDF file so that it can be edited
		  call pdf.OpenImportFile(InputFile,pdf.kptOpen,"")
		  
		  call pdf.append
		  
		  dim x as integer = pdf.ImportPage(1000000)
		  
		  call pdf.PlaceTemplateEx(x, 0, 0, pdf.GetPageWidth, pdf.GetPageHeight)
		  
		  call pdf.EndPage
		  
		  MsgBox Format((ticks-t) / 60.0, "0.0")+" seconds with DynaPDF "+pdf.kDYNAPDF_VERSIONSTRING
		  
		  call pdf.CloseImportFile
		  
		  call pdf.CloseFile
		  
		  pdf = nil
		  
		  file.Launch
		  
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
