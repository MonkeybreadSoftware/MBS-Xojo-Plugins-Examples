#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Activate()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Close()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  System.DebugLog CurrentMethodName
		  
		  // register plugins here
		  
		  if SystemInformationMBS.isLion and TargetCocoa then 
		    // ok
		  else
		    MsgBox "Please run this example with Mac OS X 10.7 and Cocoa target."
		  end if
		  
		  del = new MyNSApplicationDelegateMBS
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		del As MyNSApplicationDelegateMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		lastrun As string
	#tag EndProperty


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
		#tag ViewProperty
			Name="lastrun"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
