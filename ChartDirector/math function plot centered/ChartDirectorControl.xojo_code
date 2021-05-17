#tag Class
Protected Class ChartDirectorControl
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  isMouseDown = true
		  
		  If (AllowZoom = True) And (Keyboard.AsyncOptionKey = True) Then
		    
		    // Zoom In
		    Mode = kModeZoomIn
		    
		    StartX = X
		    StartY = Y
		    StartX2 = X
		    StartY2 = Y
		    
		  ElseIf (AllowZoom = True) And (Keyboard.AsyncShiftKey = True) Then
		    
		    // Zoom Out
		    Mode = kModeZoomOut
		    
		    StartX = X
		    StartY = Y
		    StartX2 = X
		    StartY2 = Y
		    
		  Else
		    
		    Dim HotSpotID As Integer
		    
		    // Check if over a hotspot; Nil check prevents spurious NilObjectExceptions
		    If (ImageMapHandler <> Nil) Then HotSpotID = ImageMapHandler.getHotSpot(X, Y)
		    
		    If (HotSpotID > 0) Then
		      
		      // Click
		      Mode = kModeDefault
		      
		      SendClickEvent
		      
		    ElseIf (AllowMove = True) Then
		      
		      // Move
		      Mode = kModeMove
		      
		      MouseCursor = System.Cursors.HandClosed
		      StartX = X
		      StartY = Y
		      ViewPort.startDrag  // Call to initiate drag within the ViewPort
		      
		    End If
		    
		  End If
		  
		  
		  Return (True)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If (Mode = kModeMove) Then
		    
		    
		    // If the chart has been dragged/repositioned then complete the ViewPort drag and refresh the image
		    If (ViewPort.dragTo(CDBaseChartMBS.kDirectionHorizontalVertical, StartX - X, Y - StartY) = True) Then Redraw
		    
		    
		  ElseIf (Mode = kModeZoomIn) Or (Mode = kModeZoomOut) Then
		    
		    
		    // Calculate the coordinates for the scaling/drawing of the selection rectangle
		    Dim L, T, W, H As Integer
		    
		    StartX2 = X
		    StartY2 = Y
		    
		    L = Min(StartX, StartX2)
		    T = Min(StartY, StartY2)
		    W = StartX2 - StartX
		    H = StartY2 - StartY
		    
		    If (W < 0) Then W = -W
		    If (H < 0) Then H = -H
		    
		    
		    // Composite the current chart image with the selection rectangle
		    // trigger refresh
		    RectangleTop = t
		    rectangleLeft = l
		    rectangleWidth = w
		    rectangleHeight = h
		    me.Invalidate
		    
		    
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  // Finalize redraw
		  CleanUp
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
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
		      
		      MouseCursor = System.Cursors.StandardPointer
		      
		      DrawItemInfo(X, Y)
		      
		    ElseIf (AllowMove = True) Then
		      
		      MouseCursor = System.Cursors.HandOpen
		      CleanUp  // Finalize redraw
		      
		    Else
		      
		      MouseCursor = System.Cursors.StandardPointer
		      CleanUp  // Finalize redraw
		      
		    End If
		    
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  isMouseDown = false
		  
		  If (Mode = kModeMove) Then
		    
		    // Move
		    MouseCursor=System.Cursors.HandOpen
		    
		  ElseIf (Mode = kModeZoomIn) Then
		    
		    // Zoom In (On Point)
		    If (Abs(X - StartX) < 3) And (Abs(Y - StartY) < 3) Then
		      
		      // Zoom In (On Point)
		      If (ViewPort.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) = True) Then
		        If (ViewPort.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, X, Y, ZoomInRatio) = True) Then Redraw
		      Else
		        // Cannot zoom in...
		        Redraw
		        Beep
		      End If
		      
		    Else
		      
		      // Zoom In (On Rectangle)
		      If (ViewPort.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) = True) Then
		        If (ViewPort.zoomTo(CDBaseChartMBS.kDirectionHorizontalVertical, X, Y, StartX, StartY) = True) Then Redraw
		      Else
		        // Cannot zoom in...
		        Redraw
		        Beep
		      End If
		      
		    End If
		    
		  ElseIf (Mode = kModeZoomOut) Then
		    
		    // Zoom Out (On Point)
		    If (ViewPort.canZoomOut(CDBaseChartMBS.kDirectionHorizontalVertical) = True) Then
		      If (ViewPort.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, X, Y, ZoomOutRatio) = True) Then Redraw
		    else
		      // Cannot zoom out...
		      Redraw
		      Beep
		    End If
		    
		  End If
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Initialize the ViewPort manager class
		  ViewPort = New CDViewPortManagerMBS
		  
		  
		  // Set ViewPort coordinant constraints
		  ViewPort.setViewPortHeight(1.0)
		  ViewPort.setViewPortTop(0.0)
		  ViewPort.setViewPortWidth(1.0)
		  ViewPort.setViewPortLeft(0.0)
		  
		  
		  // Set Zoom In and Zoom Out constraints (if desired; otherwise allow infinite zoom)
		  'ViewPort.setZoomInWidthLimit(0.01)
		  'ViewPort.setZoomInHeightLimit(0.01)
		  'ViewPort.setZoomOutWidthLimit(1.0)
		  'ViewPort.setZoomOutHeightLimit(1.0)
		  
		  
		  // Initialize scalable image for use in rendering the selection rectangle
		  RectanglePicture = New Picture(32, 32, 32)
		  RectanglePicture.Graphics.ForeColor = &cFF0000
		  RectanglePicture.Graphics.FillRect(0, 0, 32, 32)
		  RectanglePicture.Mask.Graphics.ForeColor = &cCCCCCC
		  RectanglePicture.Mask.Graphics.FillRect(0, 0, 32, 32)
		  
		  
		  // Set the initial cursor style
		  MouseCursor = System.Cursors.HandOpen
		  
		  
		  // Call overridden superclass method
		  Open
		  
		  // fix some properties if set wrong in IDE
		  
		  me.DoubleBuffer = false
		  me.EraseBackground = false
		  
		  #if RBVersion >= 2013.0 then
		    me.Transparent = False
		  #endif
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Handle drawing the composited image to the drawing region
		  If overlay <> Nil Then
		    g.DrawPicture overlay,0,0
		  Else
		    Draw(G)
		  end if
		  
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

	#tag Method, Flags = &h0
		Function CurrentPicture() As Picture
		  // Return the currently displayed chart image
		  Return (LastPicture)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Draw(G As Graphics)
		  // Prepare ViewPort coordinates for chart rendering
		  ViewPort.validateViewPort
		  
		  
		  // Trigger chart rendering (actual chart configuration and data plotting)
		  Current = Render(ViewPort, 1.0, G.Width, G.Height)
		  
		  
		  If (Current = Nil) Then
		    
		    
		    // If there is no valid chart object returned, clear the drawing region
		    G.ClearRect(0, 0, G.Width, G.Height)
		    
		    
		  Else
		    // Get the chart image based on the returned chart object
		    LastPicture = Current.makeChartPicture
		    
		    
		    
		    // Support control border drawing
		    If (Border = True) Then
		      
		      LastPicture.Graphics.PenHeight = 1
		      LastPicture.Graphics.PenWidth = 1
		      LastPicture.Graphics.ForeColor = &c000000
		      LastPicture.Graphics.DrawRect(0, 0, G.Width, G.Height)
		      
		      LastPicture.Mask.Graphics.PenHeight = 1
		      LastPicture.Mask.Graphics.PenWidth = 1
		      LastPicture.Mask.Graphics.ForeColor = &c000000
		      LastPicture.Mask.Graphics.DrawRect(0, 0, G.Width, G.Height)
		      
		    End If
		    
		    if CleanGraphicsBeforeDrawing then
		      g.ClearRect 0, 0, g.Width, g.Height
		    end if
		    
		    // Draw composited chart image
		    G.DrawPicture(LastPicture, 0, 0)
		    
		    
		    // Update ViewPort to current chart coordinants
		    ViewPort.setChartMetrics(Current.getChartMetrics)
		    
		    
		    // Process ImageMap data to support data point rollovers, etc.
		    Dim ImageMapString As String
		    
		    ImageMapString = Current.getHTMLImageMap("myurl" )
		    ImageMapHandler = New CDImageMapHandlerMBS(ImageMapString)
		    
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawItemInfo(X As Integer, Y As Integer)
		  Dim Index as integer
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
		Sub Print()
		  Dim PS As New PrinterSetup
		  
		  
		  // Set landscape orientation if appropriate
		  PS.Landscape = Width > Height
		  
		  
		  // Initialize graphics region for printing
		  Dim G As Graphics = OpenPrinterDialog(PS)
		  
		  
		  // Bail out...
		  If (G = Nil) Then Return
		  
		  
		  // Render printed chart (use page size)
		  // NOTE: This uses a factor of 4x to up the resolution of the printed chart image (approximately 300 dpi)
		  'Dim P As Picture = RenderPicture(4, G.Width, G.Height)
		  'G.DrawPicture(P, 0, 0, G.Width, G.Height, 0, 0, G.Width * 4, G.Height * 4)
		  
		  
		  // Render printed chart (use control size)
		  // NOTE: This uses a factor of 4x to up the resolution of the printed chart image (approximately 300 dpi)
		  Dim P As Picture = RenderPicture(4, Width, Height)
		  G.DrawPicture(P, 0, 0, Width, Height, 0, 0, Width * 4, Height * 4)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redraw()
		  // Method to directly trigger internal redraw
		  
		  
		  me.Invalidate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPicture(Factor As Double, Width As Integer, Height As Integer) As Picture
		  // Prepare ViewPort coordinates for chart rendering
		  ViewPort.validateViewPort
		  
		  
		  // Handle scaled redraw for printing
		  Dim C As CDBaseChartMBS = Render(ViewPort, Factor, Width, Height)
		  'If (C <> Nil) Then Return (C.makeChartPicture)
		  
		  
		  // Error check
		  If (C = Nil) Then Return (Nil)
		  
		  
		  dim p as Picture = C.makeChartPicture
		  
		  Return p
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SendClickEvent()
		  Dim Index as integer
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
		  
		  
		  // Trigger click event
		  ItemClicked(XLabel, Val(XValue), Val(DataSet), DataSetName, Val(Value), Title, Val(Sector), Label)
		  
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


	#tag Hook, Flags = &h0
		Event ItemClicked(XLabel As String, X As Integer, DataSet As Integer, DataSetName As String, Value As Double, Title As String, Sector As Integer, Label As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Render(ViewPort As CDViewPortManagerMBS, Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
	#tag EndHook


	#tag Note, Name = About Properties
		
		AllowMove and AllowZoom must be enabled if you want to zoom and move. 
		You need to use the viewport in your render code.
		
		If Border is true, a black line is drawn around the chart.
		
		If CleanGraphicsBeforeDrawing is true then the graphics object is cleared 
		before something is drawn
		
		The OverlayPicture defines a picture which is drawn on top of the chart 
		as a watermark.
		
		RenderWithTransparency will do redraws slower. The chart is rendered as 
		PNG with mask and for every redraw we refresh the whole control. 
		This may look bad on Windows.
		
		ZoomInRatio and ZoomOutRatio are used for zooming. 
		This is how much we zoom on each click.
		
		
	#tag EndNote

	#tag Note, Name = Notes for Render Event
		Use the Width and Height you get and not the control's.
		Use the Factor to multiply all values so you get it properly scaled for printing.
		Use the ViewPort for zooming and moving.
		
	#tag EndNote


	#tag Property, Flags = &h0
		AllowMove As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		AllowZoom As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Border As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CleanGraphicsBeforeDrawing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Current As CDBaseChartMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageMapHandler As CDImageMapHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MaxValue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MinValue As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Mode As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedClear As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Overlay As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		RectangleHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RectangleLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RectanglePicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		RectangleTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RectangleWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartX2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StartY2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ViewPort As CDViewPortManagerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomInRatio As Double = 1.25
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomOutRatio As Double = 0.75
	#tag EndProperty


	#tag Constant, Name = kModeDefault, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kModeMove, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kModeZoomIn, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = kModeZoomOut, Type = Double, Dynamic = False, Default = \"3", Scope = Private
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
			Name="InitialParent"
			Visible=false
			Group="Verhalten"
			InitialValue=""
			Type="String"
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
			Name="border"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="zoomOutRatio"
			Visible=true
			Group="Behavior"
			InitialValue="0.75"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="zoomInRatio"
			Visible=true
			Group="Behavior"
			InitialValue="1.25"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowZoom"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowMove"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CleanGraphicsBeforeDrawing"
			Visible=true
			Group="Behavior"
			InitialValue="false"
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
			Visible=false
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RectangleHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RectangleLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RectangleTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RectangleWidth"
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
