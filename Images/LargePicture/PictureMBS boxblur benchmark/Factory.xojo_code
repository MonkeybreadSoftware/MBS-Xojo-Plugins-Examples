#tag Class
Protected Class Factory
Inherits PictureFactoryMBS
	#tag Event
		Function NewPictureMBS(Width as integer, Height as integer, ImageFormat as integer) As PictureMBS
		  window1.Title=str(Width)+" x "+str(Height)
		  
		  dim file as FolderItem
		  dim size as integer
		  
		  n=n+1
		  
		  // you may need to change file paths
		  
		  if TargetLinux then
		    file=GetFolderItem("/tmp"+str(n)+".test",folderitem.PathTypeShell)
		  elseif TargetWin32 then
		    file=SpecialFolder.desktop.Child("tmp"+str(n)+".test")
		  else
		    file=findvolume("Temp").child("tmp"+str(n)+".test")
		  end if
		  
		  // size of the window:
		  size=100*1024*1024
		  
		  dim p as new PictureMBS(Width, Height, ImageFormat, size, file)
		  
		  if p=nil then
		    beep
		  end if
		  
		  Return p
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function findvolume(name as string) As folderitem
		  dim i,c as integer
		  dim v as FolderItem
		  
		  c=VolumeCount-1
		  for i=0 to c
		    v=volume(i)
		    if v<>nil and v.Name=name then
		      Return v
		    end if
		  next
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		n As Integer
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
			Name="n"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
