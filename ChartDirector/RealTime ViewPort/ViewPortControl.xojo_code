#tag Class
Protected Class ViewPortControl
Inherits CDViewPortControlBaseMBS
	#tag Method, Flags = &h0
		Sub Close()
		  If Self.output <> Nil Then
		    Self.output.ViewPortControl = Nil
		    Self.Output = Nil
		  End If
		  
		  Self.viewer = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  Self.Viewer = Nil
		  Self.mouseDownX = 0
		  Self.mouseDownY = 0
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getChart() As CDBaseChartMBS
		  // Get back the same BaseChart pointer provided by the previous setChart call.
		  
		  Return Self.Chart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getViewer() As ChartViewerCanvas
		  Return viewer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDrag(MouseEvent as MouseEvent) As Boolean
		  // Determines if the mouse is dragging.
		  
		  If viewer = Nil Then
		    Return False
		  End If
		  
		  Dim minimumDrag As Integer = viewer.getMinimumDrag
		  Dim moveX As Integer = Abs(Self.mouseDownX - MouseEvent.x)
		  Dim moveY As Integer = Abs(Self.mouseDownY - MouseEvent.y)
		  Return (moveX >= minimumDrag) Or (moveY >= minimumDrag)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseMoveEvent(MouseEvent as MouseEvent)
		  // MouseMove event handler
		  //
		  
		  // Get the QChartViewer zoom/scroll state to determine which type of mouse action is allowed
		  syncState
		  
		  // Handle the mouse move event
		  handleMouseMove(toImageX(MouseEvent.x), toImageY(MouseEvent.y), isDrag(MouseEvent))
		  
		  // Update the chart viewer if the viewport has changed
		  updateChartViewerIfNecessary
		  
		  // Update the mouse cursor
		  updateCursor(Self.Cursor)
		  
		  // Update the display
		  If (needUpdateDisplay) Then
		    paintDisplay
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mousePressEvent(MouseEvent as MouseEvent)
		  // Mouse button down event.
		  
		  If (MouseEvent.button <> MouseEvent.LeftButton) then
		    Return
		  End If
		  
		  
		  // Remember current mouse position
		  Self.mouseDownX = MouseEvent.x
		  self.mouseDownY = MouseEvent.y
		  
		  // Get the QChartViewer zoom/scroll state to determine which type of mouse action is allowed
		  syncState
		  
		  // Handle the mouse down event
		  handleMouseDown(toImageX(MouseEvent.x), toImageY(MouseEvent.y))
		  
		  // Update the chart viewer if the viewport has changed
		  updateChartViewerIfNecessary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub mouseReleaseEvent(MouseEvent as MouseEvent)
		  // Mouse button up event.
		  
		  If (MouseEvent.button <> MouseEvent.LeftButton) Then
		    Return
		  End If
		  
		  
		  // Get the QChartViewer zoom/scroll state to determine which type of mouse action is allowed
		  syncState
		  
		  // Handle the mouse down event
		  handleMouseUp(toImageX(MouseEvent.x), toImageY(MouseEvent.y))
		  
		  // Update the chart viewer if the viewport has changed
		  updateChartViewerIfNecessary
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub onViewPortChanged()
		  // Handle the ViewPortChanged event from the associated ChartViewer
		  
		  Self.updateDisplay
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub paintDisplay()
		  // Paint the display
		  
		  Dim c As CDBaseChartMBS = Self.Chart
		  
		  If c <> Nil Then
		    Output.ChartPicture = c.makeChartPicture
		  Else
		    System.DebugLog "No chart in "+CurrentMethodName
		    Output.ChartPicture = Nil
		  End If
		  
		  Output.invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setChart(c as CDXYChartMBS)
		  // Set the chart to be displayed in the control
		  
		  if c <> nil then
		    Self.Chart = c
		    
		    Self.updateDisplay
		  Else
		    Break
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setViewer(v as ChartViewerCanvas)
		  // Set the CChartViewer to be associated with this control
		  
		  Self.viewer = v
		  self.ViewPortManager = v.ViewPortManager
		  
		  updateDisplay
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub syncState()
		  // Synchronize the CViewPortControl with CChartViewer
		  
		  If viewer <> Nil Then
		    self.setZoomScrollDirection viewer.zoomDirection, viewer.scrollDirection
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toImageX(x as integer) As double
		  // In this version, no conversion is done. It is assumed the control does not stretch or shrink
		  // the image and does not provide any additional margin to offset the image.
		  Return x
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function toImageY(y as integer) As double
		  // In this version, no conversion is done. It is assumed the control does not stretch or shrink
		  // the image and does not provide any additional margin to offset the image.
		  Return y
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateChartViewerIfNecessary()
		  // Update ChartViewer if viewport has changed
		  
		  If viewer = Nil Then
		    Break
		    Return
		  End If
		  
		  If (Self.needUpdateChart Or Self.needUpdateImageMap) Then
		    viewer.updateViewPort(self.needUpdateChart, self.needUpdateImageMap)
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateCursor(position as integer)
		  // Update the mouse cursor
		  
		  Select Case position
		  Case CDBaseChartMBS.kLeft, CDBaseChartMBS.kRight
		    output.MouseCursor = System.Cursors.ArrowEastWest
		  Case CDBaseChartMBS.kTop, CDBaseChartMBS.kBottom
		    output.MouseCursor = System.Cursors.ArrowNorthSouth
		    
		  Case CDBaseChartMBS.kTopLeft, CDBaseChartMBS.kBottomRight
		    output.MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		    
		  Case CDBaseChartMBS.kTopRight, CDBaseChartMBS.kBottomLeft
		    output.MouseCursor = System.Cursors.ArrowNortheastSouthwest
		    
		  else
		    output.MouseCursor = Nil
		  End Select
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateDisplay()
		  // Update the display
		  
		  paintViewPort
		  paintDisplay
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub wheelEvent(MouseEvent as MouseEvent)
		  // MouseWheel handler
		  
		  // Process the mouse wheel only if the mouse is over the plot area
		  If ((Nil = Viewer) Or (Not isOnPlotArea(MouseEvent.x, MouseEvent.y))) Then
		    // ignore
		  Else
		    
		    // Ask the CChartViewer to zoom around the center of the chart
		    Dim x As Integer = Viewer.getPlotAreaLeft + Viewer.getPlotAreaWidth / 2
		    Dim y As Integer = Viewer.getPlotAreaTop  + Viewer.getPlotAreaHeight / 2
		    
		    If (Not viewer.onMouseWheelZoom(x, y, MouseEvent.delta)) then
		      // ignore
		    End If
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mouseDownX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseDownY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As ViewPortControlCanvas
	#tag EndProperty

	#tag Property, Flags = &h0
		Viewer As ChartViewerCanvas
	#tag EndProperty


	#tag ViewBehavior
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
			Name="mouseDownX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mouseDownY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
