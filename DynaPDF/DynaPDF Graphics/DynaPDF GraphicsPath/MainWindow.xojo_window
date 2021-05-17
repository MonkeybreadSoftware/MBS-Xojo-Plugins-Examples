#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   707
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "PDF Graphics"
   Visible         =   True
   Width           =   648
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
      Left            =   548
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
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
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Make PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   548
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
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
      EraseBackground =   True
      Height          =   673
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   516
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub draw(g as graphics, pdf as DynaPDFMBS = nil)
		  
		  Const Pi = 3.14159
		  Dim pi2 As Double = pi * 2.0
		  
		  Var gp As DynapdfGraphicsPathMBS
		  g.DrawingColor = &cFF0000
		  g.PenSize = 5
		  g.PenHeight = 5
		  g.PenWidth = 5
		  
		  Title = Str(g.PenWidth)+"x"+Str(g.PenHeight)
		  'g.DrawLine 0, 0, 100, 100
		  g.PenSize = 1
		  
		  // arc
		  g.AntiAlias = True
		  g.PenSize = 3
		  
		  Dim r As Integer = 40
		  Dim n As Integer = 0
		  For w As Integer = 0 To 350 Step 10
		    
		    Select Case n Mod 4
		    Case 0
		      g.DrawingColor = &cFF0000
		    Case 1
		      g.DrawingColor = &c00FF00
		    Case 2
		      g.DrawingColor = &c0000FF
		    Case 3
		      g.DrawingColor = &cFF00FF
		    End Select
		    n = n + 1
		    
		    Dim w0 As Double = w
		    
		    Dim w1 As Double =  w0       / 180.0 * pi
		    Dim w2 As Double = (w0+10.0) / 180.0 * pi
		    Dim clockwise As Boolean = False
		    
		    If pdf <> Nil Then
		      'w1 = Convrt(w1)
		      'w2 = Convrt(w2)
		      
		      'w1 = pi2 - w1
		      'w2 = pi2 - w2
		      'clockwise = True
		    End If
		    
		    gp = New DynapdfGraphicsPathMBS
		    gp.AddArc(200, 200, r, w1, w2, clockwise)
		    g.DrawPath gp
		    
		    r = r + 1
		    
		  Next
		  
		  
		  g.DrawingColor = &c00FFFF
		  
		  
		  Dim w1 As Double = 0
		  Dim w2 As Double = pi/2
		  Dim clockwise As Boolean = False
		  
		  gp = New DynapdfGraphicsPathMBS
		  gp.AddArc(200, 200, 80, w1, w2, clockwise)
		  g.DrawPath gp
		  
		  
		  Var curve As New DynapdfGraphicsPathMBS
		  curve.MoveToPoint(320, 200+20)
		  curve.AddCurveToPoint(320, 200+100, 500, 200+100, 500, 200+20)
		  g.DrawingColor = &c00FF00
		  g.DrawPath(curve)
		  
		  // Draw a fluffy white cloud
		  Var cloud As New DynapdfGraphicsPathMBS
		  cloud.MoveToPoint(270, 80)
		  cloud.AddCurveToPoint(230, 100, 230, 150, 330, 150)
		  cloud.AddCurveToPoint(350, 180, 420, 180, 440, 150)
		  cloud.AddCurveToPoint(520, 150, 520, 120, 490, 100)
		  cloud.AddCurveToPoint(530,  40, 470,  30, 440,  50)
		  cloud.AddCurveToPoint(420,   5, 350,  20, 350,  50)
		  cloud.AddCurveToPoint(300,   5, 250,  20, 270,  80)
		  
		  g.DrawingColor = &c0000FF
		  g.PenSize = 5
		  g.DrawPath(cloud)
		  
		  
		  Var p As New DynapdfGraphicsPathMBS
		  p.MoveToPoint(10, 5) // Start location
		  p.AddLineToPoint(40, 40)
		  p.AddLineToPoint(5, 60)
		  
		  g.DrawingColor = &c0000FF
		  g.DrawPath(p, True)
		  
		  
		  Var qCurve As New DynapdfGraphicsPathMBS
		  qCurve.MoveToPoint(38, 100)
		  qCurve.AddQuadraticCurveToPoint(138, 0, 238, 100)
		  
		  g.DrawingColor = &c00FF00
		  g.PenSize = 10
		  g.DrawPath(qCurve)
		  
		  Var rect As New DynapdfGraphicsPathMBS
		  rect.AddRectangle(300+10, 300+10, 100, 150)
		  g.DrawingColor = &cFF0000
		  g.DrawPath(rect)
		  
		  rect = New DynapdfGraphicsPathMBS
		  rect.AddRoundRectangle(10, 300+10, 100, 150, 10, 10)
		  g.DrawPath(rect)
		  
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Dim g As Graphics=OpenPrinterDialog
		  
		  if g=nil then 
		    Return
		  end if
		  
		  draw g
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Dim pdf As New MyDynapdfMBS
		  Dim f1 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics.pdf")
		  Dim f2 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics.png")
		  Dim f3 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics Rendered.png")
		  
		  'pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  If Not pdf.CreateNewPDF(f1) Then
		    Return
		  end if
		  
		  Call pdf.Append
		  
		  dim g as Graphics = pdf.PageGraphics
		  
		  draw g, pdf
		  
		  
		  // for debugging, show temp picture
		  Dim p As Picture = pdf.PageGraphicsPicture
		  p.Save(f2, p.SaveAsPNG)
		  
		  
		  Call pdf.EndPage
		  
		  If pdf.HasPro Then
		    Call pdf.RenderPageToImage(1, f3, 150, 0, 0, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfFlate, pdf.kifmPNG)
		  End If
		  
		  Call pdf.CloseFile
		  
		  
		  
		  
		  f1.Launch True
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  draw g
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
