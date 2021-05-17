#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "squareameter0")
		  createChart(1, "squareameter1")
		  createChart(2, "squareameter2")
		  createChart(3, "squareameter3")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The value to display on the meter
		  const value = 4.75
		  
		  // Create an AugularMeter object of size 110 x 110 pixels, using silver
		  // background color with a black 2 pixel 3D depressed border.
		  dim m as new CDAngularMeterMBS(110, 110, CDBaseChartMBS.silverColor, &h000000, -2)
		  
		  // Set meter appearance according to a parameter
		  if (img = 0) then
		    // Set the meter center at bottom left corner (15, 95), with radius 85
		    // pixels. Meter spans from 90 - 0 degrees.
		    m.setMeter(15, 95, 85, 90, 0)
		    // Add a label to the meter centered at (35, 75)
		    call m.addText(35, 75, "VDC", "arialbd.ttf", 12, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter)
		    
		    // Add a text box to show the value at top right corner (103, 7)
		    m.addText(103, 7, m.formatValue(value, "2"), "arial.ttf", 8, &hffffff,CDBaseChartMBS.kTopRight).setBackground(0, 0, -1)
		  elseif (img = 1) then
		    // Set the meter center at top left corner (15, 15), with radius 85 pixels.
		    // Meter spans from 90 - 180 degrees.
		    m.setMeter(15, 15, 85, 90, 180)
		    // Add a label to the meter centered at (35, 35)
		    call m.addText(35, 35, "AMP", "arialbd.ttf", 12, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter)
		    
		    // Add a text box to show the value at bottom right corner (103, 103)
		    m.addText(103, 103, m.formatValue(value, "2"), "arial.ttf", 8, &hffffff, CDBaseChartMBS.kBottomRight).setBackground(0, 0, -1)
		  elseif (img = 2) then
		    // Set the meter center at top right corner (15, 95), with radius 85 pixels.
		    // Meter spans from 270 - 180 degrees.
		    m.setMeter(95, 15, 85, 270, 180)
		    // Add a label to the meter centered at (75, 35)
		    call m.addText(75, 35, "KW", "arialbd.ttf", 12, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter)
		    // Add a text box to show the value at bottom left corner (7, 103)
		    call m.addText(7, 103, m.formatValue(value, "2"), "arial.ttf", 8, &hffffff, CDBaseChartMBS.kBottomLeft).setBackground(0, 0, -1)
		  else
		    // Set the meter center at bottom right corner (95, 95), with radius 85
		    // pixels. Meter spans from 270 - 360 degrees.
		    m.setMeter(95, 95, 85, 270, 360)
		    // Add a label to the meter centered at (75, 75)
		    call m.addText(75, 75, "RPM", "arialbd.ttf", 12, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter)
		    
		    // Add a text box to show the value at top left corner (7, 7)
		    call m.addText(7, 7, m.formatValue(value, "2"), "arial.ttf", 8, &hffffff, CDBaseChartMBS.kTopLeft).setBackground(0, 0, -1)
		  end if
		  
		  // Meter scale is 0 - 10, with a major tick every 2 units, and minor tick every 1
		  // unit
		  m.setScale(0, 10, 2, 1)
		  
		  // Set 0 - 6 as green (99ff99) zone, 6 - 8 as yellow (ffff00) zone, and 8 - 10 as
		  // red (ff3333) zone
		  m.addZone(0, 6, &h99ff99, &h808080)
		  m.addZone(6, 8, &hffff00, &h808080)
		  m.addZone(8, 10, &hff3333, &h808080)
		  
		  // Add a semi-transparent black (80000000) pointer at the specified value
		  call m.addPointer(value, &h80000000)
		  
		  w.Backdrop=m.makeChartPicture
		  
		  w.top=50+150*(img\2)
		  w.left=150*(img mod 2)
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
