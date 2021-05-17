#tag Window
Begin Window Window1
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   0
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   400
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   81303551
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "Untitled"
   Type            =   0
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim pdf As New DynapdfMBS
		  Dim f1 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics.pdf")
		  Dim f2 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics.png")
		  Dim f3 As FolderItem = SpecialFolder.Desktop.Child("DynaPDF Graphics Rendered.png")
		  
		  'pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  If Not pdf.CreateNewPDF(f1) Then
		    Return
		  End If
		  
		  Call pdf.Append
		  
		  Dim g As Graphics = pdf.PageGraphics
		  
		  draw g, pdf
		  
		  
		  // for debugging, show temp picture
		  Dim p As Picture = pdf.PageGraphicsPicture
		  p.Save(f2, Picture.Formats.PNG)
		  
		  
		  Call pdf.EndPage
		  
		  If pdf.HasPro Then
		    Call pdf.RenderPageToImage(1, f3, 150, 0, 0, pdf.krfDefault, pdf.kpxfRGB, pdf.kcfFlate, pdf.kifmPNG)
		  End If
		  
		  
		  Call pdf.CloseFile
		  
		  
		  
		  Dim pic As Picture = Picture.Open(f3)
		  
		  backdrop = pic
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub draw(g as graphics, pdf as DynaPDFMBS = nil)
		  // this is normal code as you would use with graphics class anyway
		  // but we use GraphicsWrapper which can be DynaPDFGraphics, too.
		  // so graphics can go to printer, window, picture or PDF!
		  
		  g.DrawingColor=&c777777
		  g.DrawRectangle 0,0,g.Width-1,g.Height-1
		  
		  g.DrawingColor=&cFF0000
		  g.DrawRectangle 100,100,200,200
		  
		  g.DrawLine 0,0,100,100
		  
		  g.DrawingColor=&c000000
		  g.DrawText "Hello",150,150
		  
		  g.DrawLine 100,100,200,200
		  
		  g.DrawingColor=&c00FF00
		  g.FillOval 100,0,100,100
		  
		  g.DrawingColor=&c0000FF
		  g.DrawOval 100,0,100,100
		  
		  g.DrawingColor=&cFFFF00
		  g.FillRectangle 0,100,100,100
		  g.DrawingColor=&c000000
		  g.DrawRectangle 0,100,100,100
		  
		  g.DrawingColor=&c00FF00
		  g.FillRoundRectangle 0,250,100,100,20,20
		  g.DrawingColor=&c000000
		  g.DrawRoundRectangle 0,250,100,100,20,20
		  
		  g.DrawingColor = Color.RGB(100,200,255)
		  
		  Dim path As New DynapdfGraphicsPathMBS
		  path.MoveToPoint 10, 10
		  path.AddLineToPoint 75, 30
		  path.AddLineToPoint 10, 125
		  path.AddLineToPoint 10, 10
		  g.FillPath path
		  
		  g.DrawingColor = &c000000
		  g.DrawPath path 
		  
		  g.FontName = "Times"
		  g.FontSize = 12
		  g.DrawText "Hello World", 200, 100
		  
		  g.Bold = True
		  g.DrawText "Bold", 300, 100
		  g.Bold = False
		  
		  g.Italic = True
		  g.DrawText "Italic", 300, 120
		  g.Italic = False
		  
		  g.Underline = True
		  g.DrawText "Underlined", 300, 140
		  g.Underline = False
		  
		  
		  g.DrawText "Just a test with wrapping", 300, 160, 100
		  
		  g.DrawText "Just a test with condensed", 300, 200, 100, True
		  
		  
		  // test picture drawing
		  dim logo as Picture = LogoMBS(200)
		  
		  g.DrawPicture logo, 200, 500
		  g.DrawPicture logo, 50, 500, 100, 200, 50, 50, 100, 100
		  
		  // set a pixel
		  'g.Pixel(400,400)=&cFFFFFF
		  
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag ViewBehavior
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
