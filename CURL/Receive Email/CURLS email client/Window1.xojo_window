#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   872
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1043562705
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   600
   Placement       =   0
   Resizeable      =   True
   Title           =   "CURL Email"
   Visible         =   True
   Width           =   1222
   Begin TextField Server
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Server"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   272
   End
   Begin TextField Username
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Username"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   301
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   272
   End
   Begin TextField Passwort
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Password"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   585
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   272
   End
   Begin Label ResultText
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   115
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   564
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "20%,20%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   241
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "From	To	Subject"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   47
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   634
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea DebugText
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
      Height          =   241
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   666
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
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   47
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   536
   End
   Begin RadioButton RadioPOP3
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "POP3"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   869
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   80
   End
   Begin RadioButton RadioIMAP
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "IMAP"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   961
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   70
   End
   Begin Listbox HeaderList
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   150
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Header	Value"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   333
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   461
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox RecipientsList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "50"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   150
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Name	Email"
      Italic          =   False
      Left            =   493
      LockBottom      =   False
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
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   333
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   709
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PopupMenu PopupAttachment
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   924
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   301
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   206
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
      Left            =   811
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Attachments:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   302
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   101
   End
   Begin TextArea PlainText
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
      Height          =   357
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   495
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   461
   End
   Begin HTMLViewer HTMLText
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   357
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   493
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   0
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   495
      Visible         =   True
      Width           =   709
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1142
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   302
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin TextField Subject
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Subject"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   300
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   779
   End
   Begin PushButton MailButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Get EMails"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1034
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   168
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   10
      Scope           =   0
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CurlMulti = new MyCURLSMulti
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(label as string, list as MimeAddressListMBS)
		  if list = nil then Return
		  
		  for each a as MimeAddressMBS in list.Addresses
		    if a.isGroup then
		      Add label, a.Group
		    else
		      Add label, a.Mailbox
		    end if
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(label as string, g as MimeGroupMBS)
		  if g = nil then Return
		  
		  dim emails() as string
		  for each m as MimeMailboxMBS in g.Mailboxes
		    emails.Append m.Email
		  next
		  RecipientsList.AddRow "to", g.NameDecoded, Join(emails, ", ")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(label as string, list as MimeMailboxListMBS)
		  if list = nil then Return
		  
		  for each m as MimeMailboxMBS in list.Mailboxes
		    Add label, m
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(label as string, m as MimeMailboxMBS)
		  if m = nil then Return
		  
		  RecipientsList.AddRow label, m.LabelDecoded, m.Email
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearEmail()
		  HeaderList.DeleteAllRows
		  RecipientsList.DeleteAllRows
		  PlainText.Text = ""
		  Subject.Text = ""
		  PopupAttachment.DeleteAllRows
		  PopupAttachment.Enabled = False
		  SaveButton.Enabled = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueryList()
		  MailButton.Enabled = False
		  List.DeleteAllRows
		  ClearEmail
		  redim EmailsToQuery(-1)
		  
		  
		  // imap
		  dim curl as new MyCURL
		  
		  // ask for TLSv1.2
		  curl.OptionSSLVersion = curl.kSSLVersionTLSv12
		  curl.OptionUseSSL = curl.kUseSSLall
		  
		  
		  If RadioIMAP.Value Then
		    curl.imap = True
		    curl.OptionURL = "imap://"+Server.Text+"/INBOX"
		    curl.OptionCustomRequest = "FETCH 1:* FLAGS"
		  Elseif RadioPOP3.Value Then
		    curl.pop3 = true
		    curl.OptionURL = "pop3://"+Server.Text+"/"
		  else
		    Break
		    Return
		  end if
		  curl.OptionUsername = Username.Text
		  curl.OptionPassword = Passwort.Text
		  AddHandler curl.Finished, WeakAddressOf QueryListFinished
		  
		  call CurlMulti.AddCURL curl
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueryListFinished(c as MyCURL, Result as Integer)
		  // show debug info
		  dim s as string = c.DebugData
		  if s.Encoding = nil then
		    s = DefineEncoding(s, encodings.ISOLatin1)
		  end if
		  s = ReplaceLineEndings(s, EndOfLine)
		  DebugText.Text = s
		  
		  // problem?
		  if result <> 0 then
		    MailButton.Enabled = true
		    MsgBox "CURL Error code: "+str(result)
		    Return
		  end if
		  
		  // parse list
		  
		  dim content as string = c.OutputData
		  if content.Encoding = nil then
		    content = DefineEncoding(content, encodings.ISOLatin1)
		  end if
		  content = ReplaceLineEndings(content, EndOfLine)
		  
		  
		  EmailsToQuery = Split(content, EndOfLine)
		  
		  QueryNextEmail
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueryNextEmail()
		  if EmailsToQuery.Ubound = -1 then Return // done
		  
		  dim EmailID as string = EmailsToQuery.pop
		  
		  EmailID = trim(EmailID)
		  if EmailID = "" then
		    QueryNextEmail
		    Return
		  end if
		  
		  
		  dim curl as new MyCURL
		  
		  
		  // ask for TLSv1.2
		  curl.OptionSSLVersion = curl.kSSLVersionTLSv12
		  curl.OptionUseSSL = curl.kUseSSLall
		  
		  
		  if RadioIMAP.Value then
		    // * 6 FETCH (FLAGS (\Seen))
		    
		    if left(EmailID,2) = "* " then
		      // ok
		      
		      EmailID = NthField(EmailID, " ", 2)
		      
		    else
		      break // unexpected?
		      Return
		    end if
		    
		    // imap
		    curl.OptionURL = "imap://"+Server.Text+"/INBOX;UID="+EmailID
		  elseif RadioPOP3.Value then
		    EmailID = NthField(EmailID, " ", 1)
		    curl.OptionURL = "pop3://"+Server.Text+"/"+EmailID
		  else
		    Break
		    Return
		  end if
		  
		  curl.OptionUsername = Username.Text
		  curl.OptionPassword = Passwort.Text
		  AddHandler curl.Finished, WeakAddressOf QueryNextEmailFinished
		  
		  call CurlMulti.AddCURL curl
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QueryNextEmailFinished(c as MyCURL, Result as Integer)
		  // show debug info
		  dim s as string = c.DebugData
		  if s.Encoding = nil then
		    s = DefineEncoding(s, encodings.ISOLatin1)
		  end if
		  s = ReplaceLineEndings(s, EndOfLine)
		  DebugText.Text = s
		  
		  // problem?
		  if result <> 0 then
		    MailButton.Enabled = true
		    MsgBox "CURL Error code: "+str(result)
		    Return
		  end if
		  
		  
		  QueryNextEmail
		  
		  
		  dim content as string = c.OutputData
		  
		  // parse
		  dim e as MimeEmailMBS
		  
		  try
		    e = new MimeEmailMBS(content)
		    
		    List.AddRow e.FromLabel, e.ToLabel, e.Subject
		    List.RowTag(List.LastIndex) = e
		    
		  catch ex as runtimeException
		    // a few things could go wrong
		    MsgBox Introspection.GetType(ex).fullname+EndOfLine+EndOfLine+ex.message
		    return
		  end try
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowEmail(e as MimeEmailMBS)
		  // clear
		  ClearEmail
		  
		  if e = nil then Return
		  
		  Subject.Text = e.Subject
		  PlainText.Text = e.PlainText
		  
		  dim h as MimeHeaderMBS = e.Header
		  for each ff as MimeFieldMBS in h.Fields
		    HeaderList.AddRow ff.Name, ff.Value
		  next
		  
		  Add "from", h.from
		  Add "to", h.too
		  Add "cc", h.cc
		  Add "bcc", h.bcc
		  Add "replyto", h.replyto
		  Add "sender", h.sender
		  
		  dim Attachments() as MimeAttachmentMBS = e.Attachments
		  dim Inlines()     as MimeAttachmentMBS = e.Inlines
		  
		  for each a as MimeAttachmentMBS in Attachments
		    PopupAttachment.AddRow a.Filename
		    PopupAttachment.RowTag(PopupAttachment.ListCount-1) = a
		  next
		  
		  if TargetMacOS and Inlines.ubound >= 0 and Attachments.ubound >= 0 then
		    PopupAttachment.AddSeparator
		  end if
		  
		  for each a as MimeAttachmentMBS in Inlines
		    PopupAttachment.AddRow a.Filename
		    PopupAttachment.RowTag(PopupAttachment.ListCount-1) = a
		  next
		  
		  ShowHTML e
		  PopupAttachment.Enabled = True
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowHTML(e as MimeEmailMBS)
		  dim HTML as string = e.HTMLText
		  
		  // patch html with charset = UTF-8 if needed
		  if html.Encoding = encodings.UTF8 then
		    dim p as integer = instr(HTML, "<head>")
		    if p > 0 then
		      HTML = ReplaceAll(HTML, "<head>", "<head><meta charset=""utf-8"" />")
		    end if
		  end if
		  
		  // not the best way
		  // but to write in temp folder the inlines and referencing them in html works
		  
		  
		  dim tmpfolder as FolderItem = SpecialFolder.Temporary.Child("temp email viewer "+str(rnd*1000000,"000000"))
		  tmpfolder.CreateAsFolder
		  
		  for each a as MimeAttachmentMBS in e.Inlines
		    dim Filename as string = a.Filename
		    Filename = ConvertEncoding(Filename, encodings.ASCII)
		    
		    Filename = ReplaceAll(Filename, " ", "_")
		    Filename = ReplaceAll(Filename, "?", "_")
		    Filename = ReplaceAll(Filename, ":", "_")
		    
		    dim f as FolderItem = tmpfolder.Child(Filename)
		    dim b as BinaryStream = BinaryStream.Create(f, true)
		    b.Write a.Data
		    
		    dim ID as string = a.contentId
		    if id.Left(1) = "<" then
		      id = mid(id,2)
		    end if
		    if id.Right(1) = ">" then
		      id = left(id, len(id)-1)
		    end if
		    
		    html = Replace(html, "cid:"+id, Filename)
		    
		  next
		  
		  // now write html and load it
		  
		  dim f as FolderItem = tmpfolder.Child("email.html")
		  dim b as BinaryStream = BinaryStream.Create(F, true)
		  b.Write HTML
		  
		  HTMLText.LoadPage f
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurlMulti As MyCURLSMulti
	#tag EndProperty

	#tag Property, Flags = &h0
		EmailsToQuery() As string
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  if me.ListIndex >= 0 then
		    dim e as MimeEmailMBS = me.RowTag(me.ListIndex)
		    
		    ShowEmail e
		  else
		    ClearEmail 
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupAttachment
	#tag Event
		Sub Change()
		  SaveButton.Enabled = me.ListIndex >= 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  if PopupAttachment.ListIndex = -1 then Return
		  
		  dim a as MimeAttachmentMBS = PopupAttachment.RowTag(PopupAttachment.ListIndex)
		  
		  if a = nil then Return
		  
		  dim f as FolderItem = GetSaveFolderItem("", a.Filename)
		  
		  if f = nil then Return
		  
		  dim b as BinaryStream = BinaryStream.Create(f, true)
		  
		  b.Write a.data
		  b.Close
		  
		  Exception io as IOException
		    MsgBox "Failed to write file."+EndOfLine+EndOfLine+io.message
		    
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MailButton
	#tag Event
		Sub Action()
		  if server.Text.len = 0 then
		    MsgBox "please enter a server!"
		    Return
		  end if
		  
		  QueryList
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  CurlMulti.Perform
		  
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
