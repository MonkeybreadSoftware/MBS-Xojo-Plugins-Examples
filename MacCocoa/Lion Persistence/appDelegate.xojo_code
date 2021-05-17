#tag Class
Protected Class appDelegate
Inherits NSApplicationDelegateMBS
	#tag Event
		Sub applicationDidDecodeRestorableState(coder as NSCoderMBS)
		  if coder.containsValueForKey( "myFile" ) then
		    window1.setFile coder.decodeNSURLFile( "myFile" )
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub applicationWillEncodeRestorableState(coder as NSCoderMBS)
		  if window1.file <> nil then
		    coder.encodeNSURLFile( window1.file, "myFile" )
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Function restoreWindowWithIdentifier(identifier as string, state as NSCoderMBS, byref resultWindow as variant, byref error as NSErrorMBS) As boolean
		  System.DebugLog currentMethodName+" identifier:"+identifier
		  
		  if identifier = "mainWindow" then
		    resultWindow = window1
		  end if
		  
		  Return True
		End Function
	#tag EndEvent


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
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
