#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   83026100
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim d as new MyDynapdfMBS
		  dim file as FolderItem
		  
		  d.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  file=SpecialFolder.Desktop.Child("PDF with picture direct.pdf")
		  
		  call d.CreateNewPDF file
		  call d.Append
		  
		  // no recompressing
		  call d.SetSaveNewImageFormat(false)
		  call d.SetJPEGQuality(90)
		  
		  // get picture
		  dim p as Picture=MakePicture
		  
		  dim x,y,w,h as integer
		  dim f as Double
		  dim dw as integer = d.GetPageWidth-100
		  dim dh as integer = d.GetPageHeight-100
		  
		  // scale to fit the page size
		  f=min(dw/p.Width, dh/p.Height)
		  
		  w=f*p.Width
		  h=f*p.Height
		  
		  x=50+(dw-w)/2
		  y=50+(dh-h)/2
		  
		  // add image to pdf without mask
		  call d.InsertPicture(p,x,y,w,h)
		  
		  call d.EndPage
		  
		  
		  call d.Append
		  // add image to pdf with mask
		  call d.InsertPicture(p,p.mask,x,y,w,h)
		  call d.EndPage
		  call d.CloseFile
		  
		  file.Launch
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function MakePicture() As picture
		  dim p as Picture
		  
		  dim x1,x2,x3,x4 as integer
		  dim y1,y2,y3,y4 as integer
		  
		  // 495 pixel on 72 dpi
		  // 2062 pixel on 300 dpi
		  
		  p = new Picture(2062,2062,32)
		  
		  p.Graphics.ForeColor = &cFF0000
		  p.Graphics.FillOval 0,0,p.Width,p.Height
		  
		  p.Graphics.TextSize=200
		  p.Graphics.ForeColor = &c000000
		  p.Graphics.DrawString "DynaPDF",100,200
		  
		  const w=100
		  
		  p.Graphics.ForeColor=&C777777
		  p.Graphics.PenWidth=w*2
		  
		  x1=p.Width/2
		  x2=x1
		  x3=p.Width/4
		  x4=p.Width*3/4
		  
		  y1=p.Height/4
		  y2=p.Height*3/4
		  y3=p.Height/2
		  y4=y3
		  
		  p.Graphics.DrawLine x1,y1,x2,y2
		  p.Graphics.DrawLine x1,y1,x3,y3
		  p.Graphics.DrawLine x1,y1,x4,y4
		  
		  // add something for mask like half transparent on the bottom part
		  
		  p.mask.Graphics.ForeColor = &cCCCCCC
		  p.mask.Graphics.Fillrect 0, p.Height-300, p.Width, 100
		  p.mask.Graphics.ForeColor = &c777777
		  p.mask.Graphics.Fillrect 0, p.Height-200, p.Width, 100
		  p.mask.Graphics.ForeColor = &c333333
		  p.mask.Graphics.Fillrect 0, p.Height-100, p.Width, 100
		  
		  Backdrop=p.ScaleImageAndMaskMBS(Width,Height)
		  
		  Return p
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
