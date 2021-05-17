#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // get picture folder
		  dim ImageFolder as FolderItem = SelectFolder
		  if ImageFolder = nil or not ImageFolder.Exists then Return
		  
		  
		  dim d as new MyDynapdfMBS
		  
		  d.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("Create PDF with Picture.pdf")
		  call d.CreateNewPDF file
		  
		  dim c as integer = ImageFolder.Count
		  for i as integer = 1 to c
		    dim ImageFile as FolderItem = ImageFolder.TrueItem(i)
		    
		    call d.Append
		    
		    // set a paper size
		    call d.SetPageFormat(d.kpfDIN_A4)
		    
		    call d.SetSaveNewImageFormat(false) // if possible pass through
		    call d.SetUseTransparency(false) // no transparent color
		    call d.SetCompressionFilter(d.kcfFlate) // no compression
		    call d.SetResolution(300) // max resolution
		    
		    dim PicWidth, PicHeight, BitsPerPixel as integer
		    dim Zip as Boolean
		    
		    if not d.ReadImageFormat(ImageFile, PicWidth, PicHeight, BitsPerPixel, Zip) then
		      MsgBox "Can't read image size."
		      Return
		    end if
		    
		    dim PageWidth  as integer = d.GetPageWidth
		    dim PageHeight as integer = d.GetPageHeight
		    
		    // scale to fit the page size
		    dim f as double = min(PageWidth/PicWidth, PageHeight/PicHeight)
		    
		    dim w as integer = f * PicWidth
		    dim h as integer = f * PicHeight
		    
		    dim x as integer = (PageWidth-w)/2
		    dim y as integer = (PageHeight-h)/2
		    
		    // add image to pdf
		    if d.InsertImageEx(x, y, w, h, ImageFile) < 0 then
		      MsgBox "Failed to import image."
		      Return
		    end if
		    call d.EndPage
		    
		  next
		  
		  call d.CloseFile
		  
		  file.Launch
		  
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
