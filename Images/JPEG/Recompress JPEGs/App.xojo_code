#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim ji as New JPEGImporterMBS
		  dim je as New JPEGExporterMBS
		  dim m as MemoryBlock
		  dim f,f1 as FolderItem
		  
		  dim dlg as new OpenDialog
		  
		  dlg.PromptText="Choose a JPEG image to compress it:"
		  dlg.Filter=FileTypes.ImageJpeg
		  f=dlg.ShowModal()
		  if f=nil then return
		  
		  dim origSize as int64 = f.length
		  
		  // import it
		  ji.File=f
		  ji.AllowDamaged=true
		  ji.mode=ji.ModePicture // if it is cmyk, the mode will change
		  ji.Import
		  
		  dim sdlg as new SaveAsDialog
		  
		  sdlg.PromptText="Where to save the new JPEG?"
		  sdlg.Filter=FileTypes.ImageJpeg
		  sdlg.SuggestedFileName = "image.jpg"
		  f=sdlg.ShowModal()
		  if f=nil then return
		  
		  // export it
		  je.File=f
		  je.Quality=70
		  
		  if ji.Mode = ji.ModeCMYK then
		    m=ji.PictureData
		    je.ExportCMYK m, ji.Width, ji.Height, ji.Width*4
		  else // is RGB
		    je.Picture=ji.Picture
		    je.Export
		  end if
		  
		  dim comprSize as int64 = f.length
		  
		  if origSize>comprSize then
		    MsgBox "Saved "+str(origSize-comprSize)+" bytes."
		  else
		    MsgBox "New picture is "+str(origSize-comprSize)+" bytes bigger. Maybe you change the quality setting in code?"
		  end if
		  
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
