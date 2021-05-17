#tag Window
Begin Window Window1
   BackColor       =   &c31313100
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   HasFullScreenButton=   False
   Height          =   350
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1623531691
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   True
   Width           =   400
   Begin CocoaControlMBS CocoaControlMBS1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   350
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   400
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  if not CocoaControlMBS1.Available then
		    MsgBox "This example requires Mac OS X 10.5."
		    quit
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		scrollview As nsscrollViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		textView As NSTextViewMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		VScroller As MyCustomNSScroller
	#tag EndProperty


	#tag Constant, Name = a_big_text, Type = String, Dynamic = False, Default = \"Lorem ipsum dolor sit amet\x2C consectetuer adipiscing elit. Sed non risus. Suspendisse lectus tortor\x2C dignissim sit amet\x2C adipiscing nec\x2C ultricies sed\x2C dolor. Cras elementum ultrices diam. Maecenas ligula massa\x2C varius a\x2C semper congue\x2C euismod non\x2C mi. Proin porttitor\x2C orci nec nonummy molestie\x2C enim est eleifend mi\x2C non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa\x2C scelerisque vitae\x2C consequat in\x2C pretium a\x2C enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. \r\rVestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit. Ut velit mauris\x2C egestas sed\x2C gravida nec\x2C ornare ut\x2C mi. \rAenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius\x2C ligula non tempus aliquam\x2C nunc turpis ullamcorper nibh\x2C in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet\x2C consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus\x2C aliquam faucibus\x2C convallis id\x2C congue eu\x2C quam. \r\rMauris ullamcorper felis vitae erat. Proin feugiat\x2C augue non elementum posuere\x2C metus purus iaculis lectus\x2C et tristique ligula justo vitae magna. Aliquam convallis sollicitudin purus. Praesent aliquam\x2C enim at fermentum mollis\x2C ligula massa adipiscing nisl\x2C ac euismod nibh nisl eu lectus. Fusce vulputate sem at sapien. Vivamus leo. Aliquam euismod libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo. Suspendisse cursus rutrum augue. Nulla tincidunt tincidunt mi. Curabitur iaculis\x2C lorem vel rhoncus faucibus\x2C felis magna fermentum augue\x2C et ultricies lacus lorem varius purus. Curabitur eu amet.", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events CocoaControlMBS1
	#tag Event
		Function GetView() As NSViewMBS
		  scrollview = New NSScrollViewMBS( 0,0,Me.Width,Me.Height )
		  
		  // We create and add our custom NSScroller to the NSScrollView.
		  // the scroller must be stored in a property in order to work.
		  VScroller = New MyCustomNSScroller( 0,0,15,Me.Height )
		  VScroller.knobSlotImage = New NSImageMBS( CustomNSscrollerDarkKnobSlot )
		  VScroller.knobImage = New NSImageMBS( CustomNSscrollerDarkKnob )
		  VScroller.IncrArrowImage = New NSImageMBS( CustomNSscrollerDarkIncrArrow )
		  VScroller.DecrArrowImage = New NSImageMBS( CustomNSscrollerDarkDecrArrow )
		  VScroller.BackColor = NSColorMBS.colorWithDeviceHSV(0.0, 0.0, 0.22, 1.0)
		  scrollview.verticalScroller = VScroller
		  
		  // We create and add a text field to the NSScrollView.
		  textView=New NSTextViewMBS( 0,0,Me.Width,Me.Height )
		  dim tPadding As New NSSizeMBS( 15,15 )
		  textView.ContinuousSpellCheckingEnabled = false
		  textView.allowsUndo = true
		  textView.autoresizingMask = textView.NSViewHeightSizable+textView.NSViewWidthSizable
		  textView.textContainerInset = tPadding
		  textView.backgroundColor = NSColorMBS.colorWithDeviceHSV(0.0, 0.0, 0.22, 1.0)
		  textView.textColor = NSColorMBS.whiteColor
		  textView.text = a_big_text
		  scrollview.documentView = textView
		  
		  scrollview.hasHorizontalScroller = false
		  scrollview.hasVerticalScroller = true
		  scrollview.autohidesScrollers = true
		  
		  Return scrollview
		End Function
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
