#tag Class
Protected Class MyCarbonApplicationEventsMBS
Inherits CarbonApplicationEventsMBS
	#tag Event
		Sub VolumeMounted(VolumeRefNum as integer, VolumeRoot as FolderItem)
		  dim i,c as Integer
		  dim v as FolderItem
		  dim found as Boolean
		  
		  // search folderiten for VolumeRefNum
		  found=False
		  c=VolumeCount-1
		  for i=0 to c
		    v=Volume(i)
		    
		    if v.MacVRefNum=VolumeRefNum then
		      found=True
		    end if
		  next
		  
		  if found then
		    MainWindow.OpenVolume v
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
