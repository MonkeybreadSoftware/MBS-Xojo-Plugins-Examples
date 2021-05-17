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
   Height          =   606
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   964
   MenuBar         =   1299624536
   MenuBarVisible  =   True
   MinHeight       =   500
   MinimizeButton  =   True
   MinWidth        =   964
   Placement       =   0
   Resizeable      =   True
   Title           =   "Windows Font Unicode and Code Pages"
   Visible         =   True
   Width           =   964
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
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
      Height          =   572
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Unicode	Codepages"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox uList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
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
      Height          =   572
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Unicode"
      Italic          =   False
      Left            =   332
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox cList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
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
      Height          =   572
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "CodePages"
      Italic          =   False
      Left            =   644
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  for each f as WindowsFontFamilyMBS in WindowsFontFamilyMBS.AllFonts
		    
		    if f.FontType = f.TRUETYPE_FONTTYPE then
		      
		      List.AddRow f.LogFontFullName
		      List.RowTag(List.LastIndex)=f
		      
		    end if
		    
		  next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub TestCodePage(c as MemoryBlock, bit as integer, name as string)
		  dim mask as UInt64 = Bitwise.ShiftLeft(1, bit)
		  
		  if BitwiseAnd(c.UInt64Value(0), mask)=mask then
		    cList.AddRow name
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestUnicode(c as MemoryBlock, bit as integer, name as string)
		  if bit<64 then
		    dim mask as UInt64 = Bitwise.ShiftLeft(1, bit)
		    
		    if BitwiseAnd(c.UInt64Value(0), mask)=mask then
		      uList.AddRow name
		    end if
		    
		  else
		    bit = bit - 64
		    dim mask as UInt64 = Bitwise.ShiftLeft(1, bit)
		    
		    if BitwiseAnd(c.UInt64Value(8), mask)=mask then
		      uList.AddRow name
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  cList.DeleteAllRows
		  uList.DeleteAllRows
		  
		  if me.ListIndex >= 0 then
		    dim f as WindowsFontFamilyMBS = me.RowTag(me.ListIndex)
		    
		    dim u as MemoryBlock = f.UnicodeSubsetBitfield
		    dim c as MemoryBlock = f.CodepageBitfield
		    
		    
		    // Test codepages
		    TestCodePage c, 0, "1252: Latin 1"
		    TestCodePage c, 1, "1250: Latin 2: Central Europe"
		    TestCodePage c, 2, "1251: Cyrillic"
		    TestCodePage c, 3, "1253: Greek"
		    TestCodePage c, 4, "1254: Turkish"
		    TestCodePage c, 5, "1255: Hebrew"
		    TestCodePage c, 6, "1256: Arabic"
		    TestCodePage c, 7, "1257: Baltic"
		    TestCodePage c, 8, "1258: Vietnamese"
		    
		    for i as integer = 9 to 15
		      TestCodePage c, i, "Reserved for ANSI"
		    next
		    
		    TestCodePage c, 16, "874: Thai"
		    TestCodePage c, 17, "932: Japanese, Shift-JIS"
		    TestCodePage c, 18, "936: Simplified Chinese (PRC, Singapore)"
		    TestCodePage c, 19, "949: Korean Unified Hangul Code (Hangul TongHabHyung Code)"
		    TestCodePage c, 20, "950: Traditional Chinese (Taiwan; Hong Kong SAR, PRC)"
		    TestCodePage c, 21, "1361: Korean (Johab)"
		    
		    for i as integer = 22 to 29
		      TestCodePage c, i, "Reserved for alternate ANSI and OEM"
		    next
		    
		    for i as integer = 30 to 31
		      TestCodePage c, i, "Reserved by system."
		    next
		    
		    for i as integer = 32 to 46
		      TestCodePage c, i, "Reserved for OEM"
		    next
		    
		    TestCodePage c, 47, "1258: Vietnamese"
		    TestCodePage c, 48, "869: Modern Greek"
		    TestCodePage c, 49, "866: Russian"
		    TestCodePage c, 50, "865: Nordic"
		    TestCodePage c, 51, "864: Arabic"
		    TestCodePage c, 52, "863: Canadian French"
		    TestCodePage c, 53, "862"
		    TestCodePage c, 54, "861: Icelandic"
		    TestCodePage c, 55, "860: Portuguese"
		    TestCodePage c, 56, "857: Turkish"
		    TestCodePage c, 57, "855: Cyrillic; primarily Russian"
		    TestCodePage c, 58, "852: Latin 2"
		    TestCodePage c, 59, "775: Baltic"
		    TestCodePage c, 60, "737: Greek; formerly 437G"
		    TestCodePage c, 61, "708; 720: Arabic; ASMO 708"
		    TestCodePage c, 62, "850: Multilingual Latin 1"
		    TestCodePage c, 63, "437: US"
		    
		    
		    // Test Unicode
		    
		    TestUnicode u, 0, "Basic Latin"
		    TestUnicode u, 1, "Latin-1 Supplement"
		    TestUnicode u, 2, "Latin Extended-A"
		    TestUnicode u, 3, "Latin Extended-B"
		    TestUnicode u, 4, "IPA Extensions, Phonetic Extensions"
		    TestUnicode u, 5, "Spacing Modifier Letters, Modifier Tone Letters"
		    TestUnicode u, 6, "Combining Diacritical Marks"
		    TestUnicode u, 7, "Greek and Coptic"
		    TestUnicode u, 8, "Coptic"
		    TestUnicode u, 9, "Cyrillic"
		    TestUnicode u, 10, "Armenian"
		    TestUnicode u, 11, "Hebrew"
		    TestUnicode u, 12, "Vai"
		    TestUnicode u, 13, "Arabic"
		    TestUnicode u, 14, "NKo"
		    TestUnicode u, 15, "Devanagari"
		    TestUnicode u, 16, "Bengali"
		    TestUnicode u, 17, "Gurmukhi"
		    TestUnicode u, 18, "Gujarati"
		    TestUnicode u, 19, "Oriya"
		    TestUnicode u, 20, "Tamil"
		    TestUnicode u, 21, "Telugu"
		    TestUnicode u, 22, "Kannada"
		    TestUnicode u, 23, "Malayalam"
		    TestUnicode u, 24, "Thai"
		    TestUnicode u, 25, "Lao"
		    TestUnicode u, 26, "Georgian"
		    TestUnicode u, 27, "Balinese"
		    TestUnicode u, 28, "Hangul Jamo"
		    TestUnicode u, 29, "Latin Extended Additional"
		    TestUnicode u, 30, "Greek Extended"
		    TestUnicode u, 31, "General Punctuation"
		    TestUnicode u, 32, "Superscripts And Subscripts"
		    TestUnicode u, 33, "Currency Symbols"
		    TestUnicode u, 34, "Combining Diacritical Marks For Symbols"
		    TestUnicode u, 35, "Letterlike Symbols"
		    TestUnicode u, 36, "Number Forms"
		    TestUnicode u, 37, "Arrows"
		    TestUnicode u, 38, "Mathematical Operators"
		    TestUnicode u, 39, "Miscellaneous Technical"
		    TestUnicode u, 40, "Control Pictures"
		    TestUnicode u, 41, "Optical Character Recognition"
		    TestUnicode u, 42, "Enclosed Alphanumerics"
		    TestUnicode u, 43, "Box Drawing"
		    TestUnicode u, 44, "Block Elements"
		    TestUnicode u, 45, "Geometric Shapes"
		    TestUnicode u, 46, "Miscellaneous Symbols"
		    TestUnicode u, 47, "Dingbats"
		    TestUnicode u, 48, "CJK Symbols And Punctuation"
		    TestUnicode u, 49, "Hiragana"
		    TestUnicode u, 50, "Katakana"
		    TestUnicode u, 51, "Bopomofo"
		    TestUnicode u, 52, "Hangul Compatibility Jamo"
		    TestUnicode u, 53, "Phags-pa"
		    TestUnicode u, 54, "Enclosed CJK Letters And Months"
		    TestUnicode u, 55, "CJK Compatibility"
		    TestUnicode u, 56, "Hangul Syllables"
		    TestUnicode u, 57, "Non-Plane 0. Note that setting this bit implies that there is at least one supplementary code point beyond the Basic Multilingual Plane (BMP) that is supported by this font. See Surrogates and Supplementary Characters."
		    TestUnicode u, 58, "Phoenician"
		    TestUnicode u, 59, "CJK Radicals Supplement"
		    TestUnicode u, 60, "Private Use Area"
		    TestUnicode u, 61, "CJK Strokes & 7CJK Compatibility Ideographs"
		    TestUnicode u, 62, "Alphabetic Presentation Forms"
		    TestUnicode u, 63, "Arabic Presentation Forms-A"
		    TestUnicode u, 64, "Combining Half Marks"
		    TestUnicode u, 65, "Vertical Forms & CJK Compatibility Forms"
		    TestUnicode u, 66, "Small Form Variants"
		    TestUnicode u, 67, "Arabic Presentation Forms-B"
		    TestUnicode u, 68, "Halfwidth And Fullwidth Forms"
		    TestUnicode u, 69, "Specials"
		    TestUnicode u, 70, "Tibetan"
		    TestUnicode u, 71, "Syriac"
		    TestUnicode u, 72, "Thaana"
		    TestUnicode u, 73, "Sinhala"
		    TestUnicode u, 74, "Myanmar"
		    TestUnicode u, 75, "Ethiopic"
		    TestUnicode u, 76, "Cherokee"
		    TestUnicode u, 77, "Unified Canadian Aboriginal Syllabics"
		    TestUnicode u, 78, "Ogham"
		    TestUnicode u, 79, "Runic"
		    TestUnicode u, 80, "Khmer"
		    TestUnicode u, 81, "Mongolian"
		    TestUnicode u, 82, "Braille Patterns"
		    TestUnicode u, 83, "Yi Syllables & Yi Radicals"
		    TestUnicode u, 84, "Tagalog, Hanunoo, Buhid & Tagbanwa"
		    TestUnicode u, 85, "Old Italic"
		    TestUnicode u, 86, "Gothic"
		    TestUnicode u, 87, "Deseret"
		    TestUnicode u, 88, "Byzantine Musical Symbols, Musical Symbols & Ancient Greek Musical Notation"
		    TestUnicode u, 89, "Mathematical Alphanumeric Symbols"
		    TestUnicode u, 90, "Private Use"
		    TestUnicode u, 91, "Variation Selectors"
		    TestUnicode u, 92, "Tags"
		    TestUnicode u, 93, "Limbu"
		    TestUnicode u, 94, "Tai Le"
		    TestUnicode u, 95, "New Tai Lue"
		    TestUnicode u, 96, "Buginese"
		    TestUnicode u, 97, "Glagolitic"
		    TestUnicode u, 98, "Tifinagh"
		    TestUnicode u, 99, "Yijing Hexagram Symbols"
		    TestUnicode u, 100, "Syloti Nagri"
		    TestUnicode u, 101, "Linear B Syllabary, Linear B Ideograms & Aegean Numbers"
		    TestUnicode u, 102, "Ancient Greek Numbers"
		    TestUnicode u, 103, "Ugaritic"
		    TestUnicode u, 104, "Old Persian"
		    TestUnicode u, 105, "Shavian"
		    TestUnicode u, 106, "Osmanya"
		    TestUnicode u, 107, "Cypriot Syllabary"
		    TestUnicode u, 108, "Kharoshthi"
		    TestUnicode u, 109, "Tai Xuan Jing Symbols"
		    TestUnicode u, 110, "Cuneiform"
		    TestUnicode u, 111, "Counting Rod Numerals"
		    TestUnicode u, 112, "Sundanese"
		    TestUnicode u, 113, "Lepcha"
		    TestUnicode u, 114, "Ol Chiki"
		    TestUnicode u, 115, "Saurashtra"
		    TestUnicode u, 116, "Kayah Li"
		    TestUnicode u, 117, "Rejang"
		    TestUnicode u, 118, "Cham"
		    TestUnicode u, 119, "Ancient Symbols"
		    TestUnicode u, 120, "Phaistos Disc"
		    TestUnicode u, 121, "Lycian"
		    TestUnicode u, 122, "Mahjong Tiles & Domino Tiles"
		    TestUnicode u, 123, "Windows 2000 and later: Layout progress, horizontal from right to left"
		    TestUnicode u, 124, "Windows 2000 and later: Layout progress, vertical before horizontal"
		    TestUnicode u, 125, "Windows 2000 and later: Layout progress, vertical bottom to top"
		    TestUnicode u, 126, "Reserved for process-internal usage"
		    TestUnicode u, 127, "Reserved for process-internal usage"
		    
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
