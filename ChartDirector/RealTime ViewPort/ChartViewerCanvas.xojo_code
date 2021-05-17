#tag Class
Protected Class ChartViewerCanvas
Inherits ViewPortManagerCanvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Dim m As New MouseEvent(x,y)
		  m.SetButton
		  
		  mousePressEvent(m)
		  
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Dim m As New MouseEvent(x,y)
		  m.SetButton
		  
		  mouseMoveEvent m
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  'Dim m As New MouseEvent(Self.Mousex, Self.MouseY)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  Dim m As New MouseEvent(Self.Mousex, Self.MouseY)
		  
		  leaveEvent m
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim m As New MouseEvent(x,y)
		  
		  mouseMoveEvent m
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Dim m As New MouseEvent(x,y)
		  m.SetButton
		  
		  mouseReleaseEvent(m)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  
		  Dim m As New MouseEvent(x,y)
		  m.delta = deltay
		  
		  wheelEvent(m)
		  
		  
		  
		  #Pragma Unused deltaX
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  ViewPortManager = New CDViewPortManagerMBS
		  
		  // current chart and hot spot tester
		  Self.currentChart = Nil
		  hotSpotTester = nil
		  
		  // initialize chart configuration
		  selectBoxLineColor = &c000000
		  selectBoxLineWidth = 2
		  mouseUsage = ChartViewerCanvas.MouseUsageDefault
		  zoomDirection = CDBaseChartMBS.kDirectionHorizontal
		  zoomInRatio = 2
		  zoomOutRatio = 0.5
		  mouseWheelZoomRatio = 1
		  scrollDirection = CDBaseChartMBS.kDirectionHorizontal
		  minDragAmount = 5
		  updateInterval = 20
		  
		  // current state of the mouse
		  isOnPlotArea = false
		  isPlotAreaMouseDown = false
		  isDragScrolling = false
		  currentHotSpot = -1
		  isClickable = false
		  isMouseTracking = false
		  isInMouseMove = false
		  
		  // chart update rate support
		  needUpdateChart = False
		  needUpdateImageMap = False
		  holdTimerActive = False
		  isInViewPortChanged = false
		  delayUpdateChart = NO_DELAY
		  delayedChart = nil
		  lastMouseMove = 0
		  delayedMouseEvent = nil
		  delayImageMapUpdate = false
		  
		  // track cursor support
		  autoHideMsg = ""
		  currentMouseX = UNDEFINED_COOR
		  currentMouseY = UNDEFINED_COOR
		  isInMouseMovePlotArea = false
		  
		  // selection rectangle
		  'LeftLine = 0
		  'RightLine = 0
		  'TopLine = 0
		  'BottomLine = 0
		  
		  // xojo does it always
		  'setMouseTracking(True)
		  
		  RaiseEvent Open
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If ChartPicture <> Nil Then
		    g.DrawPicture ChartPicture, 0, 0, g.Width, g.height, 0, 0, ChartPicture.Width, ChartPicture.Height
		  End If
		  
		  
		  #Pragma Unused areas
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub applyAutoHide(msg as string)
		  // Attempt to hide the dynamic layer using the specified message
		  
		  If (autoHideMsg = msg) then
		    
		    If (Nil <> currentChart) Then
		      currentChart.removeDynamicLayer
		    End If
		    
		    autoHideMsg = ""
		    updateDisplay
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function clock() As double
		  // in milliseconds
		  Return Microseconds / 1000.0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub commitMouseMove(MouseEvent as MouseEvent)
		  // Remember the mouse coordinates for later use
		  Self.currentMouseX = MouseEvent.x
		  Self.currentMouseY = MouseEvent.y
		  
		  // The chart can be updated more than once during mouse move. For example, it can update due to
		  // drag to scroll, and also due to drawing track cursor. So we delay updating the display until
		  // all all events has occured.
		  Self.delayUpdateChart = NEED_DELAY
		  Self.isInMouseMove = True
		  
		  // Check if mouse is dragging on the plot area
		  Self.isOnPlotArea = Self.isPlotAreaMouseDown Or inPlotArea(MouseEvent.x, MouseEvent.y)
		  If (Self.isPlotAreaMouseDown) Then
		    onPlotAreaMouseDrag(MouseEvent)
		  End If
		  
		  // Emit mouseMoveChart
		  RaiseEvent mouseMoveChart(MouseEvent)
		  
		  If (inExtendedPlotArea(MouseEvent.x, MouseEvent.y)) Then
		    
		    // Mouse is in extended plot area, emit mouseMovePlotArea
		    Self.isInMouseMovePlotArea = True
		    RaiseEvent mouseMovePlotArea(MouseEvent)
		    
		  Elseif (Self.isInMouseMovePlotArea) Then
		    
		    // Mouse was in extended plot area, but is not in it now, so emit mouseLeavePlotArea
		    Self.isInMouseMovePlotArea = False
		    RaiseEvent mouseLeavePlotArea(MouseEvent)
		    applyAutoHide("mouseleaveplotarea")
		  end if
		  
		  //
		  // Show hot spot tool tips if necessary
		  // (Due to QT bug, tooltip cannot be put in delayedMouseEvent, otherwise sometimes tooltip
		  // position will be incorrect.)
		  //
		  
		  If (Self.delayImageMapUpdate) Then
		    
		    Self.delayImageMapUpdate = False
		    If (Not Self.isPlotAreaMouseDown) Then
		      updateViewPort(False, True)
		    End If
		  End If
		  
		  
		  If (MouseEvent.button <> MouseEvent.NoButton) Then
		    
		    // Hide tool tips if mouse button is pressed.
		    Self.HelpTag = ""
		    
		    If HelpLabel <> Nil Then
		      HelpLabel.Text = ""
		    End If
		    
		  Else
		    
		    // Use the ChartDirector ImageMapHandler to determine if the mouse is over a hot spot
		    dim hotSpotNo as integer = 0
		    If (Nil <> Self.hotSpotTester) Then
		      hotSpotNo = Self.hotSpotTester.getHotSpot(MouseEvent.x, MouseEvent.y)
		    End If
		    
		    // If the mouse is in the same hot spot since the last mouse move event, there is no need
		    // to update the tool tip.
		    If (hotSpotNo <> Self.currentHotSpot) Then
		      
		      // Hot spot has changed - update tool tip text
		      Self.currentHotSpot = hotSpotNo
		      
		      If (hotSpotNo = 0) Then
		        
		        // Mouse is not actually on hanlder hot spot - use default tool tip text and reset
		        // the clickable flag.
		        
		        Self.HelpTag = Self.defaultToolTip
		        Self.isClickable = False
		        
		        If HelpLabel <> Nil Then
		          HelpLabel.text = self.defaultToolTip
		        End If
		        
		      Else
		        
		        // Mouse is on a hot spot. In this implementation, we consider the hot spot as
		        // clickable if its href ("path") parameter is not empty.
		        Dim path As String = Self.hotSpotTester.getValue("path")
		        Self.isClickable = ("" <> path)
		        
		        Dim s As String = Self.hotSpotTester.getValue("title")
		        Self.HelpTag = s
		        
		        If HelpLabel <> Nil Then
		          HelpLabel.Text = s
		        End If
		        
		      End If
		    End If
		  End If
		  
		  
		  // Cancel the delayed mouse event if any
		  If (Self.delayedMouseEvent <> Nil) Then
		    killTimer(delayedMouseEventTimerId)
		    Self.delayedMouseEvent = nil
		    
		  End If
		  
		  
		  // Can update chart now
		  commitUpdateChart
		  Self.isInMouseMove = False
		  
		  Self.lastMouseMove = clock
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub commitUpdateChart()
		  // Commit chart to display
		  
		  If (Self.delayUpdateChart = NEED_DELAY) Then
		    
		    // No actual update occur
		    Self.delayUpdateChart = NO_DELAY
		    Return
		  end if
		  
		  // Get the image and metrics for the chart
		  
		  Dim c As CDBaseChartMBS
		  
		  If delayUpdateChart = NEED_UPDATE Then
		    c = Self.delayedChart
		  Else
		    c = Self.currentChart
		  end if
		  
		  Dim ChartMetrics As String
		  dim image as Picture
		  
		  If c <> Nil Then
		    
		    // Output chart as Device Indpendent Bitmap with file headers
		    
		    image = c.makeChartPicture
		    
		    // Get chart metrics
		    ChartMetrics = c.getChartMetrics
		  end if
		  
		  // Set the QPixmap for display
		  Self.ChartPicture = image
		  Self.Invalidate
		  
		  // Set the chart metrics and clear the image map
		  setChartMetrics(ChartMetrics)
		  
		  // Any delayed chart has been committed
		  self.delayUpdateChart = NO_DELAY
		  Self.delayedChart = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawRect(x as integer, y as integer, width as integer, height as integer)
		  // Create the edges of the rectangle if not already created
		  
		  // width < 0 is interpreted as the rectangle extends to the left or x.
		  // height <0 is interpreted as the rectangle extends to above y.
		  If (width < 0) Then
		    width = -width
		    x = x - width
		  End If
		  
		  If (height < 0) Then
		    height = -height
		    y = y - height
		  End If
		  
		  // Put the edges along the sides of the rectangle
		  
		  TopLine.X1 = Me.Left + x
		  TopLine.Y1 = Me.top + y
		  TopLine.X2 = TopLine.X1 + width
		  TopLine.Y2 = TopLine.Y1
		  TopLine.LineColor = selectBoxLineColor
		  TopLine.BorderWidth = selectBoxLineWidth
		  
		  LeftLine.X1 = Me.Left + x
		  LeftLine.Y1 = Me.top + y
		  LeftLine.X2 = LeftLine.X1 
		  LeftLine.Y2 = LeftLine.Y1 + height
		  LeftLine.LineColor = selectBoxLineColor
		  LeftLine.BorderWidth = selectBoxLineWidth
		  
		  BottomLine.X1 = Me.Left + x
		  BottomLine.Y1 = Me.top + y + height - selectBoxLineWidth + 1
		  BottomLine.X2 = BottomLine.X1 + width
		  BottomLine.Y2 = BottomLine.Y1
		  BottomLine.LineColor = selectBoxLineColor
		  BottomLine.BorderWidth = selectBoxLineWidth
		  
		  RightLine.X1 = Me.Left + x + width - selectBoxLineWidth + 1
		  RightLine.Y1 = Me.top + y
		  RightLine.X2 = RightLine.X1 
		  RightLine.Y2 = RightLine.Y1 + height
		  RightLine.LineColor = selectBoxLineColor
		  RightLine.BorderWidth = selectBoxLineWidth
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChart() As CDBaseChartMBS
		  // Get back the same BaseChart pointer provided by the previous setChart call.
		  
		  Return self.currentChart
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChartMouseX() As integer
		  // Get the current mouse x coordinate when used in a mouse move event handler
		  
		  Dim ret As Integer = currentMouseX
		  
		  If (ret = UNDEFINED_COOR) then
		    ret = self.getPlotAreaLeft + self.getPlotAreaWidth
		  End If
		  
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChartMouseY() As integer
		  // Get the current mouse y coordinate when used in a mouse move event handler
		  
		  Dim ret As Integer = currentMouseY
		  
		  If ret = UNDEFINED_COOR then
		    ret = Self.getPlotAreaTop + Self.getPlotAreaHeight
		  End If
		  
		  Return ret
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getImageMapHandler() As CDImageMapHandlerMBS
		  // Get the image map handler for the chart
		  
		  Return hotSpotTester
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMinimumDrag() As Integer
		  // Get the minimum mouse drag before the dragging is considered as real.
		  
		  Return minDragAmount
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMouseUsage() As Integer
		  Return mouseUsage
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMouseWheelZoomRatio() As double
		  // Get the mouse wheel zoom ratio 
		  
		  Return mouseWheelZoomRatio
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPicture() As Picture
		  If ChartPicture <> Nil Then
		    Return ChartPicture
		  Else
		    // create if needed
		    Return currentChart.makeChartPicture
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPlotAreaMouseX() As integer
		  // Get the current mouse x coordinate bounded to the plot area when used in a mouse event handler
		  
		  Dim ret As Integer = getChartMouseX
		  
		  If (ret < getPlotAreaLeft) then
		    ret = getPlotAreaLeft
		  End If
		  
		  If (ret > getPlotAreaLeft + getPlotAreaWidth) Then
		    ret = getPlotAreaLeft + getPlotAreaWidth
		  End If
		  
		  Return ret
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPlotAreaMouseY() As integer
		  // Get the current mouse y coordinate bounded to the plot area when used in a mouse event handler
		  
		  Dim ret As Integer = getChartMouseY
		  
		  If (ret < getPlotAreaTop) Then
		    ret = getPlotAreaTop
		  End If
		  
		  If (ret > getPlotAreaTop + getPlotAreaHeight)  Then
		    ret = getPlotAreaTop + getPlotAreaHeight
		  End If
		  
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getScrollDirection() As Integer
		  // Get the scroll direction
		  
		  Return scrollDirection
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSelectionBorderColor() As color
		  // Get the border color of the selection box.
		  
		  Return selectBoxLineColor
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSelectionBorderWidth() As Integer
		  Return selectBoxLineWidth
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getUpdateInterval() As Integer
		  // Get the minimum interval between ViewPortChanged events.
		  
		  Return Self.updateInterval
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getZoomDirection() As Integer
		  // Get the zoom direction
		  
		  Return zoomDirection
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getZoomInRatio() As double
		  // Get the zoom-in ratio for mouse click zoom-in
		  //
		  Return zoomInRatio
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getZoomOutRatio() As Double
		  // Get the zoom-out ratio
		  
		  Return zoomOutRatio
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initRect()
		  // Create the edges for the selection rectangle
		  
		  'LeftLine = New QLabel(this);
		  'LeftLine.setAutoFillBackground(True);
		  'RightLine = New QLabel(this);
		  'RightLine.setAutoFillBackground(True);
		  'TopLine = New QLabel(this);
		  'TopLine.setAutoFillBackground(True);
		  'BottomLine = New QLabel(this);
		  'BottomLine.setAutoFillBackground(True);
		  
		  setSelectionBorderColor(getSelectionBorderColor)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDrag(direction as integer, MouseEvent as MouseEvent) As Boolean
		  // Determines if the mouse is dragging.
		  
		  // We only consider the mouse is dragging it is has dragged more than self.minDragAmount. This is
		  // to avoid small mouse vibrations triggering a mouse drag.
		  Dim spanX As Integer = Abs(MouseEvent.X - self.plotAreaMouseDownXPos)
		  Dim spanY As Integer = Abs(MouseEvent.Y - Self.plotAreaMouseDownYPos)
		  
		  Return _
		  ((direction <> CDBaseChartMBS.kDirectionVertical  ) And (spanX >= minDragAmount)) Or _
		  ((direction <> CDBaseChartMBS.kDirectionHorizontal) And (spanY >= minDragAmount))
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isInMouseMoveEvent() As Boolean
		  // Check if is currently processing a mouse move event
		  
		  Return self.isInMouseMove
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isInViewPortChangedEvent() As Boolean
		  // Check if is currently processing a view port changed event
		  
		  Return isInViewPortChanged
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMouseDragging() As Boolean
		  // Check if mouse is dragging to scroll or to select the zoom rectangle
		  
		  Return isPlotAreaMouseDown
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isMouseOnPlotArea() As Boolean
		  // Check if mouse is on the extended plot area
		  
		  If (isMouseTracking) Then
		    Return inExtendedPlotArea(getChartMouseX, getChartMouseY)
		  Else
		    Return False
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub killTimer(byref t as timer)
		  If t <> Nil Then
		    t.Mode = timer.ModeOff
		    t = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub leaveEvent(MouseEvent as MouseEvent)
		  // Process delayed mouse move, if any
		  onDelayedMouseMove
		  
		  // Mouse tracking is no longer active
		  Self.isMouseTracking = false
		  
		  If (self.isInMouseMovePlotArea) then
		    // Mouse was in extended plot area, but is not in it now, so emit mouseLeavePlotArea
		    self.isInMouseMovePlotArea = false
		    RaiseEvent mouseLeavePlotArea(MouseEvent)
		    applyAutoHide("mouseleaveplotarea")
		  End If
		  
		  // emit mouseLeaveChart
		  RaiseEvent mouseLeaveChart(MouseEvent)
		  applyAutoHide("mouseleavechart")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseMoveEvent(MouseEvent as MouseEvent)
		  // Enable mouse tracking to detect mouse leave events
		  Self.isMouseTracking = True
		  
		  RaiseEvent mouseMove(MouseEvent)
		  
		  // On Windows, mouse events can by-pass the event queue. If there are too many mouse events,
		  // the event queue may not get processed, preventing other controls from updating. If two mouse
		  // events are less than 10ms apart, there is a risk of too many mouse events. So we repost the
		  // mouse event as a timer event that is queued up normally, allowing the queue to get processed.
		  Dim timeBetweenMouseMove As Integer = ((clock) - Self.lastMouseMove) * 1000 / CLOCKS_PER_SEC 
		  
		  If ((Self.delayedMouseEvent <> Nil And (timeBetweenMouseMove < 250)) Or (timeBetweenMouseMove < 10)) Then
		    
		    If (Nil = Self.delayedMouseEvent) then
		      Self.delayedMouseEventTimerId = startTimer(1)
		    Else
		      Self.delayedMouseEvent = Nil
		    End If
		    
		    Self.delayedMouseEvent = MouseEvent
		  Else
		    commitMouseMove(MouseEvent)
		  End If
		  
		  onSetCursor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mousePressEvent(MouseEvent as MouseEvent)
		  // Mouse button down event.
		  
		  onDelayedMouseMove
		  
		  If ((MouseEvent.button = MouseEvent.LeftButton) And inPlotArea(MouseEvent.x, MouseEvent.y) And (mouseUsage <> MouseUsageDefault)) Then
		    
		    // Mouse usage is for drag to zoom/scroll. Capture the mouse to prepare for dragging and
		    // save the mouse down position to draw the selection rectangle.
		    Self.isPlotAreaMouseDown = True
		    Self.plotAreaMouseDownXPos = MouseEvent.x
		    Self.plotAreaMouseDownYPos = MouseEvent.y
		    startDrag
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseReleaseEvent(MouseEvent as MouseEvent)
		  // Mouse button up event.
		  
		  onDelayedMouseMove
		  
		  If ((MouseEvent.button = MouseEvent.LeftButton) and self.isPlotAreaMouseDown) then
		    
		    // Release the mouse capture.
		    self.isPlotAreaMouseDown = false
		    setRectVisible(False)
		    Dim hasUpdate As Boolean = False
		    
		    Select Case Self.mouseUsage
		      
		    Case MouseUsageZoomIn
		      If (canZoomIn(Self.zoomDirection)) Then
		        If (isDrag(Self.zoomDirection, MouseEvent)) Then
		          // Zoom to the drag selection rectangle.
		          hasUpdate = zoomTo(Self.zoomDirection, Self.plotAreaMouseDownXPos, Self.plotAreaMouseDownYPos, MouseEvent.x, MouseEvent.y)
		        Else
		          // User just click on a point. Zoom-in around the mouse cursor position.
		          hasUpdate = zoomAt(Self.zoomDirection, MouseEvent.x, MouseEvent.y, Self.zoomInRatio)
		        end if
		      End If
		      
		    Case MouseUsageZoomOut
		      // Zoom out around the mouse cursor position.
		      If (canZoomOut(Self.zoomDirection)) Then
		        hasUpdate = zoomAt(Self.zoomDirection, MouseEvent.x, MouseEvent.y, Self.zoomOutRatio)
		      End If
		      
		    Else
		      
		      If (Self.isDragScrolling) Then
		        // Drag to scroll. We can update the image map now as scrolling has finished.
		        updateViewPort(False, True)
		      Else
		        // Is not zooming or scrolling, so is just a normal click event.
		        RaiseEvent clicked(MouseEvent)
		      end if
		    End Select
		    
		    self.isDragScrolling = false
		    If (hasUpdate) then
		      // View port has changed - update it.
		      updateViewPort(True, True)
		    End If
		    
		  Else
		    RaiseEvent clicked(MouseEvent)
		  End If
		  
		  onSetCursor
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onDelayedMouseMove()
		  // Delayed MouseMove event handler
		  
		  If (delayedMouseEvent <> nil) Then
		    commitMouseMove(Self.delayedMouseEvent)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function onMouseWheelZoom(x as integer, y as integer, zDelta as integer) As Boolean
		  // Handles mouse wheel zooming
		  // Zoom ratio = 1 means no zooming
		  
		  If (Self.mouseWheelZoomRatio = 1) Then
		    Return False
		  End If
		  
		  // X and Y zoom ratios
		  Dim rx As Double = 1
		  Dim ry As Double = 1
		  If (getZoomDirection <> CDBaseChartMBS.kDirectionVertical) Then
		    If zDelta = 0 Then
		      
		    elseIf (zDelta > 0) Then
		      rx = Self.mouseWheelZoomRatio
		    Else
		      rx = 1.0 / Self.mouseWheelZoomRatio
		    end if
		  End If
		  
		  If (getZoomDirection <> CDBaseChartMBS.kDirectionHorizontal) Then
		    If zDelta = 0 Then
		      
		    elseIf (zDelta > 0) Then
		      ry = Self.mouseWheelZoomRatio
		    Else
		      ry = 1.0 / Self.mouseWheelZoomRatio
		    End If
		  End If
		  
		  // Do the zooming
		  If (zoomAround(x, y, rx, ry)) Then
		    updateViewPort(True, True)
		  End If
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onPlotAreaMouseDrag(MouseEvent as MouseEvent)
		  Select Case mouseUsage
		    
		  Case MouseUsageZoomIn
		    
		    //
		    // Mouse is used for zoom in. Draw the selection rectangle if necessary.
		    //
		    
		    Dim isDragZoom As Boolean = canZoomIn(zoomDirection) And isDrag(zoomDirection, MouseEvent)
		    If (isDragZoom) Then
		      
		      Dim spanX As Integer = plotAreaMouseDownXPos - MouseEvent.x
		      Dim spanY As Integer = plotAreaMouseDownYPos - MouseEvent.y
		      
		      Select Case zoomDirection
		        
		      Case CDBaseChartMBS.kDirectionHorizontal
		        drawRect(MouseEvent.x, getPlotAreaTop, spanX, getPlotAreaHeight)
		        
		      Case CDBaseChartMBS.kDirectionVertical
		        drawRect(getPlotAreaLeft, MouseEvent.y, getPlotAreaWidth, spanY)
		        
		      Else
		        drawRect(MouseEvent.x, MouseEvent.y, spanX, spanY)
		        
		      End Select
		    End If
		    setRectVisible(isDragZoom)
		    
		  Case MouseUsageScroll
		    
		    //
		    // Mouse is used for drag scrolling. Scroll and update the view port.
		    //
		    
		    If (isDragScrolling Or isDrag(scrollDirection, MouseEvent)) Then
		      isDragScrolling = True
		      If (dragTo(scrollDirection, MouseEvent.x - plotAreaMouseDownXPos, MouseEvent.y - plotAreaMouseDownYPos)) then
		        updateViewPort(True, False)
		      End If
		    end if
		  End Select
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onSetCursor()
		  If isDragScrolling Then
		    Select Case scrollDirection
		    Case CDBaseChartMBS.kDirectionHorizontal
		      Me.MouseCursor = System.Cursors.ArrowEastWest
		    Case CDBaseChartMBS.kDirectionVertical
		      Me.MouseCursor = System.Cursors.ArrowNorthSouth
		    Else
		      Me.MouseCursor = System.Cursors.StandardPointer
		    End Select
		    Return
		  End If
		  
		  If isOnPlotArea then
		    select case mouseUsage
		      
		    Case MouseUsageZoomIn
		      
		      If (canZoomIn(zoomDirection)) Then
		        Me.MouseCursor = System.Cursors.MagnifyLarger
		      Else
		        Me.MouseCursor = System.Cursors.FingerPointer
		      End If
		      
		      Return
		    Case MouseUsageZoomOut
		      If (canZoomOut(zoomDirection)) Then
		        Me.MouseCursor = System.Cursors.MagnifySmaller
		      Else
		        Me.MouseCursor = System.Cursors.FingerPointer
		      End If
		      
		      Return
		    end Select
		  End If
		  
		  If isClickable Then
		    Me.MouseCursor = System.Cursors.FingerPointer
		  Else
		    Me.MouseCursor = Nil
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeDynamicLayer(msg as string)
		  // Set the message used to remove the dynamic layer 
		  
		  autoHideMsg = msg.Lowercase
		  
		  If autoHideMsg = "now" then
		    applyAutoHide(msg)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetChart(c as CDBaseChartMBS)
		  // Set the chart to the control
		  
		  Self.currentChart = c
		  
		  Dim map As String ' = c.getHTMLImageMap("test")
		  Self.setImageMap(map)
		  
		  If c <> Nil Then
		    commitPendingSyncAxis(c)
		    
		    If delayUpdateChart <> NO_DELAY Then
		      // render chart now
		      Call c.makeChart
		    End If
		    
		  End If
		  
		  Self.updateDisplay
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setDefaultToolTip(d as string)
		  // Set the default tool tip to use
		  
		  Self.defaultToolTip = d
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setImageMap(imageMap as string)
		  // Set image map used by the chart
		  //
		  
		  //delete the existing ImageMapHandler
		  
		  Self.currentHotSpot = -1
		  Self.isClickable = False
		  
		  //create a new ImageMapHandler to represent the image map
		  If imageMap = "" Then
		    Self.hotSpotTester = Nil
		  Else
		    Self.hotSpotTester = New CDImageMapHandlerMBS(imageMap)
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setMinimumDrag(offset as integer)
		  // Set the minimum mouse drag before the dragging is considered as real. This is to avoid small
		  // mouse vibrations triggering a mouse drag.
		  
		  
		  Self.minDragAmount = offset
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setMouseUsage(m as integer)
		  // Set the mouse usage mode
		  
		  Self.mouseUsage = m
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setMouseWheelZoomRatio(ratio as Double)
		  // Set the mouse wheel zoom ratio 
		  
		  Self.mouseWheelZoomRatio = ratio
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setRectVisible(b as Boolean)
		  // Show/hide selection rectangle
		  
		  // Create the edges of the rectangle if not already created
		  
		  // Show/hide the edges
		  If TopLine <> Nil Then
		    
		    TopLine.Visible = b
		    LeftLine.Visible = b
		    BottomLine.Visible = b
		    RightLine.Visible = b
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setScrollDirection(value as integer)
		  // Set the scroll direction
		  
		  Self.scrollDirection = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSelectionBorderColor(c as color)
		  Self.selectBoxLineColor = c
		  
		  If TopLine <> Nil Then
		    TopLine.LineColor = c
		  End If
		  
		  If LeftLine <> Nil Then
		    LeftLine.LineColor = c
		  End If
		  
		  If RightLine <> Nil Then
		    RightLine.LineColor = c
		  End If
		  
		  If BottomLine <> Nil Then
		    BottomLine.LineColor = c
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSelectionBorderWidth(width as integer)
		  // Set the border width of the selection box
		  
		  Self.selectBoxLineWidth = width
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setUpdateInterval(interval as integer)
		  // Set the minimum interval between ViewPortChanged events. This is to avoid the chart being
		  // updated too frequently. (Default is 20ms between chart updates.) Multiple update events
		  // arrived during the interval will be merged into one chart update and executed at the end
		  // of the interval.
		  
		  Self.updateInterval = interval
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomDirection(value as integer)
		  // Set the zoom direction
		  
		  Self.zoomDirection = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomInRatio(value as double)
		  // Set the zoom-in ratio for mouse click zoom-in
		  
		  Self.zoomInRatio = value
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setZoomOutRatio(value as Double)
		  // Set the zoom-out ratio
		  
		  Self.zoomOutRatio = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function startTimer(Interval as integer) As timer
		  Dim t As New timer
		  
		  AddHandler t.Action, WeakAddressOf timerEvent
		  
		  t.Period = Interval
		  t.Mode = timer.ModeMultiple
		  
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub timerEvent(timerId as timer)
		  // Chart hold timer.
		  
		  
		  If (delayedMouseEvent <> nil and (timerId = delayedMouseEventTimerId)) Then
		    
		    // Is a delayed mouse move event
		    onDelayedMouseMove
		    
		  Elseif (holdTimerActive And (timerId = holdTimerId)) then
		    
		    holdTimerId.mode = timer.ModeOff
		    holdTimerActive = False
		    
		    // If has pending chart update request, handles them now.
		    If (self.needUpdateChart Or self.needUpdateImageMap) Then
		      updateViewPort(self.needUpdateChart, self.needUpdateImageMap)
		    End If
		    
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateDisplay()
		  // Update the display
		  
		  If delayUpdateChart = NO_DELAY Then
		    commitUpdateChart
		  Else
		    
		    delayUpdateChart = NEED_UPDATE
		    
		    delayedChart = currentChart
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateViewPort(NeedUpdateChartParam as Boolean, needUpdateImageMapParam as Boolean)
		  // Trigger the ViewPortChanged event
		  
		  
		  // Already updating, no need to update again
		  If (Self.isInViewPortChanged) Then
		    Return
		  end if
		  
		  // Merge the current update requests with any pending requests.
		  Self.needUpdateChart = Self.needUpdateChart Or needUpdateChartParam
		  self.needUpdateImageMap = needUpdateImageMapParam
		  
		  // Hold timer has not expired, so do not update chart immediately. Keep the requests pending.
		  If (Self.holdTimerActive) Then
		    Return
		  end if
		  
		  // The chart can be updated more than once during mouse move. For example, it can update due to
		  // drag to scroll, and also due to drawing track cursor. So we delay updating the display until
		  // all all updates has occured.
		  Dim hasDelayUpdate As Boolean = (Self.delayUpdateChart <> NO_DELAY)
		  If (Not hasDelayUpdate) Then
		    Self.delayUpdateChart = NEED_DELAY
		  End If
		  
		  // Can trigger the ViewPortChanged event.
		  validateViewPort
		  Self.isInViewPortChanged = True
		  RaiseEvent viewPortChanged
		  Self.isInViewPortChanged = False
		  
		  // Can update chart now
		  If (Not hasDelayUpdate) Then
		    commitUpdateChart
		  End If
		  
		  // Clear any pending updates.
		  Self.needUpdateChart = False
		  self.needUpdateImageMap = False
		  
		  // Set hold timer to prevent multiple chart updates within a short period.
		  If (Self.updateInterval > 0) Then
		    Self.holdTimerActive = True
		    Self.holdTimerId = startTimer(self.updateInterval)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wheelEvent(MouseEvent as MouseEvent)
		  Dim hasReceivers As Boolean = True // receivers(SIGNAL(mouseWheel(QWheelEvent *))) > 0;
		  If (hasReceivers) Then
		    
		    // Process delayed mouse move, if any
		    onDelayedMouseMove
		    
		    // emit mouseWheel event
		    RaiseEvent mouseWheel(MouseEvent)
		  End If
		  
		  // Process the mouse wheel only if the mouse is over the plot area
		  Dim hasMouseWheelZoom As Boolean = isMouseOnPlotArea And onMouseWheelZoom(getPlotAreaMouseX, getPlotAreaMouseY, MouseEvent.delta)
		  
		  If (not (hasReceivers or hasMouseWheelZoom)) then
		    // ignore
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event clicked(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event mouseLeaveChart(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event mouseLeavePlotArea(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event mouseMove(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event mouseMoveChart(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event mouseMovePlotArea(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event mouseWheel(MouseEvent as MouseEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event viewPortChanged()
	#tag EndHook


	#tag Property, Flags = &h0
		autoHideMsg As string
	#tag EndProperty

	#tag Property, Flags = &h0
		BottomLine As Line
	#tag EndProperty

	#tag Property, Flags = &h0
		ChartPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Current BaseChart object
		#tag EndNote
		currentChart As CDBaseChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// The hot spot under the mouse cursor.
		#tag EndNote
		currentHotSpot As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Get the mouse x-pixel coordinate
		#tag EndNote
		currentMouseX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Get the mouse y-pixel coordinate
		#tag EndNote
		currentMouseY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Default tool tip text
		#tag EndNote
		defaultToolTip As string
	#tag EndProperty

	#tag Property, Flags = &h0
		delayedChart As CDBaseChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		delayedMouseEvent As MouseEvent
	#tag EndProperty

	#tag Property, Flags = &h0
		delayedMouseEventTimerId As Timer
	#tag EndProperty

	#tag Property, Flags = &h0
		delayImageMapUpdate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		delayUpdateChart As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		HelpLabel As label
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Delay chart update to limit update frequency
		#tag EndNote
		holdTimerActive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		holdTimerId As timer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// ImageMapHander representing the image map
		#tag EndNote
		hotSpotTester As CDImageMapHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Mouse is over a clickable hot spot.
		#tag EndNote
		isClickable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Is current dragging scrolling the chart.
		#tag EndNote
		isDragScrolling As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Is in mouse moeve event handler
		#tag EndNote
		isInMouseMove As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// flag to indicate if is in a mouse move plot area event.
		#tag EndNote
		isInMouseMovePlotArea As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isInViewPortChanged As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Is tracking mouse leave event
		#tag EndNote
		isMouseTracking As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Mouse is over the plot area.
		#tag EndNote
		isOnPlotArea As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Mouse left button is down in the plot area.
		#tag EndNote
		isPlotAreaMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		lastMouseMove As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LeftLine As Line
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Minimum drag amount
		#tag EndNote
		minDragAmount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Mouse usage mode
		#tag EndNote
		mouseUsage As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Mouse wheel zoom ratio
		#tag EndNote
		mouseWheelZoomRatio As double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Has pending chart update request
		#tag EndNote
		needUpdateChart As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Has pending image map udpate request
		#tag EndNote
		needUpdateImageMap As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		plotAreaMouseDownXPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		plotAreaMouseDownYPos As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RightLine As Line
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Scroll direction
		#tag EndNote
		scrollDirection As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Selectiom box border color
		#tag EndNote
		selectBoxLineColor As color
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Selectiom box border width
		#tag EndNote
		selectBoxLineWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TopLine As Line
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Minimum interval between chart updates
		#tag EndNote
		updateInterval As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Zoom direction
		#tag EndNote
		zoomDirection As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Click zoom in ratio
		#tag EndNote
		zoomInRatio As double
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// Click zoom out ratio
		#tag EndNote
		zoomOutRatio As double
	#tag EndProperty


	#tag Constant, Name = CLOCKS_PER_SEC, Type = Double, Dynamic = False, Default = \"1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MouseUsageDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MouseUsageScroll, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MouseUsageZoomIn, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MouseUsageZoomOut, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NEED_DELAY, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NEED_UPDATE, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NO_DELAY, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UNDEFINED_COOR, Type = Double, Dynamic = False, Default = \"-1073741823", Scope = Public, Description = 6A757374206120626967206E756D6265722C207768696368206973206E6576657220612076616C696420636F6F7264696E617465
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="needUpdateChart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="defaultToolTip"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectBoxLineColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectBoxLineWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mouseUsage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="zoomDirection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="scrollDirection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="zoomInRatio"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="zoomOutRatio"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mouseWheelZoomRatio"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="minDragAmount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="updateInterval"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="needUpdateImageMap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentHotSpot"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isClickable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isOnPlotArea"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isPlotAreaMouseDown"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isDragScrolling"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isMouseTracking"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isInMouseMove"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="plotAreaMouseDownXPos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="plotAreaMouseDownYPos"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentMouseX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="currentMouseY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isInMouseMovePlotArea"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ChartPicture"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="holdTimerActive"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="isInViewPortChanged"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="delayUpdateChart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastMouseMove"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="delayImageMapUpdate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="autoHideMsg"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
