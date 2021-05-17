#tag Window
Begin Window mainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   342
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   False
   Title           =   ""
   Visible         =   True
   Width           =   326
   Begin PushButton OpenItBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   208
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   225
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Demo for FolderItem Plugin. By Thomas Tempelmann"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   301
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Visit my REALbasic related Web Site:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   315
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   170
   End
   Begin Label url
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   184
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "http://www.tempel.org/rb/"
      TextAlign       =   0
      TextColor       =   &c1822CD00
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   315
      Transparent     =   True
      Underline       =   True
      Visible         =   True
      Width           =   130
   End
   Begin GroupBox appDrop
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Application to open it with:"
      Enabled         =   True
      Height          =   105
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   96
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   301
   End
   Begin Label appName
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
      Left            =   132
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   120
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin GroupBox docDrop
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Document to be opened:"
      Enabled         =   True
      Height          =   50
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   34
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   300
   End
   Begin Label docName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   33
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   58
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   265
   End
   Begin Label StaticText3
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   39
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Instructions: Drop a document or application in the Document field and optionally drop an application into the Application field. Then press the Open button to open the document/application."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   265
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   301
   End
   Begin CheckBox inFGCheck
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "In Foreground"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   40
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   225
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   116
   End
   Begin RadioButton useFile
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use this file"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   23
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   119
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   90
   End
   Begin RadioButton useCreator
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use this creator"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   23
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   144
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   90
   End
   Begin TextField creatorEdit
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
      Left            =   132
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
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   143
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   51
   End
   Begin RadioButton useDefault
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use document's creator"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   23
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   169
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   133
   End
   Begin PushButton revealBut
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Reveal"
      Default         =   False
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   243
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   175
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if x>url.left and x<url.left+url.width and y>url.top and y<url.top+url.height then
		    url.textcolor = RGB(255,0,0)
		    return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if x>url.left and x<url.left+url.width and y>url.top and y<url.top+url.height then
		    url.textcolor = RGB(255,0,0)
		  else
		    url.textcolor = RGB(0,0,255)
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  url.textcolor = RGB(0,0,255)
		  if x>url.left and x<url.left+url.width and y>url.top and y<url.top+url.height then
		    ShowURL url.text
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub OpenIt()
		  Dim ok as Boolean
		  if useDefault.value then
		    ok = theDoc.LaunchMBS(inFGCheck.Value)
		  elseif useFile.value then
		    ok = theDoc.OpenWithAppMBS(theApp, inFGCheck.Value)
		  else
		    ok = theDoc.OpenWithAppMBS(theDoc.CreatorAppMBS(creatorEdit.text), inFGCheck.Value)
		  end
		  if not ok then
		    msgBox "Launch failed."
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		theApp As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		theDoc As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events OpenItBut
	#tag Event
		Sub Action()
		  if theDoc = nil then
		    MsgBox "You need to specify a document first."
		  else
		    OpenIt
		  end
		  exception exc as RuntimeException
		    msgBox "Oops. An Exception occured!"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events appDrop
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #Pragma unused action
		  
		  If obj.folderItemAvailable Then
		    If obj.FolderItem.name.Right(4) = ".app" Then
		      
		      theApp = obj.folderItem
		      #If RBVersion < 2019
		        appName.caption = theApp.name
		      #Else
		        appName.Text = theApp.Name
		      #EndIf
		      useFile.value = true
		      creatorEdit.Text = theApp.MacCreator
		    end if
		  Else
		    beep
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "anyfile"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events docDrop
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #Pragma unused action
		  
		  if obj.folderItemAvailable then
		    if obj.folderItem.directory then
		      beep
		    else
		      theDoc = obj.folderItem
		      
		      #If RBVersion < 2019
		        docName.caption = theDoc.name
		      #Else
		        docName.Text = theDoc.name
		      #EndIf
		      
		      OpenItBut.enabled = true
		    end
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.AcceptFileDrop "anyfile"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events useFile
	#tag Event
		Sub Action()
		  if theApp = nil then
		    beep
		    useDefault.value = true
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events creatorEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if key >= " " then
		    useCreator.value = true
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events revealBut
	#tag Event
		Sub Action()
		  dim theCreatorApp as FolderItem
		  if theDoc = nil then
		    MsgBox "You need to specify a document first."
		  else
		    if useFile.value then
		      theCreatorApp = theApp
		    elseif useDefault.value then
		      theCreatorApp = theDoc.CreatorAppMBS
		    else
		      theCreatorApp = theDoc.CreatorAppMBS(creatorEdit.text)
		    end
		    if theCreatorApp = nil then
		      MsgBox "No application for this creator is registered in the DTDB (Desktop Database)."
		    else
		      RevealItemInFinder (theCreatorApp)
		      BringFinderToFront
		    end
		  end
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
