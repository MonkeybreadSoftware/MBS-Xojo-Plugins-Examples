#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  MyAVFoundation = new MyAVFoundationMBS
		  
		  log "Load audio..."
		  
		  AddPlayer "/System/Library/Sounds/Hero.aiff"
		  AddPlayer "/System/Library/Sounds/Submarine.aiff"
		  AddPlayer "/System/Library/Sounds/Glass.aiff"
		  
		  
		  dim p1 as AVAudioPlayerMBS = Players(0)
		  log "Play "+p1.Name
		  if p1.play then
		    // okay
		  else
		    // failed to play
		    break
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddPlayer(f as FolderItem)
		  dim e as NSErrorMBS
		  dim p as AVAudioPlayerMBS = AVAudioPlayerMBS.audioPlayerWithFile(f, e)
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription
		  end if
		  
		  if p = nil then
		    // failed to load?
		    break
		    return
		  end if
		  
		  players.Append p
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPlayer(path as string)
		  dim f as FolderItem
		  
		  #if RBVersion > 2013 then
		    f = GetFolderItem(path, FolderItem.PathTypeNative)
		  #else
		    f = GetFolderItem(path, FolderItem.PathTypeShell)
		  #endif
		  
		  AddPlayer f
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Shared MyAVFoundation As MyAVFoundationMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Shared Players() As AVAudioPlayerMBS
	#tag EndProperty


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
