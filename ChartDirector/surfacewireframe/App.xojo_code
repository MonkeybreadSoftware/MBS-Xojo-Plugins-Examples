#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "surfacewireframe0")
		  createChart(1, "surfacewireframe1")
		  createChart(2, "surfacewireframe2")
		  createChart(3, "surfacewireframe3")
		  createChart(4, "surfacewireframe4")
		  createChart(5, "surfacewireframe5")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The x and y coordinates of the grid
		  dim dataX(-1) as double = array(-2.0, -1, 0, 1, 2)
		  dim dataY(-1) as double = array(-2.0, -1, 0, 1, 2)
		  
		  // The values at the grid points. In this example, we will compute the values
		  // using the formula z = square_root(15 - x * x - y * y).
		  dim dataZ(24) as Double
		  
		  for yIndex as integer = 0 to UBound(dataY)
		    dim y as double = dataY(yIndex)
		    
		    for xIndex as integer = 0 to UBound(dataX)
		      dim x as double = dataX(xIndex)
		      
		      dataZ(yIndex * 5 + xIndex) = sqrt(15 - x * x - y * y)
		    next
		  next
		  
		  // Create a SurfaceChart object of size 380 x 340 pixels, with white (ffffff)
		  // background and grey (888888) border.
		  dim c as new CDSurfaceChartMBS(380, 340, &hffffff, &h888888)
		  
		  // Demonstrate various wireframes with and without interpolation
		  Select case img
		  case 0
		    // Original data without interpolation
		    call c.addTitle("5 x 5 Data Points"+EndOfLine.unix+"Standard Shading", "arialbd.ttf", 12)
		    c.setContourColor(&h80ffffff)
		  case 1
		    // Original data, spline interpolated to 40 x 40 for smoothness
		    call c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40"+EndOfLine.unix+"Standard Shading", "arialbd.ttf", 12)
		    c.setContourColor(&h80ffffff)
		    c.setInterpolation(40, 40)
		  case 2
		    // Rectangular wireframe of original data
		    call c.addTitle("5 x 5 Data Points"+EndOfLine.unix+"Rectangular Wireframe")
		    c.setShadingMode(CDSurfaceChartMBS.kRectangularFrame)
		  case 3
		    // Rectangular wireframe of original data spline interpolated to 40 x 40
		    call c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40"+EndOfLine.unix+"Rectangular Wireframe")
		    
		    c.setShadingMode(CDSurfaceChartMBS.kRectangularFrame)
		    c.setInterpolation(40, 40)
		  case 4
		    // Triangular wireframe of original data
		    call c.addTitle("5 x 5 Data Points"+EndOfLine.unix+"Triangular Wireframe")
		    c.setShadingMode(CDSurfaceChartMBS.kTriangularFrame)
		  case 5
		    // Triangular wireframe of original data spline interpolated to 40 x 40
		    call c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40"+EndOfLine.unix+"Triangular Wireframe")
		    c.setShadingMode(CDSurfaceChartMBS.kTriangularFrame)
		    c.setInterpolation(40, 40)
		  end Select
		  
		  // Set the center of the plot region at (200, 170), and set width x depth x
		  // height to 200 x 200 x 150 pixels
		  c.setPlotRegion(200, 170, 200, 200, 150)
		  
		  // Set the plot region wall thichness to 5 pixels
		  c.setWallThickness(5)
		  
		  // Set the elevation and rotation angles to 20 and 30 degrees
		  c.setViewAngle(20, 30)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY, dataZ)
		  
		  
		  // Output the chart
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+360*(img\4)
		  w.left=400*(img mod 4)
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
