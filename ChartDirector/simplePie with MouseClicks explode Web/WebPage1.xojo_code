#tag WebPage
Begin WebPage WebPage1
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   664
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   84
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Pie Chart"
   Top             =   102
   Visible         =   True
   Width           =   720
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebImageViewer ImageView1
      ControlID       =   ""
      Enabled         =   True
      Height          =   600
      HorizontalAlignment=   0
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Picture         =   0
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   0
      Tooltip         =   ""
      Top             =   10
      URL             =   ""
      VerticalAlignment=   0
      Visible         =   True
      Width           =   700
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   1
      Text            =   "Click on a pie to explode it."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   622
      Underline       =   False
      Visible         =   True
      Width           =   271
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h0
		Function findsector(x as integer, y as integer) As integer
		  // click in on of the Rectangles?
		  for each re as MyRect in rects
		    if x>=re.left and x<=re.right and y>=re.top and y<=re.bottom then
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
		    
		    if oddNodes then // found it!
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

	#tag Method, Flags = &h0
		Sub run(HighLightSector as integer)
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
		  
		  if HighLightSector>=0 then
		    c.setExplode HighLightSector
		  end if
		  
		  pic=c.makeChartPicture
		  ImageView1.Picture=pic
		  
		  // read in the html map
		  Parse C.getHTMLImageMap("a")
		  
		  
		  
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

#tag Events ImageView1
	#tag Event
		Sub MouseDown(X As Integer, Y As Integer, Details As REALbasic.MouseEvent)
		  dim sector as integer = findsector(x,y)
		  
		  if sector>=0 then
		    Title="Sector "+Str(sector)
		  else
		    Title=""
		  end if
		  
		  run sector
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  run -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
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
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
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
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
