#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  msgBox "Please drop files on this application!"
		  quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  openmovie item
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub openmovie(f as folderItem)
		  dim m as movie
		  
		  // first try via QuickTime
		  m=f.openasmovie
		  
		  if m<>nil then // got it
		    quickTimeWindow.play m
		    return // exit
		  end if
		  
		  if targetWin32 then
		    windowsMCIPlayer.play f
		  else
		    msgBox "Die Datei ist kein Film für QuickTime!"    // <-- CONVERTED
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		v As windowsMCIMBS
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
