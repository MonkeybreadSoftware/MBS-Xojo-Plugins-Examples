#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem = GetOpenFolderItem(MyFileTypes.Pdf)
		  
		  if f <> nil then
		    OpenDocument f
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim d as new PDFDocumentMBS(item)
		  
		  if d.pageCount < 1 then return // error?
		  
		  dim p as new PDFWindow
		  dim v as PDFViewMBS = p.PDFView.View
		  v.displaysPageBreaks = true
		  v.autoScales = true
		  v.displayMode = v.kPDFDisplaySinglePage
		  v.document = d
		  
		  dim t as PDFThumbnailViewMBS = p.PDFThumbnailView.View
		  
		  t.maximumNumberOfColumns = 1
		  t.PDFView = v
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
