#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "surfacewireframe")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  const f=3 // scale factor, 1 for screen and 4 or more for printing
		  
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
		  dim c as new CDSurfaceChartMBS(f*380, f*340, &hffffff, &h888888)
		  
		  // Demonstrate various wireframes with and without interpolation
		  // Triangular wireframe of original data spline interpolated to 40 x 40
		  call c.addTitle("5 x 5 Points - Spline Fitted to 40 x 40"+EndOfLine.unix+"Triangular Wireframe","",f*12)
		  c.setShadingMode(CDSurfaceChartMBS.kTriangularFrame)
		  c.setInterpolation(40, 40)
		  
		  // Set the center of the plot region at (200, 170), and set width x depth x
		  // height to 200 x 200 x 150 pixels
		  c.setPlotRegion(f*200, f*170, f*200, f*200, f*150)
		  
		  // Set the plot region wall thichness to 5 pixels
		  c.setWallThickness(f*5)
		  
		  c.xAxis.setLinearScale -2,2,1
		  c.yAxis.setLinearScale -2,2,1
		  c.zAxis.setLinearScale 2.6,4.0,0.2
		  
		  call c.xAxis.setLabelStyle "",f*8
		  call c.yAxis.setLabelStyle "",f*8
		  call c.zAxis.setLabelStyle "",f*8
		  
		  c.xAxis.setTickWidth f
		  c.yAxis.setTickWidth f
		  c.zAxis.setTickWidth f
		  
		  
		  // Set the elevation and rotation angles to 20 and 30 degrees
		  c.setViewAngle(20, 30)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY, dataZ)
		  
		  
		  // Output the chart
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50
		  w.left=50
		  w.show
		  
		  w.Width=c.getWidth
		  w.Height=c.getHeight
		  
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
