#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  //ADD your own external method to confirm there is a valid 
		  //Monkeybread Xojo Plugins license
		  //HERE
		  
		  //Check if game center available in this OS X version
		  Dim major, minor, bug As Integer
		  
		  If System.Gestalt("sys1", major) Then
		    If System.Gestalt("sys2", minor) Then
		      If System.Gestalt("sys3", bug) Then
		        if major>=10 AND minor>=8 then
		          //Game Center introduced in OS X 10.8 (Mountain Lion)
		          pBoolGameCenterIsAvailable=true
		          if bug>=2 then
		            //Some new features were added in OS X 10.8.2
		            pBoolVersion1082=true
		          end if
		        else
		          Window1.Log "Max OS X v" + Str(major) + "." + Str(minor) + "." + Str(bug)+" does not "_
		          +"support Game Center. Please upgrade to run this game."
		        end if
		      End If
		    End If
		  End If
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		pBoolGameCenterIsAvailable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pBoolVersion1082 As Boolean
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Clear", Scope = Public
		#Tag Instance, Platform = Mac Cocoa, Language = Default, Definition  = \"&Clear"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Quit", Scope = Public
		#Tag Instance, Platform = Mac Cocoa, Language = Default, Definition  = \"&Quit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="pBoolGameCenterIsAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pBoolVersion1082"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
