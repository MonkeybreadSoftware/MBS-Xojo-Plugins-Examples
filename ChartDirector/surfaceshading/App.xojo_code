#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "surfaceshading0")
		  createChart(1, "surfaceshading1")
		  createChart(2, "surfaceshading2")
		  createChart(3, "surfaceshading3")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The x and y coordinates of the grid
		  dim dataX(-1) as double = array(-10.0, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10)
		  dim dataY(-1) as double = array(-10.0, -8, -6, -4, -2, 0, 2, 4, 6, 8, 10)
		  
		  // The values at the grid points. In this example, we will compute the values
		  // using the formula z = x * sin(y) + y * sin(x).
		  dim dataZ(120) as Double
		  
		  
		  for yIndex as integer = 0 to UBound(datay)
		    dim y as double = dataY(yIndex)
		    
		    for xIndex as integer = 0 to UBound(datax)
		      dim x as double = dataX(xIndex)
		      dataZ(yIndex * 11 + xIndex) = x * sin(y) + y * sin(x)
		    next
		  next
		  
		  // Create a SurfaceChart object of size 380 x 400 pixels, with white (ffffff)
		  // background and grey (888888) border.
		  dim c as new CDSurfaceChartMBS(380, 400, &hffffff, &h888888)
		  
		  // Demonstrate various shading methods
		  Select case img
		  case 0
		    call c.addTitle("11 x 11 Data Points"+EndOfLine.unix+"Smooth Shading")
		  case 1
		    call c.addTitle("11 x 11 Points - Spline Fitted to 50 x 50"+EndOfLine.unix+"Smooth Shading")
		    c.setInterpolation(50, 50)
		  case 2
		    call c.addTitle("11 x 11 Data Points"+EndOfLine.unix+"Rectangular Shading")
		    c.setShadingMode(c.kRectangularShading)
		  case 3
		    call c.addTitle("11 x 11 Data Points"+EndOfLine.unix+"Triangular Shading")
		    c.setShadingMode(c.kTriangularShading)
		  end Select
		  
		  // Set the center of the plot region at (175, 200), and set width x depth x
		  // height to 200 x 200 x 160 pixels
		  c.setPlotRegion(175, 200, 200, 200, 160)
		  
		  // Set the plot region wall thichness to 5 pixels
		  c.setWallThickness(5)
		  
		  // Set the elevation and rotation angles to 45 and 60 degrees
		  c.setViewAngle(45, 60)
		  
		  // Set the perspective level to 35
		  c.setPerspective(35)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY,dataZ)
		  
		  // Set contour lines to semi-transparent black (c0000000)
		  c.setContourColor(&hc0000000)
		  
		  
		  // Output the chart
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+380*(img\2)
		  w.left=400*(img mod 2)
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
