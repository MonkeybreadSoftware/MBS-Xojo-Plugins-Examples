#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Deactivate()
		  if first then
		    Window1.init
		    first=false
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  first=true
		  MsgBox "Please close this dialog box. Than switch to another application."
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		first As boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="first"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
