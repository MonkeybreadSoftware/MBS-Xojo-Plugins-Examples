#tag Window
Begin Window RealTimeWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   466
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   466
   MaximizeButton  =   False
   MaxWidth        =   722
   MenuBar         =   743768063
   MenuBarVisible  =   True
   MinHeight       =   466
   MinimizeButton  =   True
   MinWidth        =   722
   Placement       =   0
   Resizeable      =   False
   Title           =   "Real-Time Chart with Viewport Control"
   Visible         =   True
   Width           =   722
   Begin BevelButton savePB
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   348454911
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   122
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   30
   End
   Begin BevelButton zoomOutPB
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   2
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   739741695
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   88
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   30
   End
   Begin BevelButton zoomInPB
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   2
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   1076600831
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   54
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   30
   End
   Begin BevelButton pointerPB
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   2
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   1400305663
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   30
   End
   Begin ChartViewerCanvas ChartViewer
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      autoHideMsg     =   ""
      Backdrop        =   0
      ChartPicture    =   0
      currentHotSpot  =   0
      currentMouseX   =   0
      currentMouseY   =   0
      defaultToolTip  =   ""
      delayImageMapUpdate=   False
      delayUpdateChart=   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   350
      HelpTag         =   ""
      holdTimerActive =   False
      Index           =   -2147483648
      InitialParent   =   ""
      isClickable     =   False
      isDragScrolling =   False
      isInMouseMove   =   False
      isInMouseMovePlotArea=   False
      isInViewPortChanged=   False
      isMouseTracking =   False
      isOnPlotArea    =   False
      isPlotAreaMouseDown=   False
      lastMouseMove   =   0
      Left            =   62
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      minDragAmount   =   0
      mouseUsage      =   0
      mouseWheelZoomRatio=   0.0
      needUpdateChart =   False
      needUpdateImageMap=   False
      plotAreaMouseDownXPos=   0
      plotAreaMouseDownYPos=   0
      Scope           =   0
      scrollDirection =   0
      selectBoxLineColor=   &c00000000
      selectBoxLineWidth=   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      updateInterval  =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   640
      zoomDirection   =   0
      zoomInRatio     =   0.0
      zoomOutRatio    =   0.0
   End
   Begin Timer ChartUpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Line LeftLine
      BorderWidth     =   1.0
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c00000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "6"
      TabPanelIndex   =   0
      TabStop         =   True
      Transparent     =   False
      Visible         =   False
      X1              =   147.0
      X2              =   207.0
      Y1              =   491.0
      Y2              =   551.0
   End
   Begin Line TopLine
      BorderWidth     =   1.0
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c00000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "7"
      TabPanelIndex   =   0
      TabStop         =   True
      Transparent     =   False
      Visible         =   False
      X1              =   400.0
      X2              =   460.0
      Y1              =   513.0
      Y2              =   573.0
   End
   Begin Line BottomLine
      BorderWidth     =   1.0
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c00000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "8"
      TabPanelIndex   =   0
      TabStop         =   True
      Transparent     =   False
      Visible         =   False
      X1              =   514.0
      X2              =   574.0
      Y1              =   513.0
      Y2              =   573.0
   End
   Begin Line RightLine
      BorderWidth     =   1.0
      Index           =   -2147483648
      InitialParent   =   ""
      LineColor       =   &c00000000
      LockedInPosition=   False
      Scope           =   0
      TabIndex        =   "9"
      TabPanelIndex   =   0
      TabStop         =   True
      Transparent     =   False
      Visible         =   False
      X1              =   248.0
      X2              =   308.0
      Y1              =   500.0
      Y2              =   560.0
   End
   Begin ViewPortControlCanvas SecondCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      ChartPicture    =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   64
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   62
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   382
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   640
   End
   Begin Label HelpLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   62
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   446
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   640
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  dataSource.stopThread
		  
		  If ViewPortControl <> Nil Then
		    ViewPortControl.Close
		    ViewPortControl = Nil
		  End If
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  Redim Self.timeStamps(sampleSize-1)
		  Redim self.dataSeriesA(sampleSize-1)
		  Redim self.dataSeriesB(sampleSize-1)
		  
		  
		  Setup
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub drawChart(viewer as ChartViewerCanvas)
		  // Draw chart
		  
		  // Get the start date and end date that are visible on the chart.
		  Dim viewPortStartDate As Double = viewer.getValueAtViewPort("x", viewer.getViewPortLeft)
		  Dim viewPortEndDate   As Double = viewer.getValueAtViewPort("x", viewer.getViewPortLeft + viewer.getViewPortWidth)
		  
		  // Extract the part of the data arrays that are visible.
		  Dim viewPortTimeStamps() As Double
		  Dim viewPortDataSeriesA() As Double
		  Dim viewPortDataSeriesB() As Double
		  
		  If (self.currentIndex > 0) Then
		    // Get the array indexes that corresponds to the visible start and end dates
		    Dim startIndex As Integer = Floor(CDXYChartMBS.bSearch(DoubleArray(self.timeStamps, self.currentIndex), viewPortStartDate))
		    Dim endIndex   As Integer =  Ceil(CDXYChartMBS.bSearch(DoubleArray(self.timeStamps, self.currentIndex), viewPortEndDate))
		    Dim noOfPoints As Integer = endIndex - startIndex + 1
		    
		    // Extract the visible data
		    If (self.timeStamps(endIndex) >= viewPortStartDate) Then
		      viewPortTimeStamps  = DoubleArray(self.timeStamps , noOfPoints, startIndex)
		      viewPortDataSeriesA = DoubleArray(self.dataSeriesA, noOfPoints, startIndex)
		      viewPortDataSeriesB = DoubleArray(self.dataSeriesB, noOfPoints, startIndex)
		    End If
		    
		    // Keep track of the latest available data at chart plotting time
		    self.trackLineEndPos = self.timeStamps(self.currentIndex - 1)
		  End If
		  
		  //
		  // At this stage, we have extracted the visible data. We can use those data to plot the chart.
		  //
		  
		  //================================================================================
		  // Configure overall chart appearance.
		  //================================================================================
		  
		  // Create an XYChart object of size 640 x 350 pixels
		  Dim c As New CDXYChartMBS(640, 350)
		  
		  // Set the plotarea at (20, 30) with width 41 pixels less than chart width, and height 50 pixels
		  // less than chart height. Use a vertical gradient from light blue (f0f6ff) to sky blue (a0c0ff)
		  // as background. Set border to transparent and grid lines to white (ffffff).
		  Call c.setPlotArea(20, 30, c.getWidth - 41, c.getHeight - 50, c.linearGradientColor(0, 30, 0, c.getHeight - 50, &hf0f6ff, &ha0c0ff), -1, c.kTransparent, &hffffff, &hffffff)
		  
		  // As the data can lie outside the plotarea in a zoomed chart, we need enable clipping.
		  c.setClipping
		  
		  // Add a title to the chart using 18pt Arial font
		  Call c.addTitle("   Multithreading Real-Time Chart", "arial.ttf", 18)
		  
		  // Add a legend box at (55, 25) using horizontal layout. Use 10pt Arial Bold as font. Set the
		  // background and border color to transparent and use line style legend key.
		  Dim b As CDLegendBoxMBS = c.addLegend(55, 25, False, "arialbd.ttf", 10)
		  b.setBackground(c.kTransparent)
		  b.setLineStyleKey
		  
		  // Set the x and y axis stems to transparent and the label font to 10pt Arial
		  c.xAxis.setColors(c.kTransparent)
		  c.yAxis.setColors(c.kTransparent)
		  Call c.xAxis.setLabelStyle("arial.ttf", 10)
		  Call c.yAxis.setLabelStyle("arial.ttf", 10, &h336699)
		  
		  // Set the y-axis tick length to 0 to disable the tick and put the labels closer to the axis.
		  c.yAxis.setTickLength(0)
		  
		  // Add axis title using 10pt Arial Bold Italic font
		  Call c.yAxis.setTitle("Ionic Temperature (C)", "arialbd.ttf", 10)
		  
		  // Configure the y-axis label to be inside the plot area and above the horizontal grid lines
		  c.yAxis.setLabelGap(-1)
		  c.yAxis.setLabelAlignment(1)
		  c.yAxis.setMargin(20)
		  
		  // Configure the x-axis labels to be to the left of the vertical grid lines
		  c.xAxis.setLabelAlignment(1)
		  
		  //================================================================================
		  // Add data to chart
		  //================================================================================
		  
		  //
		  // In this example, we represent the data by lines. You may modify the code below to use other
		  // representations (areas, scatter plot, etc).
		  //
		  
		  // Add a line layer for the lines, using a line width of 2 pixels
		  Dim layer As CDLineLayerMBS = c.addLineLayer
		  layer.setLineWidth(2)
		  layer.setFastLineMode
		  
		  // Now we add the 2 data series to the line layer with red (ff0000) and green (00cc00) colors
		  layer.setXData(viewPortTimeStamps)
		  Call layer.addDataSet(viewPortDataSeriesA, &hff0000, "Alpha")
		  Call layer.addDataSet(viewPortDataSeriesB, &h00cc00, "Beta")
		  
		  //================================================================================
		  // Configure axis scale and labelling
		  //================================================================================
		  
		  // Set the x-axis as a date/time axis with the scale according to the view port x range.
		  If (self.currentIndex > 0) Then
		    c.xAxis.setDateScale(viewPortStartDate, viewPortEndDate, 5.0)
		  End If
		  
		  // For the automatic axis labels, set the minimum spacing to 75/30 pixels for the x/y axis.
		  c.xAxis.setTickDensity(75)
		  c.yAxis.setTickDensity(30)
		  
		  // We use "hh:nn:ss" as the axis label format.
		  c.xAxis.setLabelFormat("{value|hh:nn:ss}")
		  
		  // We make sure the tick increment must be at least 1 second.
		  c.xAxis.setMinTickInc(1)
		  
		  // Set the auto-scale margin to 0.05, and the zero affinity to 0.6
		  c.yAxis.setAutoScale(0.05, 0.05, 0.6)
		  
		  //================================================================================
		  // Output the chart
		  //================================================================================
		  
		  // We need to update the track line too. If the mouse is moving on the chart (eg. if
		  // the user drags the mouse on the chart to scroll it), the track line will be updated
		  // in the MouseMovePlotArea event. Otherwise, we need to update the track line here.
		  If (Not ChartViewer.isInMouseMoveEvent) Then
		    Dim x As Integer
		    If self.trackLineIsAtEnd Then
		      x = c.getWidth
		    Else
		      x = ChartViewer.getPlotAreaMouseX
		    End If
		    
		    Call trackLineLabel(c, x)
		  End If
		  
		  // Set the chart image to the QChartViewer
		  
		  viewer.setChart(c)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawFullChart(vpc as ViewPortControl)
		  // Draw the full thumbnail chart and display it in the given QViewPortControl
		  
		  // Create an XYChart object of size 640 x 60 pixels
		  Dim c As New CDXYChartMBS(640, 60)
		  
		  // Set the plotarea with the same horizontal position as that in the main chart for alignment.
		  Call c.setPlotArea(20, 0, c.getWidth - 41, c.getHeight - 1, &hc0d8ff, -1, &hcccccc, c.kTransparent, &hffffff)
		  
		  // Set the x axis stem to transparent and the label font to 10pt Arial
		  c.xAxis.setColors(c.kTransparent)
		  Call c.xAxis.setLabelStyle("Arial", 10)
		  
		  // Put the x-axis labels inside the plot area by setting a negative label gap. Use
		  // setLabelAlignment to put the label at the right side of the tick.
		  c.xAxis.setLabelGap(-1)
		  c.xAxis.setLabelAlignment(1)
		  
		  // Set the y axis stem and labels to transparent (that is, hide the labels)
		  c.yAxis.setColors(c.kTransparent, c.kTransparent)
		  
		  // Add a line layer for the lines with fast line mode enabled
		  Dim layer As CDLineLayerMBS = c.addLineLayer
		  layer.setFastLineMode
		  
		  // Now we add the 3 data series to a line layer, using the color red (&hff3333), green
		  // (&h008800) and blue (&h3333cc)
		  layer.setXData( DoubleArray(self.timeStamps, self.currentIndex) )
		  Call layer.addDataSet(DoubleArray(self.dataSeriesA, self.currentIndex), &hff3333)
		  Call layer.addDataSet(DoubleArray(Self.dataSeriesB, Self.currentIndex), &h008800)
		  
		  // The x axis scales should reflect the full range of the view port
		  
		  Dim lowerLimit  As Double = vpc.getViewer.getValueAtViewPort("x", 0)
		  Dim higherLimit As Double = vpc.getViewer.getValueAtViewPort("x", 1)
		  
		  c.xAxis.setDateScale(lowerLimit, higherLimit, 10)
		  c.xAxis.setLabelFormat("{value|nn:ss}")
		  
		  // For the automatic x-axis labels, set the minimum spacing to 75 pixels.
		  c.xAxis.setTickDensity(75)
		  
		  // For the auto-scaled y-axis, as we hide the labels, we can disable axis rounding. This can
		  // make the axis scale fit the data tighter.
		  c.yAxis.setRounding(False, False)
		  
		  // Output the chart
		  vpc.SetChart c
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitRandomWalk()
		  dataSource = New RandomWalk
		  
		  AddHandler dataSource.GotNewValues, WeakAddressOf onData
		  
		  dataSource.run
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onChartUpdateTimer()
		  // Get data from the queue, update the viewport and update the chart display if necessary.
		  
		  Dim viewer As ChartViewerCanvas = Self.ChartViewer
		  
		  // Enables auto scroll if the viewport is showing the latest data before the update
		  
		  Dim autoScroll As Boolean = False
		  If (Self.currentIndex > 0) Then
		    Dim value As Double = viewer.getValueAtViewPort("x", viewer.getViewPortLeft + viewer.getViewPortWidth)
		    Dim LastTimestamp As Double = Self.timeStamps(Self.currentIndex - 1)
		    
		    autoScroll = (0.001 + value >= LastTimestamp)
		  End If
		  
		  //
		  // Get new data from the queue and append them to the data arrays
		  //
		  Dim NewQueue() As DataPacket
		  
		  // take old queue
		  Dim Packets() As DataPacket = Queue
		  // and put new array there instead
		  Queue = NewQueue
		  
		  // now did we get data?
		  Dim count As Integer = Packets.Ubound + 1
		  If count <= 0 Then
		    Return
		  End If
		  
		  // if data arrays have insufficient space, we need to remove some old data.
		  If (Self.currentIndex + count >= sampleSize) Then
		    
		    // For safety, we check if the queue contains too much data than the entire data arrays. If
		    // this is the case, we only use the latest data to completely fill the data arrays.
		    While (count > sampleSize) 
		      packets.Remove(0)
		      count = count -1 
		    Wend
		    
		    // Remove oldest data to leave space for new data. To avoid frequent removal, we ensure at
		    // least 5% empty space available after removal.
		    
		    Dim originalIndex As Integer = Self.currentIndex
		    Self.currentIndex = sampleSize * 95 / 100 - 1
		    If (Self.currentIndex > sampleSize - count) Then
		      Self.currentIndex = sampleSize - count
		    End If
		    
		    For i As Integer = 0 To Self.currentIndex - 1
		      
		      Dim srcIndex As Integer = i + originalIndex - Self.currentIndex
		      Self.timeStamps(i)  = Self.timeStamps(srcIndex)
		      Self.dataSeriesA(i) = Self.dataSeriesA(srcIndex)
		      Self.dataSeriesB(i) = Self.dataSeriesB(srcIndex)
		    Next
		  End If
		  
		  // Append the data from the queue to the data arrays
		  For n As Integer = 0 To count-1
		    self.timeStamps(self.currentIndex)  = packets(n).elapsedTime
		    self.dataSeriesA(self.currentIndex) = packets(n).series0
		    self.dataSeriesB(self.currentIndex) = packets(n).series1
		    self.currentIndex = self.currentIndex + 1
		  Next
		  
		  //
		  // As we added more data, we may need to update the full range of the viewport.
		  //
		  
		  Dim startDate As Double = self.timeStamps(0)
		  Dim endDate As Double = self.timeStamps(self.currentIndex - 1)
		  
		  // Use the initialFullRange (which is 60 seconds in this demo) if this is sufficient.
		  Dim duration As Double = endDate - startDate
		  If (duration < initialFullRange) Then
		    endDate = startDate + initialFullRange
		  End If
		  
		  // Update the new full data range to include the latest data
		  Const KeepVisibleRange = 1
		  Dim axisScaleHasChanged As Boolean = viewer.updateFullRangeH("x", startDate, endDate, KeepVisibleRange)
		  
		  If (autoScroll) Then
		    // Scroll the viewport if necessary to display the latest data
		    Dim viewPortEndPos As Double = viewer.getViewPortAtValue("x", Self.timeStamps(Self.currentIndex - 1))
		    Dim ViewPortLeft As Double = viewer.getViewPortLeft
		    Dim ViewPortWidth As Double = viewer.getViewPortWidth
		    
		    If (viewPortEndPos > ViewPortLeft + ViewPortWidth) Then
		      viewer.setViewPortLeft(viewPortEndPos - ViewPortWidth)
		      axisScaleHasChanged = true
		    End If
		  end if
		  
		  // Set the zoom in limit as a ratio to the full range
		  viewer.setZoomInWidthLimit(zoomInLimit / (viewer.getValueAtViewPort("x", 1) - viewer.getValueAtViewPort("x", 0)))
		  
		  // Trigger the viewPortChanged event. Updates the chart if the axis scale has changed
		  // (scrolling or zooming) or if new data are added to the existing axis scale.
		  viewer.updateViewPort(axisScaleHasChanged Or (duration < initialFullRange), False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onData(r As RandomWalk, currentTime As Double, value1 As Double, value2 As Double)
		  //
		  // Handles realtime data from RandomWalk. The RandomWalk will call this method from its own thread.
		  // This is connect to an event
		  //
		  
		  Dim p As New DataPacket
		  p.elapsedTime = currentTime
		  p.series0 = value1
		  p.series1 = value2
		  
		  Queue.Append p
		  
		  
		  #Pragma unused r
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onMouseMovePlotArea(MouseEvent as MouseEvent)
		  // Draw track cursor when mouse is moving over plotarea
		  
		  Dim BaseChart As CDBaseChartMBS = ChartViewer.currentChart
		  Dim Chart As CDXYChartMBS = CDXYChartMBS(BaseChart)
		  
		  Dim trackLinePos As Double = trackLineLabel(Chart, ChartViewer.getPlotAreaMouseX)
		  
		  self.trackLineIsAtEnd = (self.currentIndex <= 0) or (trackLinePos = self.trackLineEndPos)
		  
		  ChartViewer.updateDisplay
		  
		  
		  
		  #Pragma unused MouseEvent
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onMouseUsageChanged(mouseUsage as integer)
		  // Pointer/zoom in/zoom out button clicked
		  
		  ChartViewer.setMouseUsage(mouseUsage)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onSave()
		  
		  Dim p As Picture = ChartViewer.GetPicture
		  
		  If p <> Nil Then
		    Dim f As FolderItem = GetSaveFolderItem(FileTypes1.Png, "chart.png")
		    
		    If f <> Nil Then
		      
		      p.Save(f, Picture.SaveAsPNG)
		      
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewPortChanged()
		  // View port changed event
		  
		  
		  // Update the chart if necessary
		  If (ChartViewer.needUpdateChart) Then
		    drawChart(ChartViewer)
		  End If
		  
		  // Update the full chart
		  drawFullChart(ViewPortControl)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Setup()
		  // connect line controls
		  
		  ChartViewer.LeftLine = LeftLine
		  ChartViewer.RightLine = RightLine
		  ChartViewer.TopLine = TopLine
		  ChartViewer.BottomLine = BottomLine
		  
		  
		  // Pointer push button
		  pointerPB.Value = True
		  
		  // Zoom In push button
		  zoomInPB.Value = False
		  
		  // Zoom Out push button
		  zoomOutPB.Value = False
		  
		  // Save push button
		  
		  
		  
		  
		  // Chart Viewer
		  'ChartViewer.setGeometry(0, 0, 640, 350)
		  
		  
		  // Viewport Control
		  ViewPortControl = New ViewPortControl
		  ViewPortControl.Output = SecondCanvas // <- for output in Xojo
		  ViewPortControl.setViewer(ChartViewer)
		  
		  SecondCanvas.ViewPortControl = ViewPortControl
		  ChartViewer.HelpLabel = HelpLabel
		  
		  //
		  // Initialize member variables
		  //
		  Self.currentIndex = 0
		  
		  // Initially, auto-move the track line to make it follow the data series
		  self.trackLineEndPos = 0
		  Self.trackLineIsAtEnd = True
		  
		  // Initially set the mouse to drag to scroll mode.
		  pointerPB.Value = True
		  
		  // Enable mouse wheel zooming by setting the zoom ratio to 1.1 per wheel event
		  ChartViewer.setMouseWheelZoomRatio(1.1)
		  
		  // Configure the initial viewport
		  ChartViewer.setViewPortWidth(initialVisibleRange / initialFullRange)
		  
		  // Start the random data generator
		  InitRandomWalk
		  
		  // Set up the chart update timer
		  ChartUpdateTimer.mode = timer.ModeMultiple
		  
		  
		  // The chart update rate is set to 100ms
		  ChartUpdateTimer.Period = 100
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function trackLineLabel(c as CDXYChartMBS, mouseX as Integer) As double
		  // Draw the track line with data point labels
		  
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  Dim d As CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  Dim plotArea As CDPlotAreaMBS = c.getPlotArea
		  
		  // Get the data x-value that is nearest to the mouse, and find its pixel coordinate.
		  dim xValue as double = c.getNearestXValue(mouseX)
		  Dim xCoor As Integer = c.getXCoor(xValue)
		  If (xCoor < plotArea.getLeftX) then
		    Return xValue
		  end if
		  
		  // Draw a vertical track line at the x-position
		  d.vline(plotArea.getTopY, plotArea.getBottomY, xCoor, &h888888)
		  
		  // Draw a label on the x-axis to show the track line position.
		  Dim xlabel As String
		  xlabel =          "<*font,bgColor=000000*> " 
		  xlabel = xlabel + c.xAxis.getFormattedLabel(xValue + 0.00499, "hh:nn:ss.ff") 
		  xlabel = xlabel + " <*/font*>"
		  
		  Dim t As CDTTFTextMBS = d.Text(xlabel, "arialbd.ttf", 10)
		  
		  // Restrict the x-pixel position of the label to make sure it stays inside the chart image.
		  Dim xLabelPos As Integer = Max(0, Min(xCoor - t.getWidth / 2, c.getWidth - t.getWidth))
		  t.draw(xLabelPos, plotArea.getBottomY + 2, &hffffff)
		  t.destroy
		  
		  // Iterate through all layers to draw the data labels
		  For i As Integer = 0 To c.getLayerCount-1
		    Dim layer As CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    Dim xIndex As Integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    For j As Integer = 0 To layer.getDataSetCount-1
		      
		      Dim dataSet As CDDataSetMBS = layer.getDataSetByZ(j)
		      Dim dataSetName As String = dataSet.getDataName
		      
		      // Get the color, name and position of the data label
		      Dim ColorValue As Integer = dataSet.getDataColor
		      Dim yCoor As Integer = c.getYCoor(dataSet.getPosition(xIndex), dataSet.getUseYAxis)
		      
		      // Draw a track dot with a label next to it for visible data points in the plot area
		      If ((yCoor >= plotArea.getTopY) And (yCoor <= plotArea.getBottomY) And (ColorValue <> c.kTransparent) And dataSetName.Len > 0) Then
		        
		        d.circle(xCoor, yCoor, 4, 4, ColorValue, ColorValue)
		        
		        Dim label as string
		        label =         "<*font,bgColor=" 
		        label = label + Right("000000"+Hex(ColorValue), 6)
		        label = label + "*> "
		        label = label + c.formatValue(dataSet.getValue(xIndex), "{value|P4}") 
		        label = label + " <*font*>"
		        
		        t = d.Text(label, "arialbd.ttf", 10)
		        
		        // Draw the label on the right side of the dot if the mouse is on the left side the
		        // chart, and vice versa. This ensures the label will not go outside the chart image.
		        If (xCoor <= (plotArea.getLeftX + plotArea.getRightX) / 2) Then
		          t.draw(xCoor + 6, yCoor, &hffffff, c.kLeft)
		        Else
		          t.draw(xCoor - 6, yCoor, &hffffff, c.kRight)
		        End If
		        
		        t.destroy
		      end if
		    next
		  Next
		  
		  Return xValue
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		currentIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		dataSeriesA() As double
	#tag EndProperty

	#tag Property, Flags = &h0
		dataSeriesB() As double
	#tag EndProperty

	#tag Property, Flags = &h0
		dataSource As RandomWalk
	#tag EndProperty

	#tag Property, Flags = &h0
		fullChart As CDXYChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Queue() As DataPacket
	#tag EndProperty

	#tag Property, Flags = &h0
		timeStamps() As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			If the track cursor Is at the End Of the data series, we will automatic move the track line when new data arrives.
		#tag EndNote
		trackLineEndPos As double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			
			If the track cursor Is at the End Of the data series, we will automatic move the track line when new data arrives.
		#tag EndNote
		trackLineIsAtEnd As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ViewPortControl As ViewPortControl
	#tag EndProperty


	#tag Constant, Name = initialFullRange, Type = Double, Dynamic = False, Default = \"180", Scope = Public, Description = 5468652066756C6C2072616E676520697320696E697469616C697A656420746F20313830207365636F6E64732E2049742077696C6C20657874656E64207768656E206D6F726520646174612061726520617661696C61626C652E
	#tag EndConstant

	#tag Constant, Name = initialVisibleRange, Type = Double, Dynamic = False, Default = \"30", Scope = Public, Description = 5468652076697369626C652072616E676520697320696E697469616C697A656420746F203330207365636F6E64732E
	#tag EndConstant

	#tag Constant, Name = sampleSize, Type = Double, Dynamic = False, Default = \"10000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = zoomInLimit, Type = Double, Dynamic = False, Default = \"5", Scope = Public, Description = 546865206D6178696D756D207A6F6F6D20696E2069732035207365636F6E64732E
	#tag EndConstant


#tag EndWindowCode

#tag Events savePB
	#tag Event
		Sub Action()
		  onSave
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events zoomOutPB
	#tag Event
		Sub Action()
		  If Me.Value Then
		    onMouseUsageChanged ChartViewer.MouseUsageZoomOut
		    
		    pointerPB.Value = False
		    zoomInPB.Value = False
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events zoomInPB
	#tag Event
		Sub Action()
		  If Me.Value Then
		    onMouseUsageChanged ChartViewer.MouseUsageZoomIn
		    
		    pointerPB.Value = False
		    zoomOutPB.Value = False
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pointerPB
	#tag Event
		Sub Action()
		  If Me.Value Then
		    onMouseUsageChanged ChartViewer.MouseUsageDefault
		    
		    zoomInPB.Value = False
		    zoomOutPB.Value = False
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChartViewer
	#tag Event
		Sub mouseMovePlotArea(MouseEvent as MouseEvent)
		  self.onMouseMovePlotArea MouseEvent
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub viewPortChanged()
		  Self.onViewPortChanged
		  ViewPortControl.onViewPortChanged
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChartUpdateTimer
	#tag Event
		Sub Action()
		  onChartUpdateTimer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="trackLineEndPos"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="trackLineIsAtEnd"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="currentIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
