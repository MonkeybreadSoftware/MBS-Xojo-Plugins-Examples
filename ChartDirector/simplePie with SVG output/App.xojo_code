#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim c as CDPieChartMBS
		  
		  // The data for the pie chart
		  dim data(-1) as double=array(55.0, 18.0, 15.0, 12.0, 8.0, 30.0, 35.0)
		  
		  // The labels for the pie chart
		  dim labels(-1) as string=array("Xojo", "C++", "Pascal", "Cobol", "C#", "Java", "Visual Basic")
		  
		  // Create a PieChart object of size 360 x 300 pixels
		  c = new CDPieChartMBS(360, 300)
		  c.enableVectorOutput
		  
		  // Set the center of the pie at (180, 140) and the radius to 100 pixels
		  c.setPieSize 180,140,100
		  
		  // Set the pie data and the pie labels
		  c.setData data,labels
		  
		  dim d as CDDrawAreaMBS=c.makeChart
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("simplepie.svg")
		  dim b as BinaryStream = f.CreateBinaryFile("")
		  b.Write d.outSVG
		  b.Close
		  
		  f.Launch
		  
		End Sub
	#tag EndEvent


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
