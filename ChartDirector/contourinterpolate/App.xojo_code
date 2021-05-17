#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "contourinterpolate0")
		  createChart(1, "contourinterpolate1")
		  createChart(2, "contourinterpolate2")
		  createChart(3, "contourinterpolate3")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The x and y coordinates of the grid
		  dim dataX(-1) as double = array(-4.0, -3, -2, -1, 0, 1, 2, 3, 4)
		  dim dataY(-1) as double = array(-4.0, -3, -2, -1, 0, 1, 2, 3, 4)
		  
		  // The values at the grid points. In this example, we will compute the values
		  // using the formula z = Sin(x * pi / 3) * Sin(y * pi / 3).
		  dim dataZ(9*9-1) as double
		  
		  for yIndex as integer = 0 to UBound(datay)
		    dim y as double = dataY(yIndex)
		    
		    for xIndex as integer = 0 to UBound(dataX)
		      dim x as double = dataX(xIndex)
		      
		      dataZ(yIndex * 9 + xIndex) = sin(x * 3.1416 / 3) * sin(y * 3.1416 / 3)
		    next
		  next
		  
		  // Create a XYChart object of size 360 x 360 pixels
		  DIM c as new CDXYChartMBS(360, 360)
		  
		  // Set the plotarea at (30, 25) and of size 300 x 300 pixels. Use
		  // semi-transparent black (c0000000) for both horizontal and vertical grid lines
		  call c.setPlotArea(30, 25, 300, 300, -1, -1, -1, &hc0000000, -1)
		  
		  // Add a contour layer using the given data
		  dim layer as CDContourLayerMBS = c.addContourLayer(dataX,dataY,dataZ)
		  
		  // Set the x-axis and y-axis scale
		  c.xAxis.setLinearScale(-4, 4, 1)
		  c.yAxis.setLinearScale(-4, 4, 1)
		  
		  Select case img
		  case 0
		    // Discrete coloring, spline surface interpolation
		    call c.addTitle("Spline Surface - Discrete Coloring", "arialbi.ttf", 12)
		  case 1
		    // Discrete coloring, linear surface interpolation
		    call c.addTitle("Linear Surface - Discrete Coloring", "arialbi.ttf", 12)
		    layer.setSmoothInterpolation(false)
		  case 2
		    // Smooth coloring, spline surface interpolation
		    call c.addTitle("Spline Surface - Continuous Coloring", "arialbi.ttf", 12)
		    layer.setContourColor(c.kTransparent)
		    layer.colorAxis.setColorGradient(true)
		  case 3
		    // Discrete coloring, linear surface interpolation
		    call c.addTitle("Linear Surface - Continuous Coloring", "arialbi.ttf", 12)
		    layer.setSmoothInterpolation(false)
		    layer.setContourColor(c.kTransparent)
		    layer.colorAxis.setColorGradient(true)
		  end Select
		  
		  // Output the chart
		  
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+380*(img\2)
		  w.left=380*(img mod 2)
		  w.show
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
