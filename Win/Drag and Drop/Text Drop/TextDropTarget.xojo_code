#tag Class
Protected Class TextDropTarget
Inherits WindowsDropTargetMBS
	#tag Event
		Function DragEnter(dataObject as WinDataObjectMBS, keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  // does the dataobject contain data we want?
		  
		  allowed = dataObject.HasText
		  
		  if allowed then
		    // allow it
		    effect = DROPEFFECT_COPY
		  else
		    // deny
		    effect = DROPEFFECT_NONE
		  end if
		  
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
		  
		  if allowed then
		    // allow it
		    effect = DROPEFFECT_COPY
		  else
		    // deny
		    effect = DROPEFFECT_NONE
		  end if
		  
		  Return S_OK
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Drop(dataObject as WinDataObjectMBS, keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  System.DebugLog "Inside drop event "+str(allowed)
		  
		  
		  if allowed then
		    // allow it
		    effect = DROPEFFECT_COPY
		    
		    dim s as string = dataObject.GetText
		    
		    System.DebugLog s
		    
		    TextDropWindow.StaticText1.text = s
		    
		    
		  else
		    // deny
		    effect = DROPEFFECT_NONE
		  end if
		  
		  Return S_OK
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		allowed As Boolean
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
		#tag ViewProperty
			Name="allowed"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
