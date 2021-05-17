#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "wideameter0")
		  createChart(1, "wideameter1")
		  createChart(2, "wideameter2")
		  createChart(3, "wideameter3")
		  createChart(4, "wideameter4")
		  createChart(5, "wideameter5")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The value to display on the meter
		  const value = 6.5
		  
		  // Create an AugularMeter object of size 200 x 100 pixels with rounded corners
		  dim m as new CDAngularMeterMBS(200, 100)
		  m.setRoundedFrame
		  
		  // Set meter background according to a parameter
		  if (img = 0) then
		    // Use gold background color
		    m.setBackground(CDBaseChartMBS.goldColor, &h000000, -2)
		  elseif (img = 1) then
		    // Use silver background color
		    m.setBackground(CDBaseChartMBS.silverColor, &h000000, -2)
		  elseif (img = 2) then
		    // Use metallic blue (9898E0) background color
		    m.setBackground(CDBaseChartMBS.metalColor(&h9898e0), &h000000, -2)
		  elseif (img = 3) then
		    // Use a wood pattern as background color
		    m.setBackground(m.patternColor(FindFile("wood.png")), &h000000, -2)
		  elseif (img = 4) then
		    // Use a marble pattern as background color
		    m.setBackground(m.patternColor(FindFile("marble.png")), &h000000, -2)
		  else
		    // Use a solid light purple (EEBBEE) background color
		    m.setBackground(&heebbee, &h000000, -2)
		  end if
		  
		  // Set the meter center at (100, 235), with radius 210 pixels, and span from -24
		  // to +24 degress
		  m.setMeter(100, 235, 210, -24, 24)
		  
		  // Meter scale is 0 - 100, with a tick every 1 unit
		  m.setScale(0, 10, 1)
		  
		  // Set 0 - 6 as green (99ff99) zone, 6 - 8 as yellow (ffff00) zone, and 8 - 10 as
		  // red (ff3333) zone
		  m.addZone(0, 6, &h99ff99, &h808080)
		  m.addZone(6, 8, &hffff00, &h808080)
		  m.addZone(8, 10, &hff3333, &h808080)
		  
		  // Add a title at the bottom of the meter using 10 pts Arial Bold font
		  call m.addTitle(CDBaseChartMBS.kBottom, "OUTPUT POWER LEVEL", "arialbd.ttf", 10)
		  
		  // Add a semi-transparent black (80000000) pointer at the specified value
		  call m.addPointer(value, &h80000000)
		  
		  w.Backdrop=m.makeChartPicture
		  
		  w.top=50+120*(img\3)
		  w.left=220*(img mod 3)
		  w.show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
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
