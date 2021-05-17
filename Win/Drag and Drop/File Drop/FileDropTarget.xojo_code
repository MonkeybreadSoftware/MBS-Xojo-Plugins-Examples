#tag Class
Protected Class FileDropTarget
Inherits WindowsDropTargetMBS
	#tag Event
		Function DragEnter(dataObject as WinDataObjectMBS, keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  // does the dataobject contain data we want?
		  
		  allowed = dataObject.hasPaths
		  
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
		    
		    FileDropWindow.List.DeleteAllRows
		    
		    dim files(-1) as FolderItem = dataObject.GetPaths
		    
		    for each f as FolderItem in files
		      // we got a file you can use like any other file (e.g. copy)
		      FileDropWindow.List.AddRow "Path """+f.NativePath+""""
		    next
		    
		    dim des(-1) as WindowsFileDescriptorMBS = dataObject.GetFileDescriptors
		    
		    for each d as WindowsFileDescriptorMBS in des
		      // we got file descriptions. Some metadata and the data. No path.
		      dim data as string = dataObject.GetFileContents(0)
		      FileDropWindow.List.AddRow "File """+d.FileName+""" with "+str(lenb(data))+" bytes data."
		    next
		    
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
