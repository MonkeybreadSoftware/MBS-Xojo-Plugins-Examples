#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   916
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2022557845
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Email Viewer"
   Visible         =   True
   Width           =   974
   Begin PushButton LoadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open Email..."
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   130
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   229
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
      Top             =   46
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   229
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
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   461
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PopupMenu PopupAttachment
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
      Left            =   676
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
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
      Left            =   563
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Attachments:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
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
      Height          =   609
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
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   287
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
      Height          =   609
      HelpTag         =   ""
      Index           =   -2147483648
      Left            =   493
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Renderer        =   0
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   287
      Transparent     =   True
      Visible         =   True
      Width           =   461
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
      Left            =   894
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
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
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   162
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   389
   End
End
#tag EndWindow

#tag WindowCode
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
		Sub load(f as FolderItem)
		  // clear
		  HeaderList.DeleteAllRows
		  RecipientsList.DeleteAllRows
		  PlainText.Text = ""
		  Subject.Text = ""
		  PopupAttachment.DeleteAllRows
		  
		  // parse
		  dim e as MimeEmailMBS
		  
		  try
		    e = new MimeEmailMBS(f)
		    
		  catch ex as runtimeException
		    // a few things could go wrong
		    MsgBox Introspection.GetType(ex).fullname+EndOfLine+EndOfLine+ex.message
		  end try
		  
		  Subject.Text = e.Subject
		  PlainText.Text = e.PlainText
		  
		  if e.Date <> nil then
		    HeaderList.AddRow "Date parsed", e.Date.SQLDateTime
		  end if
		  
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
		  
		  PopupAttachment.Enabled = True
		  
		  
		  ShowHTML e
		  
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


#tag EndWindowCode

#tag Events LoadButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.All)
		  
		  if f = nil then Return
		  
		  load f
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
