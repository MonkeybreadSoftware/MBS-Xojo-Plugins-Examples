#tag Class
Protected Class FileDropTarget
Inherits WindowsDropTargetMBS
	#tag Event
		Function DragEnter(dataObject as WinDataObjectMBS, keystate as integer, x as integer, y as integer, byref effect as integer) As integer
		  // does the dataobject contain data we want?
		  
		  System.DebugLog CurrentMethodName
		  
		  allowed = dataObject.hasPaths or dataObject.HasFileDescriptors or dataObject.HasFileName
		  
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
		  
		  System.DebugLog CurrentMethodName
		  
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
		  
		  FileDropWindow.List.DeleteAllRows
		  FileDropWindow.List.AddRow "Formats: "+Join(dataObject.Formats,", ")
		  
		  if allowed then
		    // allow it
		    effect = DROPEFFECT_COPY
		    
		    
		    dim files(-1) as FolderItem = dataObject.GetPaths
		    
		    for each f as FolderItem in files
		      // we got a file you can use like any other file (e.g. copy)
		      FileDropWindow.List.AddRow "Path """+f.NativePath+""""
		    next
		    
		    dim des(-1) as WindowsFileDescriptorMBS = dataObject.GetFileDescriptors
		    
		    for each d as WindowsFileDescriptorMBS in des
		      // we got file descriptions. Some metadata and the data. No path.
		      dim data as string = dataObject.GetFileContents(d.Index)
		      
		      FileDropWindow.List.AddRow "File """+d.FileName+""" with "+str(lenb(data))+" bytes data."
		      FileDropWindow.List.AddRow "ClassID: " + d.ClassID
		      FileDropWindow.List.AddRow "Flags: " + str(d.Flags)
		      FileDropWindow.List.AddRow "FileAttributes: " + str(d.FileAttributes)
		      
		    next
		    
		    dim s as string = dataObject.GetText
		    if s <> "" then
		      FileDropWindow.List.AddRow "Text with "+str(len(s))+" Characters."
		      FileDropWindow.List.AddRow s
		    end if
		    
		    if dataObject.HasFileName then
		      FileDropWindow.List.AddRow "FileName: "+dataObject.GetFileName
		    end if
		    
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
