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
   Height          =   500
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1072270573
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Print Raw Data"
   Visible         =   True
   Width           =   314
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send PS"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   292
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextArea EditField1
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   234
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
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      Password        =   ""
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "%!PS\r.1 setgray\r0 0 100 100 rectfill\rshowpage"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   274
   End
   Begin ListBox ListBox1
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   156
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   324
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   274
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send File"
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   292
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu PopupMenu1
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
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   260
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   274
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send File 2"
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   292
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim w as WindowsAddPrintJobMBS
		  dim size as integer
		  
		  w=new WindowsAddPrintJobMBS
		  
		  if not w.OpenPrinter(PopupMenu1.Text) then
		    ListBox1.AddRow( "OpenPrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  else
		    ListBox1.AddRow( "Printer: "+hex(w.PrinterHandle))
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  end if
		  
		  if w.AddJob then
		    ListBox1.AddRow( "JobID: "+str(w.JobID))
		    ListBox1.AddRow( "JobPath: "+w.JobPath)
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  else
		    ListBox1.AddRow( "AddJob failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  size=w.WriteJob(EditField1.text)
		  ListBox1.AddRow( "Write: "+str(size))
		  ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  
		  if not w.ScheduleJob then
		    ListBox1.AddRow( "ScheduleJob failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  w=nil
		  ListBox1.AddRow( "finished." )
		  ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim w as WindowsAddPrintJobMBS
		  dim size as integer
		  dim f As FolderItem
		  dim binIn As BinaryStream
		  
		  f=GetOpenFolderItem("Alle" )
		  if f=NIL or f.Exists=False then
		    Return
		  end if
		  
		  w=new WindowsAddPrintJobMBS
		  
		  if not w.OpenPrinter(PopupMenu1.Text) then
		    ListBox1.AddRow( "OpenPrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  else
		    ListBox1.AddRow( "Printer: "+hex(w.PrinterHandle))
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  end if
		  
		  if w.AddJob then
		    ListBox1.AddRow( "JobID: "+str(w.JobID))
		    ListBox1.AddRow( "JobPath: "+w.JobPath)
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  else
		    ListBox1.AddRow( "AddJob failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  binIn=f.OpenAsBinaryFile(False)
		  size=w.WriteJob(binIn.Read(binIn.Length))
		  ListBox1.AddRow( "Write: "+str(size))
		  ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  binIn.Close
		  binIn=NIL
		  
		  if not w.ScheduleJob then
		    ListBox1.AddRow( "ScheduleJob failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  w=nil
		  ListBox1.AddRow( "finished." )
		  ListBox1.ScrollPosition = ListBox1.ListCount - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  if targetWin32 then
		    
		    // add printer names ot the popupmenu
		    for each w as WindowsPrinterInfoMBS in WindowsPrinterInfoMBS.LocalPrinters
		      me.addRow(w.PrinterName)
		    next
		    
		    // select first
		    me.listIndex=0
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  //
		  dim f As FolderItem = GetOpenFolderItem( "Alle" )
		  if f = NIL or f.Exists = False then
		    Return
		  end if
		  
		  //
		  dim w As New WindowsAddPrintJobMBS
		  
		  //
		  if not w.OpenPrinter( PopupMenu1.Text ) then
		    ListBox1.AddRow( "OpenPrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  else
		    ListBox1.AddRow( "Printer: " + Hex( w.PrinterHandle ) )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  end if
		  
		  //
		  if Not w.StartDocPrinter( f.Name, "", w.kDataFormatRAW ) then
		    ListBox1.AddRow( "StartDocPrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  if Not w.StartPagePrinter then
		    ListBox1.AddRow( "StartPagePrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  dim binIn As BinaryStream = f.OpenAsBinaryFile(false) // BinaryStream.Open( f )
		  dim size As Integer = w.WritePrinter( binIn.Read( binIn.Length ) )
		  ListBox1.AddRow( "Write: " + Str( size ) ) + " kb"
		  ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  binIn.Close
		  binIn=NIL
		  
		  if not w.EndPagePrinter then
		    ListBox1.AddRow( "EndPagePrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  if not w.EndDocPrinter then
		    ListBox1.AddRow( "EndDocPrinter failed." )
		    ListBox1.ScrollPosition = ListBox1.ListCount - 1
		    Return
		  end if
		  
		  w = nil
		  ListBox1.AddRow( "finished." )
		  ListBox1.ScrollPosition = ListBox1.ListCount - 1
		  
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
