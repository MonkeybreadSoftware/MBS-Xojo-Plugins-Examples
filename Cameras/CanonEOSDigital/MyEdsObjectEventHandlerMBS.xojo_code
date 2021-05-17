#tag Class
Protected Class MyEdsObjectEventHandlerMBS
Inherits EdsObjectEventHandlerMBS
	#tag Event
		Function ObjectChanged(EventCode as integer, obj as EdsBaseMBS) As integer
		  System.DebugLog CurrentMethodName+": "+str(EventCode)
		  
		  if EventCode = EDSModuleMBS.kEdsObjectEvent_DirItemRequestTransfer then
		    
		    // cast object manually by moving handle. Plugin does not know this is a directory item!
		    dim c as new EdsDirectoryItemMBS
		    
		    c.Handle = obj.Handle
		    obj.Handle = 0
		    
		    'MsgBox d.DirectoryItemInfo.FileName
		    
		    // download picture without progress
		    
		    dim info as EdsDirectoryItemInfoMBS = c.DirectoryItemInfo
		    if info<>nil then
		      dim file as FolderItem = SpecialFolder.Desktop.Child(info.FileName)
		      
		      dim stream as new EdsStreamMBS(file, EdsStreamMBS.kEdsFileCreateDisposition_CreateNew, EdsStreamMBS.kEdsAccess_Write)
		      
		      c.Download(info.Size, stream)
		      CheckError c
		      
		      c.DownloadComplete
		      CheckError c
		      
		      stream = nil
		      
		      file.Launch
		      
		      
		    end if
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
