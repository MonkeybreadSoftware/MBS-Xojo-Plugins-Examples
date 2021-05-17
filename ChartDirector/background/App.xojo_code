#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  createChart(0, "background0")
		  createChart(1, "background1")
		  createChart(2, "background2")
		  createChart(3, "background3")
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub CreateChart(img as integer, filename as string)
		  dim w as new PicWindow
		  
		  w.Title=filename
		  
		  // The data for the chart
		  dim data(-1) as double = array(85, 156, 179.5, 211, 123)
		  dim labels(-1) as string = array("Mon", "Tue", "Wed", "Thu", "Fri")
		  
		  // Create a XYChart object of size 270 x 270 pixels
		  dim c as new CDXYChartMBS(270, 270)
		  
		  // Set the plot area at (40, 32) and of size 200 x 200 pixels
		  dim plotarea as CDPlotAreaMBS
		  plotarea = c.setPlotArea(40, 32, 200, 200)
		  
		  // Set the background style based on the input parameter
		  if (img = 0) then
		    // Has wallpaper image
		    c.setWallpaper(FindFile("tile.gif"))
		  elseif (img = 1) then
		    // Use a background image as the plot area background
		    plotarea.setBackground(FindFile("bg.png"))
		  elseif (img = 2) then
		    // Use white (&hffffff) and grey (&he0e0e0) as two alternate plotarea
		    // background colors
		    plotarea.setBackground(&hffffff, &he0e0e0)
		  else
		    // Use a dark background palette
		    c.setWhiteOnBlackColors
		  end if
		  
		  // Set the labels on the x axis
		  call c.xAxis.setLabels(labels)
		  
		  // Add a color bar layer using the given data. Use a 1 pixel 3D border for the
		  // bars.
		  dim colors(-1) as integer
		  c.addBarLayer(data, colors).setBorderColor(-1, 1)
		  
		  w.Backdrop=c.makeChartPicture
		  
		  w.top=50+300*(img\2)
		  w.left=300*(img mod 2)
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
