#tag Module
Protected Module PreferenceModule
	#tag Method, Flags = &h0
		Sub LoadPrefs()
		  // Load preferences for this app, and for this user.
		  // File will be saved at: user/Library/Preferences/com.mycompany.appname.Plist
		  UserPrefs = NSUserDefaultsMBS.standardUserDefaults
		  
		  // If needed, you can load preferences from another app (read only).
		  // Note that it's not allowed in Sandboxed applications.
		  UserPrefs.addSuiteNamed("com.apple.calculator")
		  
		  // Create a dictionnary to add some default values. 
		  // They will be used until the user save its own default values.
		  // No need to add empty values like 0, False, "", Nil, because when
		  // you will ask for a key/value pair, NSUserDefault will return a default
		  // value if the key does not exist, not an error.
		  
		  dim dic As New Dictionary
		  dic.Value("winmain_width")=1200
		  dic.Value("winmain_height")=700
		  dic.Value("OpenInFullSize")=True
		  
		  UserPrefs.registerDefaults( dic )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SavePrefs()
		  // synchronize is periodicaly triggered by the system.
		  // So you just need to call it when your app terminates
		  // or when you want to make the settings available
		  // immediatly, for example, if the user changed
		  // something in the preference window
		  
		  UserPrefs.setIntegerValue("winmain_width", Window1.Width )
		  UserPrefs.setIntegerValue("winmain_height", Window1.Height )
		  UserPrefs.setBoolValue("OpenInFullSize", False )
		  UserPrefs.setStringValue("my_file_path", "/movies/" )
		  
		  if UserPrefs.synchronize then
		    // Prefs has been saved
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		UserPrefs As NSUserDefaultsMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
