#tag Window
Begin Window PicWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   409
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "symbolline zoom"
   Visible         =   True
   Width           =   826
   Begin Canvas out
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   375
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
   End
   Begin RadioButton ToolMove
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Move"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   632
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   174
   End
   Begin RadioButton ToolZoomIn
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Zoom In"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   632
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   174
   End
   Begin RadioButton ToolZoomOut
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Zoom Out"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   632
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   174
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  viewport=New CDViewPortManagerMBS
		  
		  viewport.setViewPortHeight 0.6
		  viewport.setViewPortTop 0.2
		  viewport.setViewPortWidth 0.1
		  viewport.setViewPortLeft 0.9
		  
		  'viewport.setZoomInWidthLimit 0.01
		  'viewport.setZoomInHeightLimit 0.01
		  viewport.setZoomOutWidthLimit 0.2
		  'viewport.setZoomOutHeightLimit 1.0
		  
		  dim x0 as Double=70
		  dim x1 as Double=50
		  dim x2 as Double=30
		  dim d as new date
		  d.Year=d.Year-1
		  
		  data0.Append x0
		  data1.Append x1
		  data2.Append x2
		  datax.append new date(d)
		  
		  for i as integer=1 to 100
		    x0=x0+rnd*5.0-2.5
		    x1=x1+rnd*5.0-2.5
		    x2=x2+rnd*5.0-2.5
		    data0.Append x0
		    data1.Append x1
		    data2.Append x2
		    
		    d.day=d.day+1
		    datax.append new date(d)
		  next
		  
		  // for the selection box
		  rectanglePicture=New Picture(32,32,32)
		  rectanglePicture.Graphics.ForeColor=&cFF0000
		  rectanglePicture.Graphics.FillRect 0,0,32,32
		  rectanglePicture.mask.Graphics.ForeColor=&cCCCCCC
		  rectanglePicture.mask.Graphics.FillRect 0,0,32,32
		  
		  redraw
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function ChartTime(d as Date) As double
		  Return CDBaseChartMBS.chartTime(d.Year, d.Month, d.day, d.Hour, d.Minute, d.Second)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub redraw()
		  // The data for the line chart
		  
		  viewport.validateViewPort
		  
		  // Create a XYChart object of size 600 x 375 pixels
		  Dim c As New CDXYChartMBS(600, 375)
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  Call c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) and of 500 x 280 pixels in size. Use a vertical
		  // gradient color from light blue (f9f9ff) to sky blue (aaccff) as background.
		  // Set border to transparent and grid lines to white (ffffff).
		  Call c.setPlotArea(50, 55, 500, 280, c.linearGradientColor(0, 55, 0, 335, &hf9fcff, &haaccff), -1, c.kTransparent, &hffffff)
		  Call c.setClipping
		  
		  // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
		  // font, with transparent background.
		  c.addLegend(50, 28, False, "arialbd.ttf", 10).setBackground(c.kTransparent)
		  
		  // Set the x axis labels
		  'call c.xAxis.setLabels(labels)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30)
		  c.yAxis2.setTickDensity(30)
		  
		  // Set axis label style to 8pts Arial Bold
		  Call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  Call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  Call c.yAxis2.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set axis line width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  c.yAxis2.setWidth(2)
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  Call c.yAxis.setTitle("Revenue in US millions", "arialbi.ttf", 10)
		  Call c.yAxis2.setTitle("Revenue in US millions", "arialbi.ttf", 10)
		  
		  // scroll
		  Dim axisLowerLimit As Double
		  Dim axisUpperLimit As Double
		  
		  Dim firstDate As Double= chartTime(datax(0))
		  Dim endDate As Double = chartTime(datax(UBound(datax)))
		  Dim deltaDate As Double = endDate-firstDate
		  
		  axisLowerLimit = endDate-deltaDate *(viewport.getViewPortLeft + viewport.getViewPortWidth)
		  axisUpperLimit = endDate-deltaDate * viewport.getViewPortLeft
		  
		  c.xAxis.setDateScale(axisLowerLimit,axisUpperLimit)
		  
		  axisLowerLimit =  100.0-100.0 *(viewport.getViewPortTop + viewport.getViewPortHeight)
		  axisUpperLimit =  100.0-100.0 * viewport.getViewPortTop
		  
		  c.yAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis.setRounding(False, False)
		  c.yAxis2.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis2.setRounding(False, False)
		  
		  // Add a line layer to the chart
		  Dim layer As CDLineLayerMBS
		  layer = c.addLineLayer
		  layer.setXData(datax)
		  
		  // Set the line width to 3 pixels
		  layer.setLineWidth(3)
		  
		  // Add the three data sets to the line layer, using circles, diamands and X
		  // shapes as symbols
		  Dim dataset As CDDataSetMBS
		  
		  dataset=layer.addDataSet(data0, &hff0000, "Quantum Computer")
		  dataset.setDataSymbol(c.kCircleSymbol, 9)
		  dataset=layer.addDataSet(data1, &h00ff00, "Atom Synthesizer")
		  dataset.setDataSymbol(c.kDiamondSymbol, 11)
		  dataset=layer.addDataSet(data2, &hff6600, "Proton Cannon")
		  dataset.setDataSymbol(c.Cross2Shape, 11)
		  
		  lastpicture=c.makeChartPicture
		  
		  viewport.setChartMetrics c.getChartMetrics
		  
		  // trigger refresh
		  out.Invalidate
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected data0(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected data1(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected data2(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected datax(-1) As date
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastpicture As picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected maxvalue As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected minvalue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected rectanglePicture As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartX2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartY As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartY2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected viewport As cdviewPortManagerMBS
	#tag EndProperty


	#tag Constant, Name = zoomInRatio, Type = Double, Dynamic = False, Default = \"2.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = zoomOutRatio, Type = Double, Dynamic = False, Default = \"0.5", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events out
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If g <> Nil Then
		    g.DrawPicture lastpicture,0,0
		    
		    If rectangleWidth > 0 Then
		      g.DrawPicture rectanglePicture, rectangleLeft, rectangleTop, rectangleWidth, rectangleHeight, 0, 0, rectanglePicture.Width, rectanglePicture.Height
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if ToolMove.Value then
		    out.MouseCursor=System.Cursors.HandClosed
		    StartX=X
		    StartY=Y
		    viewport.startDrag
		    
		  else
		    // zoom
		    StartX=X
		    StartY=Y
		    StartX2=X
		    StartY2=Y
		    
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if ToolMove.Value then
		    if viewport.dragTo(CDBaseChartMBS.kDirectionHorizontalVertical, Startx-x,y-Starty) then
		      redraw
		    end if
		  else
		    StartX2=X
		    StartY2=Y
		    
		    dim l,t as integer
		    dim w,h as integer
		    
		    l=min(StartX,StartX2)
		    t=min(StartY,StartY2)
		    w=StartX2-StartX
		    h=StartY2-StartY
		    if w<0 then w=-w
		    if h<0 then h=-h
		    
		    // trigger refresh
		    RectangleTop = t
		    rectangleLeft = l
		    rectangleWidth = w
		    rectangleHeight = h
		    out.Invalidate
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  rectangleWidth = 0
		  
		  if ToolMove.Value then
		    out.MouseCursor=System.Cursors.HandOpen
		  elseif ToolZoomIn.Value then
		    
		    // zoom on point?
		    
		    if abs(X-StartX)<3 and abs(Y-StartY)<3 then
		      
		      // zoom in on point
		      if viewport.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) then
		        if viewport.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, zoomInRatio) then
		          redraw
		        end if
		      else
		        redraw
		        beep
		      end if
		      
		    else
		      
		      // zoom in on a rectangle
		      if viewport.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) then
		        if viewport.zoomTo(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, StartX, StartY) then
		          redraw
		        end if
		      else
		        redraw
		        beep
		      end if
		    end if
		    
		  elseif ToolZoomOut.Value then
		    
		    // zoom out on point
		    if viewport.canZoomOut(CDBaseChartMBS.kDirectionHorizontalVertical) then
		      if viewport.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, zoomOutRatio) then
		        redraw
		      end if
		    else
		      redraw
		      beep
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.MouseCursor=System.Cursors.HandOpen
		  
		  
		  
		  // fix some properties if set wrong in IDE
		  
		  me.DoubleBuffer = false
		  me.EraseBackground = false
		  
		  #if RBVersion >= 2013.0 then
		    me.Transparent = False
		  #endif
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ToolMove
	#tag Event
		Sub Action()
		  out.MouseCursor=System.Cursors.HandOpen
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ToolZoomIn
	#tag Event
		Sub Action()
		  out.MouseCursor=System.Cursors.MagnifyLarger
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ToolZoomOut
	#tag Event
		Sub Action()
		  out.MouseCursor=System.Cursors.MagnifySmaller
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
	#tag ViewProperty
		Name="rectangleHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="rectangleLeft"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="rectangleTop"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="rectangleWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
