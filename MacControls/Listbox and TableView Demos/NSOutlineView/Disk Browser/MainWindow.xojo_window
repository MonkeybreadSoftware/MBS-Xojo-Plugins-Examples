#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   411
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "NSTableViewMBS"
   Visible         =   True
   Width           =   577
   Begin HierarchicalMacListBox folderBrowser
      AcceptTabs      =   False
      allowsColumnReordering=   True
      allowsColumnResizing=   True
      allowsColumnSelection=   False
      allowsEmptySelection=   True
      allowsMultipleSelection=   True
      AutoDeactivate  =   True
      autohidesScrollers=   True
      Enabled         =   True
      hasHorizontalScroller=   True
      hasVerticalScroller=   True
      Height          =   359
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   52
      Transparent     =   True
      Visible         =   True
      Width           =   577
   End
   Begin CheckBox showHiddenChk
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show Hidden"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   4
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   113
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   49
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   137
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Click on a name to rename it. Double click right of the name to open it (via FolderItem.Launch). Right-click works, too. Dragging items moves them. Changes in open folders are automatically detected."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   429
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Function determineDropTarget(item as NSOutlineViewItemMBS, index as Integer) As DiskItem
		  // We retarget a drop to their enclosing folder
		  dim targetItem as DiskItem = nodeForItem (item)
		  if index >= 0 then
		    ' It's an insert - we already have the parent in 'node'
		  elseif not targetItem.IsFolder then
		    targetItem = targetItem.Parent
		  end if
		  return targetItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function fetchFilesFromPboard(pb as NSPasteboardMBS) As FolderItem()
		  dim res() as FolderItem
		  
		  dim items() as NSPasteboardItemMBS = pb.pasteboardItems
		  
		  for each item as NSPasteboardItemMBS in items
		    dim f as FolderItem
		    dim s as String = item.stringForType(NSPasteboardMBS.NSFilenamesPboardType).DefineEncoding(Encodings.UTF8)
		    if s <> "" then
		      f = PathToFolderItemMBS (s)
		    end
		    if f = nil then
		      s = item.stringForType("public.file-url").DefineEncoding(Encodings.UTF8)
		      f = GetTrueFolderItem (s, FolderItem.PathTypeURL)
		    end if
		    if f <> nil then
		      res.Append f
		    end if
		  next
		  
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function moveFiles(sourceFiles() as FolderItem, destFolder as FolderItem) As Boolean
		  // We're not using Xojo's MoveFileTo because (a) that would also move files across volumes, which is unexpected,
		  // it may not copy all metadata, and it provides no Undo.
		  // Instead, we ask the Finder via AppleScript, which takes care of all this, including error reporting.
		  
		  #if true
		    // Using the Finder
		    
		    dim script as new NSAppleScriptMBS (moveScriptCode)
		    dim error as Dictionary
		    if not script.Compile (error) then
		      break
		      return false
		    end
		    
		    dim srcList as NSAppleEventDescriptorMBS = NSAppleEventDescriptorMBS.listDescriptor()
		    for each f as FolderItem in sourceFiles
		      srcList.insertDescriptor NSAppleEventDescriptorMBS.descriptorWithFileURL(f), 0
		    next
		    
		    dim args() As NSAppleEventDescriptorMBS
		    args.Append srcList
		    args.Append NSAppleEventDescriptorMBS.descriptorWithFileURL(destFolder)
		    
		    dim p as NSAppleEventDescriptorMBS = script.executeSubroutine ("moveFiles", args, error)
		    #pragma unused p
		    if error <> nil then
		      break ' check the "error" dictionary
		      beep
		    end
		    
		    return true
		    
		  #else
		    // Lame version that moves files across volumes, even, unless we check that first and use CopyFileTo instead
		    
		    dim hadError as Boolean
		    for each f as FolderItem in draggedFiles
		      f.MoveFileTo targetFolder
		      if f.LastErrorCode <> 0 then
		        hadError = true
		      end if
		    next
		    if hadError then
		      beep
		    end if
		    
		    return true
		    
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub moveFilesInTimer(t as Timer)
		  t.Mode = Timer.ModeOff
		  mDropFinishTimer = nil
		  
		  if mDropSourceFiles.Ubound >= 0 and mDropDestFolder <> nil then
		    call moveFiles (mDropSourceFiles, mDropDestFolder)
		    dim destPath as String = mDropDestFolder.UnixpathMBS
		    dim item as DiskItem = mRootItem.FindByPath (destPath)
		    if item <> nil then
		      item.UpdateChildrenFromDisk
		    end if
		  end if
		  
		  redim mDropSourceFiles(-1)
		  mDropDestFolder = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function nodeForItem(item as NSOutlineViewItemMBS) As DiskItem
		  dim node as DiskItem
		  if item = nil then
		    node = mRootItem
		  else
		    node = DiskItem(item)
		  end if
		  return node
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub openSelectedItems(menuItem as MyMenuItem)
		  dim selected as NSIndexSetMBS = selectedItems (menuItem, folderBrowser)
		  
		  for each row as Integer in selected.Values
		    dim item as NSOutlineViewItemMBS = folderBrowser.View.itemAtRow (row)
		    if item = nil then
		      break ' huh?
		    else
		      dim node as DiskItem = nodeForItem (item)
		      dim f as FolderItem = node.FolderItem
		      if f <> nil then
		        f.Launch (false)
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub refreshSelectedItems(menuItem as MyMenuItem)
		  dim selected as NSIndexSetMBS = selectedItems (menuItem, folderBrowser)
		  
		  for each row as Integer in selected.Values
		    dim item as NSOutlineViewItemMBS = folderBrowser.View.itemAtRow (row)
		    if item = nil then
		      break ' huh?
		    else
		      dim node as DiskItem = nodeForItem (item)
		      node.UpdateChildrenFromDisk
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub renameClickedItem(menuItem as MyMenuItem)
		  dim row as Integer = folderBrowser.View.clickedRow
		  folderBrowser.View.edit (0, row, true) 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function selectedItems(menuItem as NSMenuItemMBS, lb as NSOutlineControlMBS) As NSIndexSetMBS
		  dim selected as NSIndexSetMBS = lb.View.selectedRowIndexes
		  
		  // We also need to check the clicked row if it's from a contextual menu
		  if menuItem <> nil then
		    dim row as Integer = lb.View.clickedRow
		    if selected.containsIndex (row) then
		      // The right-click happened inside the selection -> we use the entire selection
		    else
		      // The right-click happened outside the selection -> we use only the clicked row
		      selected = NSIndexSetMBS.indexSetWithIndex (row)
		    end if
		  end if
		  
		  return selected
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Written 8 Mar 2017 by Thomas Tempelmann, tempelmann@gmail.com
		Consider this sample code - you made use it as you like.
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			We cache the dragged files here during a drop operation
		#tag EndNote
		Private mDraggedFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDropDestFolder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDropFinishTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDropSourceFiles() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastDragSequence As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenu As NSMenuMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenuItems() As NSMenuItemMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRootItem As DiskItem
	#tag EndProperty


	#tag Constant, Name = moveScriptCode, Type = String, Dynamic = False, Default = \"on moveFiles (src\x2C dest)\r  tell application \"Finder\"\r    with timeout of 5 seconds\r      move src to dest\r    end timeout\r  end tell\rend moveFiles", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events folderBrowser
	#tag Event
		Sub Open()
		  // Add two columns to the listbox
		  dim col as new NSTableColumnMBS("name")
		  col.width = 200
		  col.minWidth = 100
		  col.Title = "Name"
		  col.Editable = true
		  me.AddColumn col
		  col = new NSTableColumnMBS("size")
		  col.width = 120
		  col.minWidth = 60
		  col.Title = "Size"
		  col.Editable = false
		  me.AddColumn col
		  
		  // Set some options to make the list "prettier"
		  me.View.usesAlternatingRowBackgroundColors = true
		  me.View.gridStyleMask = NSTableViewMBS.NSTableViewSolidHorizontalGridLineMask+NSTableViewMBS.NSTableViewSolidVerticalGridLineMask
		  
		  // Specify the column that contains the "expand" icons. If we don't set this, we effectively get a flat list instead
		  dim cols() as NSTableColumnMBS = me.View.tableColumns()
		  me.View.outlineTableColumn = cols(0) ' use the first column
		  
		  // If we want to allow column resizing, this option should be set to avoid ugly visual effect while resizing
		  // (i.e. the vertical grid lines do not move nicely, then), or the gridlines should be not used.
		  me.View.autoresizesOutlineColumn = false
		  
		  // And if the window is resized, we want only the first column to resize
		  me.View.columnAutoresizingStyle = NSTableViewMBS.NSTableViewFirstColumnOnlyAutoresizingStyle
		  
		  // Set up our hierarchical data, which is a tree structure
		  mRootItem = new DiskItem (me.View)
		  // Let's add all currently available volumes
		  for i as Integer = 0 to VolumeCount-1
		    mRootItem.AddChild Volume(i)
		  next
		  me.Reload ' this forces the listbox to update (by calling Events such as childOfItem etc.)
		  
		  // Let's save and re-open the expanded folder on restart of this app (needs to happen after loading the data, so that the list root has been loaded already)
		  me.View.autosaveName = "Open Folders"
		  me.View.autosaveExpandedItems = true
		  
		  // And we allow dragging of out items as well
		  me.View.registerForDraggedTypes Array (NSPasteboardMBS.NSFilenamesPboardType, "public.file-url")
		  
		  // Set up a contextual menu
		  mMenuItems.Append new MyMenuItem ("Open", 1, AddressOf openSelectedItems)
		  mMenuItems.Append new MyMenuItem ("Rename", 2, AddressOf renameClickedItem)
		  mMenuItems.Append new MyMenuItem ("Refresh", 3, AddressOf refreshSelectedItems)
		  mMenu = new NSMenuMBS
		  for each item as NSMenuItemMBS in mMenuItems
		    mMenu.addItem item
		  next
		  me.View.menu = mMenu
		End Sub
	#tag EndEvent
	#tag Event
		Function numberOfChildrenOfItem(item as NSOutlineViewItemMBS) As Integer
		  // Returns the number of child objects for a row. If item is nil, it means the root of the hierarchy
		  
		  dim node as DiskItem = nodeForItem (item)
		  if node <> nil then
		    return node.ChildCount
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function objectValue(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As Variant
		  // Returns the text for a cell
		  
		  dim node as DiskItem = nodeForItem (item)
		  
		  if node = nil or node.FolderItem = nil then return ""
		  
		  if tableColumn.identifier = "Name" then
		    return node.FolderItem.Name
		  elseif node.IsFolder then
		    return "-"
		  else
		    return Format (node.FolderItem.Length, ",###")
		  end
		End Function
	#tag EndEvent
	#tag Event
		Function isItemExpandable(item as NSOutlineViewItemMBS) As Boolean
		  // Returns whether the row is expandable (then showing the "triangle" expand control)
		  
		  dim node as DiskItem = nodeForItem (item)
		  if node <> nil then
		    return node.IsFolder
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function childOfItem(index as Integer, item as NSOutlineViewItemMBS) As NSOutlineViewItemMBS
		  // Returns the child object for a row. If item is nil, it means the root of the hierarchy
		  
		  dim node as DiskItem = nodeForItem (item)
		  if node <> nil then
		    return node.ChildAtIndex(index)
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub ItemDidCollapse(notification as NSNotificationMBS, item as NSOutlineViewItemMBS)
		  // At this point, we may dispose of the children, in order to release the memory used for them.
		  // However, this will also make the OutlineView forget the "expanded" state of inner folders.
		  
		  'dim node as DiskItem = nodeForItem (item)
		  'node.ClearChildren
		End Sub
	#tag EndEvent
	#tag Event
		Function writeItems(items() as NSOutlineViewItemMBS, pasteboard as NSPasteboardMBS) As Boolean
		  // This is called when rows get dragged.
		  
		  call pasteboard.clearContents
		  
		  dim pbItems() as NSPasteboardItemMBS
		  
		  // Let's drag the selected file(s)
		  for each item as NSOutlineViewItemMBS in items
		    dim pbItem as new NSPasteboardItemMBS
		    dim url as String = nodeForItem(item).FolderItem.URLPath
		    dim name as String = nodeForItem(item).FolderItem.Name
		    pbItem.stringForType("public.file-url") = url.ConvertEncoding(Encodings.UTF8)
		    pbItem.stringForType(NSPasteboardMBS.NSPasteboardTypeString) = name.ConvertEncoding(Encodings.UTF8)
		    pbItems.Append pbItem
		  next
		  
		  call pasteboard.SetPasteboardItems pbItems
		  
		  me.View.setDraggingSourceOperationMask (NSDraggingInfoMBS.NSDragOperationEvery, false)
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function persistentObjectForItem(item as NSOutlineViewItemMBS) As Variant
		  // This is called to identify a folder, for preserving its expand state in the preferences.
		  // It goes along with itemForPersistentObject(), which is the inverse operation.
		  
		  dim node as DiskItem = nodeForItem (item)
		  return node.Path
		End Function
	#tag EndEvent
	#tag Event
		Sub setObjectValue(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS, value as Variant)
		  // This is called when the user has edited a cell and is leaving it
		  
		  dim node as DiskItem = nodeForItem (item)
		  dim f as FolderItem = node.FolderItem
		  if f <> nil then
		    f.Name = value
		    if f.LastErrorCode <> 0 then
		      beep ' rename failed
		    end if
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function shouldEdit(tableColumn as NSTableColumnMBS, item as NSOutlineViewItemMBS) As Boolean
		  // This is called when the user click into an editable cell - we can still deny that here for individual cells
		  
		  dim node as DiskItem = nodeForItem (item)
		  dim f as FolderItem = node.FolderItem
		  if f <> nil and not f.Locked then
		    return true
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function itemForPersistentObject(persistentObject as Variant) As NSOutlineViewItemMBS
		  // This is called to identify an item, for restoring its expand state from the preferences.
		  // It goes along with persistentObjectForItem(), which is the inverse operation.
		  
		  dim node as DiskItem = mRootItem.FindByPath (persistentObject)
		  return node
		End Function
	#tag EndEvent
	#tag Event
		Sub DoubleClick()
		  // Let's open the selected items
		  
		  self.openSelectedItems nil
		End Sub
	#tag EndEvent
	#tag Event
		Function acceptDrop(info as NSDraggingInfoMBS, item as NSOutlineViewItemMBS, index as Integer) As Boolean
		  // This is called when data got dropped onto a specific row. We return whether we want to accept the data.
		  // If index is -1, it means a drop onto the item, otherwise it means a drop to insert at the child index of the given parent item.
		  
		  redim mDraggedFiles(-1)
		  
		  dim draggedFiles() as FolderItem = fetchFilesFromPboard (info.draggingPasteboard)
		  
		  dim targetItem as DiskItem = determineDropTarget (item, index)
		  dim targetFolder as FolderItem = targetItem.FolderItem
		  if targetFolder = nil then
		    // Can't drag into the root, which is a list of volumes
		    return false
		  end if
		  
		  // Now we can move the selected files to the target folder
		  // However, we need to delay that operation, because the AppleScript we'll use won't run as long as this drag isn't finished,
		  // which would be leading to a timeout. Instead, the move will be handled by the draggingExited event.
		  mDropSourceFiles = draggedFiles
		  mDropDestFolder = targetFolder
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub draggingExited(info as NSDraggingInfoMBS)
		  redim mDraggedFiles(-1)
		End Sub
	#tag EndEvent
	#tag Event
		Function validateDrop(info as NSDraggingInfoMBS, proposedItem as NSOutlineViewItemMBS, proposedChildIndex as Integer) As Integer
		  // This is called when data gets dragged over a specific row. We return whether that would get accepted as a drop.
		  // We may also retarget a different row, e.g. we'd target the enclosing folder, by calling .
		  // If index is -1, it means a drop onto the item, otherwise it means a drop to insert at the child index of the given parent item.
		  
		  // Determine the dragged items (files, folders)
		  if mDraggedFiles.Ubound < 0 or info.draggingSequenceNumber <> mLastDragSequence then
		    // It's a new drag operation - let's cache the dragged files (for performance reasons)
		    mLastDragSequence = info.draggingSequenceNumber
		    mDraggedFiles = fetchFilesFromPboard (info.draggingPasteboard)
		  end if
		  
		  // We retarget to the enclosing folder
		  dim targetItem as DiskItem = determineDropTarget (proposedItem, proposedChildIndex)
		  
		  dim targetFolder as FolderItem = targetItem.FolderItem
		  if targetFolder = nil then
		    // Can't drag into the root, which is a list of volumes
		    me.View.setDropItem nil, me.View.NSOutlineViewDropOnItemIndex
		    return NSDraggingInfoMBS.NSDragOperationNone
		  end if
		  
		  // We must not allow dragging a folder into one of its own sub folders, as such a move is not permited by the file system
		  dim targetPath as String = targetFolder.UnixpathMBS
		  for each f as FolderItem in mDraggedFiles
		    if f.Directory then
		      dim sourcePath as String = f.UnixpathMBS
		      if StrComp (sourcePath, targetPath.Left(sourcePath.Len), 0) = 0 then
		        // The dragged folder is a parent of the target folder
		        me.View.setDropItem nil, me.View.NSOutlineViewDropOnItemIndex
		        return NSDraggingInfoMBS.NSDragOperationNone // we disallow this drag to the current target
		      end
		    end if
		  next
		  
		  // Set the designated drop folder
		  me.View.setDropItem targetItem, me.View.NSOutlineViewDropOnItemIndex
		  
		  return NSDraggingInfoMBS.NSDragOperationMove // We could also support Copy, Link (generating an Alias) etc., by returning those options as well, but would have to handle them in acceptDrop then.
		End Function
	#tag EndEvent
	#tag Event
		Sub concludeDragOperation(info as NSDraggingInfoMBS)
		  redim mDraggedFiles(-1)
		  if mDropSourceFiles.Ubound >= 0 and mDropDestFolder <> nil then
		    // We have to use a Timer or we'll get a Timeout if the drag came from the Finder
		    mDropFinishTimer = new Timer
		    AddHandler mDropFinishTimer.Action, AddressOf moveFilesInTimer
		    mDropFinishTimer.Mode = Timer.ModeSingle
		  else
		    redim mDropSourceFiles(-1)
		    mDropDestFolder = nil
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub draggingEnded(info as NSDraggingInfoMBS)
		  redim mDraggedFiles(-1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events showHiddenChk
	#tag Event
		Sub Action()
		  mRootItem.ShowHidden = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
