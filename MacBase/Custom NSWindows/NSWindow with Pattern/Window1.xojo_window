#tag Window
Begin Window Window1
   BackColor       =   &cC4DBF500
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   9
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1309315854
   MenuBarVisible  =   True
   MinHeight       =   320
   MinimizeButton  =   True
   MinWidth        =   400
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   384
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   6
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   11
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   588
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  //————————
		  // Current window
		  //————————
		  dim w As New NSWindowMBS( Self )
		  w.backgroundColor = NSColorMBS.colorWithPatternImage( New NSImageMBS( LoopPatternImage ) )
		  w.acceptsMouseMovedEvents=true
		  dim themeFrame As NSViewMBS = w.contentView.superview
		  dim sa(-1) as NSViewMBS = themeFrame.subviews
		  dim h As Integer = themeFrame.frameHeight
		  
		  //———————————
		  // Custom Titlebar view
		  //———————————
		  customFrame = New CustomWindowFrame( 0,0,Self.Width,h )
		  customFrame.autoresizingMask = NSViewMBS.NSViewWidthSizable+NSViewMBS.NSViewHeightSizable
		  customFrame.BorderImage = New NSImageMBS( FrameBorderImage )
		  customFrame.BackColor = &cD9A75A00
		  customFrame.TitleColor = &c4A382000
		  customFrame.TitleShadowColor = &cF1D3AB00
		  customFrame.TitleShadowDeltaY = 1
		  customFrame.TitleTopPadding = 21
		  customFrame.TitleText = "My Book"
		  themeFrame.addSubview customFrame, NSWindowMBS.NSWindowBelow, sa(0)
		  
		  //——————————
		  // Titlebar SearchField
		  //——————————
		  SearchField=New NSSearchFieldMBS( Self.Width-160,h-28,150,20 )
		  SearchField.autoresizingMask=NSViewMBS.NSViewMinXMargin+NSViewMBS.NSViewMinYMargin
		  themeFrame.addSubview( SearchField )
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected customFrame As CustomWindowFrame
	#tag EndProperty

	#tag Property, Flags = &h0
		SearchField As NSSearchFieldMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim w1,w2,c As Integer
		  c=20 // corner size
		  w1=g.Width/2
		  w2=g.Width-w1
		  
		  g.DrawPicture BookPagesTopLeftCorner, 0,0 // Top Left Corner
		  g.DrawPicture BookPagesTopRightCorner, g.Width-c,0 // Top Right Corner
		  g.DrawPicture BookPagesBottomLeftCorner, 0,g.Height-c // Bottom Left Corner
		  g.DrawPicture BookPagesBottomRightCorner, g.Width-c,g.Height-c // Top Bottom Corner
		  
		  g.DrawPicture BookPagesTopLeftCorner, 0,c, c,g.Height-c-c, 0,c-1, c,1 // Left
		  g.DrawPicture BookPagesTopRightCorner, g.Width-c,c, c,g.Height-c-c, 0,c-1, c,1 // Right
		  
		  g.DrawPicture BookPagesTopLeft, c,0, w1-c,c, 0,0, 268,20 // Top Left
		  g.DrawPicture BookPagesTopRight, w1,0, w2-c,c, 0,0, 268,20 // Top Right
		  
		  g.DrawPicture BookPagesTopLeft, c,c, w1-c,g.Height-c-c, 0,c-1, 268,1 // Left
		  g.DrawPicture BookPagesTopRight, w1,c, w2-c,g.Height-c-c, 0,c-1, 268,1 // Right
		  
		  g.DrawPicture BookPagesBottomLeft, c,g.Height-c, w1-c,c, 0,0, 268,20 // Bottom Left
		  g.DrawPicture BookPagesBottomRight, w1,g.Height-c, w2-c,c, 0,0, 268,20 // Bottom Right
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
