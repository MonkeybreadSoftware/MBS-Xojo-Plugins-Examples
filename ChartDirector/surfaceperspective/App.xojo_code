#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "surfaceperspective0")
		  createChart(1, "surfaceperspective1")
		  createChart(2, "surfaceperspective2")
		  createChart(3, "surfaceperspective3")
		  createChart(4, "surfaceperspective4")
		  createChart(5, "surfaceperspective5")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The x and y coordinates of the grid
		  dim dataX(-1) as double = array(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0)
		  dim dataY(-1) as double = array(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0)
		  
		  // The values at the grid points. In this example, we will compute the values
		  // using the formula z = sin((x - 0.5) * 2 * pi) * sin((y - 0.5) * 2 * pi)
		  dim dataZ(120) as double
		  
		  for yIndex as integer = 0 to UBound(datay)
		    dim y as double = (dataY(yIndex) - 0.5) * 2 * 3.1416
		    for xIndex as integer = 0 to UBound(Datax)
		      dim x as double = (dataX(xIndex) - 0.5) * 2 * 3.1416
		      dataZ(yIndex * 11 + xIndex) = sin(x) * sin(y)
		    next
		  next
		  
		  // the perspective level
		  dim perspective as integer = img * 12
		  
		  // Create a SurfaceChart object of size 360 x 360 pixels, with white (ffffff)
		  // background and grey (888888) border.
		  dim c as new CDSurfaceChartMBS(360, 360, &hffffff, &h888888)
		  
		  // Set the perspective level
		  c.setPerspective(perspective)
		  call c.addTitle("Perspective = "+str(perspective))
		  
		  // Set the center of the plot region at (195, 165), and set width x depth x
		  // height to 200 x 200 x 150 pixels
		  c.setPlotRegion(195, 165, 200, 200, 150)
		  
		  // Set the plot region wall thichness to 5 pixels
		  c.setWallThickness(5)
		  
		  // Set the elevation and rotation angles to 30 and 30 degrees
		  c.setViewAngle(30, 30)
		  
		  // Set the data to use to plot the chart
		  c.setData(dataX, dataY, dataZ)
		  
		  // Spline interpolate data to a 40 x 40 grid for a smooth surface
		  c.setInterpolation(40, 40)
		  
		  // Use smooth gradient coloring.
		  c.colorAxis.setColorGradient
		  
		  
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
