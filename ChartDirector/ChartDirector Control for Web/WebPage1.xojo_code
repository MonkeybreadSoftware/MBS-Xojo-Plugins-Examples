#tag WebPage
Begin WebPage WebPage1
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   796
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   0
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "Ohne Titel"
   Top             =   0
   Visible         =   True
   Width           =   1027
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin ChartDirectorControl a11
      border          =   False
      ImageMapString  =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      OverlayPicture  =   0
      Scope           =   0
      ShowValueOnClick=   True
   End
   Begin ChartDirectorControl aa21
      border          =   False
      ImageMapString  =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      OverlayPicture  =   0
      Scope           =   0
      ShowValueOnClick=   True
   End
   Begin ChartDirectorControl a31
      border          =   False
      ImageMapString  =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      OverlayPicture  =   0
      Scope           =   0
      ShowValueOnClick=   False
   End
   Begin ChartDirectorControl a41
      border          =   False
      ImageMapString  =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      OverlayPicture  =   0
      Scope           =   0
      ShowValueOnClick=   True
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
      Text            =   "Click on sectors."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   774
      Underline       =   False
      Visible         =   True
      Width           =   580
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Method, Flags = &h0
		Function GetMBSLogo(w as integer) As Picture
		  
		  dim p as Picture = LogoMBS(500)
		  
		  dim q as new Picture(w,w,32)
		  
		  q.Graphics.DrawPicture p,0,0,w,w,0,0,500,500
		  
		  Return q
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Data0(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Data1(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Data2(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private HighLightSector As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events a11
	#tag Event
		Function Render(Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
		  CDBaseChartMBS.ScaleFactor = 2 // let plugin do double Resolution
		  
		  // The data for the line chart comes from properties
		  
		  // Create a XYChart object of size 600 x 375 pixels
		  dim c as new CDXYChartMBS(width*factor, height*factor)
		  
		  
		  'C.setBackground(C.kTransparent)
		  C.setTransparentColor(-1)
		  
		  C.setClipping(0)
		  C.setAntiAlias(True, C.kAntiAlias)
		  
		  
		  
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  call c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) and of 500 x 280 pixels in size. Use a vertical
		  // gradient color from light blue (f9f9ff) to sky blue (aaccff) as background.
		  // Set border to transparent and grid lines to white (ffffff).
		  call c.setPlotArea(50*factor, 55*factor, (width-100)*factor, (height-100)*factor, c.linearGradientColor(0, 55, 0, 335, &hf9fcff, &haaccff), -1, c.kTransparent, &hffffff)
		  call c.setClipping
		  
		  // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
		  // font, with transparent background.
		  c.addLegend(50*factor, 28*factor, false, "arialbd.ttf", 10*factor).setBackground(c.kTransparent)
		  
		  // Set the x axis labels
		  'call c.xAxis.setLabels(labels)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30*factor)
		  c.yAxis2.setTickDensity(30*factor)
		  
		  // Set axis label style to 8pts Arial Bold
		  call c.xAxis.setLabelStyle("arialbd.ttf", 8*factor)
		  call c.yAxis.setLabelStyle("arialbd.ttf", 8*factor)
		  call c.yAxis2.setLabelStyle("arialbd.ttf", 8*factor)
		  
		  // Set axis line width to 2 pixels
		  c.xAxis.setWidth(2*factor)
		  c.yAxis.setWidth(2*factor)
		  c.yAxis2.setWidth(2*factor)
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  call c.yAxis.setTitle("Revenue in US millions", "arialbi.ttf", 10*factor)
		  call c.yAxis2.setTitle("Revenue in US millions", "arialbi.ttf", 10*factor)
		  
		  // scroll
		  c.xAxis.setLinearScale(0.0, 100.0)
		  c.xAxis.setRounding(false, false)
		  
		  c.yAxis.setLinearScale(0.0, 100.0)
		  c.yAxis.setRounding(false, false)
		  c.yAxis2.setLinearScale(0.0, 100.0)
		  c.yAxis2.setRounding(false, false)
		  
		  // Add a line layer to the chart
		  dim layer as CDLineLayerMBS
		  layer = c.addLineLayer
		  
		  // Set the line width to 3 pixels
		  layer.setLineWidth(3)
		  
		  // Add the three data sets to the line layer, using circles, diamands and X
		  // shapes as symbols
		  dim d as CDDataSetMBS
		  d=layer.addDataSet(data0, &hff0000, "Quantum Computer")
		  d.setDataSymbol(c.kCircleSymbol, 9*factor)
		  d.setLineWidth(factor)
		  d=layer.addDataSet(data1, &h00ff00, "Atom Synthesizer")
		  d.setDataSymbol(c.kDiamondSymbol, 11*factor)
		  d.setLineWidth(factor)
		  d=layer.addDataSet(data2, &hff6600, "Proton Cannon")
		  d.setLineWidth(factor)
		  d.setDataSymbol(c.Cross2Shape, 11*factor)
		  
		  Return c
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  
		  // create test data
		  
		  Dim x0 As Double = 70
		  Dim x1 As Double = 50
		  Dim x2 As Double = 30
		  
		  Data0.Append(x0)
		  Data1.Append(x1)
		  Data2.Append(x2)
		  
		  // Create randomized data points for line chart demo
		  For I As Integer = 1 To 100
		    
		    x0 = x0 + Rnd() * 5.0 - 2.5
		    x1 = x1 + Rnd() * 5.0 - 2.5
		    x2 = x2 + Rnd() * 5.0 - 2.5
		    
		    Data0.Append(x0)
		    Data1.Append(x1)
		    Data2.Append(x2)
		    
		  Next
		  
		  
		  Dim P As Picture
		  
		  
		  // Ghost the overlay image
		  P = GetMBSLogo(200)
		  P.Mask.Graphics.ForeColor = &cDDDDDD
		  P.Mask.Graphics.FillRect(0, 0, P.Width, P.Height)
		  
		  
		  // Set the overlay image
		  Me.OverlayPicture = P
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events aa21
	#tag Event
		Function Render(Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
		  CDBaseChartMBS.ScaleFactor = 2 // let plugin do double Resolution
		  
		  dim f as double = factor // scale factor, 1 for screen and 4 or more for printing
		  
		  dim data0(-1) as double = array(6, 12.5, 18.2, 15.0)
		  dim angles0(-1) as double = array(45, 96, 169, 258.0)
		  dim size0(-1) as double = array(f*41, f*105, f*12, f*20.0)
		  
		  dim data1(-1) as double = array(18, 16, 11, 14.0)
		  dim angles1(-1) as double = array(30, 210, 240, 310.0)
		  dim size1(-1) as double = array(f*30, f*45, f*12, f*90.0)
		  
		  // Create a PolarChart object of size 460 x 460 pixels
		  dim c as new CDPolarChartMBS(f*width, f*height)
		  
		  // Add a title to the chart at the top left corner using 15pts Arial Bold Italic
		  // font
		  call c.addTitle(CDPolarChartMBS.kTopLeft, "<*underline=2*>EM Field Strength", "arialbi.ttf", f*15)
		  
		  // Set center of plot area at (230, 240) with radius 180 pixels
		  c.setPlotArea(f*width/2, f*height/2, f*min(width,height)*0.35)
		  
		  // Use alternative light grey/dark grey circular background color
		  c.setPlotAreaBg(&hdddddd, &heeeeee)
		  
		  // Set the grid style to circular grid
		  c.setGridStyle(false)
		  
		  // Add a legend box at the top right corner of the chart using 9 pts Arial Bold
		  // font
		  c.addLegend(f*width-f*2, f*0, true, "arialbd.ttf", f*9).setAlignment(CDPolarChartMBS.kTopRight)
		  
		  // Set angular axis as 0 - 360, with a spoke every 30 units
		  c.angularAxis.setLinearScale(0, 360, 30)
		  
		  c.radialAxis.setLinearScale 0, 20,5
		  // Set the radial axis label format
		  c.radialAxis.setLabelFormat("{value} km")
		  
		  c.angularAxis.setLabelGap f*8
		  
		  call c.angularAxis.setLabelStyle "",8*f
		  call c.radialAxis.setLabelStyle "",8*f
		  
		  
		  // Add a blue (&h9999ff) line layer to the chart using (data0, angle0)
		  dim layer0 as CDPolarLineLayerMBS
		  layer0 = c.addLineLayer(data0, &h9999ff, "Cold Spot")
		  layer0.setAngles(angles0)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer0.setLineWidth(0)
		  
		  // Use a circular data point symbol
		  layer0.setDataSymbol(CDPolarChartMBS.kCircleSymbol, f*11)
		  
		  // Modulate the symbol size by size0 to produce a bubble chart effect
		  layer0.setSymbolScale(size0)
		  
		  // Add a red (&hff9999) line layer to the chart using (data1, angle1)
		  dim layer1 as CDPolarLineLayerMBS
		  layer1 = c.addLineLayer(data1,&hff9999, "Hot Spot")
		  layer1.setAngles(angles1)
		  
		  // Disable the line by setting its width to 0, so only the symbols are visible
		  layer1.setLineWidth(0)
		  
		  // Use a circular data point symbol
		  layer1.setDataSymbol(CDPolarChartMBS.kCircleSymbol, f*11)
		  
		  // Modulate the symbol size by size1 to produce a bubble chart effect
		  layer1.setSymbolScale(size1)
		  
		  // Output the chart
		  Return c
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events a31
	#tag Event
		Sub ItemClicked(XLabel As String, X As Integer, DataSet As Integer, DataSetName As String, Value As Double, Title As String, Sector As Integer, Label As String)
		  // Manage UI interaction with chart rendering variables
		  If (Sector = HighLightSector) Then
		    HighLightSector = -1
		  Else
		    HighLightSector = Sector
		  End If
		  
		  Me.Redraw
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Dim P As Picture
		  
		  
		  // Ghost the overlay image
		  P = GetMBSLogo(200)
		  P.Mask.Graphics.ForeColor = &cDDDDDD
		  P.Mask.Graphics.FillRect(0, 0, P.Width, P.Height)
		  
		  
		  // Set the overlay image
		  Me.OverlayPicture = P
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function Render(Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
		  CDBaseChartMBS.ScaleFactor = 2 // let plugin do double Resolution
		  
		  dim f as double = factor // scale factor, 1 for screen and 4 or more for printing
		  
		  // The data for the pie chart
		  dim data(-1) as double = array(21.0, 18, 15, 12, 8, 24)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string = array("Labor", "Licenses", "Taxes", "Legal", "Facilities", "Production")
		  
		  // The colors to use for the sectors
		  dim colors(-1) as integer
		  
		  colors.Append &h66aaee
		  colors.Append &heebb22
		  colors.Append &hbbbbbb
		  colors.Append &h8844ff
		  colors.Append &hdd2222
		  colors.Append &h009900
		  
		  // Create a PieChart object of size 600 x 320 pixels. Use a vertical gradient
		  // color from light blue (99ccff) to white (ffffff) spanning the top 100 pixels
		  // as background. Set border to grey (888888). Use rounded corners. Enable soft
		  // drop shadow.
		  
		  dim c as new CDPieChartMBS(f*width, f*height)
		  c.setBackground(c.linearGradientColor(0, 0, 0, 100, &h99ccff, &hffffff),&h888888)
		  c.setRoundedFrame(&hFFFFFF,10*f)
		  'c.setDropShadow
		  
		  if HighLightSector>=0 then
		    c.setExplode(HighLightSector)
		  end if
		  
		  // Add a title using 18 pts Times New Roman Bold Italic font. Add 16 pixels top
		  // margin to the title.
		  c.addTitle("Pie Chart With Legend Demonstration", "timesbi.ttf", f*18).setMargin(0, 0, f*16, 0)
		  
		  // Set the center of the pie at (160, 165) and the radius to 110 pixels
		  c.setPieSize(f*width/4, f*height/2, f*110)
		  
		  // Draw the pie in 3D with a pie thickness of 25 pixels
		  c.set3D(f*25)
		  
		  // Set the pie data and the pie labels
		  c.setData(data, labels)
		  
		  dim x as CDTextBoxMBS = c.setLabelStyle
		  
		  
		  // Set the sector colors
		  c.setColors(CDPieChartMBS.kDataColor, colors)
		  
		  // Use local gradient shading for the sectors
		  'c.setSectorStyle(CDPieChartMBS.kLocalGradientShading)
		  
		  // Use the side label layout method, with the labels positioned 16 pixels from
		  // the pie bounding box
		  c.setLabelLayout(CDPieChartMBS.kSideLayout, 16)
		  
		  // Show only the sector number as the sector label
		  c.setLabelFormat("{={sector}+1}")
		  
		  c.setJoinLine 0,f
		  
		  // Set the sector label style to Arial Bold 10pt, with a dark grey (444444)
		  // border
		  dim t as CDTextBoxMBS=c.setLabelStyle("arialbd.ttf", f*10)
		  t.setBackground(CDPieChartMBS.kTransparent, &h444444)
		  
		  
		  // Add a legend box, with the center of the left side anchored at (330, 175), and
		  // using 10 pts Arial Bold Italic font
		  dim b as CDLegendBoxMBS = c.addLegend(f*width/2, f*height/2, true, "arialbi.ttf", f*10)
		  b.setAlignment(CDPieChartMBS.kLeft)
		  
		  // Set the legend box border to dark grey (444444), and with rounded conerns
		  b.setBackground(CDPieChartMBS.kTransparent, &h444444)
		  b.setRoundedCorners(f*10)
		  
		  // Set the legend box margin to 16 pixels, and the extra line spacing between the
		  // legend entries as 5 pixels
		  b.setMargin(f*16)
		  b.setKeySpacing(0, 5*f)
		  
		  // Set the legend box icon to have no border (border color same as fill color)
		  b.setKeyBorder(CDPieChartMBS.kSameAsMainColor)
		  
		  // Set the legend text to show the sector number, followed by a 120 pixels wide
		  // block showing the sector label, and a 40 pixels wide block showing the
		  // percentage
		  
		  // *2 as we have HiDPI!
		  b.setText("<*block,valign=top*>{={sector}+1}.<*advanceTo="+str(f*22*2)+"*><*block,width="+str(f*120*2)+"*>{label}<*/*><*block,width="+str(f*40*2)+",halign=right*>{percent}<*/*>%")
		  
		  // Output the chart
		  
		  return c
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events a41
	#tag Event
		Function Render(Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
		  CDBaseChartMBS.ScaleFactor = 2 // let plugin do double Resolution
		  
		  dim f as double = factor // scale factor, 1 for screen and 4 or more for printing
		  
		  // The data for the pyramid chart
		  dim data(-1) as double = array(156.0, 123, 211, 179)
		  
		  // The labels for the pyramid chart
		  dim labels(-1) as string = array("Funds", "Bonds", "Stocks", "Cash")
		  
		  // The semi-transparent colors for the pyramid layers
		  dim colors(-1) as integer
		  colors.Append &h60000088
		  colors.Append &h6066aaee
		  colors.Append &h60ffbb00
		  colors.Append &h60ee6622
		  
		  // Create a PyramidChart object of size 480 x 400 pixels
		  dim c as new CDPyramidChartMBS(f*width, f*height)
		  
		  // Set the cone center at (280, 180), and width x height to 150 x 300 pixels
		  c.setConeSize(f*width/2, f*height/2, f*min(height,width)*0.333, f*height*0.75)
		  
		  // Set the elevation to 15 degrees
		  c.setViewAngle(15)
		  
		  // Set the pyramid data and labels
		  c.setData(data, labels)
		  
		  // Set the layer colors to the given colors
		  c.setColors(c.kDataColor, colors)
		  
		  // Leave 1% gaps between layers
		  c.setLayerGap(0.01)
		  
		  c.setJoinLine(&h000000, f)
		  
		  // Add labels at the left side of the pyramid layers using Arial Bold font. The
		  // labels will have 3 lines showing the layer name, value and percentage.
		  call c.setLeftLabel("{label}"+EndOfLine.unix+"US ${value}K"+EndOfLine.unix+"({percent}%)", "arialbd.ttf",8*f)
		  
		  
		  Return c
		  
		  
		  
		End Function
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
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
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
#tag EndViewBehavior
