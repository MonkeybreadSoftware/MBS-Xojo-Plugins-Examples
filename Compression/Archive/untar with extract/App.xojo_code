#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim f As FolderItem = SpecialFolder.Desktop.child("test.zip")
		  
		  if not f.Exists then
		    break
		    log "No test.zip?"
		    return
		  end if
		  
		  
		  Call ArchiverMBS.SetCurrentWorkingDirectory(f.parent)
		  
		  dim ar as new MyArchiveReaderMBS
		  dim aw as new ArchiveWriteDiskMBS
		  aw.SetStandardLookup // lookup UIDs and GIDs
		  
		  dim flags as integer = ar.kExtractTime
		  
		  // handle permissions
		  flags = BitwiseOr(flags, ar.kExtractPermission)
		  flags = BitwiseOr(flags, ar.kExtractFileFlags)
		  flags = BitwiseOr(flags, ar.kExtractACL)
		  
		  // support Mac Metadata
		  flags = BitwiseOr(flags, ar.kExtractMacMetadata)
		  
		  // a few flags to avoid trouble
		  flags = BitwiseOr(flags, ar.kExtractSecureNoAbsolutePath)
		  flags = BitwiseOr(flags, ar.kExtractSecureNoDotDot)
		  
		  // enable overwrite
		  flags = BitwiseOr(flags, ar.kExtractUnlink)
		  
		  aw.Options = flags
		  
		  // any file format including tar, zip and 7zip
		  ar.SupportFormatAll
		  ar.SupportFilterAll
		  
		  Log "Open "+f.name
		  if not ar.OpenFile(f) then
		    log "Failed to open file with error "+str(ar.Lasterror)+": "+ar.ErrorString
		    return
		  end if
		  
		  // store for progress event
		  ar.TotalSize = f.Length
		  
		  Do
		    dim entry as ArchiveEntryMBS = ar.NextHeader
		    If ar.Lasterror = ar.kArchiveEOF Then Exit
		    
		    If ar.Lasterror <> ar.kArchiveOK Then
		      Log "Failed to read file header with error "+Str(ar.Lasterror)+": "+ar.ErrorString
		      Return
		    End If
		    
		    Log "Extract "+entry.PathName
		    
		    ar.extract(entry, aw)
		    
		    
		    
		  loop
		  
		  ar.Close
		  aw.Close
		  
		  log "done"
		  
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
