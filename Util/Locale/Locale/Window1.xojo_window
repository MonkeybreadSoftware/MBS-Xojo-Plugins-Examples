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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1319130781
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Locale"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   7
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
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Default	USA	British	German	French	Japanese"
      Italic          =   False
      Left            =   20
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // default
		  dim xx as LocaleMBS = LocaleMBS.Locale
		  
		  // German
		  dim DE as LocaleMBS = LocaleMBS.Locale("DE_DE") // works on Mac
		  if DE = nil then DE = LocaleMBS.Locale("de_DE") // works on Mac
		  if DE = nil then DE = LocaleMBS.Locale("de_DE.UTF8") // works on Linux
		  if DE = nil then DE = LocaleMBS.Locale("German") // works on Windows
		  
		  // French
		  dim FR as LocaleMBS = LocaleMBS.Locale("FR_FR") // works on Mac
		  if FR = nil then FR = LocaleMBS.Locale("fr_FR") // works on Mac
		  if FR = nil then FR = LocaleMBS.Locale("fr_FR.UTF8") 
		  if FR = nil then FR = LocaleMBS.Locale("French") // Works on Windows
		  if FR = nil then FR = LocaleMBS.Locale("fr") 
		  
		  // US American
		  dim US as LocaleMBS = LocaleMBS.Locale("EN_US") // works on Mac
		  if US = nil then US = LocaleMBS.Locale("en_US") // works on Mac
		  if US = nil then US = LocaleMBS.Locale("en_US.UTF8") // works on Linux
		  if US = nil then US = LocaleMBS.Locale("us") // Works on Windows
		  
		  // British
		  dim GB as LocaleMBS = LocaleMBS.Locale("EN_GB") // works on Mac
		  if GB = nil then GB = LocaleMBS.Locale("en_GB") // works on Mac
		  if GB = nil then GB = LocaleMBS.Locale("en_GB.UTF8") // works on Linux
		  if GB = nil then GB = LocaleMBS.Locale("english") // works on Windows
		  
		  // Japan
		  dim JP as LocaleMBS = LocaleMBS.Locale("JA_JP") // works on Mac
		  if JP = nil then JP = LocaleMBS.Locale("ja_JP") // works on Mac
		  if JP = nil then JP = LocaleMBS.Locale("ja_JP.UTF8")
		  if JP = nil then JP = LocaleMBS.Locale("Japanese")
		  if JP = nil then JP = LocaleMBS.Locale("ja")
		  
		  List.AddRow "Name"
		  List.AddRow "DecimalPoint"
		  List.AddRow "ThousandsSep"
		  List.AddRow "Grouping"
		  List.AddRow "IntCurrSymbol"
		  List.AddRow "CurrencySymbol"
		  List.AddRow "monDecimalPoint"
		  List.AddRow "monThousandsSep"
		  List.AddRow "monGrouping"
		  List.AddRow "PositiveSign"
		  List.AddRow "NegativeSign"
		  
		  List.AddRow "IntFracDigits"
		  List.AddRow "FracDigits"
		  List.AddRow "PosCSPrecedes"
		  List.AddRow "PosSepBySpace"
		  List.AddRow "NegCSPrecedes"
		  List.AddRow "NegSepBySpace"
		  List.AddRow "PosSignPosition"
		  List.AddRow "NegSignPosition"
		  List.AddRow "IntPosCSPrecedes"
		  List.AddRow "IntNegCSPrecedes"
		  List.AddRow "IntPosSepBySpace"
		  List.AddRow "IntNegSepBySpace"
		  List.AddRow "IntPosSignPosition"
		  List.AddRow "IntNegSignPosition"
		  
		  'MsgBox EncodeHex(xx.monGrouping)
		  
		  if xx<>Nil then
		    row = 0
		    column = 1
		    
		    AddCell xx.Name
		    AddCell xx.DecimalPoint
		    AddCell xx.ThousandsSep
		    AddCell g(xx.Grouping)
		    AddCell xx.IntCurrSymbol
		    AddCell xx.CurrencySymbol
		    AddCell xx.monDecimalPoint
		    AddCell xx.monThousandsSep
		    AddCell g(xx.monGrouping)
		    AddCell xx.PositiveSign
		    AddCell xx.NegativeSign
		    
		    AddCell s(xx.IntFracDigits)
		    AddCell s(xx.FracDigits)
		    AddCell str(xx.PosCSPrecedes)
		    AddCell str(xx.PosSepBySpace)
		    AddCell str(xx.NegCSPrecedes)
		    AddCell str(xx.NegSepBySpace)
		    AddCell s(xx.PosSignPosition)
		    AddCell s(xx.NegSignPosition)
		    AddCell s(xx.IntPosCSPrecedes)
		    AddCell s(xx.IntNegCSPrecedes)
		    AddCell s(xx.IntPosSepBySpace)
		    AddCell s(xx.IntNegSepBySpace)
		    AddCell s(xx.IntPosSignPosition)
		    AddCell s(xx.IntNegSignPosition)
		    
		  end if
		  
		  
		  if us<>Nil then
		    row = 0
		    column = 2
		    
		    AddCell us.Name
		    AddCell us.DecimalPoint
		    AddCell us.ThousandsSep
		    AddCell g(us.Grouping)
		    AddCell us.IntCurrSymbol
		    AddCell us.CurrencySymbol
		    AddCell us.monDecimalPoint
		    AddCell us.monThousandsSep
		    AddCell g(us.monGrouping)
		    AddCell us.PositiveSign
		    AddCell us.NegativeSign
		    
		    AddCell s(us.IntFracDigits)
		    AddCell s(us.FracDigits)
		    AddCell str(us.PosCSPrecedes)
		    AddCell str(us.PosSepBySpace)
		    AddCell str(us.NegCSPrecedes)
		    AddCell str(us.NegSepBySpace)
		    AddCell s(us.PosSignPosition)
		    AddCell s(us.NegSignPosition)
		    AddCell s(us.IntPosCSPrecedes)
		    AddCell s(us.IntNegCSPrecedes)
		    AddCell s(us.IntPosSepBySpace)
		    AddCell s(us.IntNegSepBySpace)
		    AddCell s(us.IntPosSignPosition)
		    AddCell s(us.IntNegSignPosition)
		    
		  end if
		  
		  if gb<>Nil then
		    row = 0
		    column = 3
		    
		    AddCell gb.Name
		    AddCell gb.DecimalPoint
		    AddCell gb.ThousandsSep
		    AddCell g(gb.Grouping)
		    AddCell gb.IntCurrSymbol
		    AddCell gb.CurrencySymbol
		    AddCell gb.monDecimalPoint
		    AddCell gb.monThousandsSep
		    AddCell g(gb.monGrouping)
		    AddCell gb.PositiveSign
		    AddCell gb.NegativeSign
		    
		    AddCell s(gb.IntFracDigits)
		    AddCell s(gb.FracDigits)
		    AddCell str(gb.PosCSPrecedes)
		    AddCell str(gb.PosSepBySpace)
		    AddCell str(gb.NegCSPrecedes)
		    AddCell str(gb.NegSepBySpace)
		    AddCell s(gb.PosSignPosition)
		    AddCell s(gb.NegSignPosition)
		    AddCell s(gb.IntPosCSPrecedes)
		    AddCell s(gb.IntNegCSPrecedes)
		    AddCell s(gb.IntPosSepBySpace)
		    AddCell s(gb.IntNegSepBySpace)
		    AddCell s(gb.IntPosSignPosition)
		    AddCell s(gb.IntNegSignPosition)
		    
		  end if
		  
		  
		  if fr<>Nil then
		    row = 0
		    column = 5
		    
		    AddCell fr.Name
		    AddCell fr.DecimalPoint
		    AddCell fr.ThousandsSep
		    AddCell g(fr.Grouping)
		    AddCell fr.IntCurrSymbol
		    AddCell fr.CurrencySymbol
		    AddCell fr.monDecimalPoint
		    AddCell fr.monThousandsSep
		    AddCell g(fr.monGrouping)
		    AddCell fr.PositiveSign
		    AddCell fr.NegativeSign
		    
		    AddCell s(fr.IntFracDigits)
		    AddCell s(fr.FracDigits)
		    AddCell str(fr.PosCSPrecedes)
		    AddCell str(fr.PosSepBySpace)
		    AddCell str(fr.NegCSPrecedes)
		    AddCell str(fr.NegSepBySpace)
		    AddCell s(fr.PosSignPosition)
		    AddCell s(fr.NegSignPosition)
		    AddCell s(fr.IntPosCSPrecedes)
		    AddCell s(fr.IntNegCSPrecedes)
		    AddCell s(fr.IntPosSepBySpace)
		    AddCell s(fr.IntNegSepBySpace)
		    AddCell s(fr.IntPosSignPosition)
		    AddCell s(fr.IntNegSignPosition)
		    
		  end if
		  
		  if de<>Nil then
		    row = 0
		    column = 4
		    
		    AddCell de.Name
		    AddCell de.DecimalPoint
		    AddCell de.ThousandsSep
		    AddCell g(de.Grouping)
		    AddCell de.IntCurrSymbol
		    AddCell de.CurrencySymbol
		    AddCell de.monDecimalPoint
		    AddCell de.monThousandsSep
		    AddCell g(de.monGrouping)
		    AddCell de.PositiveSign
		    AddCell de.NegativeSign
		    
		    AddCell s(de.IntFracDigits)
		    AddCell s(de.FracDigits)
		    AddCell str(de.PosCSPrecedes)
		    AddCell str(de.PosSepBySpace)
		    AddCell str(de.NegCSPrecedes)
		    AddCell str(de.NegSepBySpace)
		    AddCell s(de.PosSignPosition)
		    AddCell s(de.NegSignPosition)
		    AddCell s(de.IntPosCSPrecedes)
		    AddCell s(de.IntNegCSPrecedes)
		    AddCell s(de.IntPosSepBySpace)
		    AddCell s(de.IntNegSepBySpace)
		    AddCell s(de.IntPosSignPosition)
		    AddCell s(de.IntNegSignPosition)
		    
		  end if
		  
		  if jp<>Nil then
		    row = 0
		    column = 6
		    
		    AddCell jp.Name
		    AddCell jp.DecimalPoint
		    AddCell jp.ThousandsSep
		    AddCell g(jp.Grouping)
		    AddCell jp.IntCurrSymbol
		    AddCell jp.CurrencySymbol
		    AddCell jp.monDecimalPoint
		    AddCell jp.monThousandsSep
		    AddCell g(jp.monGrouping)
		    AddCell jp.PositiveSign
		    AddCell jp.NegativeSign
		    
		    AddCell s(jp.IntFracDigits)
		    AddCell s(jp.FracDigits)
		    AddCell str(jp.PosCSPrecedes)
		    AddCell str(jp.PosSepBySpace)
		    AddCell str(jp.NegCSPrecedes)
		    AddCell str(jp.NegSepBySpace)
		    AddCell s(jp.PosSignPosition)
		    AddCell s(jp.NegSignPosition)
		    AddCell s(jp.IntPosCSPrecedes)
		    AddCell s(jp.IntNegCSPrecedes)
		    AddCell s(jp.IntPosSepBySpace)
		    AddCell s(jp.IntNegSepBySpace)
		    AddCell s(jp.IntPosSignPosition)
		    AddCell s(jp.IntNegSignPosition)
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddCell(s as string)
		  list.Cell(row,column) = s
		  row = row + 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function g(s as string) As string
		  // decode grouping
		  
		  dim groupings() as string
		  
		  dim l as integer = lenb(s)
		  for i as integer = 1 to l
		    dim ch as string = midb(s,i,1)
		    dim n as integer = ascb(ch)
		    
		    if n = 127 then
		      groupings.Append "end"
		      Return Join(groupings, " ")
		    end if
		    
		    groupings.Append str(n)
		  next
		  
		  groupings.Append "repeat"
		  
		  Return Join(groupings, " ")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function S(x as integer) As string
		  if x = 127 then
		    Return "undefined"
		  else
		    Return str(x)
		  end if
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		column As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		row As Integer
	#tag EndProperty


#tag EndWindowCode

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
	#tag ViewProperty
		Name="row"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="column"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
