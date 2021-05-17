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
   Height          =   897
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
      Height          =   897
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
		  
		  
		  Dim r As New RectShape
		  r.x = 0
		  r.y = 0
		  r.Width = 1000
		  r.Height = 1
		  r.FillColor = &c000000
		  
		  group.Append r
		  
		  For y As Integer = 0 To 5
		    
		    #If XojoVersion < 2019.02
		      
		      Dim s As New StringShape
		      s.HorizontalAlignment = StringShape.Alignment.Center
		      s.VerticalAlignment = CType(y, StringShape.Alignment)
		      s.Text = "Vertical "+Str(y)
		      s.TextFont = "Helvetica"
		      
		    #Else
		      
		      // since Xojo 2019r2 we have TextShape, which is a renamed StringShape
		      
		      Dim s As New TextShape
		      s.HorizontalAlignment = TextShape.Alignment.Center
		      s.VerticalAlignment = CType(y, TextShape.Alignment)
		      s.Value = "Vertical "+Str(y)
		      s.FontName = "Helvetica"
		      
		    #EndIf
		    
		    s.Bold = True
		    s.X = y * 80
		    s.Y = 0
		    group.Append(s)
		    
		  Next
		  
		  
		  r= New RectShape
		  r.x = 200
		  r.y = 200
		  r.Width = 1
		  r.Height = 1000
		  r.FillColor = &c000000
		  
		  group.Append r
		  
		  For y As Integer = 0 To 5
		    
		    #If XojoVersion < 2019.02
		      
		      Dim s As New StringShape
		      s.Text = "Horizontal "+Str(y)
		      s.TextFont = "Helvetica"
		      s.HorizontalAlignment = CType(y, StringShape.Alignment)
		      s.VerticalAlignment = StringShape.Alignment.Center
		      
		    #Else
		      
		      Dim s As New TextShape
		      s.Value = "Horizontal "+Str(y)
		      s.FontName = "Helvetica"
		      s.HorizontalAlignment = CType(y, TextShape.Alignment)
		      s.VerticalAlignment = TextShape.Alignment.Center
		      
		    #EndIf
		    
		    s.Bold = True
		    s.X = 200
		    s.Y = y * 80+200
		    group.Append(s)
		    
		  Next
		  
		  
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
