#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
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
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Object Actions"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   0
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
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function GetActionTypeString(n as integer) As string
		  Select case n
		  case DynaPDFMBS.katURI
		    return "URI"
		  case DynaPDFMBS.katTransition
		    return "Transition"
		  case DynaPDFMBS.katThread
		    return "Thread"
		  case DynaPDFMBS.katSubmit
		    return "Submit"
		  case DynaPDFMBS.katSound
		    return "Sound"
		  case DynaPDFMBS.katSetOCGState
		    return "SetOCGState"
		  case DynaPDFMBS.katRichMediaExec
		    return "RichMediaExec"
		  case DynaPDFMBS.katReset
		    return "Reset"
		  case DynaPDFMBS.katRendition
		    return "Rendition"
		  case DynaPDFMBS.katNamed
		    return "Named"
		  case DynaPDFMBS.katMovie
		    return "Movie"
		  case DynaPDFMBS.katLaunch
		    return "Launch"
		  case DynaPDFMBS.katJavaScript
		    return "JavaScript"
		  case DynaPDFMBS.katImportData
		    return "ImportData"
		  case DynaPDFMBS.katHide
		    return "Hide"
		  case DynaPDFMBS.katGoToR
		    return "GoToR"
		  case DynaPDFMBS.katGoToE
		    return "GoToE"
		  case DynaPDFMBS.katGoTo3DView
		    return "GoTo3DView"
		  case DynaPDFMBS.katGoTo
		    return "GoTo"
		  else
		    return "?"
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(p as MyDynaPDFMBS)
		  
		  const HideWhenNoActions = true
		  
		  pdf = p
		  dim Actions as DynaPDFObjActionsMBS
		  
		  
		  
		  dim pages as integer = pdf.GetPageCount
		  for i as integer = 1 to pages
		    dim a as DynaPDFPageMBS = pdf.GetPage(i)
		    
		    if (HideWhenNoActions = false) or (pdf.GetObjActions(pdf.kotPage, i, Actions) > 0) then
		      
		      List.AddFolder "Page", str(i)
		      List.RowTag(List.LastIndex) = a
		      
		    end if
		    
		  next
		  
		  
		  dim annots as integer = pdf.GetAnnotCount-1
		  for i as integer = 0 to annots
		    dim a as DynaPDFAnnotationExMBS = pdf.GetAnnotEx(i)
		    
		    if (HideWhenNoActions = false) or (pdf.GetObjActions(pdf.kotAnnotation, i, Actions) > 0) then
		      
		      List.AddFolder "Annotation", str(i)
		      List.RowTag(List.LastIndex) = a
		      
		    end if
		    
		    
		  next
		  
		  dim fields as integer = pdf.GetFieldCount-1
		  for i as integer = 0 to fields
		    dim a as DynaPDFFieldExMBS = pdf.GetFieldEx(i)
		    
		    if (HideWhenNoActions = false) or (pdf.GetObjActions(pdf.kotField, i, Actions) > 0) then
		      
		      List.AddFolder "Field", str(i)
		      List.RowTag(List.LastIndex) = a
		      
		    end if
		    
		  next
		  
		  
		  dim bookmarks as integer = pdf.GetBookmarkCount-1
		  for i as integer = 0 to bookmarks
		    dim a as DynaPDFBookmarkMBS = pdf.GetBookmark(i)
		    
		    if (HideWhenNoActions = false) or (pdf.GetObjActions(pdf.kotBookmark, i, Actions) > 0) then
		      
		      List.AddFolder "Bookmark",str(i)
		      List.RowTag(List.LastIndex) = a
		      
		    end if
		    
		  next
		  
		  
		  dim r as integer = pdf.GetObjActions(pdf.kotCatalog, 0, Actions)
		  
		  if r > 0 then
		    List.AddFolder "Catalog Object Actions", str(r)
		    List.RowTag(List.LastIndex) = actions
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		PDF As MyDynaPDFMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  if v = nil then Return
		  
		  if v isa DynaPDFObjActionsMBS then
		    dim o as DynaPDFObjActionsMBS = v
		    
		    List.AddRow "Action", str(o.Action)
		    List.AddRow "ActionType", str(o.ActionType)+ " "+GetActionTypeString(o.ActionType)
		    if o.Events = nil then
		      List.AddRow "Events", "none"
		    else
		      List.AddFolder "Events"
		      List.RowTag(List.LastIndex) = o.Events
		    end if
		    
		    Return
		  end if
		  
		  
		  if v isa DynaPDFObjEventMBS then
		    dim o as DynaPDFObjEventMBS = v
		    
		    List.AddRow "Action", str(o.Action)
		    List.AddRow "ActionType", str(o.ActionType)+ " "+GetActionTypeString(o.ActionType)
		    List.AddRow "ObjEvent", str(o.ObjEvent)
		    
		    if o.NextObject = nil then
		      List.AddRow "Events", ""
		    else
		      List.AddFolder "NextObject"
		      List.RowTag(List.LastIndex) = o.NextObject
		    end if
		    
		    Return
		  end if
		  
		  
		  if v isa DynaPDFBookmarkMBS then
		    dim o as DynaPDFBookmarkMBS = v
		    
		    List.AddRow "DestType", str(o.DestType)
		    List.AddRow "Title",        o.Title
		    List.AddRow "DestPage", str(o.DestPage)
		    List.AddRow "Parent",   str(o.Parent)
		    List.AddRow "Style",    str(o.Style)
		    
		    
		    dim Actions as DynaPDFObjActionsMBS
		    dim r as integer = pdf.GetObjActions(pdf.kotBookmark, o.Handle, Actions)
		    
		    if r > 0 then
		      List.AddFolder "Bookmark Object Actions", str(r)
		      List.RowTag(List.LastIndex) = actions
		    end if
		    
		    return
		  end if
		  
		  
		  if v isa DynaPDFPageMBS then
		    dim o as DynaPDFPageMBS = v
		    
		    List.AddRow "Page",        str(o.Page)
		    List.AddRow "Orientation", str(o.Orientation)
		    
		    
		    
		    dim Actions as DynaPDFObjActionsMBS
		    dim r as integer = pdf.GetObjActions(pdf.kotPage, o.Page, Actions)
		    
		    if r > 0 then
		      List.AddFolder "Page Object Actions", str(r)
		      List.RowTag(List.LastIndex) = actions
		    end if
		    
		    return
		  end if
		  
		  if v isa DynaPDFAnnotationExMBS then
		    dim o as DynaPDFAnnotationExMBS = v
		    
		    List.AddRow "Type",    str(o.Type)
		    List.AddRow "Content",     o.Content
		    List.AddRow "CreateDate",  o.CreateDate
		    List.AddRow "Subject",     o.Subject
		    List.AddRow "Subtype",     o.Subtype
		    
		    
		    dim Actions as DynaPDFObjActionsMBS
		    dim r as integer = pdf.GetObjActions(pdf.kotAnnotation, o.Handle, Actions)
		    
		    if r > 0 then
		      List.AddFolder "Annotation Object Actions", str(r)
		      List.RowTag(List.LastIndex) = actions
		    end if
		    return
		  end if
		  
		  
		  if v isa DynaPDFFieldExMBS then
		    dim o as DynaPDFFieldExMBS = v
		    
		    List.AddRow "FieldName",        o.FieldName
		    List.AddRow "FieldType",    str(o.FieldType)
		    List.AddRow "Value",            o.Value
		    List.AddRow "ExpValue",         o.ExpValue
		    List.AddRow "ToolTip",          o.ToolTip
		    List.AddRow "PageNum",      str(o.PageNum)
		    
		    
		    
		    dim Actions as DynaPDFObjActionsMBS
		    dim r as integer = pdf.GetObjActions(pdf.kotField, o.Handle, Actions)
		    
		    if r > 0 then
		      List.AddFolder "Field Object Actions", str(r)
		      List.RowTag(List.LastIndex) = actions
		    end if
		    
		    return
		  end if
		  
		  
		  break // unhandled type?
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
