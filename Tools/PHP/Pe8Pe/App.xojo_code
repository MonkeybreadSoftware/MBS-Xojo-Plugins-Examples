#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  if TargetWin32 then
		    if not PHPMBS.LoadLibrary("C:\Programme\PHP\php5ts.dll") then
		      MsgBox "Failed to load php dll."
		      quit
		    end if
		    
		  elseif TargetMachO then
		    
		    f=GetFolderItem("libphp5.dylib")
		    
		    if not PHPMBS.LoadLibrary(f) then
		      MsgBox "Failed to load php library."
		      quit
		    end if
		    
		  elseif TargetLinux then
		    
		    f=GetFolderItem("libphp5.so")
		    
		    if not PHPMBS.LoadLibrary(f) then
		      MsgBox "Failed to load php library."
		      quit
		    end if
		    
		  end if
		  
		  htmlEventsCallBack=new MyScriptCallback
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		CurrentDocumentsFolderPath As String = "documents/"
	#tag EndProperty

	#tag Property, Flags = &h0
		filetoprocess As String
	#tag EndProperty

	#tag Property, Flags = &h0
		HTMLCode As String
	#tag EndProperty

	#tag Property, Flags = &h0
		htmlEventsCallBack As MyScriptCallback
	#tag EndProperty

	#tag Property, Flags = &h0
		HTMLResultLoaded As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		httpWindowTitle As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="HTMLResultLoaded"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentDocumentsFolderPath"
			Visible=false
			Group="Behavior"
			InitialValue="documents/"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="filetoprocess"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="httpWindowTitle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTMLCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
