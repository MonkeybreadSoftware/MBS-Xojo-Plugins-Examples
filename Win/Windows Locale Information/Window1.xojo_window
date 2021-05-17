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
   Height          =   565
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1520248660
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   758
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Current"
      Default         =   False
      Enabled         =   True
      Height          =   20
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
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "USA"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Germany"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   204
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   499
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
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
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   718
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  if not TargetWin32 then
		    MsgBox "This example works only on Windows."
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Show(l as WinLocalizationMBS)
		  List.DeleteAllRows
		  
		  list.addrow "LanguageID", l.LanguageID
		  list.addrow "LanguageNameLocalized", l.LanguageNameLocalized
		  list.addrow "LanguageNameEnglish", l.LanguageNameEnglish
		  list.addrow "LanguageNameAbbreviated", l.LanguageNameAbbreviated
		  list.addrow "LanguageNameNativ", l.LanguageNameNativ
		  list.addrow "CountryCode", l.CountryCode
		  list.addrow "CountryNameLocalized", l.CountryNameLocalized
		  list.addrow "CountryNameEnglish", l.CountryNameEnglish
		  list.addrow "CountryNameAbbreviated", l.CountryNameAbbreviated
		  list.addrow "CountryNameNative", l.CountryNameNative
		  list.addrow "DefaultLanguageID", l.DefaultLanguageID
		  list.addrow "DefaultCountryCode", l.DefaultCountryCode
		  list.addrow "DefaultCodePageOEM", l.DefaultCodePageOEM
		  list.addrow "DefaultCodePageANSI", l.DefaultCodePageANSI
		  list.addrow "DefaultCodePageMac", l.DefaultCodePageMac
		  list.addrow "ListItemSeparator", l.ListItemSeparator
		  list.addrow "MeasureSystem", l.MeasureSystem
		  list.addrow "DecimalSeparator", l.DecimalSeparator
		  list.addrow "ThousandSeparator", l.ThousandSeparator
		  list.addrow "DigitGrouping", l.DigitGrouping
		  list.addrow "NumberOfFraction", l.NumberOfFraction
		  list.addrow "LeadingZeros", l.LeadingZeros
		  list.addrow "NegativeNumberMode", l.NegativeNumberMode
		  list.addrow "NativeASCII0to9", l.NativeASCII0to9
		  list.addrow "CurrencySymbolLocalized", l.CurrencySymbolLocalized
		  list.addrow "CurrencySymbolInternational", l.CurrencySymbolInternational
		  list.addrow "CurrencyDecimalSeparator", l.CurrencyDecimalSeparator
		  list.addrow "CurrencyThousandSeparator", l.CurrencyThousandSeparator
		  list.addrow "CurrencyGroupingMode", l.CurrencyGroupingMode
		  list.addrow "CurrencyDigitsLocalized", l.CurrencyDigitsLocalized
		  list.addrow "CurrencyDigitsInternational", l.CurrencyDigitsInternational
		  list.addrow "CurrencyPositiveMode", l.CurrencyPositiveMode
		  list.addrow "CurrencyNegativeMode", l.CurrencyNegativeMode
		  list.addrow "DateSeparator", l.DateSeparator
		  list.addrow "TimeSeparator", l.TimeSeparator
		  list.addrow "DateShortFormatString", l.DateShortFormatString
		  list.addrow "DateLongFormatString", l.DateLongFormatString
		  list.addrow "TimeShortFormatString", l.TimeShortFormatString
		  list.addrow "DateShortFormatOrdering", l.DateShortFormatOrdering
		  list.addrow "DateLongFormatOrdering", l.DateLongFormatOrdering
		  list.addrow "TimeFormatSpecifier", l.TimeFormatSpecifier
		  list.addrow "TimeMarkerPosition", l.TimeMarkerPosition
		  list.addrow "TimeCenturyFormatSpecifier", l.TimeCenturyFormatSpecifier
		  list.addrow "TimeLeadingZeros", l.TimeLeadingZeros
		  list.addrow "DateLeadingZerosDay", l.DateLeadingZerosDay
		  list.addrow "DateLeadingZerosMonth", l.DateLeadingZerosMonth
		  list.addrow "TimeAM", l.TimeAM
		  list.addrow "TimePM", l.TimePM
		  list.addrow "CalendarTypeSpecifier", l.CalendarTypeSpecifier
		  list.addrow "CalendarTypeSpecifier2", l.CalendarTypeSpecifier2
		  list.addrow "FirstDayOfWeek", l.FirstDayOfWeek
		  list.addrow "FirstWeekOfYear", l.FirstWeekOfYear
		  
		  list.addrow "SignPositive", l.SignPositive
		  list.addrow "SignNegative", l.SignNegative
		  list.addrow "SignPositivePosition", l.SignPositivePosition
		  list.addrow "SignNegativePosition", l.SignNegativePosition
		  list.addrow "PosSymPrecedes", l.PosSymPrecedes
		  list.addrow "PosSepBySpace", l.PosSepBySpace
		  list.addrow "NegSymPrecedes", l.NegSymPrecedes
		  list.addrow "NegSepBySpace", l.NegSepBySpace
		  list.addrow "LanguageNameAbbreviatedISO", l.LanguageNameAbbreviatedISO
		  list.addrow "CountryNameAbbreviatedISO", l.CountryNameAbbreviatedISO
		  list.addrow "DefaultCodePageEBCDIC", l.DefaultCodePageEBCDIC
		  list.addrow "Papersize", l.Papersize
		  list.addrow "CurrencyNameEnglish", l.CurrencyNameEnglish
		  list.addrow "CurrencyNameNative", l.CurrencyNameNative
		  list.addrow "DateShortYearMonth", l.DateShortYearMonth
		  list.addrow "Sortname", l.Sortname
		  list.addrow "DigitSubstitution", l.DigitSubstitution
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim l as new WinLocalizationMBS
		  
		  show l
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim l as new WinLocalizationMBS(WinLocalizationMBS.LANG_ENGLISH, WinLocalizationMBS.SUBLANG_ENGLISH_US, WinLocalizationMBS.SORT_DEFAULT)
		  
		  show l
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  dim l as new WinLocalizationMBS(WinLocalizationMBS.LANG_GERMAN, WinLocalizationMBS.SUBLANG_GERMAN, WinLocalizationMBS.SORT_DEFAULT)
		  
		  show l
		  
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
		InitialValue="False"
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
