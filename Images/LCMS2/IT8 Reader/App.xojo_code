#tag Class
Protected Class App
Inherits Application
Implements LCMS2ErrorHandlerMBS
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem
		  
		  // in debug open the file on desktop
		  if DebugBuild then
		    f = SpecialFolder.Desktop.Child("test.txt")
		    if f.Exists then
		      OpenDocument f
		      Return
		    end if
		  end if
		  
		  // open any file
		  f = GetOpenFolderItem("")
		  if f <> nil then
		    OpenDocument f
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  lcms2mbs.SetLogErrorHandler self
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim it8 as LCMS2IT8MBS = LCMS2IT8MBS.LoadFromFile(nil, item)
		  
		  if it8<>nil then
		    dim mw as new MainWindow
		    mw.load item, it8
		  else
		    MsgBox "Failed to load "+item.Name
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Error(context as LCMS2ContextMBS, ErrorCode as UInt32, Text as string)
		  MsgBox "Error "+str(ErrorCode)+": "+text
		End Sub
	#tag EndMethod


	#tag Note, Name = Notes
		
		CGAT files or IT8 files must be in standard format.
		
		
		For example line endings must be LF or CRLF, but not CR.
		And NUMBER_OF_FIELDS entry must be before SAMPLE_ID entry. 
		LCMS errors if you have invalid tags defined.
		
		
		
	#tag EndNote


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
