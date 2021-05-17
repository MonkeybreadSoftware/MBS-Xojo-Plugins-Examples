#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim s1 as string = SHA256MBS.HashText("Franz jagt im komplett verwahrlosten Taxi quer durch Bayern")
		  
		  if s1 = "d32b568cd1b96d459e7291ebf4b25d007f275c9f13149beeb782fac0716613f8" then
		    // ok
		  else
		    MsgBox "Failed"
		  end if
		  
		  dim s2 as string = SHA256MBS.Hash("Frank jagt im komplett verwahrlosten Taxi quer durch Bayern")
		  dim e2 as string = EncodingToHexMBS(s2)
		  
		  if e2 = "78206a866dbb2bf017d8e34274aed01a8ce405b69d45db30bafa00f5eeed7d5e" then
		    // ok
		  else
		    MsgBox "Failed"
		  end if
		  
		  dim s3 as string = SHA256MBS.Hash("")
		  dim e3 as string = EncodingToHexMBS(s3)
		  
		  if e3 = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" then
		    // ok
		  else
		    MsgBox "Failed"
		  end if
		  
		  dim s as new SHA256MBS
		  
		  s.Add "Franz jagt im komplett"
		  s.Add " verwahrlosten Taxi quer"
		  s.Add " durch Bayern"
		  
		  dim r as string = s.ResultText
		  if r = "d32b568cd1b96d459e7291ebf4b25d007f275c9f13149beeb782fac0716613f8" then
		    ' MsgBox "OK"
		  else
		    MsgBox "Failed"
		  end if
		  
		  
		  MsgBox "OK"
		  
		End Sub
	#tag EndEvent


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
