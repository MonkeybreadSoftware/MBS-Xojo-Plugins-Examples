#tag MobileScreen
Begin MobileScreen Screen1
   BackButtonCaption=   ""
   Compatibility   =   ""
   ControlCount    =   0
   HasNavigationBar=   True
   LargeTitleDisplayMode=   2
   Left            =   0
   TabBarVisible   =   True
   TabIcon         =   0
   TintColor       =   "&h00000000"
   Title           =   "multishapebar"
   Top             =   0
   Begin MobileImageViewer ImageViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageViewer1, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 3, TopLayoutGuide, 3, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   ImageViewer1, 4, BottomLayoutGuide, 4, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      DisplayMode     =   2
      Enabled         =   True
      Height          =   503
      Image           =   0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   ""
      Top             =   65
      Visible         =   True
      Width           =   320
   End
End
#tag EndMobileScreen

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		  // The data for the bar chart
		  Dim data0(-1) As Double = Array( 100, 125, 245, 147.0)
		  Dim data1(-1) As Double = Array( 85, 156, 179, 211.0)
		  Dim data2(-1) As Double = Array( 97, 87, 56, 267.0)
		  Dim labels(-1) As String = Array("1st Quarter", "2nd Quarter", "3rd Quarter", "4th Quarter")
		  
		  // Create a XYChart object of size 600 x 350 pixels
		  Dim c As New CDXYChartMBS(600, 350)
		  
		  // Add a title to the chart using 14 pts Arial Bold Italic font
		  Call c.addTitle("Annual Product Revenue", "arialbi.ttf", 14)
		  
		  // Set the plot area at (50, 60) and of size 500 x 240. Use two alternative
		  // background colors (f8f8f8 and ffffff)
		  Call c.setPlotArea(50, 60, 500, 240, &hf8f8f8, &hffffff)
		  
		  // Add a legend box at (55, 22) using horizontal layout, with transparent
		  // background
		  Dim l As CDLegendBoxMBS
		  l=c.addLegend(55, 22, False)
		  l.setBackground(c.kTransparent)
		  
		  // Set the x axis labels
		  Call c.xAxis.setLabels labels
		  
		  // Draw the ticks between label positions (instead of at label positions)
		  c.xAxis.setTickOffset(0.5)
		  
		  // Add a multi-bar layer with 3 data sets and 9 pixels 3D depth
		  Dim layer As CDBarLayerMBS
		  layer = c.addBarLayer(c.kSide, 9)
		  Call layer.addDataSet(data0, -1, "Product A")
		  Call layer.addDataSet(data1, -1, "Product B")
		  Call layer.addDataSet(data2, -1, "Product C")
		  
		  // Set data set 1 to use a bar shape of a 6-pointed star
		  layer.setBarShape(c.StarShape(6), 0)
		  
		  // Set data set 2 to use a bar shapre of a 6-sided polygon
		  Call layer.setBarShape(c.PolygonShape(6), 1)
		  
		  // Set data set 3 to use an X bar shape
		  layer.setBarShape(c.Cross2Shape, 2)
		  
		  // Add a title to the y-axis
		  Call c.yAxis.setTitle("Revenue (USD in millions)")
		  
		  // Add a title to the x axis
		  Call c.xAxis.setTitle("Year 2005")
		  
		  // Output the chart
		  ImageViewer1.Image = c.makeChartPicture
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackButtonCaption"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasNavigationBar"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LargeTitleDisplayMode"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="MobileScreen.LargeTitleDisplayModes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Automatic"
			"1 - Always"
			"2 - Never"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabBarVisible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
