#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   644
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1490233343
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "FileMaker Data API Test"
   Visible         =   True
   Width           =   832
   Begin PushButton GetProductInfoButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Product Info"
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
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin TextArea ResultTextArea
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
      Height          =   299
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   182
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   630
   End
   Begin TextArea DebugTextArea
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
      Height          =   260
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   182
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
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   364
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   630
   End
   Begin TextField ResultField
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
      Left            =   182
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   19
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   630
   End
   Begin PushButton DatabaseNamesButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Database Names"
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
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton LayoutNamesButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Layout Names"
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
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   149
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton ScriptNamesButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Script Names"
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
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   85
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PopupMenu LayoutMenu
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
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   181
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton LayoutMetadataButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Layout MetaData"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   245
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton GetRecordsButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Get Records"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   277
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin TextField RecordIDField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Record ID"
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
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   309
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   150
   End
   Begin PushButton GetRecordButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Get Record"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   343
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PopupMenu ScriptMenu
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
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   117
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton ExecuteScriptButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Execute Script"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   214
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton DuplicateRecordButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Duplicate Record"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   375
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton SetGlobalFieldsButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Set Global Field"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   407
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton CreateRecordButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Create Record"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   439
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton EditRecordButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Edit Record"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   471
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin PushButton UploadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Upload Container"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   537
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin TextField ModIDField
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   "Mod ID"
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
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   503
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   150
   End
   Begin PushButton DeleteRecordButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   True
      Caption         =   "Delete Record"
      Default         =   False
      Enabled         =   False
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
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   569
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub ShowRecords()
		  If response.ErrorCode = 0 Then
		    
		    Dim w As New RecordsWindow
		    
		    w.Setup response.Result
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateButtons()
		  Dim HasLayout As Boolean = LayoutMenu.ListIndex >= 0
		  
		  GetRecordsButton.Enabled = HasLayout
		  LayoutMetadataButton.Enabled = HasLayout
		  RecordIDField.Enabled = HasLayout
		  SetGlobalFieldsButton.Enabled = HasLayout
		  CreateRecordButton.Enabled = HasLayout
		  
		  Dim HasRecordID As Boolean = RecordIDField.Text.Len > 0
		  
		  GetRecordButton.Enabled = HasLayout And HasRecordID
		  DuplicateRecordButton.Enabled = HasLayout And HasRecordID
		  EditRecordButton.Enabled = HasLayout And HasRecordID
		  
		  Dim HasScript As Boolean = ScriptMenu.ListIndex >= 0
		  
		  ExecuteScriptButton.Enabled = HasScript And HasLayout
		  
		  Dim HasModID As Boolean = ModIDField.Text.Len > 0
		  UploadButton.Enabled = HasLayout And HasRecordID And HasModID
		  
		  
		  DeleteRecordButton.Enabled = HasLayout And HasRecordID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateResponse()
		  If response = Nil Then
		    
		    ResultField.Text = "No response!"
		    DebugTextArea.Text  = ""
		    ResultTextArea.Text = ""
		    
		  Else
		    
		    ResultField.Text = Str(response.ErrorCode)+" "+response.ErrorMessage
		    
		    Dim Debug As String = response.DebugMessages
		    If response.ErrorCode <> 0 Then
		      Debug = Debug + EndOfLine + EndOfLine + response.RawResultJSON
		    End If
		    
		    DebugTextArea.Text  = ReplaceLineEndings(Debug, EndOfLine)
		    ResultTextArea.Text = ReplaceLineEndings(response.ResultJSON, EndOfLine)
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WalkLayouts(layouts() as Variant, names() as string)
		  
		  For Each entry As Dictionary In layouts
		    Dim name As String = entry.Value("name")
		    Dim isFolder As Boolean = entry.Lookup("isFolder", False)
		    If isFolder Then
		      // look one level deep
		      Dim folderLayoutNames() As Variant = entry.Value("folderLayoutNames")
		      WalkLayouts folderLayoutNames, Names
		      
		    Else
		      Names.Append name
		      LayoutMenu.AddRow name
		      
		    End If
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub WalkScripts(scripts() as Variant, Names() as string, Prefix as string)
		  
		  For Each entry As Dictionary In scripts
		    Dim name As String = entry.Value("name")
		    Dim isFolder As Boolean = entry.Lookup("isFolder", False)
		    If isFolder Then
		      // look one level deep
		      Dim NewScripts() As Variant = entry.Value("folderScriptNames")
		      WalkScripts NewScripts, Names, Prefix + name + " > "
		      
		    Else
		      Names.Append name
		      ScriptMenu.AddRow name
		      
		    End If
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		connection As FMDataMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		response As FMResponseMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events GetProductInfoButton
	#tag Event
		Sub Action()
		  response = connection.ProductInfo
		  
		  UpdateResponse
		  
		  // {"response":{"productInfo":{"name":"FileMaker Data API Engine","buildDate":"07/28/2020","version":"19.1.1.54","dateFormat":"MM/dd/yyyy","timeFormat":"HH:mm:ss","timeStampFormat":"MM/dd/yyyy HH:mm:ss"}},"messages":[{"code":"0","message":"OK"}]}
		  
		  If response.ErrorCode = 0 Then
		    // show version number in dialog box
		    
		    Dim result As Dictionary = response.Result
		    
		    Dim productInfo As Dictionary = result.value("productInfo")
		    If productInfo <> Nil Then
		      Dim version As String = productInfo.Value("version")
		      MsgBox version
		    End If
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DatabaseNamesButton
	#tag Event
		Sub Action()
		  response = connection.DatabaseNames
		  
		  UpdateResponse
		  
		  // {"response":{"databases":[{"name":"Contacts"}]},"messages":[{"code":"0","message":"OK"}]}
		  
		  If response.ErrorCode = 0 Then
		    // show names of databases in dialog box
		    
		    Dim result As Dictionary = response.Result
		    dim Names() as string
		    Dim databases() As Variant = result.Value("databases")
		    
		    For Each entry As Dictionary In databases
		      Dim name As String = entry.Value("name")
		      Names.Append name
		    Next
		    
		    MsgBox "Database Names" + EndOfLine + EndOfLine + Join(names, EndOfLine)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LayoutNamesButton
	#tag Event
		Sub Action()
		  response = connection.LayoutNames
		  
		  UpdateResponse
		  
		  // {"response":{"layouts":[{"name":"Contacts","table":""},{"name":"Contacts Details","table":""}]},"messages":[{"code":"0","message":"OK"}]}
		  
		  If response.ErrorCode = 0 Then
		    LayoutMenu.DeleteAllRows
		    Dim result As Dictionary = response.Result
		    
		    Dim layouts() As Variant = result.Value("layouts")
		    Dim Names() As String
		    
		    WalkLayouts Layouts, Names
		    
		    'MsgBox "Layout Names" + EndOfLine + EndOfLine + Join(names, EndOfLine)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScriptNamesButton
	#tag Event
		Sub Action()
		  response = connection.ScriptNames
		  
		  UpdateResponse
		  
		  If response.ErrorCode = 0 Then
		    ScriptMenu.DeleteAllRows
		    Dim result As Dictionary = response.Result
		    
		    Dim scripts() As Variant = result.Value("scripts")
		    Dim Names() As String
		    WalkScripts scripts, Names, ""
		    
		    'MsgBox "Script Names" + EndOfLine + EndOfLine + Join(names, EndOfLine)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LayoutMenu
	#tag Event
		Sub Change()
		  UpdateButtons
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LayoutMetadataButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  response = connection.LayoutMetadata("")
		  
		  UpdateResponse
		  
		  // {"response":{"fieldMetaData":[{"name":"SomeText","type":"normal","displayType":"editText","result":"text","global":false,"autoEnter":false,"fourDigitYear":false,"maxRepeat":1,"maxCharacters":0,"notEmpty":false,"numeric":false,"timeOfDay":false,"repetitionStart":1,"repetitionEnd":1},...
		  
		  If response.ErrorCode = 0 Then
		    Dim result As Dictionary = response.Result
		    Dim fields() As Variant = result.value("fieldMetaData")
		    
		    Dim Names() As String
		    
		    For Each entry As Dictionary In fields
		      Dim name As String = entry.Value("name")
		      Names.Append name
		    Next
		    
		    MsgBox "Field Names" + EndOfLine + EndOfLine + Join(names, EndOfLine)
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetRecordsButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  Dim request As New FMRequestMBS
		  
		  // doesn't work?
		  'request.sort = "[{""fieldName"":""SomeNumber"",""sortOrder"":""descent""}]"
		  
		  response = connection.GetRecords(request)
		  
		  UpdateResponse
		  
		  ShowRecords
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RecordIDField
	#tag Event
		Sub TextChange()
		  UpdateButtons
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetRecordButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  Dim request As New FMRequestMBS
		  
		  request.sort = "SomeText"
		  
		  response = connection.GetRecord(request, RecordIDField.Text.Trim)
		  
		  UpdateResponse
		  
		  ShowRecords 
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScriptMenu
	#tag Event
		Sub Change()
		  UpdateButtons
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ExecuteScriptButton
	#tag Event
		Sub Action()
		  connection.Layout = LayoutMenu.text
		  
		  Dim scriptName As String = ScriptMenu.Text
		  
		  response = connection.ExecuteScript(scriptName, "TestParam")
		  
		  UpdateResponse
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DuplicateRecordButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  
		  Dim request As New FMRequestMBS
		  
		  response = connection.DuplicateRecord(request, RecordIDField.Text.Trim)
		  
		  UpdateResponse
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetGlobalFieldsButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  
		  Dim request As New FMRequestMBS
		  
		  Dim dic As New Dictionary
		  dim now as new date
		  
		  // you may need to create such a field!
		  
		  dic.Value("Contacts::MyGlobalField") = "Hello World "+now.ShortTime
		  
		  response = connection.SetGlobalFields(dic)
		  
		  UpdateResponse
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CreateRecordButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  
		  Dim request As New FMRequestMBS
		  dim fieldData as new Dictionary
		  
		  fieldData.Value("First Name") = "Joe"
		  fieldData.Value("Last Name") = "Smith"
		  fieldData.Value("Title") = "Mr."
		  fieldData.Value("Company") = "Test Ltd."
		  fieldData.Value("Website") = "http://www.mbs-plugins.com/"
		  
		  request.fieldData = fieldData
		  
		  response = connection.CreateRecord(request)
		  
		  UpdateResponse
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EditRecordButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  
		  Dim request As New FMRequestMBS
		  dim fieldData as new Dictionary
		  
		  fieldData.Value("First Name") = "Bob"
		  fieldData.Value("Last Name") = "Miller"
		  
		  request.fieldData = fieldData
		  
		  response = connection.EditRecord(request, RecordIDField.text.trim)
		  
		  UpdateResponse
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UploadButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  
		  Dim request As New FMRequestMBS
		  
		  Dim upload As New FMContainerUploadMBS
		  
		  upload.ContainerFieldName = "SomeContainer"
		  upload.RecordId = RecordIDField.Text
		  upload.ModId = ModIDField.Text.trim
		  
		  If Keyboard.AsyncShiftKey Then
		    upload.DataString = "Hello World"
		    upload.FileName = "Hello.txt"
		  Else
		    upload.SetPicture LogoMBS(500)
		    upload.FileName = "image.png"
		  End If
		  
		  
		  
		  response = connection.UploadToContainerField(upload)
		  
		  UpdateResponse
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ModIDField
	#tag Event
		Sub TextChange()
		  UpdateButtons
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteRecordButton
	#tag Event
		Sub Action()
		  // which layout to use
		  connection.Layout = LayoutMenu.Text
		  
		  
		  Dim request As New FMRequestMBS
		  
		  response = connection.DeleteRecord(request, RecordIDField.Text.Trim)
		  
		  UpdateResponse
		  
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
#tag EndViewBehavior
