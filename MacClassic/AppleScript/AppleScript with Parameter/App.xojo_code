#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim a as AppleScriptMBS
		  dim s(0) as string
		  
		  a=new AppleScriptMBS
		  
		  // compile this source code
		  a.Compile "on test(s)"+chr(13)+"display dialog s"+chr(13)+"end test"
		  MsgBox a.Source
		  
		  s(0)="Good Morning!"
		  // and run it
		  
		  a.ExecuteEvent "test",s
		  
		  MsgBox a.Result
		  
		  Quit
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
