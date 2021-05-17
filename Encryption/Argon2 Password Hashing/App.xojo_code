#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  dim a as new Argon2MBS
		  
		  a.OutputLength = 24
		  a.Password = "password"
		  a.Salt = "somesalt"
		  a.cost = 2
		  a.MemoryCost = 65536
		  a.Lanes = 4
		  a.Threads = 4
		  
		  dim hash as string = a.Calc(a.kTypeI)
		  dim t as string = EncodeHex(hash)
		  
		  if t = "45d7ac72e76f242b20b77b9bf9bf9d5915894e669a24e6c6" then
		    // ok
		  else
		    // failed
		    Break 
		  end if
		  
		  dim h as string = DecodeHex("45d7ac72e76f242b20b77b9bf9bf9d5915894e669a24e6c6")
		  if a.Verify(h, a.kTypeI) then
		    // ok
		  else
		    // failed
		    break
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
