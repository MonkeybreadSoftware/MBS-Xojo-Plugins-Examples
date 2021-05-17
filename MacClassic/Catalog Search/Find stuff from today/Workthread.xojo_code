#tag Class
Protected Class Workthread
Inherits Thread
	#tag Event
		Sub Run()
		  dim t as integer
		  
		  t=ticks
		  start
		  t=ticks-t
		  
		  MsgBox format(t/60,"0.0")+" seconds."
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub additem(f as folderItem)
		  dim list as listbox
		  dim d as date
		  
		  d=f.ModificationDate
		  
		  list=mainwindow.list
		  list.addrow f.DisplayName
		  list.Cell(list.lastIndex,1)=d.LongDate+" "+d.LongTime
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub searchOnVolume(v as folderItem)
		  dim c as CatSearchMBS
		  dim f as folderItem
		  dim error as boolean // We ignore some errors in this example!
		  dim k,nn as integer
		  dim d as date
		  dim start,ende,d1,d2 as Double
		  
		  d=new date
		  
		  d.Minute=0
		  d.Second=0
		  d.Hour=0
		  
		  d1=2147483647.0 // &H7FFFFFFF
		  d2=4294967296.0 // pow(2,32)
		  
		  start=d.TotalSeconds
		  if start>d1 then
		    start=start-d2
		  end if
		  
		  d.day=d.day+1
		  ende=d.TotalSeconds
		  if ende>d1 then
		    ende=ende-d2
		  end if
		  
		  if v<>nil then
		    c=new CatSearchMBS
		    'c.UseIndexedSearch=true
		    if c.search(v,true) then
		      c.ModificationDateStart=start
		      c.ModificationDateEnd=ende
		      
		      nn=c.searchNext
		      while nn>=0
		        k=k+1
		        if k=10000 then // something wrong?
		          msgBox "Takes a long time!? Better we stop."
		          return
		        end if
		        f=c.result
		        if f<>nil and nn=0 then
		          additem f
		        end if
		        nn=c.searchNext
		      wend
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub start()
		  dim n,i as integer
		  dim v as folderItem
		  
		  n=volumecount-1
		  
		  mainwindow.bar.maximum=n
		  
		  for i=0 to n
		    mainwindow.bar.value=i
		    v=volume(i)
		    mainwindow.volumename.text=v.name
		    searchonvolume v
		  next
		  mainwindow.bar.value=n
		  
		  mainwindow.bar.visible=false
		  mainwindow.volumename.text="ready"
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
