#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim a as AppleScriptMBS
		  dim b as AppleScriptMBS
		  
		  a=new MyAppleScriptMBS
		  
		  // compile this source code, runs 30 seconds
		  a.Compile "set x to 0"+EndOfLine+"repeat until x=10000000"+EndOfLine+"set x to x + 1"+EndOfLine+"end repeat"
		  
		  b=new MyAppleScriptMBS
		  
		  // now we copy the binary code to another object
		  b.Binary=a.Binary
		  
		  // and run it
		  b.Execute
		  
		  // -1753 if you press control to cancel
		  // 0 if you let it run
		  MsgBox str(b.Lasterror)
		  
		  // now decompile
		  MsgBox b.Source
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
