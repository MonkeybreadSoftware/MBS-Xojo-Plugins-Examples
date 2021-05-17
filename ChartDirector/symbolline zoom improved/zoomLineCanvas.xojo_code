#tag Class
Protected Class zoomLineCanvas
Inherits canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  isMouseDown = true
		  
		  //if cntSymbolLineZoom(window).ToolMove.Value then
		  if allowMove and (not Keyboard.AsyncAltKey) and (not Keyboard.AsyncShiftKey) then
		    me.MouseCursor=System.Cursors.HandClosed
		    StartX=X
		    StartY=Y
		    viewport.startDrag
		    
		  else
		    // zoom
		    
		    StartX=X
		    StartY=Y
		    StartX2=X
		    StartY2=Y
		    
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If (Not Keyboard.AsyncShiftKey) And (Not Keyboard.AsyncAltKey) And allowMove Then// cntSymbolLineZoom(window).ToolMove.Value then
		    if viewport.dragTo(CDBaseChartMBS.kDirectionHorizontalVertical, x-Startx,y-Starty) then
		      redraw
		      cntSymbolLineZoom(window).LabelX.Text="x: "+str(getXdata(x))
		      cntSymbolLineZoom(window).LabelY.Text="y: "+str(getYdata(y))
		    end if
		  else
		    StartX2=X
		    StartY2=Y
		    
		    dim l,t as integer
		    dim w,h as integer
		    
		    l=min(StartX,StartX2)
		    t=min(StartY,StartY2)
		    w=StartX2-StartX
		    h=StartY2-StartY
		    if w<0 then w=-w
		    if h<0 then h=-h
		    
		    cntSymbolLineZoom(Window).LabelX.Text="x: "+Str(getXdata(x))
		    cntSymbolLineZoom(Window).LabelY.Text="y: "+Str(getYdata(y))
		    
		    
		    // trigger refresh
		    RectangleTop = t
		    rectangleLeft = l
		    rectangleWidth = w
		    rectangleHeight = h
		    me.Invalidate
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  //cntSymbolLineZoom(parent).LabelX.Text=str(me.viewport.getViewPortLeft)
		  //cntSymbolLineZoom(parent).LabelY.Text=str(me.viewport.getViewPortTop)
		  
		  If (AllowZoom = True) And (Keyboard.AsyncOptionKey = True) Then
		    
		    // Zoom In
		    MouseCursor = System.Cursors.MagnifyLarger
		    CleanUp  // Finalize redraw
		    
		  ElseIf (AllowZoom = True) And (Keyboard.AsyncShiftKey = True) Then
		    
		    // Zoom Out
		    MouseCursor = System.Cursors.MagnifySmaller
		    CleanUp  // Finalize redraw
		    
		  Else
		    
		    Dim HotSpotID As Integer
		    
		    // Check if over a hotspot; Nil check prevents spurious NilObjectExceptions
		    If (ImageMapHandler <> Nil) Then HotSpotID = ImageMapHandler.getHotSpot(X, Y)
		    
		    If (HotSpotID > 0) Then
		      cntSymbolLineZoom(window).Timer1.Mode=0
		      MouseCursor = System.Cursors.StandardPointer
		      
		      DrawItemInfo(X, Y)
		      
		    ElseIf (AllowMove = True) Then
		      
		      MouseCursor = System.Cursors.HandOpen
		      CleanUp  // Finalize redraw
		      cntSymbolLineZoom(window).Timer1.Mode=2
		      
		    Else
		      
		      MouseCursor = System.Cursors.StandardPointer
		      CleanUp  // Finalize redraw
		      cntSymbolLineZoom(window).Timer1.Mode=2
		      
		    End If
		    
		  End If
		  
		  //dim maxX,maxY,curX,curY as integer
		  //dim maxXdata,maxYdata,minXdata,minYdata,curXdata,curYdata as double
		  //
		  //maxX=c.getPlotArea.getWidth-1
		  //maxY=c.getPlotArea.getHeight-1
		  //
		  //minXdata=c.xAxis.getMinValue
		  //maxXdata=c.xAxis.getMaxValue
		  //minYdata=c.yAxis.getMinValue
		  //maxYdata=c.yAxis.getMaxValue
		  //
		  //curX=x-c.getPlotArea.getLeftX
		  //curY=c.getPlotArea.getHeight+c.getPlotArea.getTopY-y
		  //
		  //curXdata=minXdata+curX*(maxXdata-minXdata)/maxX
		  //curYdata=minYdata+curY*(maxYdata-minYdata)/maxY
		  
		  cntSymbolLineZoom(window).LabelX.Text="x: "+str(getXdata(x))
		  cntSymbolLineZoom(window).LabelY.Text="y: "+str(getYdata(y))
		  //cntSymbolLineZoom(window).LabelXax.Text="xax: "+str(minXdata)+","+str(maxXdata)
		  //cntSymbolLineZoom(window).LabelYax.Text="yax: "+str(minYdata)+","+str(maxYdata)
		  
		  exception
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  Me.rectangleWidth = 0
		  isMouseDown = false
		  
		  if allowMove and (not Keyboard.AsyncAltKey) and (not Keyboard.AsyncShiftKey) then //cntSymbolLineZoom(window).ToolMove.Value then
		    me.MouseCursor=System.Cursors.HandOpen
		  elseif allowZoom and Keyboard.AsyncAltKey then //cntSymbolLineZoom(window).ToolZoomIn.Value then
		    
		    // zoom on point?
		    
		    if abs(X-StartX)<3 and abs(Y-StartY)<3 then
		      
		      // zoom in on point
		      if viewport.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) then
		        if viewport.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, me.zoomInRatio) then
		          redraw
		        end if
		      else
		        redraw
		        beep
		      end if
		      
		    else
		      
		      // zoom in on a rectangle
		      if viewport.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) then
		        if viewport.zoomTo(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, StartX, StartY) then
		          redraw
		        end if
		      else
		        redraw
		        beep
		      end if
		    end if
		    
		  elseif allowZoom and Keyboard.AsyncShiftKey then //cntSymbolLineZoom(window).ToolZoomOut.Value then
		    
		    // zoom out on point
		    if viewport.canZoomOut(CDBaseChartMBS.kDirectionHorizontalVertical) then
		      if viewport.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, zoomOutRatio) then
		        redraw
		      end if
		    else
		      redraw
		      beep
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Me.viewport=New CDViewPortManagerMBS
		  
		  viewport.setViewPortHeight 1
		  viewport.setViewPortTop 0
		  viewport.setViewPortWidth 1
		  viewport.setViewPortLeft 0
		  
		  viewport.setZoomInWidthLimit 0.001
		  'viewport.setZoomInHeightLimit 0.01
		  viewport.setZoomOutWidthLimit 0.2
		  'viewport.setZoomOutHeightLimit 1.0
		  
		  dim x0 as Double=70
		  dim x1 as Double=50
		  dim x2 as Double=30
		  
		  data0.Append x0
		  data1.Append x1
		  data2.Append x2
		  
		  for i as integer=1 to 100
		    x0=x0+rnd*5.0-2.5
		    x1=x1+rnd*5.0-2.5
		    x2=x2+rnd*5.0-2.5
		    data0.Append x0
		    data1.Append x1
		    data2.Append x2
		  next
		  
		  // for the selection box
		  rectanglePicture=New Picture(32,32,32)
		  rectanglePicture.Graphics.ForeColor=&cFF0000
		  rectanglePicture.Graphics.FillRect 0,0,32,32
		  rectanglePicture.mask.Graphics.ForeColor=&cCCCCCC
		  rectanglePicture.mask.Graphics.FillRect 0,0,32,32
		  
		  me.MouseCursor=System.Cursors.HandOpen
		  
		  
		  
		  // fix some properties if set wrong in IDE
		  
		  me.DoubleBuffer = false
		  me.EraseBackground = false
		  
		  #if RBVersion >= 2013.0 then
		    me.Transparent = False
		  #endif
		  
		  redraw
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If g <> Nil Then
		    If overlay <> Nil Then
		      g.DrawPicture overlay,0,0
		    Else
		      g.DrawPicture lastpicture,0,0
		      
		      If rectangleWidth > 0 Then
		        g.DrawPicture rectanglePicture, rectangleLeft, rectangleTop, rectangleWidth, rectangleHeight, 0, 0, rectanglePicture.Width, rectanglePicture.Height
		      End If
		    end if
		  End If
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CleanUp()
		  // Finalize redraw
		  Me.rectangleWidth = 0
		  Me.Invalidate
		  Me.NeedClear = False
		  Me.Overlay = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawItemInfo(X As Integer, Y As Integer)
		  Dim Index As Integer
		  Dim Key, KeyValue As String
		  
		  Dim XLabel As String
		  Dim XValue As String
		  Dim DataSet As String
		  Dim DataSetName As String
		  Dim Value As String
		  Dim Title As String
		  Dim Sector As String
		  Dim Label As String
		  
		  
		  // Error check
		  If (ImageMapHandler = Nil) Then Return
		  
		  
		  // Do key/value pair priming calls
		  Index = 0
		  Key = ImageMapHandler.getKey(Index)
		  KeyValue = ImageMapHandler.getValue(Index)
		  
		  
		  Do
		    
		    // NOTE: This is not the complete supported list of parameters; Refer to ChartDirector documentation on 'Parameter Substitution and Formatting' for additional parameters
		    Select Case Key
		      
		    Case "xlabel"
		      XLabel = KeyValue
		      
		    Case "x"
		      XValue = KeyValue
		      
		    Case "dataset"
		      DataSet = KeyValue
		      
		    Case "datasetname"
		      DataSetName = KeyValue
		      
		    Case "value"
		      Value = KeyValue
		      
		    Case "title"
		      Title = KeyValue
		      
		    Case "sector"
		      Sector = KeyValue
		      
		    Case "label"
		      Label = KeyValue
		      
		    End Select
		    
		    Index = Index + 1
		    
		    // Get next key/value pair
		    Key = ImageMapHandler.getKey(Index)
		    KeyValue = ImageMapHandler.getValue(Index)
		    
		  Loop Until Key.Len = 0
		  
		  
		  // Compose label graphic
		  If (Label <> "") Then Value = Label + ": " + Value
		  
		  
		  Dim B As Picture = New Picture(Width, Height, 32)
		  Dim G As Graphics = B.Graphics
		  
		  Dim W As Integer = 6 + G.StringWidth(Value)
		  Dim H As Integer = 20
		  
		  
		  // Add some space between the cursor position and the initial label drawing position
		  X = X + 10
		  Y = Y + 10
		  
		  
		  // If we are too close to the right, we need to move our label drawing position left
		  If (X + W > G.Width) Then X = X - 20 - W
		  
		  
		  // If we are too close to the bottom, we need to move our label drawing position up
		  If (Y + H > G.Height) Then Y = Y - 20 - H
		  
		  
		  // Draw in the current composited chart image
		  B.Graphics.DrawPicture(LastPicture, 0, 0)
		  B.Mask.Graphics.DrawPicture(LastPicture.Mask, 0, 0)
		  
		  
		  // Draw the label graphic
		  G.ForeColor = &cCCCC00
		  G.FillRect(X, Y, W, H)
		  G.ForeColor = &c000000
		  G.DrawString(Value, X + 3, Y + 15)
		  
		  
		  // Update the composited chart image
		  Overlay = b
		  Me.Invalidate
		  NeedClear = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getXdata(x as integer) As double
		  dim maxX,curX as integer
		  dim maxXdata,minXdata as double
		  
		  maxX=c.getPlotArea.getWidth-1
		  
		  minXdata=c.xAxis.getMinValue
		  maxXdata=c.xAxis.getMaxValue
		  
		  curX=x-c.getPlotArea.getLeftX
		  
		  return minXdata+curX*(maxXdata-minXdata)/maxX
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getYdata(y as Integer) As Double
		  dim maxY,curY as integer
		  dim maxYdata,minYdata as double
		  
		  maxY=c.getPlotArea.getHeight//-1
		  
		  minYdata=c.yAxis.getMinValue
		  maxYdata=c.yAxis.getMaxValue
		  
		  curY=c.getPlotArea.getHeight+c.getPlotArea.getTopY-y
		  
		  return minYdata+curY*(maxYdata-minYdata)/maxY
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub redraw()
		  // The data for the line chart
		  Dim i As Integer
		  
		  viewport.validateViewPort
		  
		  // Create a XYChart object of size 600 x 375 pixels
		  c = New CDXYChartMBS(Me.width, Me.height)
		  
		  // Add a title to the chart using 18 pts Times Bold Italic font
		  Call c.addTitle("Product Line Global Revenue", "timesbi.ttf", 18)
		  
		  // Set the plotarea at (50, 55) and of 500 x 280 pixels in size. Use a vertical
		  // gradient color from light blue (f9f9ff) to sky blue (aaccff) as background.
		  // Set border to transparent and grid lines to white (ffffff).
		  Call c.setPlotArea(50, 55, Me.width-100, Me.height-110, c.linearGradientColor(0, 55, 0, 335, &hf9fcff, &haaccff), -1, c.kTransparent, &hffffff)
		  Call c.setClipping
		  
		  // Add a legend box at (50, 28) using horizontal layout. Use 10pts Arial Bold as
		  // font, with transparent background.
		  c.addLegend(50, 28, False, "arialbd.ttf", 10).setBackground(c.kTransparent)
		  
		  // Set the x axis labels
		  'call c.xAxis.setLabels(labels)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30)
		  c.yAxis2.setTickDensity(30)
		  
		  // Set axis label style to 8pts Arial Bold
		  Call c.xAxis.setLabelStyle("arialbd.ttf", 8)
		  Call c.yAxis.setLabelStyle("arialbd.ttf", 8)
		  Call c.yAxis2.setLabelStyle("arialbd.ttf", 8)
		  
		  // Set axis line width to 2 pixels
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  c.yAxis2.setWidth(2)
		  
		  // Add axis title using 10pts Arial Bold Italic font
		  Call c.yAxis.setTitle("Revenue in US millions", "arialbi.ttf", 10)
		  Call c.yAxis2.setTitle("Revenue in US millions", "arialbi.ttf", 10)
		  
		  // scroll
		  Dim axisLowerLimit As Double
		  Dim axisUpperLimit As Double
		  
		  axisUpperLimit = 100.0 *(viewport.getViewPortLeft + viewport.getViewPortWidth)
		  axisLowerLimit = 100.0 * viewport.getViewPortLeft
		  
		  c.xAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.xAxis.setRounding(False, False)
		  
		  axisLowerLimit =  100.0-100.0 *(viewport.getViewPortTop + viewport.getViewPortHeight)
		  axisUpperLimit =  100.0-100.0 * viewport.getViewPortTop
		  
		  c.yAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis.setRounding(False, False)
		  c.yAxis2.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis2.setRounding(False, False)
		  
		  // Add a line layer to the chart
		  Dim layer As CDLineLayerMBS
		  layer = c.addLineLayer
		  
		  // Set the line width to 3 pixels
		  layer.setLineWidth(3)
		  
		  // Add the three data sets to the line layer, using circles, diamands and X
		  // shapes as symbols
		  layer.addDataSet(data0, &hff0000, "Quantum Computer").setDataSymbol(c.kCircleSymbol, 9)
		  layer.addDataSet(data1, &h00ff00, "Atom Synthesizer").setDataSymbol(c.kDiamondSymbol, 11)
		  layer.addDataSet(data2, &hff6600, "Proton Cannon").setDataSymbol(c.Cross2Shape, 11)
		  
		  lastpicture=c.makeChartPicture
		  
		  viewport.setChartMetrics c.getChartMetrics
		  
		  // Process ImageMap data to support data point rollovers, etc.
		  Dim ImageMapString As String
		  
		  ImageMapString = c.getHTMLImageMap("myurl" )
		  ImageMapHandler = New CDImageMapHandlerMBS(ImageMapString)
		  
		  // trigger refresh
		  me.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMouseCursor()
		  // call from a timer in your window to keep the mouse cursor change with pressing alt and shift keys.
		  
		  // zoom allowed?
		  if not AllowZoom then Return
		  if isMouseDown then Return
		  
		  dim x as integer = me.MouseX
		  dim y as integer = me.MouseY
		  
		  // check if mouse is inside
		  if X<0 then Return
		  if Y<0 then Return
		  if X>me.Width then Return
		  if Y>me.Height then Return
		  
		  // now update
		  
		  If Keyboard.AsyncOptionKey Then
		    
		    // Zoom In
		    MouseCursor = System.Cursors.MagnifyLarger
		    
		  ElseIf Keyboard.AsyncShiftKey Then
		    
		    // Zoom Out
		    MouseCursor = System.Cursors.MagnifySmaller
		    
		  Else
		    
		    Dim HotSpotID As Integer
		    
		    // Check if over a hotspot; Nil check prevents spurious NilObjectExceptions
		    If (ImageMapHandler <> Nil) Then HotSpotID = ImageMapHandler.getHotSpot(X, Y)
		    
		    If (HotSpotID > 0) Then
		      
		      MouseCursor = System.Cursors.StandardPointer
		      
		      
		      
		    ElseIf (AllowMove = True) Then
		      
		      MouseCursor = System.Cursors.HandOpen
		      
		    Else
		      
		      MouseCursor = System.Cursors.StandardPointer
		      
		    End If
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected c As CDXYChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CleanGraphicsBeforeDrawing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected data0(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected data1(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected data2(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageMapHandler As CDImageMapHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected lastpicture As picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected maxvalue As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected minvalue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseXvalue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseYvalue As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedClear As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Overlay As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected rectanglePicture As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartX2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartY As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartY2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected viewport As cdviewPortManagerMBS
	#tag EndProperty


	#tag Constant, Name = allowDrag, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = allowMove, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = allowZoom, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = zoomInRatio, Type = Double, Dynamic = False, Default = \"2.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = zoomOutRatio, Type = Double, Dynamic = False, Default = \"0.5", Scope = Protected
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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
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
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
			Name="TabStop"
			Visible=true
			Group="Position"
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
			Name="Enabled"
			Visible=true
			Group="Appearance"
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
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="mouseXvalue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mouseYvalue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CleanGraphicsBeforeDrawing"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Overlay"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
