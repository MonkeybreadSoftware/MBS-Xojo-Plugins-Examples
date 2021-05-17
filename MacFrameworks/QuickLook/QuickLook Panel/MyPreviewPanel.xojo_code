#tag Class
Protected Class MyPreviewPanel
Inherits QLPreviewPanelMBS
	#tag Event
		Function handleEvent(e as NSEventMBS) As boolean
		  Return false
		  
		End Function
	#tag EndEvent

	#tag Event
		Function numberOfPreviewItems() As integer
		  Return UBound(files)+1
		  
		End Function
	#tag EndEvent

	#tag Event
		Function previewItemAtIndex(index as integer) As folderitem
		  Return files(index)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function sourceFrameOnScreenForPreviewItem(file as folderitem) As NSRectMBS
		  if IsLogo then
		    dim r as NSRectMBS
		    
		    dim w as window1 = window1
		    dim c as Canvas = w.canvas1
		    dim s as screen = screen(0)
		    
		    r=NSMakeRectMBS(w.Left+c.Left, s.height-(w.top+c.top+c.Height), c.Width, c.Height)
		    
		    Return r
		  end if
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadList(f as FolderItem)
		  dim r as integer
		  dim c as integer = f.Count
		  
		  for i as integer=1 to c
		    dim g as FolderItem = f.trueitem(i)
		    if g.Visible and not g.Directory then
		      files.Append g
		    end if
		  next
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		files(-1) As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		IsLogo As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
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
			Name="IsLogo"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="pic"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
