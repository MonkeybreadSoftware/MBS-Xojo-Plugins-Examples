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
   Height          =   582
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   136601599
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Xojo Test App for WebView2"
   Visible         =   True
   Width           =   774
   Begin WebView2ControlMBS web
      AdditionalBrowserArguments=   ""
      AllowSingleSignOnUsingOSPrimaryAccount=   False
      AreDefaultContextMenusEnabled=   False
      AreDefaultScriptDialogsEnabled=   True
      AreDevToolsEnabled=   True
      AreHostObjectsAllowed=   False
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   582
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsBuiltInErrorPageEnabled=   False
      IsScriptEnabled =   True
      IsStatusBarEnabled=   False
      IsWebMessageEnabled=   True
      IsZoomControlEnabled=   False
      Language        =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TargetCompatibleBrowserVersion=   ""
      Top             =   0
      Visible         =   True
      Width           =   774
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  CommandsGoBack.Enabled    = web.CanGoBack
		  CommandsGoForward.Enabled = web.CanGoForward
		  CommandsShowdevelopertools.Enable
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  System.DebugLog CurrentMethodName
		  web.LoadURL "https://www.monkeybreadsoftware.de/"
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function CommandsGoBack() As Boolean Handles CommandsGoBack.Action
			web.GoBack
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CommandsGoForward() As Boolean Handles CommandsGoForward.Action
			web.GoForward
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CommandsShowdevelopertools() As Boolean Handles CommandsShowdevelopertools.Action
			web.OpenDevToolsWindow
			Return True
			
		End Function
	#tag EndMenuHandler


#tag EndWindowCode

#tag Events web
	#tag Event
		Sub NavigationCompleted(isSuccess as Boolean, ErrorStatus as Integer, NavigationID as UInt64)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Function NavigationStarting(URL as String, IsUserInitiated as Boolean, IsRedirected as Boolean, NavigationID as UInt64) As Boolean
		  System.DebugLog CurrentMethodName+": "+URL
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub PermissionRequested(URL as String, PermissionKind as Integer, IsUserInitiated as Boolean, byref State as Integer)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub ProcessFailed(processFailedKind as Integer)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SourceChanged(isNewDocument as Boolean)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub WebMessageReceived(Source as String, webMessageAsJson as String, webMessageAsString as String)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub WindowCloseRequested()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub AddScriptToExecuteOnDocumentCreatedCompleted(JavaScript as String, ErrorCode as Integer, ID as String, Tag as Variant)
		  System.DebugLog CurrentMethodName+" "+ID
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Close()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub Configure()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub DocumentTitleChanged()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub HistoryChanged()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub ContentLoading(isErrorPage as Boolean, NavigationID as UInt64)
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExecuteScriptCompleted(JavaScript as String, ErrorCode as Integer, resultObjectAsJson as String, Tag as Variant)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opened()
		  System.DebugLog CurrentMethodName
		  
		  
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
