#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   533
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Create PDF with text styles"
   Visible         =   True
   Width           =   600
   Begin TextArea itext
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
      Height          =   228
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hello World\r\rjust a test...\r"
      TextColor       =   &c00000000
      TextFont        =   "Helvetica"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin PushButton CreateButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Create PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   480
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
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
      Width           =   100
   End
   Begin BevelButton UButton
      AcceptFocus     =   False
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   True
      Value           =   False
      Visible         =   True
      Width           =   29
   End
   Begin BevelButton IButton
      AcceptFocus     =   False
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
      Left            =   61
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   29
   End
   Begin BevelButton BButton
      AcceptFocus     =   False
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
      Left            =   102
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   29
   End
   Begin ColorPanel CP
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      current         =   &c00000000
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton LButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
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
      Left            =   177
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   29
   End
   Begin BevelButton CButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
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
      Left            =   218
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   29
   End
   Begin BevelButton RButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
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
      Left            =   259
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   29
   End
   Begin TextArea otext
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
      Height          =   227
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   286
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin Splitter MySplitter
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   12
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      LastY           =   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   274
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin BevelButton FontButton
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   1
      Caption         =   "Font"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   1
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  MySplitter.topControl = itext
		  MySplitter.bottomControl = otext
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ConvertText(d as DynaPDFMBS) As string
		  // here we convert the text
		  
		  // pick the text
		  dim s as StyledText = itext.StyledText
		  
		  dim lastalignment as integer = -1
		  
		  // this array takes the text fragments and is later joined for the result text
		  dim result(-1) as string
		  
		  'if DebugBuild then
		  '// list Paragraphs
		  'dim pc as integer = s.ParagraphCount-1
		  'for pi as integer = 0 to pc
		  'dim p as Paragraph = s.Paragraph(pi)
		  '
		  'System.DebugLog "Paragraph: "+str(pi)
		  'System.DebugLog "Alignment: "+str(p.Alignment)
		  'System.DebugLog "StartPos: "+str(p.StartPos)
		  'System.DebugLog "EndPos: "+str(p.EndPos)
		  'next
		  'end if
		  
		  dim pos as integer = 0
		  dim c as integer = s.StyleRunCount-1
		  for i as integer = 0 to c
		    
		    dim sr as StyleRun = s.StyleRun(i)
		    dim ra as Range = s.StyleRunRange(i)
		    
		    if DebugBuild then
		      System.DebugLog "i: "+str(i)
		      System.DebugLog "ra.StartPos: "+str(Ra.StartPos)
		      System.DebugLog "ra.EndPos: "+str(Ra.EndPos)
		      System.DebugLog "ra.Length: "+str(Ra.Length)
		      System.DebugLog "sr.Text: "+str(sr.Text)
		    end if
		    
		    // check the alignment using the Paragraph list
		    dim alignment as integer = 0
		    dim pc as integer = s.ParagraphCount-1
		    for pi as integer = 0 to pc
		      dim p as Paragraph = s.Paragraph(pi)
		      
		      if p.StartPos<=ra.StartPos then
		        alignment = p.Alignment
		        
		      end if
		    next
		    
		    // go with the position
		    pos = pos + len(sr.Text)
		    
		    if DebugBuild then
		      System.DebugLog "alignment: "+str(alignment)
		    end if
		    
		    // apply alignment
		    if lastalignment<>alignment then
		      lastalignment = alignment
		      // check alignment
		      Select case alignment
		      case itext.AlignCenter
		        result.Append "\ce#"
		      case itext.AlignRight
		        result.Append "\re#"
		      else
		        result.Append "\le#"
		      end Select
		    end if
		    
		    // now check the text color
		    dim co   as color = sr.TextColor
		    dim size as Double = sr.Size
		    dim fcol as integer = d.RGB(co.Red, co.Green, co.Blue)
		    
		    result.Append "\FC["+str(fcol)+"]\FS["+str(size,"0")+"]"
		    
		    // now be check the fontname, style and size
		    dim style as integer
		    
		    if sr.Bold then
		      Style = style + d.kfsBold
		    end if
		    
		    if sr.Italic then
		      Style = style + d.kfsItalic
		    end if
		    
		    Dim Font As String = sr.Font
		    dim text as string = sr.Text
		    Dim fh As Integer = d.SetFont(Font, style, Size, False, d.kcpUnicode)
		    If fh < 0 Then
		      // found not found, switch to Arial Unicode MS
		      fh = d.SetFont("Arial Unicode MS", style, Size, False, d.kcpUnicode)
		      If fh < 0 Then
		        // style not available, try again?
		        fh = d.SetFont("Arial Unicode MS", 0, Size, False, d.kcpUnicode)
		      End If
		    End If
		    
		    Dim TestPos As Integer = d.TestGlyphs(fh, Text)
		    If TestPos >= 0 Then
		      // one character not found, so we switch font
		      
		      fh = d.SetFont("Arial Unicode MS", style, Size, False, d.kcpUnicode)
		      If fh < 0 Then
		        // style not available, try again?
		        fh = d.SetFont("Arial Unicode MS", 0, Size, False, d.kcpUnicode)
		      End If
		    End If
		    
		    result.Append "\FT["+str(Fh)+"]"
		    
		    // underline is handled extra
		    if sr.Underline then
		      result.Append "\ul#"
		    end if
		    
		    // and append the text
		    result.Append Text
		    
		    if sr.Underline then
		      result.Append "\ul#"
		    end if
		    
		  next
		  
		  Return Join(result, "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run()
		  Dim pdf As New MyDynapdfMBS
		  dim text as string
		  dim height as double
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("Create PDF with text styles.pdf")
		  call pdf.CreateNewPDF f
		  call pdf.SetViewerPreferences pdf.kvpDisplayDocTitle,pdf.kavNone
		  call pdf.SetDocInfo pdf.kdiAuthor, "Christian Schmitz"
		  call pdf.SetDocInfo pdf.kdiSubject, "My first Xojo output"
		  call pdf.SetDocInfo pdf.kdiProducer, "Xojo test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first Xojo output"
		  
		  // We want to use top-down coordinates
		  call pdf.SetPageCoords pdf.kpcTopDown
		  
		  call pdf.Append
		  
		  call pdf.SetFont "Times", pdf.kfsItalic, 20.0, true, pdf.kcpUnicode
		  call pdf.SetTextRect(50, 50, pdf.GetPageWidth-100, pdf.GetPageHeight-100)
		  
		  // old way
		  'Text = ConvertText(pdf)
		  // new way using built-in functions in DynaPDFMBS
		  Text = pdf.ConvertStyledText(itext.StyledText)
		  otext.Text = Text
		  
		  // or better call WriteStyledText directy
		  Call pdf.WriteFText(pdf.ktaLeft, Text)
		  
		  height = pdf.GetPageHeight - pdf.GetLastTextPosY - 50
		  'call pdf.Rectangle( 50, 50, 150, height, pdf.kfmStroke)
		  
		  call pdf.EndPage
		  
		  call pdf.CloseFile
		  
		  f.Launch
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events itext
	#tag Event
		Sub SelChange()
		  BButton.Value = me.SelBold
		  IButton.Value = me.SelItalic
		  UButton.Value = me.SelUnderline
		  
		  CP.SetColor me.SelTextColor
		  
		  Select case itext.SelAlignment
		  case itext.AlignDefault, itext.AlignLeft
		    CButton.Value = false
		    LButton.Value = true
		    RButton.Value = false
		    
		  case itext.AlignCenter
		    CButton.Value = true
		    LButton.Value = false
		    RButton.Value = false
		    
		  case itext.AlignRight
		    CButton.Value = false
		    LButton.Value = false
		    RButton.Value = true
		    
		  end Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreateButton
	#tag Event
		Sub Action()
		  run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UButton
	#tag Event
		Sub Action()
		  itext.SelUnderline = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IButton
	#tag Event
		Sub Action()
		  itext.SelItalic = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BButton
	#tag Event
		Sub Action()
		  itext.SelBold = me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CP
	#tag Event
		Sub Changed()
		  itext.SelTextColor = me.current
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LButton
	#tag Event
		Sub Action()
		  if me.Value then
		    itext.SelAlignment = itext.AlignLeft
		    
		    CButton.Value = false
		    RButton.Value = false
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CButton
	#tag Event
		Sub Action()
		  if me.Value then
		    itext.SelAlignment = itext.AlignCenter
		    
		    LButton.Value = false
		    RButton.Value = false
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RButton
	#tag Event
		Sub Action()
		  if me.Value then
		    itext.SelAlignment = itext.AlignRight
		    CButton.Value = false
		    LButton.Value = false
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FontButton
	#tag Event
		Sub Action()
		  if me.MenuValue>=0 then
		    
		    dim fontname as string = me.List(me.MenuValue)
		    
		    itext.SelTextFont = fontname
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  dim u as integer = FontCount-1
		  dim list() as string
		  
		  for i as integer = 0 to u
		    list.Append font(i)
		  next
		  
		  // sort
		  list.sort
		  
		  for each l as string in list
		    me.AddRow l
		  next
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
