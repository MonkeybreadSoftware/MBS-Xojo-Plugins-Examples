#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // required for Windows 8.1
		  call WindowsWMIMBS.InitSecurity(false)
		  
		  dim w as new WindowsWMIMBS
		  
		  if w.ConnectServer("root\cimv2") then
		    MsgBox "ConnectServer: ok"
		    
		    if w.query("WQL","SELECT * FROM Win32_Processor") then
		      MsgBox "query: ok"
		      
		      if w.NextItem then
		        MsgBox "NextItem: ok"
		        
		        MsgBox w.GetPropertyString("Name") // string
		        MsgBox str(w.GetPropertyInteger("MaxClockSpeed")) // uint32
		        MsgBox str(w.GetPropertyInteger("ProcessorType")) // uint16
		        
		      else
		        MsgBox "NextItem: fail"+EndOfLine+"Lasterror: "+str(w.Lasterror)
		      end if
		    else
		      MsgBox "query: fail"+EndOfLine+"Lasterror: "+str(w.Lasterror)
		    end if
		    
		  else
		    MsgBox "ConnectServer: fail"+EndOfLine+"Lasterror: "+str(w.Lasterror)
		  end if
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
