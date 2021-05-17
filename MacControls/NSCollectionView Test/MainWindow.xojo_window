#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   517828607
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "NSCollectionView Test"
   Visible         =   True
   Width           =   600
   Begin NSCollectionViewControlMBS CollectionControl
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Visible         =   True
      Width           =   600
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // find some image files
		  folder = GetFolderItem("/System/Library/Desktop Pictures/", folderitem.PathTypeNative)
		  
		  If folder <> Nil Then
		    // use picture folder
		    Dim c As Integer = folder.Count
		    For i As Integer = 1 To c
		      Dim file As FolderItem = folder.Item(i)
		      
		      If file <> Nil Then
		        
		        If Right(file.name, 4) = ".jpg" Then
		          AddFile file
		        End If
		        
		      End If
		      
		    Next
		  end if
		  
		  If items.Ubound = -1 Then
		    // no pictures?
		    Break
		    
		    
		    If DebugBuild Then
		      // for debugging you can use dummy items
		      For i As Integer = 1 To 100
		        Dim c As New CollectionViewItem
		        
		        items.Append c
		        
		      Next
		    End If
		  End If
		  
		  
		  
		  
		  Title = str(items.Ubound+1)+" files"
		  collectionView.reloadData
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddFile(file as FolderItem)
		  Dim c As New CollectionViewItem
		  
		  c.imageFile = file
		  
		  items.Append c
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindCollectionViewItem(item as NSCollectionViewItemMBS) As CollectionViewItem
		  // find matching objects
		  
		  For Each it As CollectionViewItem In items
		    
		    If it is Nil Then
		      // igmore
		    Elseif it.ViewItem Is item Then
		      Return it
		    End If
		    
		  Next
		  
		  // not found
		  Return Nil
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		collectionView As NSCollectionViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		folder As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		items() As CollectionViewItem
	#tag EndProperty


#tag EndWindowCode

#tag Events CollectionControl
	#tag Event
		Sub Open()
		  Me.ScrollView.autohidesScrollers = True
		  
		  collectionView = Me.view
		  collectionView.selectable = True
		  collectionView.allowsMultipleSelection = True
		  collectionView.setBackgroundColors Array(NSColorMBS.lightGrayColor)
		  
		  Dim flowLayout As New NSCollectionViewFlowLayoutMBS
		  flowLayout.itemSize = New NSSizeMBS(300.0, 300.0)
		  flowLayout.sectionInset = New NSEdgeInsetsMBS(10.0, 20.0, 10.0, 20.0)
		  flowLayout.minimumInteritemSpacing = 20.0
		  flowLayout.minimumLineSpacing = 20.0
		  
		  collectionView.collectionViewLayout = flowLayout
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function numberOfItemsInSection(section as Integer) As Integer
		  // return number of items per section
		  // as we only show image list, we return number of images
		  
		  Return items.Ubound+1
		  
		End Function
	#tag EndEvent
	#tag Event
		Function numberOfSections() As Integer
		  // return how many sections. This example only has one
		  Return 1
		  
		End Function
	#tag EndEvent
	#tag Event
		Function itemForRepresentedObject(indexPath as NSIndexPathMBS) As NSCollectionViewItemMBS
		  // we need an item to show an image
		  System.DebugLog CurrentMethodName+ " "+ str(indexPath.item)
		  
		  // lookup the image item for the path. 
		  // Could use indexPath.section if you have multiple sections
		  Dim item As CollectionViewItem = items(indexPath.item)
		  
		  // make a new item. May recycle old items
		  Dim ViewItem As NSCollectionViewItemMBS = collectionView.makeItem(indexPath)
		  
		  
		  // load image if needed
		  item.load ViewItem
		  
		  
		  item.ImageContainer.NameField.Text = Str(indexPath.item)
		  
		  Return ViewItem
		  
		  
		  Exception n As NSExceptionMBS
		    System.DebugLog n.message
		    
		End Function
	#tag EndEvent
	#tag Event
		Sub didEndDisplayingItem(item as NSCollectionViewItemMBS, indexPath as NSIndexPathMBS)
		  // item left viewing area
		  
		  System.DebugLog CurrentMethodName+ " "+ str(item.Handle)
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ItemPrepareForReuse(item as NSCollectionViewItemMBS)
		  System.DebugLog CurrentMethodName+ " "+ str(item.Handle)
		  
		  // item will be reused, so remove it from our CollectionViewItem
		  
		  Dim it As CollectionViewItem = FindCollectionViewItem(item)
		  
		  If it <> Nil Then
		    
		    it.NSView.removeFromSuperview
		    it.ViewItem = Nil
		    
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didDeselectItems(indexPaths() as NSIndexPathMBS)
		  // items got deselected, so we make text non-bold
		  
		  System.DebugLog CurrentMethodName
		  
		  For Each indexPath As NSIndexPathMBS In indexPaths
		    Dim item As CollectionViewItem = items(indexPath.item)
		    item.ImageContainer.NameField.Bold = False
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub didSelectItems(indexPaths() as NSIndexPathMBS)
		  // items got selected, so we make text bold
		  
		  System.DebugLog CurrentMethodName
		  
		  For Each indexPath As NSIndexPathMBS In indexPaths
		    
		    Dim item As CollectionViewItem = items(indexPath.item)
		    item.ImageContainer.NameField.Bold = true
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub willDisplayItem(item as NSCollectionViewItemMBS, indexPath as NSIndexPathMBS)
		  // item will show soon. Prepare for drawing soon
		  
		  System.DebugLog CurrentMethodName + " "+ Str(item.Handle)
		  
		  
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
