#tag Class
Protected Class MyIKImageBrowserViewMBS
Inherits IKImageBrowserViewMBS
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
		  break
		End Sub
	#tag EndEvent

	#tag Event
		Sub selectionDidChange()
		  dim s as string
		  
		  dim indexset as NSIndexSetMBS = me.selectionIndexes
		  s = indexset.Operator_Convert
		  
		  s = s + " ("+str(indexset.count)+")"
		  
		  window1.list.AddRow "selection changed to "+s
		  
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
