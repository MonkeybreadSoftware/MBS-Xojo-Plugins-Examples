#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // easy case
		  test SplitCommaSeparatedValuesMBS("Hello,World,test"), array("Hello","World","test")
		  
		  // with quotes
		  test SplitCommaSeparatedValuesMBS("""Hello"",""World"",""test"""), array("Hello","World","test")
		  
		  // with quotes on middle
		  test SplitCommaSeparatedValuesMBS("Hello,""World"",test"), array("Hello","World","test")
		  
		  // with quotes on end
		  test SplitCommaSeparatedValuesMBS("Hello,""World"",""test"""), array("Hello","World","test")
		  
		  // without delimiter
		  test SplitCommaSeparatedValuesMBS("Hello"), array("Hello")
		  
		  // without delimiter, but with quotes
		  test SplitCommaSeparatedValuesMBS("""Hello"""), array("Hello")
		  
		  // with a missing quote
		  test SplitCommaSeparatedValuesMBS("""Hello"), array("Hello")
		  
		  // with a missing quote
		  test SplitCommaSeparatedValuesMBS("Hello, World"""), array("Hello", " World")
		  
		  // with quotes on end, one missing
		  test SplitCommaSeparatedValuesMBS("Hello,""World"",""test"), array("Hello","World","test")
		  
		  // other delimiter
		  test SplitCommaSeparatedValuesMBS("Hello;World;test", ";"), array("Hello","World","test")
		  
		  // long delimiter
		  test SplitCommaSeparatedValuesMBS("Hello---World---test", "-"), array("Hello", "", "", "World","", "", "test")
		  
		  // other delimiter, other quote
		  test SplitCommaSeparatedValuesMBS("Hello;'World';'test'", ";", "'"), array("Hello","World","test")
		  
		  MsgBox "OK"
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub test(q() as string, a() as string)
		  
		  if UBound(q) = UBound(a) then
		    dim u as integer = UBound(a)
		    for i as integer = 0 to u
		      if q(i) = a(i) then
		        // okay
		      else
		        MsgBox "Failed"+EndOfLine+Join(a,",")+EndOfLine+join(q,",")
		        quit
		      end if
		    next
		    
		    'MsgBox "OK"
		  else
		    MsgBox "Failed ubound"+EndOfLine+Join(a,",")+EndOfLine+join(q,",")
		    quit
		  end if
		  
		End Sub
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
