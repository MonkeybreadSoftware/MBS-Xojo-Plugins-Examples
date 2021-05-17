#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  // let user pick a file
		  Dim f As FolderItem = GetOpenFolderItem(FileTypes1.Jpeg)
		  If f <> Nil Then
		    OpenDocument f
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  // open jpeg file and look for EXIF
		  
		  Dim j As New JPEGImporterMBS
		  
		  j.ReadExifData = True
		  j.File = item
		  j.mode = j.ModeAuto
		  
		  
		  If j.ReadHeader Then // read header only
		    
		    // do we have exif data
		    Dim ExifData As String = j.ExifData
		    If ExifData.Len = 0 Then
		      
		      MsgBox "No EXIF data in the file "+item.DisplayName+"."
		    else
		      
		      Dim exif As New ExifTagsMBS(ExifData)
		      Dim w As New ExifWindow
		      
		      w.ShowExif exif, item.DisplayName
		    end if
		    
		  Else
		    MsgBox "Failed to read file: "+j.ErrorMessage
		  End If
		  
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
