#tag Window
Begin Window MassEmailWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   653
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1107831403
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Mass Email"
   Visible         =   True
   Width           =   1224
   Begin TextArea InputEmails
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
      Height          =   523
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   0.0
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
      Text            =   "Youremail@yourserver.test	Your Name"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   247
   End
   Begin Label StaticText1
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Sending to"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   175
   End
   Begin TextField SubjectLine
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   279
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   630
   End
   Begin Label StaticText2
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
      Left            =   279
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Subject:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin Label StaticText3
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
      Left            =   279
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Content:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   80
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1124
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   612
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label StaticText4
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
      Left            =   219
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "From:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   581
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   48
   End
   Begin TextField InputFrom
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   279
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "from@yourserver.test"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   581
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   630
   End
   Begin Listbox status
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
      Height          =   555
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   921
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      ShowDropIndicator=   False
      TabIndex        =   10
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
      Width           =   283
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField InputBCC
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   279
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "yourmailbox@yourserver.test"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   612
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   630
   End
   Begin Label StaticText5
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
      Left            =   219
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "BCC:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   612
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   48
   End
   Begin CheckBox CheckDebug
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Debug"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   809
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin Timer StartTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   5000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin CheckBox CheckDelay
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Delay Sending"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   921
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      State           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   612
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   118
   End
   Begin PushButton AttachButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select Attachments"
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
      Scope           =   "0"
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   581
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   175
   End
   Begin Label Filename
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   612
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   187
   End
   Begin ProgressBar bar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   921
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   581
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   283
   End
   Begin Timer BarTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   457
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   279
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Panels          =   ""
      Scope           =   "0"
      SmallTabs       =   False
      TabDefinition   =   "Plain Text\rHTML"
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   112
      Transparent     =   True
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   630
      Begin TextArea PlainTextField
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
         Height          =   399
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   299
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   0.0
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
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Hello %name%,"
         TextColor       =   
         TextFont        =   "Courier"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   150
         Transparent     =   True
         Underline       =   False
         UnicodeMode     =   0
         UseFocusRing    =   True
         Visible         =   True
         Width           =   590
      End
      Begin TextArea HTMLTextField
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
         Height          =   399
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   299
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   0.0
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "Courier"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   150
         Transparent     =   True
         Underline       =   False
         UnicodeMode     =   0
         UseFocusRing    =   True
         Visible         =   True
         Width           =   590
      End
   End
   Begin Timer CURLTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   10
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stop"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1032
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   612
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PasteButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Paste"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   829
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   80
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  for each s as MyCURL in curls
		    if s.Started = false then
		      MsgBox "Da wird noch gesendet."
		      Return true
		    end if
		  next
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  if t<>nil then
		    t.Close
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim d as new date
		  dim s as string = d.SQLDateTime.ReplaceAll(":", "-")
		  dim f as new FolderItem("MassEmail log "+s+".txt")
		  
		  if f.Exists then
		    t=f.AppendToTextFile
		  else
		    t=f.CreateTextFile
		  end if
		  
		  
		  
		  CurlMulti = new MyCURLMulti
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ConvertToASCII(s as string) As string
		  Return ConvertEncoding(s,encodings.ASCII)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToISO(s as string) As string
		  s=ConvertEncoding(s,encodings.ISOLatin1)
		  
		  
		  
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertToQuotedPrintable(s as string) As string
		  Return EncodeQuotedPrintable(s)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Finished()
		  for each c as MyCURL in curls
		    if not c.started then
		      Return
		    end if
		  next
		  
		  log "All finished"
		  CURLTimer.Mode = 0
		  
		  dim Emails() as string
		  dim FEmails() as string
		  for each c as MyCURL in curls
		    emails.Append c.EmailLine
		    if c.Failed then
		      FEmails.Append c.EmailLine
		    end if
		  next
		  
		  InputEmails.Text = Join(femails, EndOfLine)
		  
		  redim curls(-1)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(s as string, error as Boolean = false)
		  try
		    
		    if t <> nil then
		      t.WriteLine s
		      t.Flush
		    end if
		    
		  catch io as IOException
		    status.AddRow "IOException in writing log!"
		    t = nil
		  end try
		  
		  status.AddRow s
		  status.CellTag(status.LastIndex, 0) = error
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunningCount() As Integer
		  dim n as integer = 0
		  
		  for each c as MyCURL in curls
		    if c.Finished then 
		      Continue
		    end if
		    if c.started then
		      n = n + 1
		    end if
		  next
		  
		  Return n
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send()
		  dim InputText as string = InputEmails.Text.trim
		  if InputText = "" then
		    // email recipient for testing
		    dim tab as string = encodings.utf8.chr(9)
		    
		    InputText = "zivi@me.com"+tab+"Your Name" // <-- change
		  end if
		  
		  dim EmailAddresses(-1) as string = split(ReplaceLineEndings(InputText, EndOfLine),EndOfLine)
		  dim r as new random
		  
		  if t=nil then
		    MsgBox "no log file?"
		    Return
		  end if
		  
		  redim curls(-1)
		  EmailAddresses.Shuffle
		  
		  dim count as integer
		  
		  dim EmailAddressesUbound as integer = UBound(EmailAddresses)
		  
		  if EmailAddressesUbound > 3 and CheckDebug.Value then
		    MsgBox "Don't debug send with so many emails."
		    Return
		  end if
		  
		  
		  for ia as integer = 0 to EmailAddressesUbound
		    
		    count = count + 1
		    
		    dim CurrentEmailAddress as string = EmailAddresses(ia)
		    
		    CurrentEmailAddress = trim(CurrentEmailAddress)
		    if len(CurrentEmailAddress)>0 then
		      dim BodyPlainText as string = PlainTextField.text
		      dim HTMLText as string = HTMLTextField.text
		      
		      if len(HTMLText)>3 then
		        HTMLText = EncodingToHTMLMBS(HTMLText, 1)
		      end if
		      
		      
		      dim emailaddress as string = NthField(CurrentEmailAddress,chr(9),1)
		      
		      if CheckDebug.Value then
		        emailaddress = "zivi@mac.com" // <-- change
		      end if
		      
		      dim name as string = NthField(CurrentEmailAddress,chr(9),2)
		      dim text as string = NthField(CurrentEmailAddress,chr(9),3)
		      dim EmailID as string = NthField(CurrentEmailAddress,chr(9),4)
		      
		      if name = "" and instr(BodyPlainText, "%name")>0 then
		        MsgBox "%name found, but no Names!"
		        Return
		      end if
		      
		      if text = "" and instr(BodyPlainText, "%text")>0 then
		        MsgBox "%text found, but not texts!"
		        Return
		      end if
		      
		      if name = "" and instr(HTMLText, "%name")>0 then
		        MsgBox "%name found, but no names!"
		        Return
		      end if
		      
		      if text = "" and instr(HTMLText, "%text")>0 then
		        MsgBox "%text found, but no texts!"
		        Return
		      end if
		      
		      if len(EmailID)>0 then
		        BodyPlainText = ReplaceAll(BodyPlainText, "**EmailID**", EmailID)
		        HTMLText = ReplaceAll(HTMLText, "**EmailID**", EncodingToHTMLMBS(EmailID))
		      end if
		      if len(text)>0 then
		        BodyPlainText = ReplaceAll(BodyPlainText, "%text%", text)
		        HTMLText = ReplaceAll(HTMLText, "%text%", EncodingToHTMLMBS(text))
		      end if
		      if len(name)>0 then
		        BodyPlainText=ReplaceAll(BodyPlainText, "%name%", name)
		        HTMLText = ReplaceAll(HTMLText, "%name%", EncodingToHTMLMBS(name))
		      end if
		      
		      dim Subject as string = SubjectLine.text
		      
		      if len(text)>0 then
		        Subject=ReplaceAll(Subject, "%text%", text)
		      end if
		      if len(name)>0 then
		        Subject=ReplaceAll(Subject, "%name%", name)
		      end if
		      
		      dim from as string = InputFrom.text
		      
		      BodyPlainText = ReplaceLineEndings(BodyPlainText, EndOfLine.windows)
		      HTMLText = ReplaceLineEndings(HTMLText, EndOfLine.windows)
		      
		      
		      dim email as new CURLEmailMBS
		      
		      if BodyPlainText.len > 3 then
		        email.PlainText = BodyPlainText
		      end if
		      if HTMLText.len > 3 then
		        email.HTMLText = HTMLText
		      end if
		      
		      
		      email.SMTPUsername = "xxx" // <-- change
		      email.SMTPServer   = "sslout.df.eu" // <-- change
		      email.SMTPPassword = "xxx" // <-- change
		      email.Subject = subject
		      
		      
		      
		      email.SetFrom from, "Your Name" // <-- change
		      
		      email.AddHeader "X-Mailer: MBS Emailer"
		      email.AddTo emailaddress, name
		      
		      dim BCC as string = InputBCC.text.trim
		      if BCC.len>0 then
		        email.AddBCC BCC, "Your Name" // <-- change
		      end if
		      
		      
		      for each file as FolderItem in files
		        dim b as BinaryStream = BinaryStream.Open(file)
		        dim data as string = b.Read(b.Length)
		        
		        email.AddAttachment data, file.Name
		      next
		      
		      
		      
		      
		      dim curl as new MyCURL
		      curl.OptionBufferSize = 16*1024
		      
		      if curl.SetupEmail(email) then
		        // ok
		      else
		        dim curlLasterror as integer = curl.Lasterror
		        Break // problem?
		      end if
		      
		      curl.email = email
		      curl.YieldTime = true
		      curl.OptionVerbose = true
		      curl.CollectOutputData = true
		      curl.CollectDebugData = true
		      curl.OptionPort = 587 // <-- change
		      curl.OptionSSLVerifyHost = 2
		      curl.OptionSSLVerifyPeer = 1
		      #if RBVersion >= 2013 then
		        curl.OptionCAInfo = SpecialFolder.Preferences.Child("sslout.df.eu.cer").NativePath // <-- change
		      #else
		        curl.OptionCAInfo = SpecialFolder.Preferences.Child("sslout.df.eu.cer").UnixpathMBS // <-- change
		      #endif
		      curl.OptionUseSSL = curl.kFTPSSL_ALL
		      curl.OptionSSLVersion = curl.kSSLVersionTLSv12
		      curl.destEmail = emailaddress
		      curl.EmailLine = CurrentEmailAddress
		      curl.CurlMulti = CurlMulti
		      curl.Started = false
		      curl.failed = false
		      
		      curls.append curl
		      
		      if not CheckDelay.Value then
		        curl.sendMail
		      end if
		    end if
		  next
		  
		  
		  
		  log str(count)+" sockets..."
		  StartTimer.Mode = 2
		  CURLTimer.Mode = 2
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurlMulti As MyCURLMulti
	#tag EndProperty

	#tag Property, Flags = &h0
		curls() As MyCURL
	#tag EndProperty

	#tag Property, Flags = &h0
		failed As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		files(-1) As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		t As TextOutputStream
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  send
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events status
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row < me.ListCount and row <> me.ListIndex then
		    
		    dim error as Boolean = me.CellTag(row, column)
		    
		    if error then
		      
		      g.ForeColor = &cFFCCCC
		      g.FillRect 0, 0, g.Width, g.Height
		      
		      return true
		    end if
		    
		  end if
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CheckDebug
	#tag Event
		Sub Open()
		  me.Value=DebugBuild
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartTimer
	#tag Event
		Sub Action()
		  dim r as integer = RunningCount
		  
		  if r > 10 then
		    Return
		  end if
		  
		  for each s as MyCURL in curls
		    if s.Started = false then
		      s.SendMail
		      Return
		    end if
		  next
		  
		  log "All SMTP Sockets started." 
		  me.Mode = 0
		  bar.Value = bar.Maximum
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AttachButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  redim files(-1)
		  
		  if f<>Nil then
		    files.Append f
		    Filename.text = f.name
		  else
		    Filename.text = ""
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BarTimer
	#tag Event
		Sub Action()
		  dim count as integer = UBound(curls)+1
		  dim Finished as integer = 0
		  
		  for each s as MyCURL in curls
		    if s.Finished then
		      Finished = Finished + 1
		    end if
		  next
		  
		  
		  if count = 0 then
		    
		    if bar.Maximum<>1 then
		      bar.Maximum = 1
		    end if
		    
		    if bar.Value<>0 then
		      bar.Value = 0
		    end if
		    
		  else
		    
		    if bar.Maximum<>count then
		      bar.Maximum = count
		    end if
		    
		    if bar.Value<>Finished then
		      bar.Value = Finished
		    end if
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CURLTimer
	#tag Event
		Sub Action()
		  CurlMulti.Perform
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  StartTimer.mode = 0
		  CURLTimer.Mode = 0
		  
		  if CurlMulti <> nil then
		    redim CurlMulti.queue(-1)
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PasteButton
	#tag Event
		Sub Action()
		  dim c as new Clipboard
		  dim s as string = c.Text
		  s = ReplaceLineEndings(s, EndOfLine)
		  
		  dim lines() as string = split(s, EndOfLine)
		  
		  if lines.Ubound > 2 and lines(1).trim <> "" then
		    // nothing
		    
		    PlainTextField.Text = s
		    
		  else
		    
		    SubjectLine.Text = lines(0)
		    
		    lines.Remove 0
		    lines.Remove 0
		    
		    PlainTextField.Text = Join(lines, EndOfLine)
		    
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
	#tag ViewProperty
		Name="failed"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
