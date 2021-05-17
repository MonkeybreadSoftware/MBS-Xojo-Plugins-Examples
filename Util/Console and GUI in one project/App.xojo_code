#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // check for arguments
		  Dim args() As String = Me.ArgumentsMBS
		  
		  Dim u As Integer = UBound(args)
		  
		  If u = 0 Then
		    Return // GUI
		    
		  Else
		    
		    RunConsole args
		    StdoutMBS.Flush
		    ExitMBS(0)
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub RunConsole(args() as string)
		  
		  isConsole = True
		  
		  
		  // Console
		  
		  If TargetWin32 Then
		    // important on Windows to get anything to show
		    call StdoutMBS.AttachConsole
		  end if
		  
		  StdoutMBS.Write "Hello World"+EndOfLine
		  
		  // check parameters
		  Dim u As Integer = UBound(args)
		  for i as integer = 1 to u
		    Dim arg As String = args(i)
		    
		    
		    StdoutMBS.Write str(i)+" "+arg+EndOfLine
		    
		  next
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		isConsole As Boolean
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
		#tag ViewProperty
			Name="isConsole"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
