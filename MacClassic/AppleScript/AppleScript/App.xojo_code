#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim a as AppleScriptMBS
		  dim b as AppleScriptMBS
		  
		  a=new AppleScriptMBS
		  
		  // compile this source code
		  a.Compile "display dialog ""Hello World!"""
		  
		  b=new AppleScriptMBS
		  
		  // now we copy the binary code to another object
		  b.Binary=a.Binary
		  
		  // and run it
		  b.Execute
		  
		  // now decompile
		  MsgBox b.Source
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
