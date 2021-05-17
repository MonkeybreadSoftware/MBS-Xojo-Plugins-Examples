#tag Class
Protected Class ChartDirectorControl
Inherits WebImageView
	#tag Event
		Sub MouseDown(X As Integer, Y As Integer, Details As REALbasic.MouseEvent)
		  
		  
		  Dim HotSpotID As Integer
		  
		  // Check if over a hotspot; Nil check prevents spurious NilObjectExceptions
		  If (ImageMapHandler <> Nil) Then HotSpotID = ImageMapHandler.getHotSpot(X, Y)
		  
		  If (HotSpotID > 0) Then
		    
		    // Click
		    SendClickEvent
		    
		    if ShowValueOnClick then
		      DrawItemInfo(X, Y)
		    end if
		    
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
		Sub Open()
		  
		  // Call overridden superclass method
		  Open
		  
		  
		  Redraw
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  redraw
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CleanUp()
		  // Finalize redraw
		  If (NeedClear = True) Then
		    NeedClear = False
		    
		    
		    self.Picture = LastWebPicture
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentPicture() As Picture
		  // Return the currently displayed chart image
		  Return (LastPicture)
		  
		End Function
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
		  
		  
		  Dim B As Picture = New Picture(LastPicture.Width, LastPicture.Height)
		  dim f as integer = 2
		  B.VerticalResolution   = LastPicture.VerticalResolution
		  b.HorizontalResolution = LastPicture.HorizontalResolution
		  
		  Dim G As Graphics = B.Graphics
		  g.TextSize = 12 * f
		  
		  Dim W As Integer = 6 + G.StringWidth(Value) / f
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
		  if LastPicture.Mask <> nil and b.mask <> nil then
		    B.Mask.Graphics.DrawPicture(LastPicture.Mask, 0, 0)
		  end if
		  
		  // Draw the label graphic
		  G.ForeColor = &cCCCC00
		  G.FillRect(X*f, Y*f, W*f, H*f)
		  G.ForeColor = &c000000
		  G.DrawString(Value, f*(X + 3), f*(Y + 15))
		  
		  
		  // Update the composited chart image
		  
		  self.Picture = B
		  NeedClear = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redraw()
		  
		  
		  // Trigger chart rendering (actual chart configuration and data plotting)
		  Current = Render(1.0, me.Width, me.Height)
		  
		  
		  If Current = Nil Then
		    
		    
		    // If there is no valid chart object returned, clear the drawing region
		    LastPicture = nil
		    LastWebPicture = nil
		    
		    self.Picture = nil
		    
		  Else
		    
		    // Get the chart image based on the returned chart object
		    LastPicture = Current.makeChartPicture
		    
		    
		    // Support overlay picture drawing
		    If (OverlayPicture <> Nil) Then
		      LastPicture.Graphics.DrawPicture(OverlayPicture, (me.Width - OverlayPicture.Width) / 2, (me.Height - OverlayPicture.Height) / 2)
		    End If
		    
		    
		    // Support control border drawing
		    If (Border = True) Then
		      
		      LastPicture.Graphics.PenHeight = 1
		      LastPicture.Graphics.PenWidth = 1
		      LastPicture.Graphics.ForeColor = &c000000
		      LastPicture.Graphics.DrawRect(0, 0, me.Width, me.Height)
		      
		      LastPicture.Mask.Graphics.PenHeight = 1
		      LastPicture.Mask.Graphics.PenWidth = 1
		      LastPicture.Mask.Graphics.ForeColor = &c000000
		      LastPicture.Mask.Graphics.DrawRect(0, 0, me.Width, me.Height)
		      
		    End If
		    
		    // Draw composited chart image
		    
		    LastWebPicture = LastPicture
		    self.Picture = LastWebPicture
		    
		    
		    // Process ImageMap data to support data point rollovers, etc.
		    
		    ImageMapString = Current.getHTMLImageMap("myurl" )
		    ImageMapHandler = New CDImageMapHandlerMBS(ImageMapString)
		    
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPicture(Factor As Double, Width As Integer, Height As Integer) As Picture
		  
		  // Handle scaled redraw for printing
		  Dim C As CDBaseChartMBS = Render(factor, Width, Height)
		  'If (C <> Nil) Then Return (C.makeChartPicture)
		  
		  
		  // Error check
		  If (C = Nil) Then Return (Nil)
		  
		  
		  // Get in-memory version of the chart image in PNG format (supports transparency)
		  Dim S As String
		  S = C.makeChart(C.kPNG)
		  
		  
		  // Error check
		  If (S = "") Then Return (Nil)
		  
		  
		  // Generate RB Picture from chart image data
		  Dim P As Picture
		  P = PNGStringToPictureMBS(S, 0)
		  
		  
		  Return (P)
		  
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
		  
		  #if DebugBuild then
		    // so you can look on all values in debugger
		    dim debugDictionary as new Dictionary
		  #endif
		  
		  
		  Do
		    
		    #if DebugBuild then
		      debugDictionary.value(key) = KeyValue
		    #endif
		    
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


	#tag Hook, Flags = &h0
		Event ItemClicked(XLabel As String, X As Integer, DataSet As Integer, DataSetName As String, Value As Double, Title As String, Sector As Integer, Label As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Render(Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
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
		Border As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Current As CDBaseChartMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ImageMapHandler As CDImageMapHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			Last map for debugging.
			
		#tag EndNote
		ImageMapString As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastWebPicture As WebPicture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedClear As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		OverlayPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowValueOnClick As Boolean
	#tag EndProperty


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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="border"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OverlayPicture"
			Visible=true
			Group="Behavior"
			InitialValue="nil"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowValueOnClick"
			Visible=true
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ImageMapString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
