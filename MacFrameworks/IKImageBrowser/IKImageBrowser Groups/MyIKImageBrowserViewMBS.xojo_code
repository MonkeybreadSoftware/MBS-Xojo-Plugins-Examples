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
		Function groupAtIndex(index as integer) As Dictionary
		  dim d as new Dictionary
		  
		  dim u as integer = UBound(items)
		  dim m as integer = u/2+1
		  
		  if index = 0 then
		    dim range as new NSRangeMBS(0, m)
		    d.Value(me.IKImageBrowserGroupTitleKey) = "First Group"
		    d.Value(me.IKImageBrowserGroupRangeKey) = range
		  elseif index = 1 then
		    dim range as new NSRangeMBS(m, u-m+1)
		    d.Value(me.IKImageBrowserGroupTitleKey) = "Second Group"
		    d.Value(me.IKImageBrowserGroupRangeKey) = range
		  end if
		  
		  d.Value(me.IKImageBrowserGroupBackgroundColorKey) = NSColorMBS.redColor
		  d.Value(me.IKImageBrowserGroupStyleKey) = me.IKGroupDisclosureStyle
		  
		  Return d
		End Function
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
		Function numberOfGroups() As integer
		  Return 2
		  
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
