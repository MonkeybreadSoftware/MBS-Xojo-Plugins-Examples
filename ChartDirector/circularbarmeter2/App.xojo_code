#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  CDBaseChartMBS.ScaleFactor = 2
		  
		  For i As Integer = 0 To 7
		    CreateChart i
		  Next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateChart(chartIndex as integer)
		  // The value to display on the meter
		  Const value = 85
		  
		  // The meter radius and angle
		  Const radius = 50
		  Dim angle As Double = value * 360.0 / 100.0
		  
		  // Create an AngularMeter with transparent background
		  Dim m As New CDAngularMeterMBS(radius * 2 + 10, radius * 2 + 10, CDBaseChartMBS.kTransparent)
		  
		  // Set the center, radius and angular range of the meter
		  m.setMeter(m.getWidth / 2, m.getHeight / 2, radius, 0, 360)
		  
		  // For circular bar meters, we do not need pointer or graduation, so we hide them.
		  m.setMeterColors(CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent)
		  m.setCap(0, CDBaseChartMBS.kTransparent)
		  
		  // In this example, the circular bar has 20 segments
		  Dim angleStep As Integer = 360 / 20
		  
		  // The gap between segments is 4.5 degrees
		  Dim angleGap As Double = 4.5
		  
		  //
		  // This example demonstrates several coloring styles
		  //
		  
		  // Thd default fill and blank colors
		  Dim FillColor As Integer = &h336699
		  Dim blankColor As Integer = &heeeeee
		  
		  If (chartIndex >= 4) Then
		    // Use dark background style
		    m.setColors(CDBaseChartMBS.whiteOnBlackPalette)
		    FillColor = &h6699ff
		    blankColor = &h222222
		  end if
		  
		  If (chartIndex Mod 4 = 1) Then
		    // Alternative fill color
		    FillColor = &h00ee33
		  Elseif (chartIndex mod 4 = 2) Then
		    // Use a smooth color scale as the fill color
		    Dim smoothColorScale() As Integer = Array(0, &h0022ff, 15, &h0088ff, 30, &h00ff00, 55, &hffff00, 80, &hff0000, 100, &hff0000)
		    FillColor = m.getDrawArea.angleGradientColor(m.getWidth / 2, m.getHeight / 2, 0, 360, radius, radius - 20, smoothColorScale)
		  Elseif (chartIndex mod 4 = 3) Then
		    // Use a step color scale as the fill color
		    Dim stepColorScale() As Integer = Array(0, &h0044ff, 20, &h00ee00, 50, &heeee00, 70, &hee0000, 100)
		    FillColor = m.getDrawArea.angleGradientColor(m.getWidth / 2, m.getHeight / 2, -angleGap / 2, 360 - angleGap / 2, radius, radius - 20, stepColorScale)
		  End If
		  
		  // Draw the blank part of the circular bar
		  If (angle < 360) Then
		    // Iterate the segments in the blank part of the circular bar
		    Dim startAngle As Integer = (angle / angleStep) * angleStep
		    While startAngle < 360
		      // The first segment may be partially filled
		      Dim partialAngle As Double = If(startAngle >= angle, 0, (angle - startAngle) * (1 - angleGap / angleStep))
		      m.addRingSector(radius, radius - 20, startAngle + partialAngle, startAngle + angleStep - angleGap, blankColor)
		      startAngle = startAngle + angleStep
		    Wend
		  End If
		  
		  // Draw the fill part of the circular bar
		  If (angle > 0) then
		    // Iterate the segments in the fill part of the circular bar
		    Dim startAngle As Integer = 0 
		    While startAngle < angle
		      // The last segment may be partially filled
		      Dim angleSpan As Double = (angleStep - angleGap) * If(angle >= startAngle + angleStep, 1, (angle - startAngle) / angleStep)
		      m.addRingSector(radius, radius - 20, startAngle, startAngle + angleSpan, FillColor)
		      startAngle = startAngle + angleStep
		    wend
		  End If
		  
		  // Add a label at the center to display the value
		  m.addText(m.getWidth / 2, m.getHeight / 2, m.formatValue(value, "{value}"), "Arial", 25, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter).setMargin(0)
		  
		  'Dim pic As Picture = m.makeChartPicture
		  
		  // use PNG to pass alpha
		  Dim pngData As String = m.makeChart(m.kPNG)
		  Dim pic As Picture = Picture.FromData(pngData)
		  
		  Dim w As New MainWindow
		  w.pic = pic
		  w.top = 50
		  w.Width = pic.Width / 2
		  w.Height = pic.Height / 2
		  w.Left = 10 + 110 * chartIndex
		  w.show
		  
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
