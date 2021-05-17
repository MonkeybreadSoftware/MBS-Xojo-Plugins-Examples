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
   Height          =   600
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   285383026
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Font Info"
   Visible         =   True
   Width           =   800
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   602
      HelpTag         =   ""
      Hierarchical    =   False
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
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox Liste
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "30%"
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
      Height          =   602
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   211
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
      Width           =   589
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim d as new MyDynaPDFMBS
		  
		  call d.CreateNewPDF
		  
		  dim file as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  if file = nil then quit
		  
		  call d.OpenImportFile(file)
		  call d.ImportPDFFile(1)
		  
		  // for showing fonts in current PDF:
		  dim c as integer = d.GetFontCount-1
		  for i as integer = 0 to c
		    dim f as DynaPDFFontInfoMBS = d.GetFontInfoEx(i)
		    
		    dim n as string = f.FullName
		    if n = "" then
		      n = f.BaseFont
		    end if
		    
		    List.AddRow n
		    List.RowTag(List.LastIndex) = f
		  next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function strBaseEncoding(n as integer) As string
		  Select case n
		  case DynaPDFMBS.kbeMacExpert
		    Return "MacExpert"
		  case DynaPDFMBS.kbeMacRoman
		    Return "MacRoman"
		  case DynaPDFMBS.kbeStandard
		    Return "Standard"
		  case DynaPDFMBS.kbeWinAnsi
		    Return "WinAnsi"
		  else
		    Return "unknown: "+str(n)
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strBool(b as Boolean) As string
		  if b then
		    Return "yes"
		  else
		    Return "no"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strFontFileType(n as integer) As string
		  Select case n
		  case DynaPDFMBS.kffsCIDFontType0C
		    Return "CIDFontType0C"
		  case DynaPDFMBS.kffsCIDFontType2
		    Return "CIDFontType2"
		  case DynaPDFMBS.kffsNoSubtype
		    Return "NoSubtype"
		  case DynaPDFMBS.kffsOpenType
		    Return "OpenType"
		  case DynaPDFMBS.kffsOpenTypeC
		    Return "OpenTypeC"
		  case DynaPDFMBS.kffsType1C
		    Return "Type1C"
		  else
		    Return "unknown: "+str(n)
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strFontType(n as integer) As string
		  Select case n
		  case DynaPDFMBS.kftMMType1 // 0
		    Return "MMType1"
		  case DynaPDFMBS.kftTrueType // 1
		    Return "TrueType"
		  case DynaPDFMBS.kftType0 // 2
		    Return "Type0"
		  case DynaPDFMBS.kftType1 // 3
		    Return "Type1"
		  case DynaPDFMBS.kftType3 // 4
		    Return "Type3"
		  else
		    Return "unknown: "+str(n)
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strMemory(m as MemoryBlock) As string
		  if m = nil then
		    Return "n/a"
		  end if
		  
		  dim s as string = leftb(m, 100)
		  dim e as string = EncodeHex(s)+"..."
		  
		  Return e
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strPoint(r as DynapdfPointMBS) As string
		  if r = nil then
		    Return "n/a"
		  end if
		  
		  Return str(r.x)+"/"+str(r.y)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strRect(r as DynaPDFRectMBS) As string
		  if r = nil then
		    Return "n/a"
		  end if
		  
		  Return str(r.Left)+"/"+str(r.top)+" "+str(r.Right)+"/"+str(r.Bottom)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  Liste.DeleteAllRows
		  
		  if List.ListIndex = -1 then
		    Return
		  end if
		  
		  dim f as DynaPDFFontInfoMBS = list.RowTag(List.ListIndex)
		  
		  Liste.AddRow "Ascent", str(f.Ascent)
		  Liste.AddRow "AvgWidth", str(f.AvgWidth)
		  Liste.AddRow "BaseEncoding", strBaseEncoding(f.BaseEncoding)
		  Liste.AddRow "BaseFont", f.BaseFont
		  Liste.AddRow "CapHeight", str(f.CapHeight)
		  Liste.AddRow "CharSet", f.CharSet
		  Liste.AddRow "CharSetSize", str(f.CharSetSize)
		  Liste.AddRow "CIDOrdering", str(f.CIDOrdering)
		  Liste.AddRow "CIDRegistry", str(f.CIDRegistry)
		  Liste.AddRow "CIDSet", strMemory(f.CIDSet)
		  Liste.AddRow "CIDSetSize", str(f.CIDSetSize)
		  Liste.AddRow "CIDSupplement", str(f.CIDSupplement)
		  Liste.AddRow "CIDToGIDMap", strMemory(f.CIDToGIDMap)
		  Liste.AddRow "CIDToGIDMapSize", str(f.CIDToGIDMapSize)
		  Liste.AddRow "CMapBuf", strMemory(f.CMapBuf)
		  Liste.AddRow "CMapBufSize", str(f.CMapBufSize)
		  Liste.AddRow "CMapName", str(f.CMapName)
		  Liste.AddRow "Descent", str(f.Descent)
		  Liste.AddRow "Encoding", strMemory(f.Encoding)
		  Liste.AddRow "FirstChar", str(f.FirstChar)
		  Liste.AddRow "Flags", hex(f.Flags)
		  Liste.AddRow "FontBBox", strRect(f.FontBBox)
		  Liste.AddRow "FontBuffer", strMemory(f.FontBuffer)
		  Liste.AddRow "FontBufSize", str(f.FontBufSize)
		  Liste.AddRow "FontFamily", f.FontFamily
		  Liste.AddRow "FontFilePath", f.FontFilePath
		  Liste.AddRow "FontFileType", strFontFileType(f.FontFileType)
		  Liste.AddRow "FontName", f.FontName
		  Liste.AddRow "FontStretch", f.FontStretch
		  Liste.AddRow "FontType", strFontType(f.FontType)
		  Liste.AddRow "FontWeight", str(f.FontWeight)
		  Liste.AddRow "FullName", f.FullName
		  Liste.AddRow "HaveEncoding", strBool(f.HaveEncoding)
		  'Liste.AddRow "HorzWidths", str(f.HorzWidths)
		  Liste.AddRow "HorzWidthsCount", str(f.HorzWidthsCount)
		  Liste.AddRow "Imported", strBool(f.Imported)
		  Liste.AddRow "ItalicAngle", str(f.ItalicAngle)
		  Liste.AddRow "Lang", str(f.Lang)
		  Liste.AddRow "LastChar", str(f.LastChar)
		  Liste.AddRow "Leading", str(f.Leading)
		  Liste.AddRow "Length1", str(f.Length1)
		  Liste.AddRow "Length2", str(f.Length2)
		  Liste.AddRow "Length3", str(f.Length3)
		  Liste.AddRow "MaxWidth", str(f.MaxWidth)
		  Liste.AddRow "Metadata", strMemory(f.Metadata)
		  Liste.AddRow "MetadataSize", str(f.MetadataSize)
		  Liste.AddRow "MisWidth", str(f.MisWidth)
		  Liste.AddRow "Panose", strMemory(f.Panose)
		  Liste.AddRow "PostScriptName", f.PostScriptName
		  Liste.AddRow "SpaceWidth", str(f.SpaceWidth)
		  Liste.AddRow "StemH", str(f.StemH)
		  Liste.AddRow "StemV", str(f.StemV)
		  Liste.AddRow "ToUnicode", strMemory(f.ToUnicode)
		  Liste.AddRow "ToUnicodeSize", str(f.ToUnicodeSize)
		  Liste.AddRow "VertDefPos", strPoint(f.VertDefPos)
		  Liste.AddRow "VertWidthsCount", str(f.VertWidthsCount)
		  Liste.AddRow "WMode", str(f.WMode)
		  Liste.AddRow "XHeight", str(f.XHeight)
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  Update
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
