#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  auth = ServiceManagementModuleMBS.CreateAuthorization
		  
		  dim domain as string = ServiceManagementModuleMBS.kSMDomainSystemLaunchd
		  dim label as string = "com.mycompany.helper"
		  dim error as variant
		  
		  if ServiceManagementModuleMBS.JobBless(domain, label, auth, error) then
		    MsgBox "OK"
		  else
		    dim cferror as CFErrorMBS = error
		    
		    if cferror <> nil then
		      MsgBox cferror.Description
		    else
		      MsgBox "Some error?"
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		auth As AuthorizationMBS
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
