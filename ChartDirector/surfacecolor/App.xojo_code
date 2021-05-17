#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  For i As Integer = 0 To 3
		    createChart i
		  Next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub createChart(chartIndex as integer)
		  // The x and y coordinates of the grid
		  Dim dataX() As Double = Array(-4.0, -3, -2, -1, 0, 1, 2, 3, 4)
		  Dim dataX_size As Integer = dataX.Ubound + 1
		  Dim dataY() As Double = Array(-4.0, -3, -2, -1, 0, 1, 2, 3, 4)
		  Dim dataY_size As Integer = dataY.Ubound + 1
		  
		  // Use random numbers for the z values on the XY grid
		  Dim r As New CDRanSeriesMBS(99)
		  Dim dataZ() As Double = r.get2DSeries(dataX_size, dataY_size, -0.9, 0.9)
		  
		  // Create a SurfaceChart object of size 460 x 460 pixels with white (&hffffff) background and
		  // grey (&h888888) border
		  Dim c As New CDSurfaceChartMBS(460, 460, &hffffff, &h888888)
		  
		  // Set the surface data
		  c.setData(dataX, dataY, dataZ)
		  
		  // Add a color axis (the legend) in at the top center of the chart, with labels at the bottom.
		  // Set the axis to flat style.
		  Dim cAxis As CDColorAxisMBS = c.setColorAxis(c.getWidth / 2, 15, CDBaseChartMBS.kTop, 250, CDBaseChartMBS.kBottom)
		  Call cAxis.setTitle("Color Axis")
		  cAxis.setAxisBorder(CDBaseChartMBS.kTransparent, 0)
		  
		  // By default, the color axis is synchronized with the z-axis. The following code remove the
		  // synchronization so that the color axis will auto-scale independently. Set the auto-scale
		  // minimum tick spacing to 20 pixels.
		  cAxis.syncAxis(Nil)
		  cAxis.setTickDensity(20)
		  
		  If (chartIndex = 1) Then
		    // Speicify a color gradient as a list of colors, and use it in the color axis.
		    Dim colorGradient() As Integer = Array( CType(&h0044cc, Integer), &hffffff, &h00aa00)
		    
		    cAxis.setColorGradient(False, colorGradient)
		  Elseif (chartIndex = 2) Then
		    // Specify the color scale to use in the color axis
		    Dim colorScale() As Double = Array(-1.0, &h1a9850, -0.75, &h66bd63, -0.5, &ha6d96a, -0.25, &hd9ef8b, 0, &hfee08b, 0.25, &hfdae61, 0.5, &hf46d43, 0.75, &hd73027, 1)
		    
		    cAxis.setColorScale(colorScale)
		  Elseif (chartIndex = 3) Then
		    // Specify the color scale to use in the color axis. Also specify an underflow color
		    // &h66ccff (blue) for regions that fall below the lower axis limit.
		    Dim colorScale() As Double = Array(0, &hffff99, 0.2, &h80cdc1, 0.4, &h35978f, 0.6, &h01665e, 0.8, &h003c30, 1)
		    
		    cAxis.setColorScale(colorScale, &h66ccff)
		  End If
		  
		  // Set the center of the plot region at (230, 250), and set width x depth x height to 240 x 240
		  // x 170 pixels
		  c.setPlotRegion(230, 250, 240, 240, 170)
		  
		  // Set the plot region wall thichness to 3 pixels
		  c.setWallThickness(3)
		  
		  // Set the elevation and rotation angles to 45 degrees
		  c.setViewAngle(45, 45)
		  
		  // Set the perspective level to 20
		  c.setPerspective(20)
		  
		  // Spline interpolate data to a 50 x 50 grid for a smooth surface
		  c.setInterpolation(50, 50)
		  
		  // Set the axis title
		  Call c.xAxis.setTitle("X-Axis", "Arial Bold", 10)
		  Call c.yAxis.setTitle("Y-Axis", "Arial Bold", 10)
		  Call c.zAxis.setTitle("Z Axis", "Arial Bold", 10)
		  
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
