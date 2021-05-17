#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // we have two ways
		  
		  DrawNumbersOnTopOfPages
		  
		  'TemplateOnTopOfNumbers
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawNumbersOnTopOfPages()
		  dim pdf as new MyDynapdfMBS
		  Dim x As integer
		  
		  // takes existing PDF and draws a new one with page numbers and draws old PDF on top of that
		  
		  dim source as FolderItem = getopenfolderitem(FileTypes1.Pdf)
		  if source=nil then
		    return
		  end if
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use a Pro or Enterprise License
		  
		  dim f as FolderItem=SpecialFolder.Desktop.Child("Create numbered pages.pdf")
		  call pdf.CreateNewPDF f
		  'call pdf.SetDocInfo pdf.kdiSubject, "   "
		  'call pdf.SetDocInfo pdf.kdiProducer, "Quality Press Software"
		  'call pdf.SetDocInfo pdf.kdiAuthor, "Auto-Number"
		  'call pdf.SetDocInfo pdf.kdiTitle, "Numbered Output"
		  
		  call pdf.OpenImportFile source, pdf.kptOpen, ""
		  call pdf.ImportPDFFile(1)
		  
		  // no compression to read pdf file in text editor
		  call pdf.SetCompressionLevel(0)
		  
		  dim PageCount as integer = pdf.GetPageCount
		  for x=1 to PageCount
		    call pdf.EditPage(x)
		    call pdf.SetPageCoords(pdf.kpcBottomUp)
		    'call pdf.SetFontOrigin(pdf.korDownLeft)
		    
		    call pdf.SetUseVisibleCoords(true) // to avoid trouble with special cropbox settings
		    call pdf.SetFillColorSpace(pdf.kcsDeviceRGB)
		    call pdf.SetFont "Times",pdf.kfsNone,46,True,pdf.kcp1252
		    call pdf.SetFillColor(-2550000)
		    
		    call pdf.WriteText 1*72,1*72, "Page "+str(x)
		    call pdf.EndPage
		  next 
		  
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  
		  f.Launch (true)
		  quit
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PlaceCentered(pdf as dynapdfmbs, template as integer, mediabox as DynaPDFRectMBS, cropbox as DynaPDFRectMBS, destx as double, desty as double, destwidth as double, destheight as double) As boolean
		  dim x,y,w,h,sx as double
		  
		  if CropBox = nil then
		     
		    // If no crop box is set use the media box. 
		    CropBox = MediaBox
		  end if
		  
		  w  = CropBox.Right - CropBox.Left
		  h  = CropBox.Top - CropBox.Bottom
		  sx = DestWidth / w
		  
		  // The origin of the template must be scaled  
		  if (h * sx <= DestHeight) then
		    
		    h = h* sx
		    w = (MediaBox.Right - MediaBox.Left) * sx
		    x = DestX - CropBox.Left   * sx
		    y = DestY - CropBox.Bottom * sx + (DestHeight - h) / 2.0
		    return pdf.PlaceTemplate( template, x, y, w, 0.0)
		  else 
		    
		    sx = DestHeight / h
		    w = w*sx
		    h = (MediaBox.Top - MediaBox.Bottom) * sx
		    x = DestX - CropBox.Left   * sx + (DestWidth - w) / 2.0
		    y = DestY - CropBox.Bottom * sx
		    
		    return pdf.PlaceTemplate(template, x, y, 0.0, h)
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TemplateOnTopOfNumbers()
		  dim pdf as new MyDynapdfMBS
		  Dim x,template As integer
		  dim mediabox, cropbox as DynaPDFRectMBS
		  
		  // takes existing PDF and draws a new one with page numbers and draws old PDF on top of that
		  
		  dim source as FolderItem = getopenfolderitem(FileTypes1.Pdf)
		  if source=nil then
		    return
		  end if
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  dim f as FolderItem=SpecialFolder.Desktop.Child("Create numbered pages.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetDocInfo pdf.kdiSubject, "   "
		  call pdf.SetDocInfo pdf.kdiProducer, "Quality Press Software"
		  call pdf.SetDocInfo pdf.kdiAuthor, "Auto-Number"
		  call pdf.SetDocInfo pdf.kdiTitle, "Numbered Output"
		  
		  call pdf.OpenImportFile source, pdf.kptOpen, ""
		  
		  call pdf.AddFontSearchPath SpecialFolder.Desktop.Child("fonts"),true
		  
		  for x=1 to pdf.getinPageCount
		    call pdf.append
		    call pdf.SetFontOrigin(pdf.korDownLeft)
		    
		    call pdf.SetFont "Times",pdf.kfsNone,46,True,pdf.kcp1252
		    call pdf.SetFillColor(-2550000)
		    
		    call pdf.WriteText 1*72,1*72, "Page "+str(x)
		    
		    template=pdf.ImportPage(x)
		    
		    mediabox=pdf.getinbbox(x,pdf.kpbmediaBox)
		    cropbox=pdf.getinbbox(x,pdf.kpbcropBox)
		    
		    call placecentered(pdf, template, mediaBox, cropBox, 0, 0, pdf.getpageWidth, pdf.getpageheight)
		    
		    call pdf.EndPage
		  next 
		  
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  
		  f.Launch (true)
		  quit
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h4
		dynapdfFontMBSXHeight As Single
	#tag EndProperty


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
		#tag ViewProperty
			Name="dynapdfFontMBSXHeight"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Single"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
