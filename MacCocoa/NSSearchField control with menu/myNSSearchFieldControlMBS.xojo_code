#tag Class
Protected Class myNSSearchFieldControlMBS
Inherits NSSearchFieldControlMBS
	#tag Method, Flags = &h0
		Sub createMenu()
		  n = me.View
		  
		  Redim items(-1)
		  
		  // Menu
		  Dim m As ModSearch.SearchFieldMenuItem
		  searchmenu=New NSMenuMBS("Search Menu")
		  
		  m=New ModSearch.SearchFieldMenuItem
		  m.CreateMenuItem("Begins with")
		  m.Enabled=True
		  if result = SearchResult.BeginsWith then
		    m.state = 1
		  else
		    m.state = 0
		  end if
		  m.tag=1
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  searchmenu.addItem m
		  
		  m=New ModSearch.SearchFieldMenuItem
		  m.CreateMenuItem("Contains")
		  m.Enabled=True
		  if result = SearchResult.Contains then
		    m.state = 1
		  else
		    m.state = 0
		  end if
		  m.tag=2
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  searchmenu.addItem m
		  
		  m=New ModSearch.SearchFieldMenuItem
		  m.CreateMenuItem("Ends with")
		  if result = SearchResult.EndsWith then
		    m.state = 1
		  else
		    m.state = 0
		  end if
		  m.Enabled=True
		  m.tag=3
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  searchmenu.addItem m
		  
		  m=New ModSearch.SearchFieldMenuItem
		  m.CreateSeparator
		  searchmenu.addItem m
		  
		  m=New ModSearch.SearchFieldMenuItem
		  m.CreateMenuItem("Cancel")
		  m.Enabled=True
		  m.tag=4
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  searchmenu.addItem m
		  
		  
		  
		  // ***** recent searches
		  dim ClearItem as new NSMenuItemMBS
		  ClearItem.CreateMenuItem("Clear")
		  ClearItem.tag = NSSearchFieldMBS.NSSearchFieldClearRecentsMenuItemTag
		  searchmenu.addItem ClearItem
		  
		  dim SepItem as new NSMenuItemMBS
		  SepItem.CreateSeparator
		  SepItem.tag = NSSearchFieldMBS.NSSearchFieldRecentsTitleMenuItemTag
		  searchmenu.addItem SepItem
		  
		  dim RecentSearchesItem as new NSMenuItemMBS
		  RecentSearchesItem.CreateMenuItem "Recent Searches"
		  RecentSearchesItem.tag = NSSearchFieldMBS.NSSearchFieldRecentsTitleMenuItemTag
		  searchmenu.addItem RecentSearchesItem
		  
		  dim RecentsItem as new NSMenuItemMBS
		  RecentsItem.CreateMenuItem "Recents"
		  RecentsItem.tag = NSSearchFieldMBS.NSSearchFieldRecentsMenuItemTag
		  searchmenu.addItem RecentsItem
		  
		  n.searchMenuTemplate = searchmenu
		  n.focusRingType = n.NSFocusRingTypeDefault
		  n.maximumRecents = 10
		  n.setRecentSearches array("Hello", "World")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DelegateForMenuAction(SelectedTag As Integer)
		  window1.log CurrentMethodName+" "+str(SelectedTag)
		  
		  dim index as integer = searchmenu.indexOfItemWithTag(SelectedTag)
		  if index >= 0 then
		    dim item as NSMenuItemMBS = searchmenu.Item(index)
		    
		    Select case SelectedTag
		    case 1 // Begins with
		      result=SearchResult.BeginsWith
		    case 3 // Ends with
		      result=SearchResult.EndsWith
		    case 2 // Contains
		      result=SearchResult.Contains
		    case 4 // cancel
		      ' TODO: handle cancel search
		    end Select
		    
		    // recreate searchbox's menu
		    createMenu
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		items() As ModSearch.SearchFieldMenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		n As NSSearchFieldMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		result As SearchResult
	#tag EndProperty

	#tag Property, Flags = &h0
		searchmenu As NSMenuMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="22"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="SearchResult"
			EditorType="Enum"
			#tag EnumValues
				"0 - BeginsWith"
				"1 - Contains"
				"2 - EndsWith"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
