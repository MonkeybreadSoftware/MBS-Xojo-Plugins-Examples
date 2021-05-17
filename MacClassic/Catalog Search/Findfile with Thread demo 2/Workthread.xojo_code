#tag Class
Protected Class Workthread
Inherits Thread
	#tag Event
		Sub Run()
		  Dim c As CatSearchMBS
		  Dim nn As Integer
		  Dim f As folderItem
		  Dim k As Integer
		  Dim list As listbox
		  Dim v As folderItem
		  
		  mainwindow.runButton.enabled=False
		  c=New CatSearchMBS
		  
		  list=mainwindow.list
		  list.DeleteAllRows
		  
		  v=CurrentUserFolderMBS(0) // choose a folder in the users folder
		  
		  if c.search(v,true) then
		    c.name=mainwindow.iText.text
		    c.partialName=true
		    
		    nn=c.searchNext
		    while nn>=0
		      k=k+1
		      if k=1000 then // something wrong?
		        msgBox "Takes a long time!? Better we stop."
		        return
		      end if
		      f=c.result
		      if f<>Nil and nn=0 then // Something found
		        list.addrow f.name
		        list.Cell(list.lastIndex,1)=format((f.length+f.resourceForkLength)/1024,"0")+" KB"
		        #if RBVersion < 2019
		          list.Cell(list.lastIndex,2)=readable(f.mactype)
		        #EndIf
		        list.Cell(list.lastIndex,3)=readable(f.maccreator)
		        list.Cell(list.lastIndex,4)=volumename(f)
		      end if
		      
		      nn=c.searchNext
		    wend
		  end if
		  mainwindow.runButton.enabled=true
		  
		  if c.usedCatSearchForLastSearch then
		    msgBox "Fast Catalog Search was used."
		  else
		    msgBox "Slower Index Search was used."
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function readable(s as string) As string
		  // files don't need to have a creator or filetype
		  
		  if s=chr(0)+chr(0)+chr(0)+chr(0) then
		    return "?"
		  else
		    return s
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function volumename(file as folderItem) As string
		  dim g as folderItem
		  dim f as folderItem
		  
		  f=file
		  if f<>nil then
		    g=f.parent
		    while g<>nil
		      f=g
		      g=f.parent
		    wend
		    return f.name
		  end if
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
