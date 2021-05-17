#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   665590584
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Game Center Test"
   Visible         =   True
   Width           =   1000
   Begin Listbox Listbox1
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
      Height          =   332
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
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   48
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   960
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton bbAuthenticate1082
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "AuthenticateLocalPlayer 10.8.2"
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   "0"
      TabIndex        =   1
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
      Width           =   213
   End
   Begin PushButton pbAuthenticate108
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "AuthenticateLocalPlayer 10.8"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   253
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   225
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  //Many Game Center operations are asynchronous
		  //The class MyGameKitMBS will receive many asynchronous events for your game to use 
		  //Property pGameKit is the location this app uses for receiving those events
		  
		  pGameKit = new MyGameKitMBS
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AuthenticateLocalPlayer108(localPlayer as GKLocalPlayerMBS)
		  ////////////// Apple's Xcode OS X 10.8 authentication code example
		  '- (void) authenticateLocalPlayer
		  ' {
		  '  GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
		  '  [localPlayer authenticateWithCompletionHandler:^(NSError *error) {
		  '   if (localPlayer.isAuthenticated)
		  '   {
		       // Player was successfully authenticated.
		       // Perform additional tasks for the authenticated player.
		  '   }
		  '  }];
		  ' }
		  ////////////////
		  
		  //Shared instance of the local player provided as method parameter
		  'localPlayer = GKLocalPlayerMBS.localPlayer
		  
		  //NOTE: This method of authentication is deprecated
		  localPlayer.authenticate
		  
		  //balance of code is in MyGameKitMBS.authenticateCompleted event handler
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AuthenticateLocalPlayer1082(localPlayer as GKLocalPlayerMBS)
		  //////////////// Apple's Xcode OS X 10.8.2 authenticate code example
		  '(void) authenticateLocalPlayer
		  ' {
		  ' GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
		  ' localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
		  '  if (viewController != nil)
		  '   {
		     //showAuthenticationDialogWhenReasonable: is an example method name. Create your own method that displays an authentication view when appropriate for your app.
		  '   [self showAuthenticationDialogWhenReasonable: viewController];
		  '   }
		  '  else if (localPlayer.isAuthenticated)
		  '  {
		    //authenticatedPlayer: is an example method name. Create your own method that is called after the loacal player is authenticated.
		  '  [self authenticatedPlayer: localPlayer];
		  '  }
		  '  else
		  '   {
		  '    [self disableGameCenter];
		  '   }
		  '  }];
		  ' } 
		  ////////////////
		  
		  //Shared instance of the local player provided as method parameter
		  'localPlayer = GKLocalPlayerMBS.localPlayer
		  
		  // old code
		  'localPlayer.authenticate
		  
		  // new code
		  localPlayer.SetAuthenticateHandler
		  
		  //balance of code is in MyGameKitMBS.authenticateHandler event handler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BeginAuthenticate(localPlayer as GKLocalPlayerMBS) As Boolean
		  if localPlayer=nil then
		    Log("Local player is nil at start of authentication; cannot proceed")
		    return False
		  end if
		  
		  if localPlayer.playerID<>"" then
		    //Check if local player is already authenticated
		    if localPlayer.isAuthenticated then
		      Log("Local player "+localPlayer.playerID+" is already authenticated.")
		      //if already authenticated no need to proceed
		      return false
		    else
		      Log("Start to authenticate local player "+localPlayer.playerID)
		      //proceed with authenticating player
		      return true
		    end if
		  else
		    Log("No local player ID at start of authentication process")
		    //proceed with authentication even though no player ID at this time
		    return true
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ButtonAction(buttonName as string)
		  dim localPlayer as GKLocalPlayerMBS
		  
		  //Retrieves the shared instance of the local player
		  localPlayer = GKLocalPlayerMBS.localPlayer
		  
		  //check and report local player status at beginning of authenticate
		  Dim OK as boolean =BeginAuthenticate(localPlayer)
		  
		  if OK then
		    // run authenticate
		    if buttonName="1082" then
		      AuthenticateLocalPlayer1082(localPlayer)
		    else
		      AuthenticateLocalPlayer108(localPlayer)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Check(localPlayer as GKLocalPlayerMBS)
		  // isAuthenticated will tell if things went well.
		  if localPlayer<>nil then
		    Log "alias: "+localPlayer.alias
		    Log "isAuthenticated: "+str(localPlayer.isAuthenticated)
		    Log "isFriend: "+str(localPlayer.isFriend)
		    Log "isUnderage: "+str(localPlayer.isUnderage)
		    Log "playerID: "+localPlayer.playerID
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  System.DebugLog s
		  Listbox1.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pBool108Used As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pGameKit As MyGameKitMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events bbAuthenticate1082
	#tag Event
		Sub Action()
		  //This authentication method not implemented until OS X 10.8.2
		  if NOT App.pBoolVersion1082 then
		    Log("This OS X system version does not support this authentication method.")
		  else
		    //Your game will pick one authentication method and always use it 
		    //so this test is unecessary in your final project
		    if pBool108Used then
		      //But this test app allows use of both methods so this check is used 
		      //because there is some unknown interaction between the two methods
		      Log("You have already used old authenticate method during this test. "_
		      +"Restart app to use new authenticate method.")
		    else
		      ButtonAction("1082")
		    end if
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAuthenticate108
	#tag Event
		Sub Action()
		  //Your game app will pick one authentication method and always use it 
		  //so this flag is unecessary
		  //But this test app allows use of both authenticate methods so this flag is used
		  //because there is some unknown interaction between the two methods
		  pBool108Used=true
		  
		  ButtonAction("108")
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
		Name="pBool108Used"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
