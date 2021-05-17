#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  // Labels for the tree map
		  Dim energy_types() As String = Array("Coal", "Oil", "Gas", "Nuclear", "Hydro", "Solar", "Wind", "Biomass", "Geothermal", "Wave")
		  
		  For chartIndex As Integer = 0 To 4
		    
		    // Random data for the tree map
		    Dim r As New CDRanSeriesMBS(3)
		    Dim data() As Double = r.getSeries(20, 20, 400)
		    
		    // Create a Tree Map object of size 300 x 300 pixels
		    Dim c As New CDTreeMapChartMBS(300, 300)
		    c.setPlotArea(20, 20, 260, 260)
		    
		    // Obtain the root of the tree map, which is the entire plot area
		    Dim root As CDTreeMapNodeMBS = c.RootNode
		    
		    // Add first level nodes to the root.
		    root.setData(data)
		    
		    If chartIndex = 0 Then
		      // Squarity - Layout the cells so that they are as square as possible.
		      Call c.addTitle("Squarify")
		      root.setLayoutMethod(CDBaseChartMBS.kTreeMapSquarify)
		    Elseif (chartIndex = 1) Then
		      // Strip layout - Cells flow from left to right, top to bottom. The number of cells in each
		      // row is such that they will be as close to a square as possible. (The setLayoutMethod also
		      // supports other flow directions.)
		      Call c.addTitle("Strip")
		      root.setLayoutMethod(CDBaseChartMBS.kTreeMapStrip)
		    Elseif (chartIndex = 2) Then
		      // Binary Split by Size - Split the cells into left/right groups so that their size are as
		      // close as possible. For each group, split the cells into top/bottom groups using the same
		      // criteria. Continue until each group contains one cell. (The setLayoutMethod also supports
		      // other flow directions.)
		      Call c.addTitle("Binary Split by Size")
		      root.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryBySize)
		    Elseif (chartIndex = 3) Then
		      // Binary Split by Count - Same as "Binary Split by Size", except that the cell count
		      // (instead of the size) is used to split the cells.
		      Call c.addTitle("Binary Split by Count")
		      root.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryByMid)
		    Elseif (chartIndex = 4) Then
		      // Binary Split by Size (Sorted) - Same as "Binary Split by Size" except the cells are
		      // sorted first.
		      Call c.addTitle("Binary Split by Size (Sorted)")
		      root.setSorting(-1)
		      root.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryBySize)
		    end if
		    
		    // Get the prototype (template) for the first level nodes.
		    Dim nodeConfig As CDTreeMapNodeMBS = c.getLevelPrototype(1)
		    
		    // Set the label format for the nodes to show the label and value with 8pt Arial Bold font in
		    // black color (000000) and center aligned in the node.
		    nodeConfig.setLabelFormat("{index}", "Arial", 8, &h000000, CDBaseChartMBS.kCenter)
		    
		    
		    // Set automatic fill color and white (ffffff) border
		    nodeConfig.setColors(CDBaseChartMBS.kDataColor, &hffffff)
		    
		    // Output the chart
		    Dim pic As Picture = c.makeChartPicture
		    
		    Dim w As New MainWindow
		    w.Title = "Tree Map Layout " + Str(chartIndex)
		    w.pic = pic
		    w.show
		    
		  Next
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
