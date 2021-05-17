#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim file100 as FolderItem = createtestfile(100)
		  dim file200 as FolderItem = createtestfile(200)
		  dim file500 as FolderItem = createtestfile(500)
		  dim filetext as FolderItem = CreateTextFile("test.txt", "Hello World"+EndOfLine+"Just a test file.")
		  
		  files.Append file100
		  files.Append file200
		  files.Append file500
		  files.Append filetext
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CreateTestFile(n as integer) As FolderItem
		  dim logo as Picture = logoMBS(n)
		  dim file as FolderItem = SpecialFolder.Temporary.Child("test"+str(n)+".jpg")
		  
		  file.SaveAsJPEG logo
		  
		  Return file
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateTextFile(filename as string, content as string) As FolderItem
		  
		  dim file as FolderItem = SpecialFolder.Temporary.Child(filename)
		  
		  dim t as TextOutputStream = file.CreateTextFile
		  if t<>Nil then
		    t.Write content
		  end if
		  
		  Return file
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		files(-1) As FolderItem
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
