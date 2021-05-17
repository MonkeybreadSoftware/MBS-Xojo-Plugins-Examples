#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   428
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   814258175
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Text Editor"
   Visible         =   True
   Width           =   788
   Begin TextArea Editor
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
      Height          =   322
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   0.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "2"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   86
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   385
   End
   Begin BevelButton BoldButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   True
      ButtonType      =   1
      Caption         =   "B"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   32
   End
   Begin BevelButton ItalicButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   1
      Caption         =   "I"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   64
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   28
   End
   Begin BevelButton underlineButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   1
      Caption         =   "U"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   104
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   True
      Value           =   False
      Visible         =   True
      Width           =   28
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   98
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "2"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   66
   End
   Begin PushButton OpenButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open"
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "2"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   66
   End
   Begin PopupMenu PopupFont
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   144
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "2"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin ColorPickerButton ColorPickerButton1
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   277
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton LeftButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   True
      ButtonType      =   1
      Caption         =   "L"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   311
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   32
   End
   Begin BevelButton CenterButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   True
      ButtonType      =   1
      Caption         =   "C"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   342
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   32
   End
   Begin BevelButton RightButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   True
      ButtonType      =   1
      Caption         =   "R"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   373
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "2"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   32
   End
   Begin PushButton CreateButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   176
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "2"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   99
   End
   Begin Canvas Preview
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   388
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   417
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   351
   End
   Begin Timer RedrawTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   400
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  editor.StyledText.RTFData = testRTF
		  
		  
		  
		  UpdatePreview
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  RedrawTimer.Mode = timer.ModeSingle
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  RedrawTimer.Mode = timer.ModeSingle
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub UpdatePreview()
		  
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Pro" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil)
		  
		  // add page
		  call pdf.append
		  call pdf.SetFont("Helvetica")
		  
		  call pdf.SetPageWidth(preview.Width)
		  call pdf.SetPageHeight(preview.Height)
		  call pdf.SetColorSpace(pdf.kcsDeviceRGB)
		  call pdf.SetFillColor(0) // black
		  
		  call pdf.settextrect 5, pdf.getpageHeight-5, pdf.getpageWidth-10, pdf.getpageHeight-10
		  call pdf.writeStyledText(pdf.ktaLeft, window1.Editor.StyledText)
		  
		  call pdf.EndPage
		  
		  pic = pdf.RenderPagePicture(1, preview.Width * 2, preview.Height * 2)
		  preview.Invalidate
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private NoEvents As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


	#tag Constant, Name = testRTF, Type = String, Dynamic = False, Default = \"{\\rtf1\\ansi\\ansicpg1252{\\fonttbl{\\f0\\fnil Helvetica;}{\\f1\\fnil Arial;}{\\f2\\fnil Times;}{\\f3\\fnil Comic Sans MS;}}{\\colortbl\\red0\\green0\\blue0;\\red217\\green11\\blue0;\\red46\\green111\\blue253;\\red102\\green177\\blue50;}\\uc0 \\ql\\f0\\fs36 Hello World\\par\\par \\cf1 red\\cf0  \\cf2 blue\\cf0  \\cf3 green\\par \\cf0 \\par \\fs28 14 point\\fs24 \\par \\fs20 10 point\\par \\fs36 \\par \\b bold\\b0 \x2C \\i italic\\i0 \x2C \\ul underline\\ul0 \\par \\par \\f1 Arial \\b bold\\b0  \\i italic\\par \\i0\\f2 Times \\b bold\\b0  \\i italic\\par \\i0\\f3 Comic Sans \\b bold\\b0  italic\\par }", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Editor
	#tag Event
		Sub SelChange()
		  NoEvents = true
		  
		  boldButton.Value = me.SelBold
		  ItalicButton.Value = me.SelItalic
		  underlineButton.Value = me.SelUnderline
		  
		  dim n as string = me.SelTextFont
		  if n = "" then
		    PopupFont.ListIndex = -1
		  else
		    // schrift suchen und eintrag setzen
		    dim u as integer = PopupFont.ListCount-1
		    for i as integer = 0 to u
		      if PopupFont.List(i) = n then
		        PopupFont.ListIndex = i
		        exit
		      end if
		    next
		  end if
		  
		  ColorPickerButton1.value = me.SelTextColor
		  
		  Select case me.SelAlignment
		  case me.AlignRight
		    RightButton.Value = true
		    LeftButton.Value = false
		    CenterButton.Value = false
		  case me.AlignCenter
		    RightButton.Value = false
		    LeftButton.Value = false
		    CenterButton.Value = true
		  else
		    RightButton.Value = false
		    LeftButton.Value = true
		    CenterButton.Value = false
		  end Select
		  
		  NoEvents = false
		  
		  RedrawTimer.Mode = timer.ModeSingle
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BoldButton
	#tag Event
		Sub Action()
		  Editor.SelBold = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ItalicButton
	#tag Event
		Sub Action()
		  Editor.SelItalic = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events underlineButton
	#tag Event
		Sub Action()
		  Editor.SelUnderline = me.Value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetSaveFolderItem(FileTypes1.Rtf, "test.rtf")
		  
		  if f = nil then Return 
		  
		  dim b as BinaryStream = BinaryStream.Create(f)
		  
		  b.Write editor.StyledText.RTFData
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OpenButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetopenFolderItem(FileTypes1.Rtf)
		  
		  if f = nil then Return 
		  
		  dim b as BinaryStream = BinaryStream.open(f)
		  
		  editor.StyledText.RTFData = b.Read(B.Length)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupFont
	#tag Event
		Sub Open()
		  dim u as integer = FontCount-1
		  for i as integer = 0 to u
		    dim n as string = font(i)
		    
		    PopupFont.AddRow n
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if NoEvents then Return // nicht setzen, wenn wir selber setzen
		  
		  editor.SelTextFont = me.Text
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorPickerButton1
	#tag Event
		Sub ColorChanged()
		  editor.SelTextColor = me.value
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LeftButton
	#tag Event
		Sub Action()
		  Editor.SelAlignment = editor.AlignLeft
		  
		  RightButton.Value = false
		  CenterButton.Value = false
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CenterButton
	#tag Event
		Sub Action()
		  Editor.SelAlignment = editor.AlignCenter
		  
		  LeftButton.Value = false
		  RightButton.Value = false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RightButton
	#tag Event
		Sub Action()
		  Editor.SelAlignment = editor.AlignRight
		  
		  
		  LeftButton.Value = false
		  CenterButton.Value = false
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreateButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetSaveFolderItem(FileTypes1.pdf, "test.pdf")
		  
		  if f = nil then Return 
		  
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(f)
		  
		  // add page
		  call pdf.append
		  call pdf.SetFont("Helvetica")
		  
		  // start horizontal 110 from left
		  // start veritical 100 from top
		  // width is page width minus 130 pixels left and 50 right
		  // height is page height minus 100 on bottom and 250 on top
		  
		  call pdf.settextrect 110, pdf.getpageHeight -100, pdf.getpageWidth-110-50, pdf.getpageHeight-100-100
		  call pdf.writeStyledText(pdf.ktaLeft, window1.Editor.StyledText)
		  
		  call pdf.EndPage
		  call pdf.closefile
		  
		  f.Launch
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Preview
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if pic <> nil then
		    g.DrawPicture pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RedrawTimer
	#tag Event
		Sub Action()
		  UpdatePreview
		  
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
	#tag ViewProperty
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
