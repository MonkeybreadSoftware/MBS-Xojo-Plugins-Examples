#tag WebPage
Begin WebPage MainPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   400
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Generate Barcodes"
   Top             =   0
   Visible         =   True
   Width           =   600
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Open()
		  // UPC Version A
		  // UPC-A is used in the United States for retail applications. The
		  // symbol requires an 11 digit article number. The check digit is
		  // calculated by Zint. In addition EAN-2 and EAN-5 add-on symbols can
		  // be added using the + character.
		  
		  test "UPCA", BarcodeGeneratorMBS.BarcodeUpca, "72527270270+12345"
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
		  test "EAN", BarcodeGeneratorMBS.BarcodeEanx, "7432365+54321"
		  
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
		  
		  
		  
		  // add scrollbar
		  me.minHeight = p
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Test(typeLabel as string, type as integer, text as string)
		  dim c as new BarcodeContainer
		  
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
		  
		  'List.AddRow typeLabel, text, error
		  'List.CellTag(List.LastIndex,2) = pic
		  
		  c.TypeLabel.Text = typeLabel
		  c.TextLabel.Text = text
		  c.Image.Picture = pic
		  
		  c.EmbedWithin(self, 0, p, c.Width, c.Height)
		  p = p + c.Height
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected p As Integer
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
