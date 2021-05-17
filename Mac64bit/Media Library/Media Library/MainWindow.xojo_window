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
   Height          =   800
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   302761983
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   0
   Resizeable      =   True
   Title           =   "Media Library"
   Visible         =   True
   Width           =   800
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   802
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
      LockRight       =   True
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
      Width           =   802
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer LoadSourcesTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  if not MLMediaLibraryMBS.Available then
		    MsgBox "Please run as 64-bit Mac app."
		    quit
		  else
		    
		    dim Options as new Dictionary
		    MediaLibrary = new MLMediaLibraryMBS(Options)
		    
		    // trigger loading
		    call MediaLibrary.mediaSources
		    
		    
		    
		    LoadSourcesTimer.Mode = timer.ModeMultiple
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddProperties(p as Dictionary)
		  
		  for each key as Variant in p.keys
		    dim vv as Variant = p.Value(key)
		    
		    if vv isa NSImageMBS then
		      list.AddRow key.StringValue, "Image"
		      List.RowTag(List.LastIndex) = vv
		    else
		      
		      try
		        List.AddRow key.StringValue, vv.StringValue
		        
		      catch r as runtimeException
		        // ignore?
		      end try
		    end if
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		MediaLibrary As MLMediaLibraryMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  
		  if v isa MLMediaSourceMBS then
		    
		    dim source as MLMediaSourceMBS = v
		    
		    dim group as MLMediaGroupMBS = source.rootMediaGroup
		    
		    if group <> nil then
		      List.AddFolder group.Name
		      List.RowTag(List.LastIndex) = group
		    end if
		    
		    AddProperties source.Properties
		    
		    Return
		  end if
		  
		  
		  if v isa MLMediaGroupMBS then
		    dim group as MLMediaGroupMBS = v
		    
		    dim childGroups() as MLMediaGroupMBS = group.childGroups
		    for each childgroup as MLMediaGroupMBS in childGroups
		      
		      List.AddFolder childgroup.Name
		      List.RowTag(List.LastIndex) = childgroup
		      
		      // trigger loading
		      call childgroup.childGroups
		      call childgroup.mediaObjects
		      
		    next
		    
		    dim mediaObjects() as MLMediaObjectMBS = group.mediaObjects
		    for each mediaObject as MLMediaObjectMBS in mediaObjects
		      
		      List.AddFolder mediaObject.Name
		      List.RowTag(List.LastIndex) = mediaObject
		      
		    next
		    
		    
		    AddProperties group.Properties
		    
		    return
		  end if
		  
		  if v isa MLMediaObjectMBS then
		    dim item as MLMediaObjectMBS = v
		    
		    List.AddRow "Name", item.Name
		    List.AddRow "ContentType", item.ContentType
		    List.AddRow "FileSize", str(item.FileSize, "0")
		    List.AddRow "MediaSourceIdentifier", item.MediaSourceIdentifier
		    List.AddRow "ModificationDate", item.ModificationDate.SQLDateTime
		    List.AddRow "OriginalURL", item.OriginalURL
		    List.AddRow "ThumbnailURL", item.ThumbnailURL
		    List.AddRow "URL", item.URL
		    
		    dim ArtworkImage as NSImageMBS = item.ArtworkImage
		    if ArtworkImage <> nil then
		      list.AddRow "ArtworkImage", "Image"
		      List.RowTag(List.LastIndex) = item.ArtworkImage
		    end if
		    
		    AddProperties item.Properties
		    
		    return
		  end if
		  
		  if v isa NSImageMBS then
		    dim n as NSImageMBS = v
		    
		    dim p as new PictureWindow
		    
		    p.Title = List.cell(row, 0)
		    p.Backdrop = n.CopyPictureWithMask
		    p.show
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadSourcesTimer
	#tag Event
		Sub Action()
		  dim sources as Dictionary = MediaLibrary.mediaSources
		  
		  
		  if sources <> nil then
		    
		    for each key as Variant in sources.keys
		      dim name as string = key
		      dim source as MLMediaSourceMBS = sources.Value(key)
		      
		      'dim p as Dictionary = source.Properties
		      
		      List.AddFolder source.mediaSourceIdentifier
		      List.RowTag(List.LastIndex) = source
		      
		      // trigger loading
		      call source.rootMediaGroup 
		      
		    next
		    
		    me.Mode = timer.ModeOff
		    
		  end if
		  
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
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
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
