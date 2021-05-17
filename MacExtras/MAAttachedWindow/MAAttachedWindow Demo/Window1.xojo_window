#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   256
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   434937955
   MenuBarVisible  =   True
   MinHeight       =   60
   MinimizeButton  =   True
   MinWidth        =   0
   Placement       =   2
   Resizeable      =   False
   Title           =   ""
   Visible         =   True
   Width           =   256
   Begin Canvas LogoCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   256
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   256
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Quit()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CloseWindow() As Boolean
		  If not (MAAttachedWindow = Nil) Then
		    Self.NSWindowMBS.removeChildWindow(MAAttachedWindow)
		    
		    Dim NSWindowAnimator as NSWindowMBS = MAAttachedWindow.animator()
		    
		    If (NSWindowAnimator = Nil) Then
		      MAAttachedWindow.Close()
		    Else
		      NSWindowAnimator.alphaValue = 0.0
		    End If
		    
		    MAAttachedWindow = Nil
		  End If
		  
		  Return True
		  
		  Exception
		    Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShowWindow() As Boolean
		  If (MAAttachedWindow = Nil) Then
		    Dim NSWindow as NSWindowMBS = Self.NSWindowMBS
		    Dim MAPosition as Integer = MAAttachedWindowMBS.MAPositionBottom
		    Dim MADistance as Double = 10.0
		    Dim NSPoint as New NSPointMBS(Self.Width / 2, 10)
		    
		    Dim NSTextField as New NSTextFieldMBS(10, 0, 200, 92)
		    NSTextField.StringValue = "This is the logo of awesome MonkeyBread Software." + EndOfLine + EndOfLine + "Many thanks to Matt Gemmell for creating MAAttachedWindow."
		    NSTextField.Editable = False
		    NSTextField.textColor = NSColorMBS.whiteColor()
		    NSTextField.backgroundColor = NSColorMBS.blackColor()
		    NSTextField.Bordered = False
		    
		    Dim NSView as New NSViewMBS(0, 0, 220, 102)
		    NSView.addSubview(NSTextField)
		    
		    MAAttachedWindow = MAAttachedWindowMBS.attachedWindow(NSView, NSPoint, NSWindow, MAPosition, MADistance)
		    MAAttachedWindow.borderColor = NSColorMBS.whiteColor
		    MAAttachedWindow.backgroundColor = NSColorMBS.blackColor
		    MAAttachedWindow.viewMargin = 4
		    MAAttachedWindow.borderWidth = 3
		    MAAttachedWindow.cornerRadius = 8
		    MAAttachedWindow.drawsRoundCornerBesideArrow = True
		    MAAttachedWindow.arrowBaseWidth = 20
		    MAAttachedWindow.arrowHeight = 15
		    MAAttachedWindow.hasArrow = True
		    MAAttachedWindow.alphaValue = 0.0
		    
		    NSWindow.addChildWindow(MAAttachedWindow, NSWindowMBS.NSWindowAbove)
		    
		    Dim NSWindowAnimator as NSWindowMBS = MAAttachedWindow.animator()
		    
		    If (NSWindowAnimator = Nil) Then
		      MAAttachedWindow.alphaValue = 0.9
		    Else
		      NSWindowAnimator.alphaValue = 0.9
		    End If
		    
		    MAAttachedWindow.Show()
		    
		    Self.Show() //a 'hack' to not set the MAAttachedWindow to the front
		  End If
		  
		  Return True
		  
		  Exception
		    Return False
		End Function
	#tag EndMethod


	#tag Note, Name = About
		
		This example was created by Joris Vervuurt <jorisvervuurt@planet.nl>
		
	#tag EndNote


	#tag Property, Flags = &h0
		MAAttachedWindow As MAAttachedWindowMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events LogoCanvas
	#tag Event
		Sub Open()
		  Me.Backdrop = LogoMBS(256)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Call ShowWindow()
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Call CloseWindow()
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
