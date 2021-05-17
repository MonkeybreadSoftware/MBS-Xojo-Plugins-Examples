#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if IsRosetta then
		    MsgBox "Rosetta active"
		  else
		    MsgBox "Rosetta not found"
		  end if
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function IsRosetta() As boolean
		  Const CTL_HW = 6
		  Const HW_MODEL = 2
		  
		  dim mib,m as MemoryBlock
		  
		  mib=newMemoryBlock(8)
		  mib.Long(0) = CTL_HW
		  mib.Long(4) = HW_MODEL
		  
		  m=SystemControlMBS(mib)
		  if m<>nil then
		    MsgBox m.CString(0)
		    if m.CString(0)="PowerMac" then
		      Return true
		    end if
		  else
		    MsgBox "got nil"
		  end if
		  
		End Function
	#tag EndMethod


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
