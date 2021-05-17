#tag Window
Begin Window PicWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   462
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2101945758
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "finance"
   Visible         =   True
   Width           =   640
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // Create a finance chart demo containing 100 days of data
		  const noOfDays = 100
		  
		  // To compute moving averages starting from the first day, we need to get extra
		  // data points before the first day
		  const extraDays = 30
		  
		  // In this exammple, we use a random number generator utility to simulate the
		  // data. We set up the random table to create 6 cols x (noOfDays + extraDays)
		  // rows, using 9 as the seed.
		  dim rantable as new CDRanTableMBS(9, 6, noOfDays + extraDays)
		  
		  // Set the 1st col to be the timeStamp, starting from Sep 4, 2002, with each row
		  // representing one day, and counting week days only (jump over Sat and Sun)
		  rantable.setDateCol(0, CDFinanceChartMBS.chartTime(2002, 9, 4), 86400, true)
		  
		  // Set the 2nd, 3rd, 4th and 5th columns to be high, low, open and close data.
		  // The open value starts from 100, and the daily change is random from -5 to 5.
		  rantable.setHLOCCols(1, 100, -5, 5)
		  
		  // Set the 6th column as the vol data from 5 to 25 million
		  rantable.setCol(5, 50000000, 250000000)
		  
		  // Now we read the data from the table into arrays
		  dim timeStamps(-1) as double = rantable.getCol(0).Values
		  dim highData(-1) as double = rantable.getCol(1).Values
		  dim lowData(-1) as double = rantable.getCol(2).Values
		  dim openData(-1) as double = rantable.getCol(3).Values
		  dim closeData(-1) as double = rantable.getCol(4).Values
		  dim volData(-1) as double = rantable.getCol(5).Values
		  
		  
		  // Create a FinanceChart object of width 640 pixels
		  dim c as new CDFinanceChartMBS(640)
		  
		  // Add a title to the chart
		  call c.addTitle("Finance Chart Demonstration")
		  
		  // Set the data into the finance chart object
		  call c.setData(timeStamps, highData, lowData, openData, closeData, volData, extraDays)
		  
		  // Add the main chart with 240 pixels in height
		  call c.addMainChart(240)
		  
		  // Add a 5 period simple moving average to the main chart, using brown color
		  call c.addSimpleMovingAvg(5, &h663300)
		  
		  // Add a 20 period simple moving average to the main chart, using purple color
		  call c.addSimpleMovingAvg(20, &h9900ff)
		  
		  // Add an HLOC symbols to the main chart, using green/red for up/down days
		  call c.addHLOC(&h008000, &hcc0000)
		  
		  // Add 20 days bollinger band to the main chart, using light blue (9999ff) as the
		  // border and semi-transparent blue (c06666ff) as the fill color
		  call c.addBollingerBand(20, 2, &h9999ff, &hc06666ff)
		  
		  // Add a 75 pixels volume bars sub-chart to the bottom of the main chart, using
		  // green/red/grey for up/down/flat days
		  call c.addVolBars(75, &h99ff99, &hff9999, &h808080)
		  
		  // Append a 14-days RSI indicator chart (75 pixels high) after the main chart.
		  // The main RSI line is purple (800080). Set threshold region to +/- 20 (that is,
		  // RSI = 50 +/- 25). The upper/lower threshold regions will be filled with red
		  // (ff0000)/blue (0000ff).
		  call c.addRSI(75, 14, &h800080, 20, &hff0000, &h0000ff)
		  
		  // Append a 12-days momentum indicator chart (75 pixels high) using blue (0000ff)
		  // color.
		  call c.addMomentum(75, 12, &h0000ff)
		  
		  // Output the chart
		  Backdrop=c.makeChartPicture
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
