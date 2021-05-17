#tag Class
Protected Class MyWindowsICMSetupMBS
Inherits WindowsICMSetupMBS
	#tag Event
		Sub Apply()
		  window1.List.AddRow "Apply"
		  window1.Update
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Idle()
		  dim l as listbox = window1.List
		  dim c as integer = l.ListCount
		  
		  if c>0 then
		    if l.Cell(c-1,0)="Idle" then
		      Return // ignore duplicates
		    end if
		  end if
		  
		  l.AddRow "Idle"
		  
		End Sub
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
