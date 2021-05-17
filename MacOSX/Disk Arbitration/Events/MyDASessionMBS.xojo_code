#tag Class
Protected Class MyDASessionMBS
Inherits DASessionMBS
	#tag Event
		Sub Appeared(disk as DADiskMBS)
		  dim dic as Dictionary = disk.Description
		  dim name as string = getname(dic, disk)
		  
		  log "Disk appeared: "+name, dic
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DescriptionChanged(disk as DADiskMBS, keys() as string)
		  dim dic as Dictionary = disk.Description
		  dim name as string = getname(dic, disk)
		  
		  log "Disk description changed for "+name, dic
		  
		  Break
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Disappeared(disk as DADiskMBS)
		  dim dic as Dictionary = disk.Description
		  dim name as string = getname(dic, disk)
		  
		  log "Disk disappeared: "+name, dic
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Peek(disk as DADiskMBS)
		  dim dic as Dictionary = disk.Description
		  dim name as string = getname(dic, disk)
		  
		  log "Disk peek: "+name, dic
		  break
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function getname(dic as Dictionary, disk as DADiskMBS) As string
		  
		  if dic.HasKey(DADiskMBS.kDADiskDescriptionVolumeNameKey) then
		    Return dic.Value(DADiskMBS.kDADiskDescriptionVolumeNameKey)
		  end if
		  
		  if dic.HasKey(DADiskMBS.kDADiskDescriptionMediaNameKey) then
		    Return dic.Value(DADiskMBS.kDADiskDescriptionMediaNameKey)
		  end if
		  
		  if dic.HasKey(DADiskMBS.kDADiskDescriptionDevicePathKey) then
		    Return dic.Value(DADiskMBS.kDADiskDescriptionDevicePathKey)
		  end if
		  
		  if dic.HasKey(DADiskMBS.kDADiskDescriptionVolumeNameKey) then
		    Return dic.Value(DADiskMBS.kDADiskDescriptionVolumeNameKey)
		  end if
		  
		  if dic.HasKey(DADiskMBS.kDADiskDescriptionVolumePathKey) then
		    dim n as folderitem = dic.Value(DADiskMBS.kDADiskDescriptionVolumePathKey)
		    return n.Name
		  end if
		  
		  Return disk.BSDName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(Message as string, dic as Dictionary = nil)
		  dim d as new date
		  dim l as listbox = window1.List
		  l.AddRow d.ShortTime, message
		  l.ScrollPosition = l.LastIndex
		  l.RowTag(l.LastIndex) = dic
		  
		  
		  
		  
		End Sub
	#tag EndMethod


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
