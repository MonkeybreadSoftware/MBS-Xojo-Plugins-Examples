#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  If WindowCount = 0 Then
		    
		    Dim f As FolderItem = GetOpenFolderItem(FileTypes1.pdf)
		    
		    If f <> Nil Then
		      OpenDocument f
		    End If
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim f As FolderItem = FindFile("license.pdf")
		  If f<> Nil And f.Exists Then
		    OpenDocument f
		  End If
		  
		  
		  Dim ff As FolderItem = SpecialFolder.Desktop.child("test.pdf")
		  If ff<> Nil And ff.Exists Then
		    OpenDocument ff
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  Dim m As New MainWindow(item)
		  
		  m.show
		  
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
