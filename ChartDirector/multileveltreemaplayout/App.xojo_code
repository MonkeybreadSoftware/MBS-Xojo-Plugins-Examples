#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  For i As Integer = 0 To 5
		    createChart i
		  Next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub createChart(chartIndex as integer)
		  // The first level nodes of the tree map. There are 4 nodes.
		  Dim names() As String = Array("A", "B", "C", "D")
		  
		  // Use random numbers for second level nodes
		  Dim r As New CDRanSeriesMBS(11 + chartIndex)
		  
		  Dim series0() As Double = r.getSeries(6, 10, 100)
		  Dim series1() As Double = r.getSeries(6, 10, 100)
		  Dim series2() As Double = r.getSeries(6, 10, 100)
		  Dim series3() As Double = r.getSeries(6, 10, 100)
		  
		  // Colors for second level nodes
		  Dim colors0() As Integer = Array(CType(&hddeedd, Integer), &hbbeebb, &h99ee99, &h77ee77, &h55ee55, &h33ee33)
		  Dim colors1() As Integer = Array(CType(&hffeedd, Integer), &hffddbb, &hffcc99, &hffbb77, &hffaa55, &hff9933)
		  Dim colors2() As Integer = Array(CType(&hddeeff, Integer), &hbbddff, &h99ccee, &h77bbee, &h55aadd, &h3399dd)
		  Dim colors3() As Integer = Array(CType(&hffeeff, Integer), &heeccee, &hddaadd, &hcc88cc, &hbb66bb, &haa44aa)
		  
		  // Create a Tree Map object of size 400 x 380 pixels
		  Dim c As New CDTreeMapChartMBS(400, 380)
		  
		  // Set the plotarea at (10, 35) and of size 380 x 300 pixels
		  c.setPlotArea(10, 35, 380, 300)
		  
		  // Obtain the root of the tree map, which is the entire plot area
		  Dim root As CDTreeMapNodeMBS = c.RootNode
		  
		  // Add first level nodes to the root. We do not need to provide data as they will be computed as
		  // the sum of the second level nodes.
		  Dim empty() As Double
		  root.setData(empty, names)
		  
		  Dim emptyString() As String
		  // Add second level nodes to each of the first level node
		  root.Node(0).setData(series0, emptyString, colors0)
		  root.Node(1).setData(series1, emptyString, colors1)
		  root.Node(2).setData(series2, emptyString, colors2)
		  root.Node(3).setData(series3, emptyString, colors3)
		  
		  // Get the prototype (template) for the first level nodes.
		  Dim nodeConfig As CDTreeMapNodeMBS = c.getLevelPrototype(1)
		  
		  // Hide the first level node cell border by setting its color to transparent
		  nodeConfig.setColors(-1, CDBaseChartMBS.kTransparent)
		  
		  // Get the prototype (template) for the second level nodes.
		  Dim nodeConfig2 As CDTreeMapNodeMBS = c.getLevelPrototype(2)
		  
		  // Set the label format for the nodes to include the parent node's label and index of the second
		  // level node. Use semi-transparent black (3f000000) Arial Bold font and put the label at the
		  // center of the cell.
		  nodeConfig2.setLabelFormat("{parent.label}{index}", "Arial Bold", 8, &h3f000000, CDBaseChartMBS.kCenter)
		  
		  
		  // Set the second level node cell border to white (ffffff)
		  nodeConfig2.setColors(-1, &hffffff)
		  
		  If (chartIndex = 0) Then
		    // Squarify (default) - Layout the cells so that they are as square as possible.
		    Call c.addTitle("Squarify", "Arial Bold", 15)
		  Elseif (chartIndex = 1) Then
		    // Slice and Dice - First level cells flow horizontally. Second level cells flow vertically.
		    // (The setLayoutMethod also supports other flow directions.)
		    Call c.addTitle("Slice and Dice", "Arial Bold", 15)
		    root.setLayoutMethod(CDBaseChartMBS.kTreeMapSliceAndDice)
		  Elseif (chartIndex = 2) Then
		    // Binary Split by Size - Split the cells into left/right groups so that their size are as
		    // close as possible. For each group, split the cells into top/bottom groups using the same
		    // criteria. Continue until each group contains one cell. (The setLayoutMethod also supports
		    // other flow directions.)
		    Call c.addTitle("Binary Split by Size", "Arial Bold", 15)
		    root.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryBySize)
		    nodeConfig.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryBySize)
		  Elseif (chartIndex = 3) Then
		    // Layout first level cells using Slice and Dice. Layout second level cells using Binary
		    // Split By Size.
		    Call c.addTitle("Slice and Dice + Binary By Size", "Arial Bold", 15)
		    root.setLayoutMethod(CDBaseChartMBS.kTreeMapSliceAndDice)
		    nodeConfig.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryBySize)
		  Elseif (chartIndex = 4) Then
		    // Layout first level cells using Slice and Dice. Layout second level cells using Squarify.
		    Call c.addTitle("Slice and Dice + Squarify", "Arial Bold", 15)
		    root.setLayoutMethod(CDBaseChartMBS.kTreeMapSliceAndDice)
		    nodeConfig.setLayoutMethod(CDBaseChartMBS.kTreeMapSquarify)
		  Elseif (chartIndex = 5) Then
		    // Layout first level cells using Binary Split By Size.. Layout second level cells using
		    // Strip. With Strip layout, cells flow from left to right, top to bottom. The number of
		    // cells in each row is such that they will be as close to a square as possible. (The
		    // setLayoutMethod also supports other flow directions.)
		    Call c.addTitle("Binary Split By Size + Strip", "Arial Bold", 15)
		    root.setLayoutMethod(CDBaseChartMBS.kTreeMapBinaryBySize)
		    nodeConfig.setLayoutMethod(CDBaseChartMBS.kTreeMapStrip)
		  End If
		  
		  // Output the chart
		  Dim pic As Picture = c.makeChartPicture
		  
		  Dim w As New MainWindow
		  w.pic = pic
		  
		End Sub
	#tag EndMethod


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
