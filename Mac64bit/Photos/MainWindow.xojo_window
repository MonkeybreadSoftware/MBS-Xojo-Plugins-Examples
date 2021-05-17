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
   Height          =   442
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   413695999
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "PhotoLibrary"
   Visible         =   True
   Width           =   908
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   32
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   444
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Output
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   443
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   298
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   610
   End
   Begin PHLivePhotoControlMBS LivePhotoControl
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   298
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   455
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // put the LivePhotoControl where the Canvas is without making one parent of other
		  
		  LivePhotoControl.Visible = False
		  LivePhotoControl.top = Output.top
		  LivePhotoControl.Left = Output.Left
		  LivePhotoControl.Width = Output.Width
		  LivePhotoControl.Height = Output.Height
		  
		  
		  
		  ImageManager = New PHImageManagerMBS
		  
		  AddCollectionList PHCollectionListMBS.TypeFolder, PHCollectionListMBS.SubtypeRegularFolder, "Folders"
		  AddCollectionList PHCollectionListMBS.TypeSmartFolder, PHCollectionListMBS.SubtypeSmartFolderEvents, "Events"
		  AddCollectionList PHCollectionListMBS.TypeSmartFolder, PHCollectionListMBS.SubtypeSmartFolderFaces, "Faces"
		  AddCollectionList PHCollectionListMBS.TypeMomentList, PHCollectionListMBS.SubtypeAny, "Moments"
		  
		  AddAssetCollections PHAssetCollectionMBS.TypeAlbum, PHAssetCollectionMBS.SubtypeAny, "Albums"
		  AddAssetCollections PHAssetCollectionMBS.TypeSmartAlbum, PHAssetCollectionMBS.SubtypeAny, "Smart Albums"
		  AddAssetCollections PHAssetCollectionMBS.TypeMoment, PHAssetCollectionMBS.SubtypeAny, "Moments"
		  
		  // look for those holding live photos, so we can show a few
		  AddAssetCollections PHAssetCollectionMBS.TypeSmartAlbum, PHAssetCollectionMBS.SubtypeSmartAlbumLivePhotos, "Live Photos"
		  
		  Dim Folders As PHFetchResultMBS = PHCollectionListMBS.fetchTopLevelUserCollections
		  If folders <> Nil Then
		    list.AddFolderWithTag "Collections", folders
		  End If
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddAssetCollections(type as integer, subtype as integer, label as string)
		  Dim Folders As PHFetchResultMBS = PHAssetCollectionMBS.fetchAssetCollectionsWithType(type, subtype)
		  
		  If folders <> Nil And folders.count > 0 Then
		    list.AddFolderWithTag label, folders
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCollectionList(type as integer, subtype as integer, label as string)
		  Dim Folders As PHFetchResultMBS = PHCollectionListMBS.fetchCollectionListsWithType(type, subtype)
		  
		  If folders <> Nil And folders.count > 0 Then
		    list.AddFolderWithTag label, folders
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFetchResult(folders As PHFetchResultMBS)
		  Dim List As listbox = Self.List
		  
		  Dim values() As Variant = folders.allObjects
		  
		  For Each value As Variant In values
		    
		    If value IsA PHCollectionListMBS Then
		      Dim p As PHCollectionListMBS = value
		      Dim t As String = p.localizedTitle
		      If t.Len = 0 Then
		        t = p.localIdentifier
		      End If
		      
		      list.AddFolderWithTag t, p
		    Elseif value IsA PHAssetCollectionMBS Then
		      Dim p As PHAssetCollectionMBS = value
		      Dim t As String = p.localizedTitle
		      If t.Len = 0 Then
		        t = p.localIdentifier
		      End If
		      
		      list.AddFolderWithTag t, p
		      
		    Elseif value IsA PHCollectionMBS Then
		      Dim p As PHCollectionMBS = value
		      Dim t As String = p.localizedTitle
		      If t.Len = 0 Then
		        t = p.localIdentifier
		      End If
		      
		      list.AddFolderWithTag t, p
		      
		    Elseif value IsA PHAssetMBS Then
		      Dim p As PHAssetMBS = value
		      
		      Dim t As String = p.localIdentifier
		      
		      list.AddRowWithTag t, p
		      
		    Else
		      Break
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadAsset(p as PHAssetMBS)
		  
		  if p = CurrentAsset then return // ignore
		  
		  // don't need old one
		  If CurrentRequestID <> 0 Then
		    ImageManager.cancelImageRequest CurrentRequestID
		    CurrentRequestID = 0
		  End If
		  
		  title = "Loading..."
		  CurrentAsset = p
		  
		  Dim contentMode As Integer = ImageManager.ContentModeAspectFit
		  Dim targetSize As New CGSizeMBS(output.Width * 2, Output.Height * 2)
		  
		  If PHLivePhotoRequestOptionsMBS.available And BitwiseAnd(p.mediaSubtypes, p.MediaSubtypePhotoLive) <> 0 Then
		    // live photo
		    
		    Dim Handler As PHImageManagerMBS.RequestLivePhotoForAssetCompletedMBS = AddressOf requestLivePhotoForAssetCompleted
		    Dim options As New PHLivePhotoRequestOptionsMBS
		    // due to download, the handler is called twice, frist small, second large picture
		    options.NetworkAccessAllowed = True
		    
		    CurrentRequestID = ImageManager.RequestLivePhotoForAsset(p, targetSize, ContentMode, options, Handler, Nil)
		    
		  Else
		    // normal photo
		    
		    Dim Handler As PHImageManagerMBS.RequestImageForAssetCompletedMBS = AddressOf requestImageForAssetCompleted
		    Dim options As New PHImageRequestOptionsMBS
		    // due to download, the handler is called twice, frist small, second large picture
		    options.Synchronous = False
		    options.NetworkAccessAllowed = True
		    
		    CurrentRequestID = ImageManager.RequestImageForAsset(p, targetSize, ContentMode, options, Handler, Nil)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LoadAssetPicture(p as PHAssetMBS) As Picture
		  
		  Dim contentMode As Integer = ImageManager.ContentModeAspectFit
		  Dim options As New PHImageRequestOptionsMBS
		  Dim targetSize As New CGSizeMBS(128,32)
		  
		  // due to download, the handler is called twice, frist small, second large picture
		  options.Synchronous = true
		  options.NetworkAccessAllowed = True
		  options.DeliveryMode = options.DeliveryModeFastFormat
		  
		  Dim info As Dictionary
		  Dim image As NSImageMBS = ImageManager.RequestImageForAssetSync(p, targetSize, ContentMode, options, info)
		  
		  If image <> Nil Then
		    Return image.CopyPicture
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub requestImageForAssetCompleted(asset as PHAssetMBS, options as PHImageRequestOptionsMBS, result as NSImageMBS, info as Dictionary, tag as Variant)
		  System.DebugLog CurrentMethodName+ " "+asset.localIdentifier
		  
		  Dim error As NSErrorMBS = info.Lookup(PHImageManagerMBS.PHImageErrorKey, Nil)
		  Dim IsDegrated As Boolean = info.Lookup(PHImageManagerMBS.PHImageResultIsDegradedKey, False)
		  Dim isCanceled As Boolean = info.Lookup(PHImageManagerMBS.PHImageCancelledKey, False)
		  
		  If isCanceled Then 
		    // exit on cancel
		    Return
		  Elseif error <> Nil Then
		    MsgBox error.LocalizedDescription
		    CurrentRequestID = 0
		    Return
		  Elseif IsDegrated Then
		    Title = "Loaded preview."
		  Else
		    Title = "Loaded full picture"
		  End If
		  
		  If result <> Nil Then
		    System.DebugLog "size: "+Str(result.width)+"x"+Str(result.height)
		    
		    pic = result.CopyPicture
		    output.Invalidate
		    output.Visible = True
		    LivePhotoControl.Visible = False
		    
		  End If
		  
		  CurrentRequestID = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub requestLivePhotoForAssetCompleted(asset as PHAssetMBS, options as PHImageRequestOptionsMBS, livePhoto as PHLivePhotoMBS, info as Dictionary, tag as Variant)
		  System.DebugLog CurrentMethodName+ " "+asset.localIdentifier
		  
		  Dim error As NSErrorMBS = info.Lookup(PHImageManagerMBS.PHImageErrorKey, Nil)
		  Dim IsDegrated As Boolean = info.Lookup(PHImageManagerMBS.PHImageResultIsDegradedKey, False)
		  Dim isCanceled As Boolean = info.Lookup(PHImageManagerMBS.PHImageCancelledKey, False)
		  
		  If isCanceled Then 
		    // exit on cancel
		    Return
		  Elseif error <> Nil Then
		    MsgBox error.LocalizedDescription
		    CurrentRequestID = 0
		    Return
		  Elseif IsDegrated Then
		    Title = "Loaded preview."
		  Else
		    Title = "Loaded full picture"
		  End If
		  
		  If livePhoto <> Nil Then
		    
		    pic = Nil
		    output.Visible = False
		    LivePhotoControl.LivePhoto = livePhoto
		    LivePhotoControl.Visible = True
		    LivePhotoControl.startPlayback LivePhotoControl.PlaybackStyleFull
		    
		  End If
		  
		  CurrentRequestID = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentAsset As PHAssetMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentRequestID As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ImageManager As PHImageManagerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		preview As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Untitled As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim v As Variant = Me.RowTag(row)
		  
		  If v IsA PHFetchResultMBS Then
		    
		    Dim folders As PHFetchResultMBS = v
		    
		    AddFetchResult folders
		    
		    
		  Elseif v IsA PHCollectionListMBS Then
		    Dim c As PHCollectionListMBS = v
		    
		    Dim r As PHFetchResultMBS = PHCollectionMBS.fetchCollectionsInCollectionList(c)
		    
		    If r <> Nil Then
		      AddFetchResult r
		    End If
		    
		  Elseif v IsA PHAssetCollectionMBS Then
		    Dim c As PHAssetCollectionMBS = v
		    
		    Dim r As PHFetchResultMBS = PHAssetMBS.fetchAssetsInAssetCollection(c)
		    
		    If r <> Nil Then
		      AddFetchResult r
		    End If
		    
		  Else
		    Break
		  End If
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    Dim v As Variant = Me.RowTag(Me.ListIndex)
		    
		    If v IsA PHAssetMBS Then
		      Dim p As PHAssetMBS = v
		      
		      If CurrentAsset <> p Then
		        
		        LoadAsset p
		        
		      End If
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  Dim v As Variant = Me.RowTag(row)
		  If v IsA PHAssetMBS Then
		    Dim asset As PHAssetMBS = v
		    
		    // load picture as needed
		    If list.CellTag(List.LastIndex,0) = Nil Then
		      Dim pic As Picture = LoadAssetPicture(asset)
		      list.CellTag(List.LastIndex,0) = pic
		    end if
		  End If
		  
		  
		  Dim p As Picture = Me.CellTag(row, 0)
		  
		  If p <> Nil Then
		    
		    Dim faktor As Double = g.Height / p.Height
		    
		    // Calculate new size
		    Dim w As Integer = p.Width * faktor
		    Dim h As Integer = p.Height * faktor
		    
		    // draw picture in the new size
		    g.DrawPicture p, 0, 0, w, h, 0, 0, p.Width, p.Height
		    
		    
		    Return True
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Output
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic <> Nil Then
		    
		    Dim faktor As Double = Min( g.Height / Pic.Height, g.Width / Pic.Width)
		    
		    // Calculate new size
		    Dim w As Integer = Pic.Width * faktor
		    Dim h As Integer = Pic.Height * faktor
		    
		    Dim dx As Integer = (g.Width  - w)/2
		    Dim dy As Integer = (g.Height - h)/2
		    
		    // draw picture in the new size
		    g.DrawPicture Pic, dx, dy, w, h, 0, 0, Pic.Width, Pic.Height
		    
		  End If
		  
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
	#tag ViewProperty
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Untitled"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentRequestID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="preview"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
