#tag Class
Protected Class NSToolbarMain
Inherits CustomNSToolbarMBS
	#tag Event
		Function itemForItemIdentifier(identifier as string, willBeInsertedIntoToolbar as boolean) As NSToolbarItemMBS
		  Select case identifier
		  case "admin" // items with NSSegmentedControls must be recreated here.
		    // Workaround for a Cocoa bug. Only needed if allowsUserCustomization=True.
		    
		    dim BtAdmin as New NSToolbarAdminSegment
		    // toolbar item
		    dim BtAdminItem as New NSToolbarItemMBS("admin")
		    BtAdminItem.label="Administration"
		    BtAdminItem.paletteLabel="Administration"
		    BtAdminItem.view=BtAdmin
		    
		    myItems.Append BtAdminItem
		    myItems.Append BtAdmin
		    Return BtAdminItem
		    
		  case "display"
		    dim BtDisplay as New NSToolbarDisplaySegment
		    dim BtDisplayItem as New NSToolbarItemMBS("display")
		    BtDisplayItem.label="Display options"
		    BtDisplayItem.paletteLabel="Display options"
		    BtDisplayItem.view=BtDisplay
		    
		    myItems.Append BtDisplayItem
		    myItems.Append BtDisplay
		    Return BtDisplayItem
		    
		  case "options"
		    dim BtOption as New NSToolbarOptionPopup
		    // toolbar item
		    dim BtOptionItem as New NSToolbarItemMBS("options")
		    BtOptionItem.label="Options"
		    BtOptionItem.paletteLabel="Options"
		    BtOptionItem.view = BtOption
		    myItems.Append BtOptionItem
		    myItems.Append BtOption
		    Return BtOptionItem
		    
		  case "searchfield"
		    dim SearchField as New NSToolbarSearchField
		    // toolbar item
		    dim SearchFieldItem as New NSToolbarItemMBS("searchfield")
		    SearchFieldItem.label="Search title"
		    SearchFieldItem.paletteLabel="Search title"
		    SearchFieldItem.minSize=New NSSizeMBS( 140, MainToolbarNSSearchFieldHeight )
		    SearchFieldItem.maxSize=New NSSizeMBS( 300, MainToolbarNSSearchFieldHeight )
		    SearchFieldItem.view = SearchField
		    
		    myItems.Append SearchField
		    myItems.Append SearchFieldItem
		    Return SearchFieldItem
		    
		  case "editor"
		    dim BtEditor as New NSToolbarEditorSegment
		    dim BtEditorItem as New NSToolbarItemMBS("editor")
		    BtEditorItem.label="Editor"
		    BtEditorItem.paletteLabel="Editor"
		    BtEditorItem.view=BtEditor
		    
		    myItems.Append BtEditorItem
		    myItems.Append BtEditor
		    self.BtEditor = BtEditor
		    Return BtEditorItem
		    
		  case "flags"
		    dim BtFlags as New NSToolbarFlagPopupSegment
		    dim BtFlagsItem as New NSToolbarItemMBS("flags")
		    BtFlagsItem.label="Flags"
		    BtFlagsItem.paletteLabel="Flags"
		    BtFlagsItem.view=BtFlags
		    
		    myItems.Append BtFlagsItem
		    myItems.Append BtFlags
		    Return BtFlagsItem
		    
		  case "play"
		    dim BtPlay as New NSToolbarPlayButton
		    // toolbar item
		    dim BtPlayItem as New NSToolbarItemMBS("play")
		    BtPlayItem.label="Play"
		    BtPlayItem.paletteLabel="Play"
		    BtPlayItem.view = BtPlay
		    
		    myItems.Append BtPlayItem
		    myItems.Append BtPlay
		    Return BtPlayItem
		  end Select
		End Function
	#tag EndEvent

	#tag Event
		Function toolbarAllowedItemIdentifiers() As string()
		  Return AllowEdit
		End Function
	#tag EndEvent

	#tag Event
		Function toolbarDefaultItemIdentifiers() As string()
		  Return ItemIdentifiers
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BtEditorAddEnabled(Assigns value As Boolean)
		  // A example of method that can make buttons more accessibles.
		  // Use like this: Window1.MainToolbar.BtEditorAddEnabled=True
		  
		  BtEditor.isEnabledForSegment( 0 )=value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  Super.Constructor("my_application_mainToolbar")
		  Self.allowsUserCustomization = true
		  Self.displayMode = NSToolbarMBS.NSToolbarDisplayModeIconOnly
		  Self.sizeMode = NSToolbarMBS.NSToolbarSizeModeRegular
		  
		  //————————————————
		  // Segment button : administration
		  //————————————————
		  AllowEdit.Append "admin"
		  ItemIdentifiers.Append "admin"
		  
		  //———————
		  // Flexible space
		  //———————
		  ItemIdentifiers.Append NSToolbaritemMBS.NSToolbarFlexibleSpaceItemIdentifier
		  AllowEdit.Append NSToolbaritemMBS.NSToolbarFlexibleSpaceItemIdentifier
		  
		  //————————————————
		  // Segment button : display options
		  //————————————————
		  AllowEdit.Append "display"
		  ItemIdentifiers.Append "display"
		  
		  //——————————————
		  // Popup button : option popup
		  //——————————————
		  AllowEdit.Append "options"
		  ItemIdentifiers.Append "options"
		  
		  //——————
		  // SearchField
		  //——————
		  AllowEdit.Append "searchfield"
		  ItemIdentifiers.Append "searchfield"
		  
		  //———————
		  // Flexible space
		  //———————
		  ItemIdentifiers.Append NSToolbaritemMBS.NSToolbarFlexibleSpaceItemIdentifier
		  AllowEdit.Append NSToolbaritemMBS.NSToolbarFlexibleSpaceItemIdentifier
		  
		  //———————————————
		  // Segment button : Edit and Add
		  //———————————————
		  AllowEdit.Append "editor"
		  ItemIdentifiers.Append "editor"
		  
		  //———————————————
		  // Segment button : Flag popup
		  //———————————————
		  AllowEdit.Append "flags"
		  ItemIdentifiers.Append "flags"
		  
		  //——————————
		  // Single button : Play
		  //——————————
		  AllowEdit.Append "play"
		  ItemIdentifiers.Append "play"
		End Sub
	#tag EndMethod


	#tag Note, Name = Credits
		
		David Della Rocca <dellarocca.david@free.fr>
		
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected AllowEdit() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BtEditor As NSSegmentedControlMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ItemIdentifiers() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			This array stores all items and views we use to keep them alive
			
		#tag EndNote
		myItems() As Variant
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
