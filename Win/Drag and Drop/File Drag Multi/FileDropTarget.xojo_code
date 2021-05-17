#tag Class
Protected Class FileDropTarget
Inherits WindowsDropTargetMBS
	#tag Event
		Function DragEnter(dataObject as WinDataObjectMBS, keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  // deny drop
		  effect = DROPEFFECT_NONE
		  
		  Return S_OK
		  
		End Function
	#tag EndEvent

	#tag Event
		Function DragLeave() As integer
		  return S_OK
		End Function
	#tag EndEvent

	#tag Event
		Function DragOver(keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  // deny drop
		  effect = DROPEFFECT_NONE
		  
		  Return S_OK
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Drop(dataObject as WinDataObjectMBS, keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  // deny drop
		  effect = DROPEFFECT_NONE
		  
		  Return S_OK
		  
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
