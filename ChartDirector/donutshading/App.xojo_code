#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "donutshading0")
		  createChart(1, "donutshading1")
		  createChart(2, "donutshading2")
		  createChart(3, "donutshading3")
		  createChart(4, "donutshading4")
		  createChart(5, "donutshading5")
		  createChart(6, "donutshading6")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The data for the pie chart
		  dim data(-1) as double = array(18.0, 30, 20, 15)
		  
		  // The colors to use for the sectors
		  dim colors(-1) as integer 
		  colors.Append &h66aaee
		  colors.Append &heebb22
		  colors.Append &hbbbbbb
		  colors.Append &h8844ff
		  
		  // Create a PieChart object of size 200 x 220 pixels. Use a vertical gradient
		  // color from blue (0000cc) to deep blue (000044) as background. Use rounded
		  // corners of 16 pixels radius.
		  dim c as new CDPieChartMBS(200, 220)
		  c.setBackground(c.linearGradientColor(0, 0, 0, c.getHeight, &h0000cc, &h000044))
		  c.setRoundedFrame(&hffffff, 16)
		  
		  // Set donut center at (100, 120), and outer/inner radii as 80/40 pixels
		  c.setDonutSize(100, 120, 80, 40)
		  
		  // Set the pie data
		  c.setData(data)
		  
		  // Set the sector colors
		  c.setColors(CDPieChartMBS.kDataColor, colors)
		  
		  
		  // Demonstrates various shading modes
		  select case img
		  case 0
		    call c.addTitle("Default Shading", "bold", 12, &hffffff)
		  case 1
		    call c.addTitle("Local Gradient", "bold", 12, &hffffff)
		    c.setSectorStyle(CDPieChartMBS.kLocalGradientShading)
		  case 2
		    call c.addTitle("Global Gradient", "bold", 12, &hffffff)
		    c.setSectorStyle(CDPieChartMBS.kGlobalGradientShading)
		  case 3
		    call c.addTitle("Concave Shading", "bold", 12, &hffffff)
		    c.setSectorStyle(CDPieChartMBS.kConcaveShading)
		  case 4
		    call c.addTitle("Rounded Edge", "bold", 12, &hffffff)
		    c.setSectorStyle(CDPieChartMBS.kRoundedEdgeShading)
		  case 5
		    call c.addTitle("Radial Gradient", "bold", 12, &hffffff)
		    c.setSectorStyle(CDPieChartMBS.kRadialShading)
		  case 6
		    call c.addTitle("Ring Shading", "bold", 12, &hffffff)
		    c.setSectorStyle(CDPieChartMBS.kRingShading)
		  end Select
		  
		  // Disable the sector labels by setting the color to Transparent
		  call c.setLabelStyle("", 8, CDPieChartMBS.kTransparent)
		  
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
