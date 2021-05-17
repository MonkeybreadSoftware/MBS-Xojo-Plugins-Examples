#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // For RB 2010r3 and newer
		  
		  // The XYZ points for the bubble chart
		  dim dataX0(-1) as double = array(150, 300, 1000, 1700.0)
		  dim dataY0(-1) as double = array(12, 60, 25, 65.0)
		  dim dataZ0(-1) as double = array(20, 50, 50, 85.0)
		  
		  dim dataX1(-1) as double = array(500, 1000, 1300.0)
		  dim dataY1(-1) as double = array(35, 50, 75.0)
		  dim dataZ1(-1) as double = array(30, 55, 95.0)
		  
		  // Create a XYChart object of size 450 x 420 pixels
		  dim c as new CDXYChartMBS(450, 420)
		  
		  // Set the plotarea at (55, 65) and of size 350 x 300 pixels, with a light grey
		  // border (&hc0c0c0). Turn on both horizontal and vertical grid lines with light
		  // grey color (&hc0c0c0)
		  call c.setPlotArea(55, 65, 350, 300, -1, -1, &hc0c0c0, &hc0c0c0, -1)
		  
		  // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 12
		  // pts Times Bold Italic font. Set the background and border color to
		  // Transparent.
		  call c.addLegend(50, 30, false, "timesbi.ttf", 12).setBackground(CDXYChartMBS.kTransparent)
		  
		  // Add a title to the chart using 18 pts Times Bold Itatic font.
		  call c.addTitle("Product Comparison Chart", "timesbi.ttf", 18)
		  
		  // Add a title to the y axis using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Capacity (tons)", "arialbi.ttf", 12)
		  
		  // Add a title to the x axis using 12 pts Arial Bold Italic font
		  call c.xAxis.setTitle("Range (miles)", "arialbi.ttf", 12)
		  
		  // Set the axes line width to 3 pixels
		  c.xAxis.setWidth(3)
		  c.yAxis.setWidth(3)
		  
		  // Add (dataX0, dataY0) as a scatter layer with semi-transparent red (&h80ff3333)
		  // circle symbols, where the circle size is modulated by dataZ0. This creates a
		  // bubble effect.
		  c.addScatterLayer(dataX0, dataY0, "Technology AAA", c.kCircleSymbol, 9, &h80FF3333, &h80FF3333).setSymbolScale(dataZ0)
		  
		  // Add (dataX1, dataY1) as a scatter layer with semi-transparent green
		  // (&h803333ff) circle symbols, where the circle size is modulated by dataZ1.
		  // This creates a bubble effect.
		  c.addScatterLayer(dataX1, dataY1, "Technology BBB", c.kCircleSymbol, 9, &h803333FF, &h803333FF).setSymbolScale(dataZ1)
		  
		  // Output the chart
		  dim p as Picture = c.makeChartPicture
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		  
		  p.Save(f, p.SaveAsMostCompatible)
		  
		  
		  Return 0
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
