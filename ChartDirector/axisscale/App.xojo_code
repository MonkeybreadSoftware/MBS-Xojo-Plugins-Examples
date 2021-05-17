#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "axisscale0")
		  createChart(1, "axisscale1")
		  createChart(2, "axisscale2")
		  createChart(3, "axisscale3")
		  createChart(4, "axisscale4")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The data for the chart
		  dim data(-1) as double = array(5.5, 3.5, -3.7, 1.7, -1.4, 3.3)
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun")
		  
		  // Create a XYChart object of size 200 x 190 pixels
		  dim c as new CDXYChartMBS(200, 190)
		  
		  // Set the plot area at (30, 20) and of size 140 x 140 pixels
		  call c.setPlotArea(30, 20, 140, 140)
		  
		  // Configure the axis as according to the input parameter
		  if (img = 0) then
		    call c.addTitle("No Axis Extension", "arial.ttf", 8)
		  elseif (img = 1) then
		    call c.addTitle("Top/Bottom Extensions = 0/0", "arial.ttf", 8)
		    // Reserve 20% margin at top of plot area when auto-scaling
		    c.yAxis.setAutoScale(0, 0)
		  elseif (img = 2) then
		    call c.addTitle("Top/Bottom Extensions = 0.2/0.2", "arial.ttf", 8)
		    // Reserve 20% margin at top and bottom of plot area when auto-scaling
		    c.yAxis.setAutoScale(0.2, 0.2)
		  elseif (img = 3) then
		    call c.addTitle("Axis Top Margin = 15", "arial.ttf", 8)
		    // Reserve 15 pixels at top of plot area
		    c.yAxis.setMargin(15)
		  else
		    call c.addTitle("Manual Scale -5 to 10", "arial.ttf", 8)
		    // Set the y axis to scale from -5 to 10, with ticks every 5 units
		    c.yAxis.setLinearScale(-5, 10, 5)
		  end if
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Add a color bar layer using the given data. Use a 1 pixel 3D border for the
		  // bars.
		  dim colors(-1) As integer
		  c.addBarLayer(data, colors).setBorderColor(-1, 1)
		  
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+240*(img\3)
		  w.left=220*(img mod 3)
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
