#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  For i As Integer = 0 To 2
		    createChart i
		  Next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addBubbleTexture(sc as CDSurfaceChartMBS)
		  // Set the original surface color to be from grey (&hbbbbbb) to light grey (&heeeeee) based on
		  // the z-value. This will become the background color of the surface.
		  Dim colorGradient() As Integer = Array( CType(&hbbbbbb, Integer), &heeeeee)
		  sc.colorAxis.setColorGradient(True, colorGradient)
		  
		  // The data values for the red bubbles
		  Dim dataX0() As Double = Array(-5.0, -2, 1, 7)
		  Dim dataY0() As Double = Array(2.0, 4, -2, -6)
		  Dim dataZ0() As Double = Array(20.0, 60, 50, 85)
		  
		  // The data values for the blue bubbles
		  Dim dataX1() As Double = Array(5.0, -5, -3)
		  Dim dataY1() As Double = Array(3.0, -4, 7)
		  Dim dataZ1() As Double = Array(100.0, 85, 95)
		  
		  // Create a bubble chart of the same size as the surface XY size
		  Dim c As New CDXYChartMBS(sc.getPlotRegionWidth, sc.getPlotRegionDepth, CDBaseChartMBS.kTransparent)
		  
		  call c.setPlotArea(0, 0, c.getWidth, c.getHeight, -1, -1, CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  // Synchronize the bubble chart axis scale to the surface axis scale. As the surface axes are
		  // visible, we can hide the bubble chart axes.
		  c.yAxis.syncAxis(sc.yAxis)
		  c.xAxis.syncAxis(sc.xAxis)
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  
		  // Add bubbles with the semi-transparent red color (&h7fff3333). Also add a matching legend
		  // entry to the surface chart.
		  c.addScatterLayer(dataX0, dataY0, "", CDBaseChartMBS.kCircleSymbol, 9, &h7fff3333, &h7fff3333).setSymbolScale(dataZ0)
		  sc.getLegend.addKey("Hot Zone", &h7fff3333)
		  
		  // Add bubbles with the semi-transparent blue color (&h7f3333ff). Also add a matchine legend
		  // entry to the surface chart
		  c.addScatterLayer(dataX1, dataY1, "", CDBaseChartMBS.kCircleSymbol, 9, &h7f3333ff, &h7f3333ff).setSymbolScale(dataZ1)
		  
		  sc.getLegend.addKey("Wet Zone", &h7f3333ff)
		  
		  // Before we generate the bubble chart as texture, we must layout the surface chart first. It is
		  // because the bubble chart axis scale depends on the surface chart axis scale.
		  sc.layout
		  
		  // Output the bubble chart and save it as a resource
		  Dim m As CDDrawAreaMBS = c.makeChart
		  sc.setResource("texture", m)
		  // Use the resource as the texture
		  sc.setSurfaceTexture(sc.patternColor("@/texture"))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addPolarTexture(sc as CDSurfaceChartMBS)
		  sc.setSurfaceAxisGrid(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  Dim c As New CDPolarChartMBS(sc.getPlotRegionWidth, sc.getPlotRegionDepth, CDBaseChartMBS.kTransparent)
		  
		  c.setPlotArea(c.getWidth / 2, c.getHeight / 2, c.getWidth / 2)
		  
		  // Use alternative light grey/dark grey circular background color
		  c.setPlotAreaBg(&haf000000, CDBaseChartMBS.kTransparent)
		  
		  // Set the grid style to circular grid
		  c.setGridStyle(False)
		  
		  // Set angular axis as 0 - 360, with a spoke every 30 units
		  c.angularAxis.setLinearScale(0, 360, 30)
		  Call c.angularAxis.setLabelStyle("normal", 8, CDBaseChartMBS.kTransparent)
		  c.radialAxis.setLinearScale(0, 10, 2)
		  c.radialAxis.setColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  
		  // Output the polar chart and save it as a resource
		  sc.setResource("texture", c.makeChart)
		  // Use the resource as the texture
		  
		  Dim patternColor As Integer = sc.patternColor("@/texture")
		  sc.setSurfaceTexture(patternColor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub createChart(chartIndex as integer)
		  // The x and y coordinates of the grid
		  Dim dataX() As Double = Array(-10.0, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		  Dim dataX_size As Integer = dataX.Ubound + 1
		  Dim dataY() As Double = Array(-10.0, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		  Dim dataY_size As Integer = dataY.Ubound + 1
		  
		  // The values at the grid points. In this example, we will compute the values using the formula
		  // z = x * y.
		  Dim dataZ_size As Integer = dataX_size * dataY_size
		  Dim dataZ() As Double
		  
		  redim dataZ(dataZ_size-1)
		  
		  For yIndex As Integer = 0 To dataY_size - 1
		    For xIndex As Integer = 0 To dataX_size - 1
		      dataZ(yIndex * dataX_size + xIndex) = dataX(xIndex) * dataY(yIndex)
		    Next
		  Next
		  
		  // Create a SurfaceChart object of size 480 x 450 pixels
		  Dim c As New CDSurfaceChartMBS(480, 450)
		  
		  // Set the center of the plot region at (240, 210), and set width x depth x height to 240 x 240
		  // x 200 pixels
		  c.setPlotRegion(240, 210, 240, 240, 200)
		  
		  // Set the elevation and rotation angles to 30 and 15 degrees
		  c.setViewAngle(30, 15)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY, dataZ)
		  
		  // Spline interpolate data to a 80 x 80 grid for a smooth surface
		  c.setInterpolation(80, 80)
		  
		  // Reserve 50 pixels at the bottom of the z-axis to allow for the XY projection
		  c.zAxis.setMargin(0, 50)
		  
		  // Add XY projection
		  c.addXYProjection
		  
		  // Use semi-transparent black (&hc0000000) for x and y major surface grid lines. Use dotted
		  // style for x and y minor surface grid lines.
		  Dim majorGridColor As Integer = &hc0000000
		  Dim minorGridColor As Integer = c.dashLineColor(majorGridColor, CDBaseChartMBS.kDotLine)
		  c.setSurfaceAxisGrid(majorGridColor, majorGridColor, minorGridColor, minorGridColor)
		  
		  // Get the surface texture
		  Dim textureChart As CDBaseChartMBS
		  If (chartIndex = 0) Then
		    // Surface texture is a bubble chart
		    Call c.addTitle("<*underline=2*>Bubble Chart Texture", "Arial Bold", 16)
		    
		    // This texture uses the legend box, so we need to add a legend box to the chart at (490,
		    // 200).
		    Dim b As CDLegendBoxMBS = c.addLegend(490, 200, True, "Arial Bold", 10)
		    b.setBackground(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		    b.setMaxWidth(c.getWidth - 490 - 1)
		    
		    // Add the texture
		    addBubbleTexture(c)
		  Elseif (chartIndex = 1) Then
		    // Surface Texture is a polar chart
		    Call c.addTitle("<*underline=2*>Polar Chart Texture", "Arial Bold", 16)
		    
		    // This texture uses the color axis, so we add the color axis at (420, 75)
		    Dim cAxis As CDColorAxisMBS = c.setColorAxis(420, 75, CDBaseChartMBS.kTopLeft, 200, CDBaseChartMBS.kRight)
		    
		    // By default, the color axis synchronizes with the z-axis. We cancel the synchronization so
		    // that the color axis will auto-scale independently.
		    cAxis.syncAxis(Nil)
		    
		    // Add the texture
		    addPolarTexture(c)
		  Else
		    // Surface Texture is an image
		    Call c.addTitle("<*underline=2*>Image Texture", "Arial Bold", 16)
		    
		    // Use a DrawArea to load the image
		    Dim d As New CDDrawAreaMBS
		    Dim f As FolderItem = GetFolderItem("maptexture.png")
		    Call d.load(f.NativePath)
		    d.resize(240, 210)
		    
		    // Set the DrawArea as a resource
		    c.setResource("texture", d)
		    // Use the resource as the texture
		    c.setSurfaceTexture(c.patternColor("@/texture"))
		  End If
		  
		  // Set contour lines to semi-transparent white (80ffffff)
		  c.setContourColor(&h80ffffff)
		  
		  // Set the x, y and z axis titles using 10 pt Arial Bold font
		  Call c.xAxis.setTitle("X Title<*br*>Placeholder", "Arial Bold", 10)
		  Call c.yAxis.setTitle("Y Title<*br*>Placeholder", "Arial Bold", 10)
		  Call c.zAxis.setTitle("Z Title Placeholder", "Arial Bold", 10)
		  
		  
		  // Output the chart
		  Dim pic As Picture = c.makeChartPicture
		  
		  Dim w As New MainWindow
		  w.pic = pic
		  w.Left = 10 + w.Width * chartIndex
		  w.top = 50
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
