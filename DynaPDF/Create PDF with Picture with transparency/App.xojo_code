#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim d as new MyDynapdfMBS
		  dim file as FolderItem
		  
		  d.SetLicenseKey "Lite" // For this example you can use a Lite, Pro or Enterprise License
		  
		  file=SpecialFolder.Desktop.Child("Create PDF with Picture with transparency.pdf")
		  
		  call d.CreateNewPDF file
		  call d.Append
		  
		  // no recompressing
		  call d.SetSaveNewImageFormat(false)
		  
		  dim e as new DynaPDFExtGStateMBS
		  
		  // set graphics state, so the image gets 50% transparency as a whole
		  e.FillAlpha = 0.5
		  dim ExtGState as integer = d.CreateExtGState(e)
		  call d.SetExtGState(ExtGState)
		  
		  // Please note: 
		  // Adding pictures with alpha channel works in Starter edition
		  // Setting transparency of objects (e.g. picture) requires Lite License or better
		  
		  // get picture
		  dim p as Picture = LogoMBS(500)
		  
		  dim x,y,w,h as integer
		  dim f as Double
		  dim dw as integer = d.GetPageWidth-100
		  dim dh as integer = d.GetPageHeight-100
		  
		  // scale to fit the page size
		  f=min(dw/p.Width, dh/p.Height)
		  
		  w=f*p.Width
		  h=f*p.Height
		  
		  x=50+(dw-w)/2
		  y=50+(dh-h)/2
		  
		  // add image to pdf
		  call d.InsertPicture(p, x, y, w, h)
		  
		  call d.EndPage
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
