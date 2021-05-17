#tag Window
Begin Window PicWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   620
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "simplePie with MouseClicks"
   Visible         =   True
   Width           =   700
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Click on the pie sectors and labels to see the sector number in the title"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   600
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   700
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim p as Picture
		  p = new Picture(pic.Width, pic.Height, 32)
		  p.Graphics.DrawPicture pic,0,0
		  
		  dim sector as integer = findsector(x,y,p)
		  
		  if sector>=0 then
		    Title="Sector "+Str(sector)
		  else
		    Title=""
		  end if
		  
		  Backdrop=p
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  // The data for the pie chart
		  dim data(-1) as double=array(55.0, 18.0, 25.0, 22.0, 18.0, 30.0, 35.0)
		  
		  // The labels for the pie chart, Words are choosen random to check font!
		  dim labels(-1) as string=array("Germany","Italy","France","Spain","UK","Poland","Russia")
		  
		  // Create a PieChart object of size 360 x 300 pixels
		  c = new CDPieChartMBS(700, 600)
		  
		  // Set the center of the pie at (180, 140) and the radius to 100 pixels
		  c.setPieSize 350,300,150
		  
		  // Set the pie data and the pie labels
		  c.setData data,labels
		  call c.setLabelStyle "Times New Roman",18
		  
		  pic=c.makeChartPicture
		  Backdrop=pic
		  
		  // read in the html map
		  Parse C.getHTMLImageMap("a")
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function findsector(x as integer, y as integer, p as picture) As integer
		  // click in on of the Rectangles?
		  for each re as MyRect in rects
		    if x>=re.left and x<=re.right and y>=re.top and y<=re.bottom then
		      if p<>Nil then
		        // draw rectangle
		        p.Graphics.ForeColor=&c000000
		        p.Graphics.DrawRect re.left, re.top, re.right-re.left, re.bottom-re.top
		      end if
		      
		      Return re.sector
		    end if
		  next
		  
		  // click in a polygon?
		  for each po as MyPoly in polys
		    dim polysides as integer=UBound(po.x)
		    
		    dim j as integer=polySides
		    dim oddNodes as Boolean=False
		    
		    for i as integer=0 to polySides
		      if (po.y(i)<y and po.y(j)>=y) or (po.y(j)<y and po.y(i)>=y) then
		        if (po.x(i)+(y-po.y(i))/(po.y(j)-po.y(i))*(po.x(j)-po.x(i))<x) then
		          oddNodes=not oddNodes
		        end if
		      end if
		      j=i
		      
		    next
		    if oddNodes then
		      
		      if p<>Nil then
		        // draw rectangle
		        p.Graphics.ForeColor=&c000000
		        
		        dim points(0) as integer
		        dim c as integer=UBound(po.x)
		        for i as integer=0 to c
		          Points.Append po.x(i)
		          Points.Append po.y(i)
		        next
		        
		        p.Graphics.DrawPolygon points
		      end if
		      
		      Return po.sector
		    end if
		    
		  next
		  
		  // nothing found
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Parse(s as string)
		  // Parse the html map
		  s=ReplaceLineEndings(s,EndOfLine)
		  
		  dim lines(-1) as string = split(s,EndOfLine)
		  
		  for each line as string in lines
		    // <area shape="poly" coords="350,145,428,166,484,222,505,300,504,320,350,300" href="a?sector=0&label=Germany&value=55&percent=27.09">
		    
		    dim parts(-1) as string = split(line,"""")
		    
		    if UBound(parts)>=6 then
		      if parts(1)="poly" then
		        dim po as new MyPoly
		        po.setCoords parts(3)
		        po.setSector parts(5)
		        polys.Append po
		      elseif parts(1)="Rect" then
		        dim re as new MyRect
		        re.setCoords parts(3)
		        re.setSector parts(5)
		        rects.Append re
		        
		      end if
		    end if
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		c As CDPieChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected polys(-1) As MyPoly
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected rects(-1) As MyRect
	#tag EndProperty


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
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
