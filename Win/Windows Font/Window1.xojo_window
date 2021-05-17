#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   675
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1996856030
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Windows Fonts"
   Visible         =   True
   Width           =   1254
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
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   594
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Windows Font Families"
      Italic          =   False
      Left            =   713
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   188
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox Liste
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
      Height          =   594
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   913
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   321
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox RList
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   594
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "REAL Studio Font List"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   61
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   188
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   35
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Here we query the font list with our WindowsFontFamilyMBS class. Looks like the REAL Studio font list is the same. DynaPDF on the other hand reads the font folder directly."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   732
   End
   Begin Listbox DList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   594
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "DynaPDF Name	Postscript Name	Style"
      Italic          =   False
      Left            =   220
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   61
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   481
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  fonts = WindowsFontFamilyMBS.AllFonts
		  
		  for each f as WindowsFontFamilyMBS in fonts
		    List.Addfolder f.LogFontFullName
		    List.RowTag(List.LastIndex)=f
		  next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(name as string, value as Boolean)
		  Liste.AddRow name
		  
		  if value then
		    Liste.Cell(Liste.LastIndex,1)="Yes"
		  else
		    Liste.Cell(Liste.LastIndex,1)="No"
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(name as string, value as integer)
		  Liste.AddRow name
		  Liste.Cell(Liste.LastIndex,1)=str(value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(name as string, value as string)
		  Liste.AddRow name
		  Liste.Cell(Liste.LastIndex,1)=value
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		fonts(-1) As WindowsFontFamilyMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  liste.DeleteAllRows
		  
		  if me.ListIndex = -1 then
		    // ignore
		  else
		    dim f as WindowsFontFamilyMBS = List.RowTag(List.ListIndex)
		    
		    Add "FontType", f.FontType
		    
		    // LOGFONT
		    Add "LogFontHeight", f.LogFontHeight
		    Add "LogFontWidth", f.LogFontWidth
		    Add "LogFontEscapement", f.LogFontEscapement
		    Add "LogFontOrientation", f.LogFontOrientation
		    Add "LogFontWeight", f.LogFontWeight
		    Add "LogFontItalic", f.LogFontItalic
		    Add "LogFontUnderline", f.LogFontUnderline
		    Add "LogFontStrikeOut", f.LogFontStrikeOut
		    Add "LogFontCharSet", f.LogFontCharSet
		    Add "LogFontOutPrecision", f.LogFontOutPrecision
		    Add "LogFontClipPrecision", f.LogFontClipPrecision
		    Add "LogFontQuality", f.LogFontQuality
		    Add "LogFontPitchAndFamily", f.LogFontPitchAndFamily
		    Add "LogFontFaceName", f.LogFontFaceName
		    
		    // ENUMLOGFONTEX
		    Add "LogFontFullName", f.LogFontFullName
		    Add "LogFontStyle", f.LogFontStyle
		    Add "LogFontScript", f.LogFontScript
		    
		    // DESIGNVECTOR
		    Add "NumberOfDesignVectors", f.NumberOfDesignVectors
		    
		    for i as integer = 0 to f.NumberOfDesignVectors-1
		      add "DesignVectorValues "+str(i+1), f.DesignVectorValues(i)
		    next
		    
		    // TEXTMETRIC
		    Add "TextMetricHeight", f.TextMetricHeight
		    Add "TextMetricAscent", f.TextMetricAscent
		    Add "TextMetricDescent", f.TextMetricDescent
		    Add "TextMetricInternalLeading", f.TextMetricInternalLeading
		    Add "TextMetricExternalLeading", f.TextMetricExternalLeading
		    Add "TextMetricAverageCharWidth", f.TextMetricAverageCharWidth
		    Add "TextMetricMaxCharWidth", f.TextMetricMaxCharWidth
		    Add "TextMetricWeight", f.TextMetricWeight
		    Add "TextMetricOverhang", f.TextMetricOverhang
		    Add "TextMetricDigitizedAspectX", f.TextMetricDigitizedAspectX
		    Add "TextMetricDigitizedAspectY", f.TextMetricDigitizedAspectY
		    Add "TextMetricFirstChar", f.TextMetricFirstChar
		    Add "TextMetricLastChar", f.TextMetricLastChar
		    Add "TextMetricDefaultChar", f.TextMetricDefaultChar
		    Add "TextMetricBreakChar", f.TextMetricBreakChar
		    Add "TextMetricItalic", f.TextMetricItalic
		    Add "TextMetricUnderlined", f.TextMetricUnderlined
		    Add "TextMetricStruckOut", f.TextMetricStruckOut
		    Add "TextMetricPitchAndFamily", f.TextMetricPitchAndFamily
		    Add "TextMetricCharSet", f.TextMetricCharSet
		    
		    
		    Add "TextMetricFlags", f.TextMetricFlags
		    Add "TextMetricSizeEM", f.TextMetricSizeEM
		    Add "TextMetricCellHeight", f.TextMetricCellHeight
		    Add "TextMetricAverageWidth", f.TextMetricAverageWidth
		    Add "NumberOfAxes", f.NumberOfAxes
		    
		    for i as integer = 0 to f.NumberOfAxes-1
		      add "AxisName "+str(i+1), f.AxisName(i)
		      add "AxisMaxValue "+str(i+1), f.AxisMaxValue(i)
		      add "AxisMinValue "+str(i+1), f.AxisMinValue(i)
		    next
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim f as WindowsFontFamilyMBS = List.RowTag(row)
		  
		  if f<>Nil then
		    
		    // we'd better pass a family name, but maybe this is okay, too?
		    dim a(-1) as WindowsFontFamilyMBS = WindowsFontFamilyMBS.FontsOfFamily(f.LogFontFullName)
		    
		    for each x as WindowsFontFamilyMBS in a
		      List.Addfolder x.LogFontFullName
		      List.RowTag(List.LastIndex)=x
		    next
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RList
	#tag Event
		Sub Open()
		  dim c as integer = FontCount-1
		  for i as integer = 0 to c
		    me.AddRow font(i)
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DList
	#tag Event
		Sub Open()
		  // Comment out and remove MyDynaPDFMBS class form project if you don't have the MBS REALbasic DynaPDF Plugin
		  
		  dim pdf as new MyDynapdfMBS
		  
		  call pdf.EnumHostFontsEx
		  
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
