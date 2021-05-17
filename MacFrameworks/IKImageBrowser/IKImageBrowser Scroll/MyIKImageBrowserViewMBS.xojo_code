#tag Class
Protected Class MyIKImageBrowserViewMBS
Inherits IKImageBrowserViewMBS
	#tag Event
		Sub cellWasDoubleClickedAtIndex(index as integer)
		  msgbox "double clicked on photo "+str(index)
		  msgbox window1.Imagebrowser.items(index).imageTitle
		End Sub
	#tag EndEvent

	#tag Event
		Function itemAtIndex(index as integer) As IKImageBrowserItemMBS
		  if items(index) = nil then
		    
		    // we auto generate here an ID for each new item we create
		    static counter as integer
		    counter = counter + 1
		    
		    dim uid as string = str(counter)
		    dim path as string = files(index).UnixpathMBS
		    dim version as integer = 1
		    dim title as string = files(index).DisplayName
		    items(index) = IKImageBrowserItemMBS.ItemWithPath(uid, path, version, title)
		  end if
		  
		  Return items(index)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function numberOfItems() As integer
		  Return UBound(files)+1
		End Function
	#tag EndEvent

	#tag Event
		Sub removeItemsAtIndexes(indexes as NSIndexSetMBS)
		  dim values() as integer = indexes.Values
		  for a as integer = values.Ubound downto 0
		    items.Remove(values(a))
		    files.Remove(values(a))
		  next a
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub setFiles(files() as FolderItem)
		  self.files = files
		  
		  redim items(-1)
		  redim items(UBound(files))
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		files() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		items() As IKImageBrowserItemMBS
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
	#tag EndViewBehavior
End Class
#tag EndClass
