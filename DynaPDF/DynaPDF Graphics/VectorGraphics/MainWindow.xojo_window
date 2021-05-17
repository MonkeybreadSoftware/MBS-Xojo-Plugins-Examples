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
   Height          =   531
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1935006797
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Vector Graphics"
   Visible         =   True
   Width           =   592
   Begin Canvas VectorCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   531
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
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
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   592
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  BuildGroup
		  
		  MakePDF
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BuildGroup()
		  Dim group As New Group2D
		  
		  Dim z As New RectShape
		  z.Width = 1
		  z.Height = 1
		  z.FillColor = RGB(255, 0, 0)
		  z.Fill = 100
		  
		  group.Append(z)
		  
		  If True Then
		    Dim r As New RoundRectShape
		    r.Width = 120
		    r.Height = 120
		    r.Border = 100
		    r.BorderColor = RGB(0,0,0) // black
		    r.FillColor = RGB(255,102,102)
		    r.CornerHeight = 15
		    r.CornerWidth = 15
		    r.BorderWidth = 2.5
		    
		    group.Append(r)
		    Dim s As New RoundRectShape
		    s.Width = 120
		    s.Height = 120
		    s.Border = 100
		    s.BorderColor = RGB(0,0,0) // black
		    s.FillColor = RGB(255,102,102)
		    s.CornerHeight = 15
		    s.CornerWidth = 15
		    s.BorderWidth = 2.5
		    s.X = r.X + 20
		    s.Y = r.Y + 20
		    
		    group.Append(s)
		    
		    
		    Dim rr As New RectShape
		    rr.Width = 120
		    rr.Height = 120
		    rr.Border = 50
		    rr.BorderColor = RGB(0,0,0) // black
		    rr.FillColor = RGB(102,102, 255)
		    rr.BorderWidth = 5
		    rr.Fill = 50
		    rr.X = s.X + 20
		    rr.Y = s.Y + 20
		    
		    group.Append(rr)
		  End If
		  
		  
		  
		  If True Then
		    Dim p As Picture
		    p = New Picture(240, 200)
		    p.Graphics.ForeColor = &cFF0000
		    p.Graphics.FillOval(0, 0, 240, 200)
		    
		    Dim px As New PixmapShape(p)
		    px.Rotation = 45 / 57.2958  // 45 Degrees in radians
		    
		    px.x = 200
		    px.y = 200
		    
		    group.Append(px)
		    
		    
		    Dim o As New OvalShape
		    o.Width = 60
		    o.Height = 120
		    
		    o.FillColor = RGB(127, 127, 255)
		    o.x = px.x
		    o.y = px.y
		    group.Append(o)
		  End If
		  
		  
		  
		  If True Then
		    Dim s As New StringShape
		    s.Text = "Hello World"
		    s.TextFont = "Helvetica"
		    s.Bold = True
		    s.Rotation = 3.14159 / 2 // (radians, 90 degrees = pi/2)
		    s.X = 0
		    s.Y = 200
		    group.Append(s)
		  End If
		  
		  
		  If True Then
		    Dim s As New StringShape
		    s.X = 20
		    s.Text = "Hello World"
		    s.HorizontalAlignment = StringShape.Alignment.Left
		    s.x = 200
		    s.y = 0
		    group.Append(s)
		  End If
		  
		  If True Then
		    Dim a As New ArcShape
		    a.ArcAngle = 1.57
		    a.StartAngle = -1.57
		    a.FillColor = RGB(255, 0, 127)
		    a.x = 0
		    a.y = 300
		    group.Append(a)
		    
		    
		    Dim aa As New ArcShape
		    aa.ArcAngle = 1.57
		    aa.StartAngle = 3.14
		    aa.FillColor = RGB(0, 255, 127)
		    aa.x = 0
		    aa.y = 300
		    group.Append(aa)
		  End If
		  
		  If false Then
		    Dim c As New CurveShape
		    c.ControlX(0) = 120
		    c.ControlY(0) = -40
		    c.Order = 1
		    c.X = 10
		    c.Y = 100
		    c.X2 = 250
		    c.Y2 = 100
		    
		    'Dim g As New Group2D
		    'g.x = 200
		    'g.y = 300
		    'g.Append c
		    group.Append(c)
		  End If
		  
		  If True Then
		    // ice cone
		    Dim fx As New FigureShape
		    fx.AddLine(0, 100, 50, 0)
		    fx.AddLine(50, 0, -50, 0)
		    fx.Border = 100  // opaque border
		    fx.BorderColor = &cFF0000  // red border
		    fx.FillColor = &cFFFF00   // yellow interior
		    
		    fx.x = 0
		    fx.y = 300
		    
		    group.Append fx
		  End If
		  
		  
		  Self.group = group
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakePDF()
		  Dim pdf As New MyDynapdfMBS
		  Dim f1 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF VectorGraphics.pdf")
		  Dim f2 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF VectorGraphics.png")
		  Dim f3 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF VectorGraphics Rendered.png")
		  
		  'pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  If Not pdf.CreateNewPDF(f1) Then
		    Return
		  End If
		  
		  Call pdf.Append
		  
		  Dim g As Graphics = pdf.PageGraphics
		  
		  g.DrawObject group, 100, 100
		  
		  
		  // for debugging, show temp picture
		  Dim p As Picture = pdf.PageGraphicsPicture
		  p.Save(f2, p.SaveAsPNG)
		  
		  
		  Call pdf.EndPage
		  
		  if pdf.HasPro then
		    Call pdf.RenderPageToImage(1, f3, 72, 0, 0, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfFlate, pdf.kifmPNG)
		  End If
		  
		  Call pdf.CloseFile
		  
		  
		  
		  
		  f1.Launch True
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		group As Group2D
	#tag EndProperty


#tag EndWindowCode

#tag Events VectorCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawObject(group, 100, 100)
		  'mSavePicture = New Picture(Me.Width, Me.Height, 32)
		  'mSavePicture.Graphics.DrawObject(group, 100, 100)
		  'g.DrawPicture(mSavePicture, 0, 0)
		  
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
