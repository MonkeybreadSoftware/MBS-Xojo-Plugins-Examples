#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.zip")
		  dim folder as FolderItem = SpecialFolder.Pictures // some folder with images
		  dim files() As string
		  
		  dim c as integer = folder.count
		  for i as integer = 1 to c
		    dim file as FolderItem = folder.TrueItem(i)
		    
		    if file.Directory then
		      // we go here for this example only one level deep
		      
		      dim subfolder as FolderItem = file
		      dim cc as integer = subfolder.count
		      for ii as integer = 1 to cc
		        dim subfile as FolderItem = subfolder.TrueItem(ii)
		        if subfile.name.Right(4) = ".jpg" then
		          // here we pass a relative path
		          files.Append subfolder.name+"/"+subfile.name
		        end if
		      next
		      
		    else
		      
		      if file.name.Right(4) = ".jpg" then
		        // just padd a file name for files directly in source folder
		        files.Append file.name
		      end if
		    end if
		  next
		  
		  dim ErrorMessage as string
		  dim e as integer = ZipMBS.CompressFiles(f, folder, files, errorMessage)
		  
		  MsgBox "Error: "+str(e)
		  
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
