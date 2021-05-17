#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim xml as string = MakeXML
		  
		  dim o as CFObjectMBS = NewCFObjectMBSFromXML(NewCFBinaryDataMBSStr(xml))
		  
		  if o isa CFDictionaryMBS then
		    dim d as CFDictionaryMBS = CFDictionaryMBS(o)
		    dim key as CFStringMBS = NewCFStringMBS("Key")
		    
		    dim valueObject as CFObjectMBS = d.Value(key)
		    if valueObject isa CFStringMBS then
		      dim value as CFStringMBS = CFStringMBS(valueObject)
		      MsgBox value.str
		    else
		      // error
		      break
		    end if
		  else
		    // error
		    break
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function MakeXML() As string
		  dim d as new CFMutableDictionaryMBS
		  dim key as CFStringMBS = NewCFStringMBS("Key")
		  dim value as CFStringMBS = NewCFStringMBS("My Value")
		  
		  d.set(key, value)
		  
		  dim b as CFBinaryDataMBS = d.XML
		  Return b.Str
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
