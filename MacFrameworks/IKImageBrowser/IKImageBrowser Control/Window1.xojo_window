#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   412655657
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Test"
   Visible         =   True
   Width           =   600
   Begin Listbox list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   387
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   348
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   253
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin IKImageBrowserViewControlMBS IKImageBrowserViewControlMBS1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   387
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -1
      Transparent     =   True
      Visible         =   True
      Width           =   337
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function readfolder(folder as FolderItem) As FolderItem()
		  dim files() as FolderItem
		  
		  dim c as integer = folder.Count
		  for i as integer = 1 to c
		    dim item as FolderItem = folder.TrueItem(i)
		    
		    if item <> nil and item.Visible then
		      if item.Directory then
		        dim items() as FolderItem = readfolder(item)
		        for each it as FolderItem in items
		          files.Append it
		        next
		      else
		        files.Append item
		      end if
		    end if
		    
		  next
		  
		  Return files
		  
		End Function
	#tag EndMethod

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
		Imagebrowser As IKImageBrowserViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		items() As IKImageBrowserItemMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events IKImageBrowserViewControlMBS1
	#tag Event
		Sub Open()
		  self.Imagebrowser = me.View
		  
		  // horizontal scrolling
		  
		  'me.Scrollview.hasVerticalScroller = false
		  'me.Scrollview.hasHorizontalScroller = true
		  'Imagebrowser.contentResizingMask = Imagebrowser.NSViewWidthSizable
		  
		  // setup properties
		  Imagebrowser.allowsReordering = true
		  Imagebrowser.allowsMultipleSelection = true
		  Imagebrowser.allowsEmptySelection = true
		  Imagebrowser.animates = true
		  Imagebrowser.zoomValue = 0.43
		  Imagebrowser.autoresizesSubviews = true
		  Imagebrowser.cellsStyleMask = Imagebrowser.IKCellsStyleShadowed + Imagebrowser.IKCellsStyleTitled
		  Imagebrowser.isHidden = false
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child("test")
		  
		  if not folder.Exists then
		    MsgBox "please put folder named test on desktop with images."
		  end if
		  
		  dim files() as FolderItem = readfolder(folder)
		  
		  setfiles files
		  Imagebrowser.reloadData
		  
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
		  break
		End Sub
	#tag EndEvent
	#tag Event
		Sub selectionDidChange()
		  dim s as string
		  
		  dim indexset as NSIndexSetMBS = me.view.selectionIndexes
		  s = indexset.Operator_Convert
		  
		  s = s + " ("+str(indexset.count)+")"
		  
		  window1.list.AddRow "selection changed to "+s
		  
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
