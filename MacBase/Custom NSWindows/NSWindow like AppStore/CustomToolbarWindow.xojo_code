#tag Class
Protected Class CustomToolbarWindow
Inherits Window
	#tag Event
		Sub Activate()
		  Active=True
		  Activate() // Event
		End Sub
	#tag EndEvent

	#tag Event
		Sub ContentsChanged()
		  if winBt<>Nil then
		    winBt.Dirty=Self.ContentsChanged
		    winBt.needsDisplay=True
		  end if
		  
		  ContentsChanged() // Event
		End Sub
	#tag EndEvent

	#tag Event
		Sub Deactivate()
		  Active=False
		  Deactivate() // Event
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  // we take care of the window buttons
		  // as they are not in the titlebar area.
		  if x>13 and x<67 and y<18 then
		    Return False
		    
		    // Moves the window
		  elseif y>=0 and y<=22 then
		    movePoint=New NSPointMBS
		    clickDX=X
		    clickDY=Self.Height-Y
		    ScreenHeight=Screen(0).Height
		    MoveAreaClicked=True
		    Return True
		  end if
		  
		  Return MouseDown( X,Y ) // Event
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  // Moves the window
		  if MoveAreaClicked then
		    movePoint.X=system.MouseX-clickDX
		    movePoint.Y=ScreenHeight-system.MouseY-clickDY
		    Self.NSWindowMBS.setFrameOrigin( movePoint )
		  end if
		  
		  MouseDrag( X,Y ) // Event
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  MoveAreaClicked=False
		  MouseUp() // Event
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  //——————————
		  // The current Window
		  //——————————
		  // Must be a metal window (Frame=9)
		  dim w As NSWindowMBS=Self.NSWindowMBS
		  w.setAutorecalculatesContentBorderThickness( False, NSWindowMBS.NSMaxYEdge )
		  w.setContentBorderThickness( 22, NSWindowMBS.NSMaxYEdge )
		  w.acceptsMouseMovedEvents=True
		  
		  // Current window's frame
		  dim themeFrame As NSViewMBS = w.contentView.superview
		  dim h As Integer=themeFrame.frameHeight
		  
		  //————————————
		  // Custom window buttons
		  //————————————
		  winBt=New CocoaWindowButtons( 13,h-32, Self, StandardWindowButtonsImage )
		  themeFrame.addSubview( winBt, NSWindowMBS.NSWindowBelow, Nil )
		  
		  //——————————
		  // Navigation buttons
		  //——————————
		  NavButtons=New NavSegmentedControl( 76,h-36,65,24 )
		  NavButtons.segmentCount=2
		  NavButtons.imageForSegment(0)=New NSImageMBS( nav_arrow_left )
		  NavButtons.imageForSegment(1)=New NSImageMBS( nav_arrow_right )
		  NavButtons.widthForSegment(0)=0
		  NavButtons.widthForSegment(1)=0
		  NavButtons.tagForSegment(0)=0
		  NavButtons.tagForSegment(1)=1
		  NavButtons.segmentStyle=NSSegmentedControlMBS.NSSegmentStyleRoundRect
		  NavButtons.autoresizingMask=NSViewMBS.NSViewMinYMargin
		  NavButtons.trackingMode=NavButtons.NSSegmentSwitchTrackingMomentary
		  themeFrame.addSubview( NavButtons )
		  
		  //——————————
		  // Toolbar SearchField
		  //——————————
		  SearchField=New NSSearchFieldMBS( Self.Width-158,h-34,150,22 )
		  SearchField.autoresizingMask=NSViewMBS.NSViewMinXMargin+NSViewMBS.NSViewMinYMargin
		  themeFrame.addSubview( SearchField )
		  
		  Open() // Event
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Draw the content background
		  g.ForeColor=&cEDEDED00
		  g.FillRect 0,22,g.Width,g.Height-22
		  
		  // Top line
		  if Active then g.ForeColor=&c6D6D6D else g.ForeColor=&cA0A0A0
		  g.DrawLine 0,22,g.Width,22
		  
		  Paint( g ) // Event
		End Sub
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Activate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ContentsChanged()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Deactivate()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDown(X As Integer, Y As Integer) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseDrag(X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MouseUp()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Paint(g As Graphics)
	#tag EndHook


	#tag Property, Flags = &h21
		Private Active As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private clickDX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private clickDY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MoveAreaClicked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private movePoint As NSPointMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		NavButtons As NavSegmentedControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScreenHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SearchField As NSSearchFieldMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private winBt As CocoaWindowButtons
	#tag EndProperty


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
End Class
#tag EndClass
