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
   Height          =   584
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1427312639
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "WebKit 2 Test"
   Visible         =   True
   Width           =   690
   Begin WKWebViewControlMBS browser
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   292
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Visible         =   True
      Width           =   650
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "50%"
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
      Height          =   240
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
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   324
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   650
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton TryButton
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Evaluate"
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
      Left            =   601
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   69
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #if Target64Bit then
		    
		    Title = "WebKit 2 with 64-bit"
		    
		  #else
		    
		    Title = "WebKit 1 with 32-bit"
		    
		  #endif
		  
		  #if Target64Bit then
		    browser.addScriptMessageHandler "test"
		  #endif
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		LastContextMenu As NSMenuMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		LastContextMenuItem As MyNSMenuItemMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events browser
	#tag Event
		Sub Open()
		  Dim f As FolderItem = FindFile("test.html")
		  dim b as BinaryStream = BinaryStream.Open(f)
		  dim s as string = b.Read(B.Length, encodings.UTF8)
		  
		  me.LoadHTML s
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function decidePolicyForNavigationAction(URL as String, NavigationType as String, modifierFlags as Integer, buttonNumber as Integer, newWindow as boolean, frameName as string, request as NSURLRequestMBS) As boolean
		  List.AddRow CurrentMethodName
		  List.AddRow "URL", URL
		  List.AddRow "NavigationType", NavigationType
		  List.AddRow "modifierFlags", str(modifierFlags)
		  List.AddRow "buttonNumber", str(buttonNumber)
		  List.AddRow "newWindow", str(newWindow)
		  List.AddRow "frameName", frameName
		  List.AddRow ""
		  
		  List.ScrollPosition = List.ListCount
		  
		  'Return true // to block
		End Function
	#tag EndEvent
	#tag Event
		Sub JavaScriptEvaluated(JavaScript as String, Result as Variant, Error as NSErrorMBS, Tag as String)
		  List.AddRow CurrentMethodName
		  List.AddRow "JavaScript", JavaScript
		  if Error = nil then
		    List.AddRow "Error", "none"
		  else
		    List.AddRow "Error", Error.LocalizedDescription
		  end if
		  
		  List.AddRow "Tag", Tag
		  List.AddRow ""
		  
		  List.ScrollPosition = List.ListCount
		  
		  MsgBox "JavaScript result: "+result.StringValue
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub runJavaScriptAlertPanel(message as String)
		  List.AddRow CurrentMethodName
		  List.AddRow "Message", Message
		  List.AddRow ""
		  
		  List.ScrollPosition = List.ListCount
		  
		  
		  MsgBox message
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function runJavaScriptTextInputPanel(prompt as String, defaultText as String) As String
		  List.AddRow CurrentMethodName
		  List.AddRow "prompt", prompt
		  List.AddRow "defaultText", defaultText
		  List.AddRow ""
		  
		  List.ScrollPosition = List.ListCount
		  
		  
		  
		  dim r as string
		  dim d as new InputDialog
		  
		  d.Message.Text = prompt
		  d.InputField.Text = defaultText
		  
		  d.ShowModal
		  
		  if d.ok then
		    r = d.InputField.Text
		  end if
		  
		  d.close
		  
		  Return r
		  
		End Function
	#tag EndEvent
	#tag Event
		Function runJavaScriptConfirmPanel(message as String) As boolean
		  List.AddRow CurrentMethodName
		  List.AddRow "Message", Message
		  List.AddRow ""
		  
		  List.ScrollPosition = List.ListCount
		  
		  
		  
		  Dim d as New MessageDialog                  //declare the MessageDialog object
		  d.icon=MessageDialog.GraphicCaution         //display warning icon
		  d.ActionButton.Caption="Confirm"
		  d.CancelButton.Visible=True                 //show the Cancel button
		  d.Message=message
		  
		  Dim b as MessageDialogButton = d.ShowModal //display the dialog
		  
		  Select Case b                              //determine which button was pressed.
		  Case d.ActionButton
		      //user pressed Confirm
		    Return true
		  End select
		End Function
	#tag EndEvent
	#tag Event
		Sub didCommitNavigation(navigation as WKNavigationMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didFailNavigation(navigation as WKNavigationMBS, Error as NSErrorMBS)
		  List.AddRow CurrentMethodName
		  
		  if error <> nil then
		    List.AddRow "error", Error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didFailProvisionalNavigation(navigation as WKNavigationMBS, Error as NSErrorMBS)
		  List.AddRow CurrentMethodName
		  
		  if error <> nil then
		    List.AddRow "error", Error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didFinishNavigation(navigation as WKNavigationMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didReceiveServerRedirectForProvisionalNavigation(navigation as WKNavigationMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didStartProvisionalNavigation(navigation as WKNavigationMBS)
		  List.AddRow CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub didReceiveScriptMessage(Body as Variant, name as String)
		  MsgBox name+EndOfLine+body.StringValue
		End Sub
	#tag EndEvent
	#tag Event
		Sub didCloseContextualMenu(menu as NSMenuMBS, NSEvent as NSEventMBS)
		  List.AddRow CurrentMethodName
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub willShowContextualMenu(menu as NSMenuMBS, NSEvent as NSEventMBS)
		  List.AddRow CurrentMethodName
		  
		  // remove all
		  'menu.removeAllItems
		  
		  
		  // subclass to catch event (or use addHandler)
		  Dim m As New MyNSMenuItemMBS
		  
		  m.CreateMenuItem
		  m.Title = "Hello World"
		  
		  // no subclass for separator needed
		  Dim s As New NSMenuItemMBS
		  s.CreateSeparator
		  
		  // add our items
		  menu.addItem s
		  menu.addItem m
		  
		  
		  // make sure Xojo objects stay alive for some time
		  LastContextMenuItem = m
		  LastContextMenu = menu
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TryButton
	#tag Event
		Sub Action()
		  browser.EvaluateJavaScript("window.webkit.messageHandlers.test.postMessage('Hello');")
		  
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
