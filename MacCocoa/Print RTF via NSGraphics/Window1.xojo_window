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
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1422942207
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print"
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
      Width           =   80
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   334
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Refresh"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   500
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
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function CalcRTF(g as Graphics, RTF as string, x as Double, y as Double, MaxWidth as integer = 999, MaxHeight as Integer = 999, OverwriteFont as NSFontMBS = nil) As NSSizeMBS
		  dim at as new NSMutableAttributedStringMBS
		  call at.initWithRTF(testRTF)
		  
		  
		  if OverwriteFont <> nil then
		    
		    at.addAttribute(at.NSFontAttributeName, OverwriteFont, new NSRangeMBS(0, at.Length))
		    
		  end if
		  
		  
		  dim h as integer = g.Handle(g.HandleTypeCGContextRef)
		  dim n as NSGraphicsMBS = NSGraphicsMBS.graphicsContextWithCGContextHandle(h)
		  
		  dim s as new NSSizeMBS(MaxWidth, MaxHeight)
		  dim r as NSRectMBS = n.boundingRectWithSize(at, s)
		  
		  Return r.Size
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRTF(g as Graphics, RTF as string, x as Double, y as Double, ps as PrinterSetup, MaxWidth as integer = 999, MaxHeight as Integer = 999, OverwriteFont as NSFontMBS = nil)
		  dim at as new NSMutableAttributedStringMBS
		  call at.initWithRTF(testRTF)
		  
		  
		  if OverwriteFont <> nil then
		    
		    at.addAttribute(at.NSFontAttributeName, OverwriteFont, new NSRangeMBS(0, at.Length))
		    
		  end if
		  
		  
		  dim h as integer = g.Handle(g.HandleTypeCGContextRef)
		  dim n as NSGraphicsMBS = NSGraphicsMBS.graphicsContextWithCGContextHandle(h)
		  
		  dim s as new NSSizeMBS(MaxWidth, MaxHeight)
		  dim r as NSRectMBS = n.boundingRectWithSize(at, s)
		  
		  dim rHeight as integer = r.Height
		  
		  if ps = nil then
		    r.X = x
		    r.Y = g.Height - y - rHeight
		  else
		    dim PageLeft   as integer = ps.PageLeft
		    dim PageTop    as integer = ps.PageTop
		    dim PageHeight as integer = ps.PageHeight
		    
		    r.X = x - PageLeft
		    r.y = PageHeight - y + PageTop - rHeight
		  end if
		  
		  n.drawInRect(at, r)
		  
		  
		  n = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDummyGraphics()
		  static image as new NSImageMBS(10,10)
		  static g as NSGraphicsMBS = NSGraphicsMBS.graphicsContextWithNSImage(image)
		  g.setCurrentContext
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = testRTF, Type = String, Dynamic = False, Default = \"{\\rtf1\\ansi\\ansicpg1252\\cocoartf1504\\cocoasubrtf810\n{\\fonttbl\\f0\\fswiss\\fcharset0 Helvetica;}\n{\\colortbl;\\red255\\green255\\blue255;\\red164\\green8\\blue0;}\n{\\*\\expandedcolortbl;;\\csgenericrgb\\c64314\\c3137\\c0;}\n\\paperw11900\\paperh16840\\margl1440\\margr1440\\vieww10800\\viewh8400\\viewkind0\n\\pard\\tx566\\tx1133\\tx1700\\tx2267\\tx2834\\tx3401\\tx3968\\tx4535\\tx5102\\tx5669\\tx6236\\tx6803\\pardirnatural\\partightenfactor0\n\n\\f0\\b\\fs24 \\cf2 Hello World}", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim oldGraphics as NSGraphicsMBS = NSGraphicsMBS.graphicsContext
		  
		  
		  dim ps as new PrinterSetup
		  dim g as Graphics = OpenPrinterDialog(ps)
		  
		  if g = nil then 
		    Return
		  end if
		  
		  
		  
		  // draw RTF
		  
		  g.DrawLine 100, 100, 200, 100
		  g.DrawString "Hello World", 100, 100
		  
		  drawRTF g, testRTF, 100, 120, ps
		  g.DrawLine 100, 120, 200, 120
		  
		  
		  // replace font
		  g.ForeColor = &c000000
		  g.DrawRect 100, 200, 400, 200
		  drawRTF g, testRTF, 100, 200, ps, 400, 200, NSFontMBS.fontWithName("Times", 20)
		  
		  
		  // calc rect
		  g.ForeColor = &cFF0000
		  dim s as NSSizeMBS = CalcRTF(g, testRTF, 100, 200, 400, 200, NSFontMBS.fontWithName("Times", 20))
		  g.DrawRect 100, 200, s.Width, s.Height
		  
		  
		  
		  // restore old context
		  if oldGraphics <> nil then
		    oldGraphics.setCurrentContext
		    oldGraphics = nil
		  end if
		  
		  // set dummy to avoid crash when closing print progress dialog
		  SetDummyGraphics
		  
		  // free graphics
		  g = nil
		  
		  SetDummyGraphics
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  dim ps as PrinterSetup = nil // nil for non printing
		  
		  // draw RTF
		  
		  g.DrawLine 100, 100, 200, 100
		  g.DrawString "Hello World", 100, 100
		  
		  drawRTF g, testRTF, 100, 120, ps
		  g.DrawLine 100, 120, 200, 120
		  
		  
		  // replace font
		  g.ForeColor = &c000000
		  g.DrawRect 100, 200, 400, 200
		  drawRTF g, testRTF, 100, 200, ps, 400, 200, NSFontMBS.fontWithName("Times", 20)
		  
		  
		  // calc rect
		  g.ForeColor = &cFF0000
		  dim s as NSSizeMBS = CalcRTF(g, testRTF, 100, 200, 400, 200, NSFontMBS.fontWithName("Times", 20))
		  g.DrawRect 100, 200, s.Width, s.Height
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  canvas1.Invalidate
		  
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
