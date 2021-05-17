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
   MenuBar         =   595984954
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Test"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   120
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   387
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Text	Picture"
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
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // UPC Version A
		  // UPC-A is used in the United States for retail applications. The
		  // symbol requires an 11 digit article number. The check digit is
		  // calculated by Zint. In addition EAN-2 and EAN-5 add-on symbols can
		  // be added using the + character.
		  
		  test "UPCA", BarcodeGeneratorMBS.BarcodeUpca, "72527270270"
		  
		  // UPC Version E
		  // UPC-E is a zero-compressed version of UPC-A developed for smaller
		  // packages. The code requires a 6 digit article number (digits 0-9).
		  // The check digit is calculated by Zint. EAN-2 and EAN-5 add- on
		  // symbols can be added using the + character as with UPC-A. In
		  // addition Zint also supports Number System 1 encoding by entering a
		  // 7-digit article number stating with the digit 1.
		  
		  test "UPCE", BarcodeGeneratorMBS.BarcodeUpcE, "1123456"
		  
		  // European Article Number (EN 797) 6.1.4.1 EAN-2, EAN-5, EAN-8 and EAN-13
		  // The EAN system is used in retail across Europe and includes
		  // standards for EAN-2 and EAN-5 add-on codes, EAN-8 and EAN-13 which
		  // encode 2, 5, 7 or 12 digit numbers respectively. Zint will decide
		  // which symbology to use depending on the length of the input data.
		  // In addition EAN-2 and EAN-5 add-on symbols can be added using the +
		  // symbol as with UPC symbols.
		  
		  test "EAN", BarcodeGeneratorMBS.BarcodeEanx, "54321"
		  
		  // Standard Code 39 was developed in 1974 by Intermec.
		  // Input data can be of any length and supports the characters 0-9, A-
		  // Z, dash (-), full stop (.), space, asterisk (*), dollar ($), slash
		  // (/), plus (+) and percent (%). The standard does not require a
		  // check digit but a modulo-43 check digit can be added if required by
		  // setting Option2 = 1.
		  
		  test "Code39", BarcodeGeneratorMBS.BarcodeCode39, "CODE39"
		  
		  // PDF417 (ISO 15438)
		  // Heavily used in the parcel industry, the PDF417 symbology can
		  // encode a vast amount of data into a small space. Zint supports
		  // encoding up to the ISO standard maximum symbol size of 925
		  // codewords which (at error correction level 0) allows a maximum data
		  // size of 1850 text characters, or 2710 digits. The width of the
		  // generated PDF417 symbol can be specified at the command line using
		  // the Option2 with a number between 1 and 30, and the amount of check
		  // digit information can be specified by using the Option1 property
		  // with a number between 0 and 8 where the number of codewords used
		  // for check information is determined by 2(value + 1). The default
		  // level of check information is determined by the amount of data
		  // being encoded. International text support is provided using the
		  // Latin-1 character set as described in Appendix A. A separate
		  // symbology ID can be used to encode Health Industry Barcode (HIBC)
		  // data which adds a leading '+' character and a modulo-49 check digit
		  // to the encoded data.
		  
		  test "PDF417", BarcodeGeneratorMBS.BarcodePdf417, "Hello World, Just a test. 123"
		  
		  // 6.6.1 Data Matrix (ISO 16022) Also known as Semacode this symbology
		  // was developed in 1989 by Acuity CiMatrix in partnership with the US
		  // DoD and NASA. The symbol can encode a large amount of data in a
		  // small area. Data Matrix can encode any characters in the Latin-1
		  // set and can also encode GS1 data. The size of the generated symbol
		  // can also be adjusted using Option2. A separate symbology ID can be
		  // used to encode Health Industry Barcode (HIBC) data which adds a
		  // leading '+' character and a modulo-49 check digit to the encoded
		  // data. Note that only ECC200 encoding is supported, the older
		  // standards have now been removed from Zint. An extra feature is
		  // available for Data Matrix symbols which allows Zint to
		  // automatically resize the symbol as required but also prevents Zint
		  // from using rectangular symbols. To set this mode at the command
		  // line use Option3 = OptionSquare.
		  
		  test "DataMatrix", BarcodeGeneratorMBS.BarcodeDatamatrix, "Hello World"
		  
		  // QR Code
		  // Also known as Quick Response Code this symbology was developed by
		  // Denso. Four levels of error correction are available using the
		  // Option1 property.
		  
		  // Input ECC LevelError Correction Capacity    Recovery Capacity
		  // 1    L (default)    Approx 20% of symbol    Approx 7%
		  // 2    M    Approx 37% of symbol    Approx 15%
		  // 3    Q    Approx 55% of symbol    Approx 25%
		  // 4    H    Approx 65% of symbol    Approx 30%
		  
		  // The size of the symbol can be set by using the Option2 to the QR Code version required (1-40).
		  
		  test "QR Code", BarcodeGeneratorMBS.BarcodeQrcode, "Hello World"
		  
		  
		  
		  // While Zint app is GPL, the ZINT shared library is licensed under BSD 3!
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Test(typeLabel as string, type as integer, text as string)
		  dim z as new BarcodeGeneratorMBS
		  
		  z.Symbology = type
		  z.Encode text
		  
		  dim pic as Picture = z.picture
		  dim error as string
		  
		  dim e as integer = z.LastError
		  Select case e
		  case z.ErrorTooLong
		    error = "ErrorTooLong"
		  case z.ErrorInvalidData
		    error = "ErrorInvalidData"
		  case z.ErrorInvalidCheck
		    error = "ErrorInvalidCheck"
		  case z.ErrorInvalidOption
		    error = "ErrorInvalidOption"
		  case z.ErrorEncodingProblem
		    error = "ErrorEncodingProblem"
		  case z.ErrorFileAccess
		    error = "ErrorFileAccess"
		  case z.ErrorMemory
		    error = "ErrorMemory"
		  end Select
		  
		  List.AddRow typeLabel, text, error
		  List.CellTag(List.LastIndex,2) = pic
		  
		  dim f as FolderItem 
		  
		  
		  f = SpecialFolder.Desktop.Child("barcode "+typeLabel+".svg")
		  e = z.WriteSVG(f.UnixpathMBS)
		  if z.ErrorText.len >0 then
		    MsgBox z.ErrorText
		  end if
		  
		  f = SpecialFolder.Desktop.Child("barcode "+typeLabel+".eps")
		  e = z.WritePS(f.UnixpathMBS)
		  if z.ErrorText.len >0 then
		    MsgBox z.ErrorText
		  end if
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if column = 2 and row<me.ListCount then
		    dim pic as Picture = me.CellTag(row, column)
		    if pic<>Nil then
		      g.DrawPicture pic, 0, 0, pic.Width, pic.Height, 0, 0, pic.Width, pic.Height
		      Return true
		    end if
		  end if
		  
		End Function
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
