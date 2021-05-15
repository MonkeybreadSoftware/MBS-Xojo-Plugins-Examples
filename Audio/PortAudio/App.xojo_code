#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.log")
		  if PortAudioMBS.SetDebugLogFile(f) then
		    
		  else
		    Break
		  end if
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
