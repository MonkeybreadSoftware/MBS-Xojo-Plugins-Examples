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
   MenuBar         =   83340049
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Date"
   Visible         =   True
   Width           =   600
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
		  // for Mac, Windows and Linux we usually have different locale names
		  dim de as string =  l("de_DE", "deu", "de_DE.UTF8")
		  dim en as string =  l("en_US", "english", "en_US.UTF8")
		  dim fr as string =  l("fr_FR", "fra", "fr_FR.UTF8")
		  
		  
		  dim d as new date
		  
		  List.AddRow "ShortDate", d.ShortDate
		  List.AddRow "ShortTime", d.ShortTime
		  List.AddRow "LongDate", d.LongDate
		  List.AddRow "LongTime", d.LongTime
		  List.AddRow "AbbreviatedDate", d.AbbreviatedDate
		  
		  List.AddRow "%x %X",    MyFormatDateMBS("%x %X", d)
		  List.AddRow "%x %X de", MyFormatDateMBS("%x %X", d, de)
		  List.AddRow "%x %X fr", MyFormatDateMBS("%x %X", d, fr)
		  List.AddRow "%x %X en", MyFormatDateMBS("%x %X", d, en)
		  
		  
		  List.AddRow "%a", MyFormatDateMBS("%a", d) // The abbreviated weekday name according to the current locale.
		  List.AddRow "%A", MyFormatDateMBS("%A", d) // The full weekday name according to the current locale.
		  List.AddRow "%b", MyFormatDateMBS("%b", d) // The abbreviated month name according to the current locale.
		  List.AddRow "%B", MyFormatDateMBS("%B", d) // The full month name according to the current locale.
		  List.AddRow "%c", MyFormatDateMBS("%c", d) // The preferred date and time representation for the current locale.
		  'List.AddRow "%C", MyFormatDateMBS("%C", d) // The century number (year/100) as a 2-digit integer. (SU)
		  List.AddRow "%d", MyFormatDateMBS("%d", d) // The day of the month as a decimal number (range 01 to 31).
		  List.AddRow "%D", MyFormatDateMBS("%D", d) // Equivalent to %m/%d/%y. (Yecch-for Americans only. Americans should note that in other countries %d/%m/%y is rather common. This means that in international context this format is ambiguous and should not be used.) (SU)
		  List.AddRow "%e", MyFormatDateMBS("%e", d) // Like %d, the day of the month as a decimal number, but a leading zero is replaced by a space. (SU)
		  List.AddRow "%F", MyFormatDateMBS("%F", d) // Equivalent to %Y-%m-%d (the ISO 8601 date format). (C99)
		  List.AddRow "%G", MyFormatDateMBS("%G", d) // The ISO 8601 week-based year (see NOTES) with century as a decimal number. The 4-digit year corresponding to the ISO week number (see %V). This has the same format and value as %Y, except that if the ISO week number belongs to the previous or next year, that year is used instead. (TZ)
		  List.AddRow "%g", MyFormatDateMBS("%g", d) // Like %G, but without century, that is, with a 2-digit year (00-99). (TZ)
		  List.AddRow "%H", MyFormatDateMBS("%H", d) // The hour as a decimal number using a 24-hour clock (range 00 to 23).
		  List.AddRow "%I", MyFormatDateMBS("%I", d) // The hour as a decimal number using a 12-hour clock (range 01 to 12).
		  List.AddRow "%j", MyFormatDateMBS("%j", d) // The day of the year as a decimal number (range 001 to 366).
		  List.AddRow "%k", MyFormatDateMBS("%k", d) // The hour (24-hour clock) as a decimal number (range 0 to 23); single digits are preceded by a blank. (See also %H.) (TZ)
		  List.AddRow "%l", MyFormatDateMBS("%l", d) // The hour (12-hour clock) as a decimal number (range 1 to 12); single digits are preceded by a blank. (See also %I.) (TZ)
		  List.AddRow "%m", MyFormatDateMBS("%m", d) // The month as a decimal number (range 01 to 12).
		  List.AddRow "%M", MyFormatDateMBS("%M", d) // The minute as a decimal number (range 00 to 59).
		  List.AddRow "%p", MyFormatDateMBS("%p", d) // Either "AM" or "PM" according to the given time value, or the corresponding strings for the current locale. Noon is treated as "PM" and midnight as "AM".
		  List.AddRow "%P", MyFormatDateMBS("%P", d) // Like %p but in lowercase: "am" or "pm" or a corresponding string for the current locale. (GNU)
		  List.AddRow "%r", MyFormatDateMBS("%r", d) // The time in a.m. or p.m. notation. In the POSIX locale this is equivalent to %I:%M:%S %p. (SU)
		  List.AddRow "%R", MyFormatDateMBS("%R", d) // The time in 24-hour notation (%H:%M). (SU) For a version including the seconds, see %T below.
		  List.AddRow "%s", MyFormatDateMBS("%s", d) // The number of seconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC). (TZ)
		  List.AddRow "%S", MyFormatDateMBS("%S", d) // The second as a decimal number (range 00 to 60). (The range is up to 60 to allow for occasional leap seconds.)
		  List.AddRow "%T", MyFormatDateMBS("%T", d) // The time in 24-hour notation (%H:%M:%S). (SU)
		  List.AddRow "%u", MyFormatDateMBS("%u", d) // The day of the week as a decimal, range 1 to 7, Monday being 1. See also %w. (SU)
		  List.AddRow "%U", MyFormatDateMBS("%U", d) // The week number of the current year as a decimal number, range 00 to 53, starting with the first Sunday as the first day of week 01. See also %V and %W.
		  List.AddRow "%V", MyFormatDateMBS("%V", d) // The ISO 8601 week number (see NOTES) of the current year as a decimal number, range 01 to 53, where week 1 is the first week that has at least 4 days in the new year. See also %U and %W. (SU)
		  List.AddRow "%w", MyFormatDateMBS("%w", d) // The day of the week as a decimal, range 0 to 6, Sunday being 0. See also %u.
		  List.AddRow "%W", MyFormatDateMBS("%W", d) // The week number of the current year as a decimal number, range 00 to 53, starting with the first Monday as the first day of week 01.
		  List.AddRow "%x", MyFormatDateMBS("%x", d) // The preferred date representation for the current locale without the time.
		  List.AddRow "%X", MyFormatDateMBS("%X", d) // The preferred time representation for the current locale without the date.
		  List.AddRow "%y", MyFormatDateMBS("%y", d) // The year as a decimal number without a century (range 00 to 99).
		  List.AddRow "%Y", MyFormatDateMBS("%Y", d) // The year as a decimal number including the century.
		  List.AddRow "%z", MyFormatDateMBS("%z", d) // The +hhmm or -hhmm numeric timezone (that is, the hour and minute offset from UTC). (SU)
		  List.AddRow "%Z", MyFormatDateMBS("%Z", d) // The timezone or name or abbreviation.
		  List.AddRow "%+", MyFormatDateMBS("%+", d) // The date and time in date(1) format. (TZ) (Not supported in glibc2.)
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function l(Mac as string, Win as string, Lin as string) As string
		  if TargetLinux then Return lin
		  if TargetWin32 then Return win
		  if TargetMacOS then Return mac
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MyFormatDateMBS(format as string, date as date, locale as string = "") As string
		  Return FormatDateMBS(format, date, locale)
		  Exception u as UnsupportedFormatException
		    
		    Return "Error: "+u.message
		    
		End Function
	#tag EndMethod


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
#tag EndViewBehavior
