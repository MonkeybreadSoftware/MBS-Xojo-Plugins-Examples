#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  pdf = new MyDynaPDFMBS
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("pdfs")
		  
		  if f.Exists  = false then
		    MsgBox "please put a folder PDFs on your desktop."
		    Return
		  end if
		  
		  dir f
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Dir(folder as FolderItem)
		  dim files() as FolderItem
		  dim c as integer = folder.count
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.TrueItem(i)
		    
		    if file<>nil and file.Visible and Right(file.name,4) = ".pdf" then
		      files.Append file
		    end if
		  next
		  
		  
		  for each file as FolderItem in files
		    process file
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(s as string)
		  System.DebugLog s
		  LogWindow.List.AddRow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Process(file as FolderItem)
		  log "Process "+file.Name
		  
		  // start fresh
		  call pdf.CreateNewPDF nil
		  call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		  
		  // import PDF
		  call pdf.OpenImportFile(file)
		  
		  Call pdf.ImportPDFPage(1)
		  
		  Call pdf.CloseImportFile
		  
		  // render preview
		  dim Resolution as integer = 72
		  dim Width as integer = 0 // auto
		  dim Height as integer = 0 // auto
		  dim Flags as integer = 0
		  dim PixFmt as integer = pdf.kpxfRGB
		  dim Filter as integer = pdf.kcfJPEG
		  dim Format as integer = pdf.kifmJPEG
		  
		  if pdf.RenderPageToImage(1, nil, Resolution, Width, Height, Flags, PixFmt, Filter, Format) then
		    dim data as string = pdf.GetImageBuffer
		    dim ImageName as string = Replace(file.name, ".pdf", ".jpg")
		    dim imageFile as FolderItem = file.parent.Child( ImageName )
		    dim b as BinaryStream = BinaryStream.Create(imageFile, true)
		    b.Write data
		    
		    pdf.FreeImageBuffer
		  end if
		  
		  // explicit shutdown this instance
		  call pdf.CloseFile
		  call pdf.FreeImageBuffer
		  call pdf.FreePDF
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pdf As DynaPDFMBS
	#tag EndProperty


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
