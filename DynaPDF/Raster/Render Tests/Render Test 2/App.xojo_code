#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim destfolder as FolderItem = SpecialFolder.Desktop.Child("Render Test 2")
		  destfolder.CreateAsFolder
		  
		  for i as integer = 1 to 9
		    Run i,destfolder
		  next
		  
		  MsgBox "Render Test 2 done. Please check memory usage."
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Run(n as integer, destfolder as FolderItem)
		  dim pdf as new MyDynapdfMBS
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("dynapdf_help.pdf")
		  
		  if pdf.CreateNewPDF(nil) then
		    if pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage) then
		      if pdf.OpenImportFile(f, 0, "")=0 then
		        if pdf.ImportPDFFile(1, 1.0, 1.0)>0 then
		          
		          dim PageCount as integer = pdf.GetPageCount
		          
		          for i as integer = 1 to PageCount
		            
		            // render page to fit given size and no matrix
		            dim out as Picture = pdf.RenderPagePicture(i, 1000, 1000, 2, nil)
		            
		            if out = nil then
		              break
		              MsgBox "Error: picture is nil."
		              quit
		            end if
		            
		            dim outfile as FolderItem = destfolder.Child(str(n)+"-"+str(i)+".jpg")
		            
		            if outfile = nil then
		              break
		              MsgBox "Error: folderitem is nil."
		              quit
		            end if
		            
		            out.Save(outfile, out.SaveAsJPEG, out.QualityHigh)
		            'call outfile.SaveAsJPEGMBS(out, 75)
		            
		            
		            if DebugBuild then
		              Return
		            end if
		          next
		        else
		          break
		          MsgBox "ImportPDFFile failed."
		          quit
		        end if
		      else
		        break
		        MsgBox "OpenImportFile failed."
		        quit
		      end if
		    else
		      break
		      MsgBox "SetImportFlags fails."
		      quit
		    end if
		  else
		    break
		    MsgBox "CreateNewPDF fails."
		    quit
		  end if
		  
		End Sub
	#tag EndMethod


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
