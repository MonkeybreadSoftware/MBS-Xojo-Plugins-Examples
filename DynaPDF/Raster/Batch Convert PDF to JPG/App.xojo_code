#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("testpdfs")
		  
		  if folder.Exists = false then
		    MsgBox "Please change path to your own PDF folder."
		  end if
		  
		  dim c as integer = folder.count
		  for i as integer = 1 to c
		    dim item as FolderItem = folder.TrueItem(i)
		    if item<>Nil and right(item.name,4)=".pdf" then
		      dim pdf as new MyDynaPDFMBS
		      
		      call pdf.CreateNewPDF(nil)
		      call pdf.SetImportFlags(pdf.kifImportAsPage)
		      call pdf.OpenImportFile(item, 0, "")
		      call pdf.ImportPDFFile(1,1.0,1.0)
		      
		      dim pc as integer = pdf.GetPageCount
		      for pi as integer = 1 to pc
		        
		        System.DebugLog item.name
		        
		        // query size of imported page
		        dim rect as DynaPDFRectMBS = pdf.GetInBBox(pi, pdf.kpbCropBox)
		        if rect = nil then // use media box if there is no crop box
		          rect = pdf.GetInBBox(pi, pdf.kpbMediaBox)
		        end if
		        
		        dim w,h as integer
		        
		        if rect.Bottom>rect.Top then
		          h = rect.Bottom - rect.Top
		        else
		          h = rect.top - rect.Bottom
		        end if
		        
		        if rect.Right>rect.Left then
		          w = rect.Right - rect.Left
		        else
		          w = rect.Left - rect.Right
		        end if
		        
		        // render page as picture
		        dim pic as Picture = pdf.RenderPagePicture(pi, w, h)
		        
		        dim name as string = ReplaceAll(item.name, ".pdf", "")
		        
		        dim output as FolderItem = SpecialFolder.Desktop.Child(name+str(pi)+".jpg")
		        
		        if pic<>Nil then
		          // older REAL Studio versions
		          output.SaveAsJPEG pic
		          
		          // newer REAL Studio versions
		          'pic.Save(output, pic.SaveAsJPEG)
		          
		          output.Launch(True)
		        end if
		      next
		    end if
		  next
		  
		  
		  quit
		  
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
