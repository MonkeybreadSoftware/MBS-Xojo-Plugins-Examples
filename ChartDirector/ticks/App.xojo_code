#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "ticks0")
		  createChart(1, "ticks1")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The data for the chart
		  dim data(-1) as double = array(100, 125, 265, 147, 67, 105.0)
		  dim labels(-1) as string = array("Jan", "Feb", "Mar", "Apr", "May", "Jun")
		  
		  // Create a XYChart object of size 250 x 250 pixels
		  dim c as new CDXYChartMBS(250, 250)
		  
		  // Set the plot area at (27, 25) and of size 200 x 200 pixels
		  call c.setPlotArea(27, 25, 200, 200)
		  
		  if (img = 1) then
		    // High tick density, uses 10 pixels as tick spacing
		    call c.addTitle("Tick Density = 10 pixels")
		    c.yAxis.setTickDensity(10)
		  else
		    // Normal tick density, just use the default setting
		    call c.addTitle("Default Tick Density")
		  end if
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Add a color bar layer using the given data. Use a 1 pixel 3D border for the
		  // bars.
		  dim colors(-1) as integer
		  c.addBarLayer(data, colors).setBorderColor(-1, 1)
		  
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+270*(img\3)
		  w.left=270*(img mod 3)
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
