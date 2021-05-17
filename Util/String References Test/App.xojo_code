#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // test String references
		  dim a as string = "Hello"
		  dim b as string = a // no copy
		  dim c as string = left(a,5) // no copy
		  dim d as string = "Hello" // gets same constant string
		  
		  dim pa as integer = GetStringMemoryAddressMBS(a)
		  dim pb as integer = GetStringMemoryAddressMBS(b)
		  dim pc as integer = GetStringMemoryAddressMBS(c)
		  dim pd as integer = GetStringMemoryAddressMBS(d)
		  
		  #if RBVersion >= 2014.03 then
		    // test Text references
		    dim e as text = "Hello"
		    dim f as text = e // no copy
		    dim g as text = f.Left(5) // no copy
		    dim h as text = "Hello" // gets same constant text
		    
		    dim pe as integer = GetTextMemoryAddressMBS(e)
		    dim pf as integer = GetTextMemoryAddressMBS(f)
		    dim pg as integer = GetTextMemoryAddressMBS(g)
		    dim ph as integer = GetTextMemoryAddressMBS(h)
		    
		    // test Auto references
		    dim i as auto = "Hello"
		    dim j as auto = i // no copy
		    dim k as auto = "Hello" // same text, but new auto object
		    dim l as auto = k // no copy
		    
		    dim pi as integer = GetAutoMemoryAddressMBS(i)
		    dim pj as integer = GetAutoMemoryAddressMBS(j)
		    dim pk as integer = GetAutoMemoryAddressMBS(k)
		    dim pl as integer = GetAutoMemoryAddressMBS(l)
		  #endif
		  
		  dim m as Object = app
		  dim n as Object = m // no copy
		  dim o as Variant = 123 // new Variant object
		  dim p as Variant = o // no copy
		  
		  dim pm as integer = GetObjectMemoryAddressMBS(m)
		  dim pn as integer = GetObjectMemoryAddressMBS(n)
		  dim po as integer = GetObjectMemoryAddressMBS(o)
		  dim pp as integer = GetObjectMemoryAddressMBS(p)
		  
		  Break // see in debugger
		  
		  
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
