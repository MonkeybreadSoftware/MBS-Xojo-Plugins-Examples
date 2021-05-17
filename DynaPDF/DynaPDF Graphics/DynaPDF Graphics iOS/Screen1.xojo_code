#tag MobileScreen
Begin MobileScreen Screen1
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "DynaPDF on iOS"
   Top             =   0
   Begin MobileImageViewer ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 3, TopLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      DisplayMode     =   1
      Enabled         =   True
      Height          =   503
      Image           =   0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  Dim pdf As New MyDynapdfMBS
		  Dim f1 As FolderItem = SpecialFolder.Documents.Child("DynaPDF Graphics.pdf")
		  Dim f2 As FolderItem = SpecialFolder.Documents.Child("DynaPDF Graphics.png")
		  Dim f3 As FolderItem = SpecialFolder.Documents.Child("DynaPDF Graphics Rendered.png")
		  
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
		  
		  ImageViewer1.Image = pic
		  'ImageViewer1.Image = p
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub draw(g as graphics, pdf as DynaPDFMBS = nil)
		  // this is normal code as you would use with graphics class anyway
		  // but we use GraphicsWrapper which can be DynaPDFGraphics, too.
		  // so graphics can go to printer, window, picture or PDF!
		  
		  If pdf <> Nil Then
		    // set pdf specific things
		  End If
		  
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
		  g.FillPath path
		  
		  g.DrawingColor = &c000000
		  g.DrawPath path
		  
		  g.Font = New Font("Zapfino", 12)
		  g.DrawText "Hello World", 200, 100
		  
		  g.Font = Font.BoldSystemFont(14)
		  g.DrawText "BoldSystemFont", 300, 100
		  
		  g.Font = Font.ItalicSystemFont(14)
		  g.DrawText "ItalicSystemFont", 300, 120
		  
		  g.Underline = true
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
