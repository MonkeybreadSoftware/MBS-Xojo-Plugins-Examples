#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // find app
		  dim Folder as FolderItem = GetFolderItem("")
		  dim BuildHelper as FolderItem = Find(Folder, "Builds - Helper")
		  dim BuildMain as FolderItem = Find(Folder, "Builds - Main")
		  dim MacHelperFolder as FolderItem = find(BuildHelper, "Mac")
		  dim MacMainFolder as FolderItem = find(BuildMain, "Mac")
		  dim MainApp as FolderItem = MacMainFolder.Child("Main.app")
		  dim HelperApp as FolderItem = MacHelperFolder.Child("Helper.app")
		  dim ContentsFolder as FolderItem = MainApp.Child("Contents")
		  
		  // add helper app to main app
		  dim LibraryFolder as FolderItem = ContentsFolder.Child("Library")
		  LibraryFolder.CreateAsFolder
		  dim LoginItemsFolder as FolderItem = LibraryFolder.Child("LoginItems")
		  LoginItemsFolder.CreateAsFolder
		  HelperApp.CopyFileTo LoginItemsFolder.Child("Helper.app")
		  
		  // fix info.plist
		  dim HelperApp2 as FolderItem = LoginItemsFolder.Child("Helper.app")
		  dim ContentsFolder2 as FolderItem = HelperApp2.Child("Contents")
		  dim InfoFile as FolderItem = ContentsFolder2.Child("Info.plist")
		  dim b as BinaryStream = BinaryStream.Open(InfoFile, true)
		  dim s as string = b.Read(b.Length, encodings.UTF8)
		  
		  if instr(s, "<key>LSUIElement</key>") = 0 then // not yet patched
		    s = ReplaceAll(s, "</dict>", "<key>LSUIElement</key><true/></dict>")
		    
		    b.Position = 0
		    b.Write s
		    b.Close
		  end if
		  
		  MsgBox "OK"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Find(f as FolderItem, name as string) As FolderItem
		  dim c as integer = f.Count
		  for i as integer = 1 to c
		    dim g as FolderItem = f.TrueItem(i)
		    if g<>nil then
		      if instr(g.name,name)>0 then
		        Return g
		      end if
		    end if
		  next
		  
		End Function
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
