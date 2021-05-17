#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   540
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1121260361
   MenuBarVisible  =   True
   MinHeight       =   540
   MinimizeButton  =   False
   MinWidth        =   690
   Placement       =   0
   Resizeable      =   False
   Title           =   "Hex Dump Example"
   Visible         =   True
   Width           =   690
   Begin TextArea efShowData
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   467
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "000000: xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx xx   xxxxxxxxxxxxxxxx"
      TextColor       =   
      TextFont        =   "Courier"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   650
   End
   Begin PushButton pbDump
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "HexDump"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   305
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
      Top             =   500
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label stSize
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   443
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "12.345.678 bytes"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   500
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   202
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  self.top =50
		  self.Left = (Screen(0).AvailableWidth - self.Width)/2
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub HexOut(mb As MemoryBlock)
		  // This method is passed a memoryblock containing the data to be
		  // displayed. The method formats the data, 16 bytes at a time in a hex
		  // dump format. Three MBS features are used:
		  // StringHandleMBS for fast string building, HexstringMBS to format
		  // the 16 bytes in hex with spacing, and ReplaceNonPrintableCharactersMBS
		  // to format the 16 bytes to the right of the hex display showing the printable
		  // characters.
		  Dim i, j, k, ln, m, n, pos As Integer
		  Dim ltrs(15), s, theHex, theLtrs, thePos  As String
		  Dim r As StringHandleMBS
		  
		  r = new StringHandleMBS
		  n = mb.Size - 1  // number of bytes in memoryblock
		  pos = 0
		  k = 16
		  for i = 0 to n step 16  // walk through memoryblock 16 bytes at a time
		    thePos = right("00000" + hex(i), 6) + ": "  // format offset part of string  ******
		    if i + 16 > n then k = n - i + 1  // walking past end of memoryblock?
		    s = mb.StringValue(i, k)  // get up to 16 bytes from memoryblock as a string
		    theHex = HexstringMBS(s, 2, 16, "", "", " ", " ")  // get hex version of string  ******
		    theLtrs = ReplaceNonPrintableCharactersMBS(s)  // get character representation *****
		    //s = thePos + theHex + " " + theLtrs + gcr
		    r.Add thePos + theHex + " " + theLtrs + EndOfLine
		    //efShowData.AppendText s  // append to editfield
		    ln = ln + 1
		    if ln = 16 then  // output a blank line after every 16th printed line
		      r.Add " " + EndOfLine
		      //efShowData.AppendText " " + gcr
		      ln = 0
		    end if
		  Next i
		  efShowData.Text = r.copy
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events efShowData
	#tag Event
		Sub Open()
		  me.text = ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  me.ScrollPosition = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbDump
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  Dim b As BinaryStream
		  Dim n As Integer
		  Dim mb As MemoryBlock
		  
		  // open the included gif file to display in hex dump format
		  f = GetOpenFolderItem("")
		  if f <> nil and f.exists then
		    b = f.OpenAsBinaryFile
		    if b <> nil then
		      n = f.Length
		      stSize.Text = Format(n, "#,###") + " bytes"
		      mb = NewMemoryBlock(n)
		      mb.StringValue(0,n) = b.Read(n)
		      b.close
		      HexOut mb
		    else
		      Beep
		      MsgBox "Unable to open thumbsup.gif file as a binarystream"
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events stSize
	#tag Event
		Sub Open()
		  me.text = ""
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
