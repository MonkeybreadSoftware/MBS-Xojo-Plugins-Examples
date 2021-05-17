#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  f=FrameworksFolderMBS(-32765).Child("Phidget21.framework")
		  
		  if LoadPhidgetFrameworkMBS(f) then
		    MsgBox "Framework loaded"
		  else
		    MsgBox "Failed to load framework"
		  end if
		  
		  // use LoadPhidgetWindowsDLLMBS on Windows
		  // use LoadPhidgetLinuxLibraryMBS on Linux
		  
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
