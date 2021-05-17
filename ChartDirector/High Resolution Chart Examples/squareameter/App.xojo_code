#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  
		  createChart(0, "squareameter")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  const f=4 // scale factor, 1 for screen and 4 or more for printing
		  
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The value to display on the meter
		  const value = 4.75
		  
		  // Create an AugularMeter object of size 110 x 110 pixels, using silver
		  // background color with a black 2 pixel 3D depressed border.
		  dim m as new CDAngularMeterMBS(f*110, f*110, CDBaseChartMBS.silverColor, &h000000, -2)
		  
		  // Set meter appearance according to a parameter
		  // Set the meter center at bottom left corner (15, 95), with radius 85
		  // pixels. Meter spans from 90 - 0 degrees.
		  m.setMeter(f*15, f*95, f*85, 90, 0)
		  // Add a label to the meter centered at (35, 75)
		  call m.addText(f*35, f*75, "VDC", "arialbd.ttf", f*12, CDBaseChartMBS.kTextColor, CDBaseChartMBS.kCenter)
		  
		  // Add a text box to show the value at top right corner (103, 7)
		  m.addText(f*103, f*7, m.formatValue(value, "2"), "arial.ttf", f*8, &hffffff,CDBaseChartMBS.kTopRight).setBackground(0, 0, -1)
		  
		  // Meter scale is 0 - 10, with a major tick every 2 units, and minor tick every 1
		  // unit
		  m.setScale(0, 10, 2, 1)
		  
		  //m.setLineWidth -f*2
		  m.setCap(f*3, CDBaseChartMBS.silverColor)
		  
		  m.setTickLength f*5
		  m.setLineWidth f, f, f, f
		  
		  call m.setLabelStyle "",8*f
		  
		  // Set 0 - 6 as green (99ff99) zone, 6 - 8 as yellow (ffff00) zone, and 8 - 10 as
		  // red (ff3333) zone
		  m.addZone(0, 6, &h99ff99, &h808080)
		  m.addZone(6, 8, &hffff00, &h808080)
		  m.addZone(8, 10, &hff3333, &h808080)
		  
		  // Add a semi-transparent black (80000000) pointer at the specified value
		  call m.addPointer(value, &h80000000)
		  
		  w.Backdrop=m.makeChartPicture
		  
		  w.top=50
		  w.left=50
		  w.Height=m.getHeight
		  w.Width=m.getWidth
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
