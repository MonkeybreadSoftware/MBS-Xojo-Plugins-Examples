#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'TestWhoami
		  'TestPing
		  TestPingAsync
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub TestPing()
		  // synchronously
		  
		  Dim s As New ShellMBS
		  
		  Dim args() As String
		  
		  args.Append "-c"
		  args.Append "5"
		  args.Append "monkeybreadsoftware.com"
		  
		  s.SetArguments args
		  s.Execute "/sbin/ping"
		  
		  
		  Dim output As String = s.ReadOutput
		  Dim errors As String = s.ReadError
		  
		  While s.IsRunning
		    
		    output = output + s.ReadOutput
		    errors = errors + s.ReadError
		    MainWindow.Log.Text = output+Errors
		    
		    // wait a bit
		    app.DoEvents 1
		    
		  Wend
		  
		  output = output + s.ReadOutput
		  errors = errors + s.ReadError
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestPingAsync()
		  // synchronously
		  
		  sh = New MyShellMBS
		  
		  
		  Dim args() As String
		  
		  args.Append "-c"
		  args.Append "5"
		  args.Append "monkeybreadsoftware.com"
		  
		  sh.SetArguments args
		  sh.Execute "/sbin/ping"
		  
		  
		  
		  If sh.ErrorCode <> 0 Then
		    MsgBox "Failed to run "+Str(sh.ErrorCode)
		  End If
		  
		  
		  
		  // see evens in MyShellMBS for reading data
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestWhoami()
		  Dim s As New ShellMBS
		  
		  s.Execute "/usr/bin/whoami"
		  s.Wait 5
		  
		  Dim output As String = s.ReadOutput
		  Dim errors As String = s.ReadError
		  
		  Break
		  
		  MsgBox "whoami: "+output
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		sh As MyShellMBS
	#tag EndProperty


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
