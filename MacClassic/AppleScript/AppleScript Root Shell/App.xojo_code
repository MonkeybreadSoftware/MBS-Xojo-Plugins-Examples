#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // Run whoami with admin rights
		  
		  dim a as AppleScriptMBS
		  dim b as AppleScriptMBS
		  
		  a=new AppleScriptMBS
		  
		  // compile this source code
		  a.Compile "do shell script ""whoami"" with administrator privileges"
		  
		  // and run it
		  a.Execute
		  
		  // now decompile
		  MsgBox a.Result
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
