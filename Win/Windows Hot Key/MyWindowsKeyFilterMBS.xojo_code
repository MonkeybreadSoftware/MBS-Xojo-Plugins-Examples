#tag Class
Protected Class MyWindowsKeyFilterMBS
Inherits WindowsKeyFilterMBS
	#tag Event
		Function KeyDown(vkCode as integer, scanCode as integer, flags as integer, time as integer) As Boolean
		  if vkCode = &h74 then // F5
		    window1.Listbox1.AddRow "F5 down"
		    Return true
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function KeyUp(vkCode as integer, scanCode as integer, flags as integer, time as integer) As Boolean
		  if vkCode = &h74 then // F5
		    window1.Listbox1.AddRow "F5 up"
		    Return true
		  end if
		  
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
