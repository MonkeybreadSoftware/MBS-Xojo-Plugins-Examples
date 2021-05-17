#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  dim d as new date
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  call pdf.CreateNewPDF nil
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // load CharacterMaps if you want to correctly process asian fonts
		  'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		  
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  dim pic as Picture = LogoMBS(500) // Needs MBS Main Plugin
		  
		  call pdf.InsertPicture(pic, 50, 200, 200, 200)
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 40.0, true, pdf.kcp1252
		  call pdf.WriteFText pdf.ktaCenter, "My first Xojo output!"
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcp1252
		  call pdf.WriteText 50.0, 180.0, "File created: " + d.LongDate
		  
		  call pdf.EndPage
		  
		  dim out as Picture = pdf.RenderPagePicture(1)
		  
		  if out = nil then
		    MsgBox "Error: picture is nil."
		    Return
		  end if
		  
		  dim outfile as FolderItem = SpecialFolder.Desktop.Child("Create and Render PDF.jpg")
		  
		  // older Real Studio
		  outfile.SaveAsJPEG out
		  
		  // newer Real Studio
		  'out.Save(outfile, out.SaveAsJPEG)
		  
		  outfile.Launch
		  
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
