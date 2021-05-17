#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "pyramidrotation0")
		  createChart(1, "pyramidrotation1")
		  createChart(2, "pyramidrotation2")
		  createChart(3, "pyramidrotation3")
		  createChart(4, "pyramidrotation4")
		  createChart(5, "pyramidrotation5")
		  createChart(6, "pyramidrotation6")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The data for the pyramid chart
		  dim data(-1) as double = array(156.0, 123, 211, 179)
		  
		  // The semi-transparent colors for the pyramid layers
		  dim colors(-1) as integer 
		  colors.Append &h400000cc
		  colors.Append &h4066aaee
		  colors.Append &h40ffbb00
		  colors.Append &h40ee6622
		  
		  // The rotation angle
		  dim angle as integer = img * 15
		  
		  // Create a PyramidChart object of size 200 x 200 pixels, with white (ffffff)
		  // background and grey (888888) border
		  dim c as new CDPyramidChartMBS(200, 200, &hffffff, &h888888)
		  
		  // Set the pyramid center at (100, 100), and width x height to 60 x 120 pixels
		  c.setPyramidSize(100, 100, 60, 120)
		  
		  // Set the elevation to 15 degrees and use the given rotation angle
		  
		  call c.addTitle("Rotation = "+str(angle), "ariali.ttf", 15)
		  c.setViewAngle(15, angle)
		  
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
