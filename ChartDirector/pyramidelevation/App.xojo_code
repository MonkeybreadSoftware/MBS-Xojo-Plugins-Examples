#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "pyramidelevation0")
		  createChart(1, "pyramidelevation1")
		  createChart(2, "pyramidelevation2")
		  createChart(3, "pyramidelevation3")
		  createChart(4, "pyramidelevation4")
		  createChart(5, "pyramidelevation5")
		  createChart(6, "pyramidelevation6")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The data for the pyramid chart
		  dim data(-1) as double = array(156.0, 123, 211, 179)
		  
		  // The colors for the pyramid layers
		  dim colors(-1) as integer
		  colors.Append &h66aaee
		  colors.Append &heebb22
		  colors.Append &hcccccc
		  colors.Append &hcc88ff
		  
		  // The layer gap
		  dim angle as integer = img * 15
		  
		  // Create a PyramidChart object of size 200 x 200 pixels, with white (ffffff)
		  // background and grey (888888) border
		  dim c as new CDPyramidChartMBS(200, 200, &hffffff, &h888888)
		  
		  // Set the pyramid center at (100, 100), and width x height to 60 x 120 pixels
		  c.setPyramidSize(100, 100, 60, 120)
		  
		  // Set the layer gap
		  call c.addTitle("Elevation = "+str(angle), "ariali.ttf", 15)
		  c.setViewAngle(angle)
		  
		  // Set the pyramid data
		  c.setData(data)
		  
		  // Set the layer colors to the given colors
		  c.setColors(c.kDataColor, colors)
		  
		  // Leave 1% gaps between layers
		  c.setLayerGap(0.01)
		  
		  // Output the chart
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+220*(img\3)
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
