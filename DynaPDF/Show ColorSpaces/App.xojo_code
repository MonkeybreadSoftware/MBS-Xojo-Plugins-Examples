#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = GetOpenFolderItem(MyFileTypes.All)
		  
		  if f=nil then
		    quit
		  end if
		  
		  dim p as new MyDynapdfMBS
		  
		  p.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call p.CreateNewPDF
		  
		  // Skip anything that is not required
		  call p.SetImportFlags p.kifContentOnly+p.kifImportAsPage
		  
		  // From which PDF file do you want to extract the images?
		  call p.OpenImportFile(f, p.kptOpen, "")
		  
		  // Import file
		  call p.ImportPDFFile(1, 1.0, 1.0)
		  
		  
		  window1.run p
		  
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
