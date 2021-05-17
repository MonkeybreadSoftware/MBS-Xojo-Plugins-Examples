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
   Height          =   652
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1234106367
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "JavaScript Pixel Editing"
   Visible         =   True
   Width           =   970
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   140
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   492
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   618
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea InputText
      AcceptTabs      =   True
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   364
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   332
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "function processPixels(width, height, count)\n{\n	var offset = 0;\n	var mem = globalThis.mem; // use local variable to make it faster\n\n	for (var n = 0; n < count; n++) // make it slower!\n	for (var y = 0; y < height; y++)\n	{\n		for (var x = 0; x < width; x++)\n		{\n			mem[offset + 0] = mem[offset + 0] * 0.8 + 0.2;\n			mem[offset + 1] = mem[offset + 1] * 0.8 + 0.2;\n			mem[offset + 2] = mem[offset + 2] * 0.8 + 0.2;\n			offset = offset + 3;\n		}\n	}\n\n	return 1;\n}"
      TextColor       =   &c00000000
      TextFont        =   "Courier"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   618
   End
   Begin PushButton EvalButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run in JavaScript"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   396
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas Canvas2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   332
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin PushButton EvalThreadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run in JavaScript Threaded"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin PushButton EvalThreadButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run 8 JavaScript Threads"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   544
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin ProgressWheel ProgressWheel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   756
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   454
      Transparent     =   False
      Visible         =   False
      Width           =   32
   End
   Begin PushButton EvalXojoButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run in Xojo"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   544
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   396
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label Label1
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
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "For below, please uncomment the for loop for n."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   428
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   618
   End
   Begin CheckBox CheckTimes
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "100 times"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   850
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      State           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   396
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // global JavaScript
		  jg = New MyJavaScriptEngineMBS
		  
		  InputPicture = LogoMBS(300)
		  OutputPicture = Nil
		  
		  canvas1.Backdrop = InputPicture
		  canvas2.Backdrop = OutputPicture
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub EvalJavaScript()
		  List.AppendRow "Run this in JavaScript"
		  
		  ProgressWheel1.Visible = True
		  
		  Dim je As MyJavaScriptEngineMBS = jg
		  
		  Dim m1 As Double = Microseconds
		  Dim w As Integer = InputPicture.Width
		  Dim h As Integer = InputPicture.Height
		  Dim m As New MemoryBlock(W * H * 3) 
		  Dim count As Integer = 1
		  If CheckTimes.Value Then
		    count = 100
		  end if
		  
		  Call InputPicture.CopyRGBtoMemoryblockMBS(m, 0)
		  
		  
		  Try
		    
		    // Pass Memoryblock To JavaScript as reference
		    je.GlobalMemoryBlock("mem") = m
		    je.AddFunction "processPixels", InputText.Text
		    
		    Dim v As Variant = je.CallFunction("processPixels", w, h, count)
		    
		    List.AppendRow "result: "+v.StringValue
		    
		    
		  Catch j As JavaScriptEngineExceptionMBS
		    
		    List.AppendRow "Exception: "+j.Message
		    
		  End Try
		  
		  
		  OutputPicture = MemoryblockRGBtoPictureMBS(m, 0, w, h)
		  canvas2.Backdrop = OutputPicture
		  
		  Dim m2 As Double = Microseconds
		  List.AppendRow Str((m2-m1)/1000, "0.0")+" ms"
		  
		  ProgressWheel1.Visible = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EvalJavaScriptMT(ThreadCount as integer)
		  List.AppendRow "Run "+Str(ThreadCount)+" threads with JavaScript."
		  
		  EvalThreadButton.Enabled = False
		  EvalThreadButton1.Enabled = False
		  
		  ProgressWheel1.Visible = True
		  
		  Dim StartTime As Double = Microseconds
		  
		  Dim w As Integer = InputPicture.Width
		  Dim h As Integer = InputPicture.Height
		  Dim NewScript As String = InputText.Text
		  Dim count As Integer = 1
		  If CheckTimes.Value Then
		    count = 100
		  End If
		  
		  
		  For i As Integer = 1 To ThreadCount
		    Dim je As New MyJavaScriptEngineMBS
		    
		    Dim m As New MemoryBlock(W * H * 3) 
		    Call InputPicture.CopyRGBtoMemoryblockMBS(m, 0)
		    
		    Dim t As New WorkThread
		    t.Width = w
		    t.Height = h
		    t.mem = m
		    t.NewScript = NewScript
		    t.StartTime = StartTime
		    t.je = je
		    t.count = count
		    t.ThreadCount = ThreadCount
		    
		    If MyThread = Nil Then
		      // let only last one report
		      MyThread = t
		      t.FinishMethod = AddressOf EvalJavaScriptMT_Finish
		    End If
		    
		    t.run
		    
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EvalJavaScriptMT_Finish()
		  Dim t As WorkThread = MyThread
		  
		  Dim m As MemoryBlock = t.mem
		  Dim w As Integer = t.Width
		  Dim h As Integer = t.Height
		  
		  OutputPicture = MemoryblockRGBtoPictureMBS(m, 0, w, h)
		  canvas2.Backdrop = OutputPicture
		  
		  Dim EndTime As Double = Microseconds
		  List.AppendRow t.result
		  List.AppendRow Str((EndTime-t.StartTime)/1000, "0.0")+" ms for running "+Str(t.ThreadCount)+" times, each on one preemptive thread."
		  
		  
		  ProgressWheel1.Visible = False
		  EvalThreadButton.Enabled = True
		  EvalThreadButton1.Enabled = True
		  MyThread = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EvalXojo1()
		  List.AppendRow "Run similar function in pure Xojo"
		  
		  #Pragma DisableBackgroundTasks True
		  
		  Dim m1 As Double = Microseconds
		  Dim w As Integer = InputPicture.Width
		  Dim h As Integer = InputPicture.Height
		  Dim m As New MemoryBlock(W * H * 3) 
		  Dim count As Integer = 1
		  If CheckTimes.Value Then
		    count = 100
		  End If
		  
		  Call InputPicture.CopyRGBtoMemoryblockMBS(m, 0)
		  
		  Dim offset As Integer = 0
		  
		  // ptr is faster than MemoryBlock
		  dim p as ptr = m
		  
		  For n As Integer = 1 To count
		    For y As Integer = 1 To h
		      For x As Integer = 1 To w
		        
		        p.UInt8(offset + 0) = p.UInt8(offset + 0) * 0.8 + 0.2
		        p.UInt8(offset + 1) = p.UInt8(offset + 1) * 0.8 + 0.2
		        p.UInt8(offset + 2) = p.UInt8(offset + 2) * 0.8 + 0.2
		        offset = offset + 3
		      Next
		    Next
		  Next
		  
		  OutputPicture = MemoryblockRGBtoPictureMBS(m, 0, w, h)
		  canvas2.Backdrop = OutputPicture
		  
		  Dim m2 As Double = Microseconds
		  List.AppendRow Str((m2-m1)/1000, "0.0")+" ms"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EvalXojo2()
		  List.AppendRow "Run similar function in pure Xojo"
		  
		  #Pragma DisableBackgroundTasks True
		  
		  Dim m1 As Double = Microseconds
		  Dim w As Integer = InputPicture.Width
		  Dim h As Integer = InputPicture.Height
		  Dim m As New MemoryBlock(W * H * 3) 
		  Dim count As Integer = 1
		  If CheckTimes.Value Then
		    count = 100
		  End If
		  
		  Call InputPicture.CopyRGBtoMemoryblockMBS(m, 0)
		  
		  Dim offset As Integer = 0
		  
		  For n As Integer = 1 To count
		    For y As Integer = 1 To h
		      For x As Integer = 1 To w
		        
		        m.UInt8Value(offset + 0) = m.UInt8Value(offset + 0) * 0.8 + 0.2
		        m.UInt8Value(offset + 1) = m.UInt8Value(offset + 1) * 0.8 + 0.2
		        m.UInt8Value(offset + 2) = m.UInt8Value(offset + 2) * 0.8 + 0.2
		        offset = offset + 3
		      Next
		    next
		  Next
		  
		  OutputPicture = MemoryblockRGBtoPictureMBS(m, 0, w, h)
		  canvas2.Backdrop = OutputPicture
		  
		  Dim m2 As Double = Microseconds
		  List.AppendRow Str((m2-m1)/1000, "0.0")+" ms"
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		InputPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		jg As MyJavaScriptEngineMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		MyThread As WorkThread
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputPicture As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub DoubleClick()
		  MsgBox me.Cell(me.ListIndex,0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EvalButton
	#tag Event
		Sub Action()
		  EvalJavaScript
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EvalThreadButton
	#tag Event
		Sub Action()
		  EvalJavaScriptMT 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  EvalJavaScriptMT_Finish
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EvalThreadButton1
	#tag Event
		Sub Action()
		  EvalJavaScriptMT 8
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EvalXojoButton
	#tag Event
		Sub Action()
		  EvalXojo1
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InputPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="OutputPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
