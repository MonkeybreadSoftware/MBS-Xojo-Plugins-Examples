#tag Class
Protected Class App
Inherits Application
	#tag Method, Flags = &h0
		Function FixEncoding(s as string) As string
		  dim UTF8 as TextEncoding = encodings.UTF8
		  
		  if not UTF8.IsValidData(s) then
		    break // this function works only on UTF-8 text!
		    return s
		  end if
		  
		  
		  // how many ? do we have?
		  dim CountFieldsS as Integer = CountFieldsB(s, "?")
		  
		  dim u as integer = encodings.Count-1
		  for i as integer = 0 to u
		    
		    // we try each encoding
		    dim e as TextEncoding = encodings.Item(i)
		    dim internetName as string = e.internetName
		    
		    if internetName.left(3) <> "UTF" then // skip all UTF variants
		      // now convert back to old encoding
		      dim t as string = ConvertEncoding(s, e)
		      
		      if UTF8.IsValidData(t) then
		        // looks like the new text is valid UTF-8
		        
		        dim CountFieldsT as integer = CountFieldsB(t, "?")
		        if CountFieldsT = CountFieldsS then
		          // and conversion didn't find characters it didn't like
		          
		          dim r as string = DefineEncoding(t, encodings.UTF8)
		          
		          // we got a fixed string
		          return r
		          
		        end if
		      end if
		    end if
		  next
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test()
		  dim SomeText as string = "Vielen Dank für ihr Verständnis."
		  
		  // lets say you would save this text in other encoding
		  dim SomeText_WindowsANSI as string = DefineEncoding(SomeText, encodings.WindowsANSI)
		  dim SomeText_MacRoman    as string = DefineEncoding(SomeText, encodings.MacRoman)
		  dim SomeText_DOSLatin1   as string = DefineEncoding(SomeText, encodings.DOSLatin1)
		  
		  // and now get that as UTF-8
		  dim SomeText_WindowsANSI_UTF8 as string = ConvertEncoding(SomeText_WindowsANSI, Encodings.UTF8)
		  dim SomeText_MacRoman_UTF8    as string = ConvertEncoding(SomeText_MacRoman, Encodings.UTF8)
		  dim SomeText_DOSLatin1_UTF8   as string = ConvertEncoding(SomeText_DOSLatin1, Encodings.UTF8)
		  
		  // now you have the broken text you don't want.
		  // e.g. Vielen Dank fÃ¼r ihr VerstÃ¤ndnis.
		  
		  // now we want to fix.
		  
		  
		  dim SomeText_WindowsANSI_UTF8_fixed as string = FixEncoding(SomeText_WindowsANSI_UTF8)
		  dim SomeText_MacRoman_UTF8_fixed    as string = FixEncoding(SomeText_MacRoman_UTF8)
		  dim SomeText_DOSLatin1_UTF8_fixed   as string = FixEncoding(SomeText_DOSLatin1_UTF8)
		  
		  // and you see in debugger all texts are back right
		  
		  Break
		End Sub
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
