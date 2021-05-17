#tag Class
Protected Class MyNSSavePanelMBS
Inherits NSSavePanelMBS
	#tag Event
		Sub directoryDidChange(path as string, folder as folderitem)
		  window1.ListBox1.AddRow "Changed directory: "+folder.UnixpathMBS
		End Sub
	#tag EndEvent

	#tag Event
		Function isValidFilename(path as string, item as folderitem) As boolean
		  Window1.ListBox1.AddRow "is valid: "+item.Name
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Sub panelSelectionDidChange()
		  window1.ListBox1.AddRow "Selection changed"
		End Sub
	#tag EndEvent

	#tag Event
		Sub savePanelDidEnd(ReturnCode as integer)
		  dim f as FolderItem
		  
		  window1.ListBox1.AddRow "Save panel did end: "+str(ReturnCode)
		  
		  if ReturnCode=NSOKButton then
		    window1.ListBox1.AddRow "Result: OK"
		    
		    f=File 
		    if f<>nil then
		      window1.ListBox1.AddRow "File: "+f.UnixpathMBS
		    else
		      window1.ListBox1.AddRow "File: ?"
		    end if
		    
		    f=Directory 
		    if f<>nil then
		      window1.ListBox1.AddRow "Directory: "+f.UnixpathMBS
		    else
		      window1.ListBox1.AddRow "Directory: ?"
		    end if
		    
		  elseif ReturnCode=NSCancelButton then
		    window1.ListBox1.AddRow "Result: Cancel"
		  else
		    window1.ListBox1.AddRow "Result: "+str(ReturnCode)
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function shouldShowFilename(path as string, item as folderitem) As boolean
		  Window1.ListBox1.AddRow "Should Show Filename: "+item.Name
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Sub willExpand(expanding as boolean)
		  if expanding then
		    window1.ListBox1.AddRow "Will expand"
		  else
		    window1.ListBox1.AddRow "Will collapse"
		  end if
		  
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
