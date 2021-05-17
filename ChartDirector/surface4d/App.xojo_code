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
		  Dim dataX() As Double = Array(-10.0, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		  Dim dataX_size As Integer = dataX.Ubound + 1
		  Dim dataY() As Double = Array(-10.0, -9, -8, -7, -6, -5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
		  Dim dataY_size As Integer = dataY.Ubound + 1
		  
		  // The values at the grid points. In this example, we will compute the values using the formula
		  // z = x * sin(y) + y * sin(x).
		  Dim dataZ_size As Integer = dataX_size * dataY_size
		  Dim dataZ() As Double
		  
		  Redim dataZ(dataZ_size - 1)
		  
		  For yIndex As Integer = 0 To dataY_size - 1
		    Dim y As Double = dataY(yIndex)
		    For xIndex As Integer = 0 To dataX_size - 1
		      Dim x As Double = dataX(xIndex)
		      dataZ(yIndex * dataX_size + xIndex) = x * Sin(y) + y * Sin(x)
		    Next
		  Next
		  
		  // Create a SurfaceChart object of size 460 x 460 pixels, with white (ffffff) background and
		  // grey (888888) border.
		  Dim c As New CDSurfaceChartMBS(460, 460, &hffffff, &h888888)
		  
		  // Add a color axis at the top center of the chart, with labels at the bottom side
		  Dim cAxis As CDColorAxisMBS = c.setColorAxis(c.getWidth / 2, 10, CDBaseChartMBS.kTop, 250, CDBaseChartMBS.kBottom)
		  
		  // If the color is based on the z-values, the color axis will synchronize with the z-axis. (The
		  // Axis.syncAxis can be used to disable that.) Otherwise, the color axis will auto-scale
		  // independently. In the latter case, we set the tick spacing to at least 20 pixels.
		  cAxis.setTickDensity(20)
		  
		  // Set flat color axis style
		  cAxis.setAxisBorder(CDBaseChartMBS.kTransparent, 0)
		  
		  If (chartIndex = 0) Then
		    // The default is to use the Z values to determine the color.
		    Call cAxis.setTitle("Color based on Z", "Arial Bold", 15)
		    c.setData(dataX, dataY, dataZ)
		  Elseif (chartIndex = 1) Then
		    // ChartDirector supports using an extra value (called W value) to determine the color.
		    Call cAxis.setTitle("Color based on W", "Arial Bold", 15)
		    
		    // Use random W values
		    Dim r As New CDRanSeriesMBS(5)
		    Dim dataW() As Double = r.get2DSeries(dataX_size, dataY_size, 0.5, 9.5)
		    c.setData(dataX, dataY, dataZ, dataW)
		    
		  Elseif (chartIndex = 2) Then
		    // We can set the W values to the X coordinates. The color will then be determined by the X
		    // coordinates.
		    Call cAxis.setTitle("Color based on X", "Arial Bold", 15)
		    Dim colorX_size As Integer = dataZ_size
		    Dim colorX() As Double
		    Redim colorX(colorX_size-1)
		    
		    For yIndex As Integer = 0 To dataY_size - 1 
		      For xIndex As Integer = 0 To dataX_size - 1
		        colorX(yIndex * dataX_size + xIndex) = dataX(xIndex)
		      Next
		    Next
		    
		    c.setData(dataX, dataY, dataZ, colorX)
		  Else 
		    // We can set the W values to the Y coordinates. The color will then be determined by the Y
		    // coordinates.
		    Call cAxis.setTitle("Color based on Y", "Arial Bold", 15)
		    Dim colorY_size As Integer = dataZ_size
		    Dim colorY() As Double
		    Redim colorY(colorY_size-1)
		    
		    For yIndex As Integer = 0 To dataY_size - 1 
		      For xIndex As Integer = 0 To dataX_size - 1
		        colorY(yIndex * dataX_size + xIndex) = dataY(yIndex)
		      Next
		    Next
		    c.setData(dataX, dataY, dataZ, colorY)
		  end if
		  
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
		  
		  // Add the axis titles
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
