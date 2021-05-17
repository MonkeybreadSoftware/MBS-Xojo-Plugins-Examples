#tag Class
Protected Class Workthread
Inherits Thread
	#tag Event
		Sub Run()
		  dim c as CatSearchMBS
		  dim nn,n,i as integer
		  dim f as folderItem
		  dim k as integer
		  dim list as listbox
		  dim v as folderItem
		  dim catalogchanged as Boolean
		  
		  catalogchanged=false
		  mainwindow.runButton.enabled=false
		  c=new CatSearchMBS
		  
		  list=mainwindow.list
		  list.DeleteAllRows
		  
		  n=volumecount-1
		  
		  for i=0 to n
		    v=volume(i)
		    if c.search(v,true) then
		      c.name=mainwindow.itext.text
		      c.partialName=true
		      
		      nn=c.searchNext
		      while nn>=0
		        if nn=2 then
		          catalogchanged=true
		        end if
		        k=k+1
		        if k=1000 then // something wrong?
		          msgBox "Takes a long time!? Better we stop."
		          return
		        end if
		        f=c.result
		        if f<>Nil and nn=0 then // Something found
		          list.addrow f.name
		          list.Cell(list.lastIndex,1)=format((f.length+f.resourceForkLength)/1024,"0")+" KB"
		          #If RBVersion < 2019
		            list.Cell(list.lastIndex,2)=readable(f.mactype)
		          #EndIf
		          list.Cell(list.lastIndex,3)=readable(f.maccreator)
		          list.Cell(list.lastIndex,4)=v.name
		        end if
		        
		        nn=c.searchNext
		      wend
		    end if
		  next
		  mainwindow.runButton.enabled=true
		  
		  mainwindow.info.text=str(list.ListCount)+" items found."
		  if catalogchanged then
		    MsgBox "The catalog of one of the volumes changed while searching. You may have duplicate items or missing ones."
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
