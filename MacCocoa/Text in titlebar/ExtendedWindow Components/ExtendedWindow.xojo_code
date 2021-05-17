#tag Class
Protected Class ExtendedWindow
Inherits Window
	#tag Event
		Sub Close()
		  //remove the text in the titlebar before closing the window
		  RemoveTitlebarText()
		  
		  RaiseEvent Close
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  //check the system version and set the values of the IsLion, IsSnowLeopard and IsLeopard properties
		  CheckSystemVersion()
		  
		  RaiseEvent Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckSystemVersion()
		  //check the system version and set the values of the IsLion, IsSnowLeopard and IsLeopard properties
		  Dim SystemVersion as Integer
		  Call System.Gestalt("sysv", SystemVersion)
		  
		  If ((SystemVersion >= &h1070) and (SystemVersion < &h1080)) Then
		    IsLion = True
		  ElseIf ((SystemVersion >= &h1060) and (SystemVersion < &h1070)) Then
		    IsSnowLeopard = True
		  ElseIf ((SystemVersion >= &h1050) and (SystemVersion < &h1060)) Then
		    IsLeopard = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateNewLabel(IsTopLabel as Boolean, Text as String, LabelWidth as Double, Font as NSFontMBS) As NSTextViewMBS
		  Dim Y as Double = 1.0
		  Dim LabelTextColor as NSColorMBS = PrivateTitlebarTextNSColor
		  
		  If not (IsTopLabel) Then
		    Y = 0.0
		    
		    //set the 'shadow' color according to the system version
		    If (IsLion) Then
		      LabelTextColor = NSColorMBS.colorWithDeviceRGB(230.0 / 255.0, 230.0 / 255.0, 230.0 / 255.0)
		    ElseIf (IsSnowLeopard) Then
		      LabelTextColor = NSColorMBS.colorWithDeviceRGB(210.0 / 255.0, 210.0 / 255.0, 210.0 / 255.0)
		    ElseIf (IsLeopard) Then
		      LabelTextColor = NSColorMBS.colorWithDeviceRGB(210.0 / 255.0, 210.0 / 255.0, 210.0 / 255.0)
		    Else //default color value
		      LabelTextColor = NSColorMBS.colorWithDeviceRGB(230.0 / 255.0, 230.0 / 255.0, 230.0 / 255.0)
		    End If
		  End If
		  
		  //create a new NSTextView, set its properties and then return it
		  Dim LabelToReturn as New NSTextViewMBS(0.0, Y, LabelWidth, 15.0)
		  LabelToReturn.font = Font
		  LabelToReturn.textColor = LabelTextColor
		  LabelToReturn.text = Text
		  LabelToReturn.isSelectable = False
		  LabelToReturn.drawsBackground = False
		  LabelToReturn.alignment = NSTextViewMBS.NSRightTextAlignment
		  
		  Return LabelToReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleEnterFullScreen(sender as FullScreenEventMirror)
		  //hide the text when entering fullscreen mode, if on Lion
		  TitlebarTextVisible = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleExitFullScreen(sender as FullScreenEventMirror)
		  //show the text when exiting fullscreen mode, if on Lion
		  TitlebarTextVisible = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFailedToEnterFullScreen(sender as FullScreenEventMirror)
		  //show the text again when entering fullscreen mode failed, if on Lion
		  TitlebarTextVisible = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFailedToExitFullScreen(sender as FullScreenEventMirror)
		  //hide the text again when exiting fullscreen mode failed, if on Lion
		  TitlebarTextVisible = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function HandleMouseUp(sender as CustomNSViewMBS, e as NSEventMBS, x as Double, y as Double) As Boolean
		  //raise the TitlebarTextClicked event
		  RaiseEvent TitlebarTextClicked
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveTitlebarText()
		  //remove the titlebar text if there is currently text added to the title bar
		  If not (TitlebarView = Nil) Then
		    //make the text invisible
		    TitlebarTextVisible = False
		    
		    //remove the mouse click handler
		    RemoveHandler TitlebarView.mouseUp, AddressOf HandleMouseUp
		    
		    //if on Lion and if the Window is fullscreen-enabled, remove the fullscreen events handlers
		    If (IsLion and Self.FullScreenPrimaryMBS) Then
		      If not (FullScreenEventMirrorObject = Nil) Then
		        RemoveHandler FullScreenEventMirrorObject.WillEnterFullScreen, AddressOf HandleEnterFullScreen
		        RemoveHandler FullScreenEventMirrorObject.DidFailToEnterFullScreen, AddressOf HandleFailedToEnterFullScreen
		        RemoveHandler FullScreenEventMirrorObject.WillExitFullScreen, AddressOf HandleExitFullScreen
		        RemoveHandler FullScreenEventMirrorObject.DidFailToExitFullScreen, AddressOf HandleFailedToExitFullScreen
		        
		        FullScreenEventMirrorObject = Nil
		      End If
		    End If
		    
		    //remove and destroy the top label
		    TopLabel.removeFromSuperview()
		    TopLabel = Nil
		    
		    //remove and destroy the bottom 'shadow' label
		    BottomLabel.removeFromSuperview()
		    BottomLabel = Nil
		    
		    //finally, remove and destroy the NSView that contained the top and bottom labels
		    TitlebarView.removeFromSuperview()
		    TitlebarView = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TitlebarText() As String
		  //return the currently set text
		  Return PrivateTitlebarText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TitlebarText(ShouldFadeIn as Boolean = True, Assigns Text as String)
		  //remove any existing text
		  RemoveTitlebarText()
		  
		  If not (Text = "") Then
		    //store the passed Text
		    PrivateTitlebarText = Text
		    
		    //if no color has been set, use the default text color
		    If (PrivateTitlebarTextNSColor = Nil) Then
		      TitlebarTextColor = RGB(55, 55, 55)
		    End If
		    
		    //calculate the width of the label
		    Dim NSGraphics as New NSGraphicsMBS()
		    Dim NSFont as NSFontMBS = NSFontMBS.fontWithName("Helvetica", 11.0)
		    Dim NSAttributes as New Dictionary(NSAttributedStringMBS.NSFontAttributeName : NSFont)
		    Dim MaximumLabelWidth as Double = Self.Width - 62.0
		    Dim LabelWidth as Double = NSGraphics.sizeWithAttributes(Text, NSAttributes).Width + 10.0
		    
		    //check if the width of the label exceeds the maximum width, to prevent the window's red, yellow and green buttons from malfunctioning
		    If (LabelWidth > MaximumLabelWidth) Then
		      LabelWidth = MaximumLabelWidth
		    End If
		    
		    //create the two subviews with the text inside of them
		    BottomLabel = CreateNewLabel(False, Text, LabelWidth, NSFont)
		    TopLabel = CreateNewLabel(True, Text, LabelWidth, NSFont)
		    
		    //adjust the X-coordinate according to the value of Self.FullScreenPrimaryMBS
		    Dim X as Double = 0.0
		    
		    If (Self.FullScreenPrimaryMBS) Then
		      X = 18.0
		    End If
		    
		    //create a new NSView and add the subviews
		    TitlebarView = new CustomNSViewMBS((Self.Width - LabelWidth) - X, Self.NSWindowMBS.frame.Height - 21.0, LabelWidth, 15.0)
		    
		    //show or hide the text depending on the current situation
		    If not (IsLion) Then
		      TitlebarTextVisible = True
		    Else
		      If (Self.IsFullScreenMBS) Then
		        TitlebarTextVisible = False
		      Else
		        TitlebarTextVisible = True
		      End If
		    End If
		    
		    TitlebarView.addSubview(BottomLabel)
		    TitlebarView.addSubview(TopLabel)
		    
		    //make the text invisible, only if the text should fade in
		    If (ShouldFadeIn) Then
		      TitlebarView.alphaValue = 0.0
		    End If
		    
		    //set the autoresizingMask to make sure that the text stays in the top-right corner of the titlebar
		    TitlebarView.autoresizingMask = NSViewMBS.NSViewMinXMargin + NSViewMBS.NSViewMinYMargin
		    
		    //add the NSView with the two subviews to the titlebar
		    Self.NSWindowMBS.contentView.superview.addSubview(TitlebarView)
		    
		    //make the text visible by fading it in, only if the text should fade in of course
		    If (ShouldFadeIn) Then
		      Dim TitlebarViewAnimator as NSViewMBS = TitlebarView.animator()
		      
		      If not (TitlebarViewAnimator = Nil) Then
		        TitlebarViewAnimator.alphaValue = 1.0
		      Else
		        TitlebarView.alphaValue = 1.0
		      End If
		    End If
		    
		    //add a handler to handle mouse clicks
		    AddHandler TitlebarView.mouseUp, AddressOf HandleMouseUp
		    
		    //if on Lion and if the Window is fullscreen-enabled, add handlers to handle fullscreen events
		    If (IsLion and Self.FullScreenPrimaryMBS) Then
		      FullScreenEventMirrorObject = new FullScreenEventMirror(Self.NSWindowMBS)
		      
		      If not (FullScreenEventMirrorObject = Nil) Then
		        AddHandler FullScreenEventMirrorObject.WillEnterFullScreen, AddressOf HandleEnterFullScreen
		        AddHandler FullScreenEventMirrorObject.DidFailToEnterFullScreen, AddressOf HandleFailedToEnterFullScreen
		        AddHandler FullScreenEventMirrorObject.WillExitFullScreen, AddressOf HandleExitFullScreen
		        AddHandler FullScreenEventMirrorObject.DidFailToExitFullScreen, AddressOf HandleFailedToExitFullScreen
		      End If
		    End If
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TitlebarTextClicked()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TitlebarTextVisibilityChanged(Visible as Boolean)
	#tag EndHook


	#tag Property, Flags = &h21
		Private BottomLabel As NSTextViewMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FullScreenEventMirrorObject As FullScreenEventMirror
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsLeopard As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsLion As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsSnowLeopard As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrivateTitlebarText As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrivateTitlebarTextColor As Color
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrivateTitlebarTextNSColor As NSColorMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrivateTitlebarTextVisible As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //if a custom color has not been set, return the default color, otherwise return the custom color
			  If (PrivateTitlebarTextNSColor = Nil) Then
			    Return RGB(55, 55, 55)
			  Else
			    Return PrivateTitlebarTextColor
			  End If
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //store the passed Color object
			  PrivateTitlebarTextColor = value
			  
			  //create an NSColor object from the TextColor parameter
			  PrivateTitlebarTextNSColor = NSColorMBS.colorWithDeviceRGB(value.Red / 255.0, value.Green / 255.0, value.Blue / 255.0)
			  
			  //update the text color, only if there is currently text added to the title bar
			  If not (TopLabel = Nil) Then
			    TopLabel.textColor = PrivateTitlebarTextNSColor
			  End If
			End Set
		#tag EndSetter
		TitlebarTextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //return the True if the text is visible and return False if the text is hidden
			  Return PrivateTitlebarTextVisible
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //store the passed value
			  PrivateTitlebarTextVisible = value
			  
			  //if there is currently any text set, hide or show the text according to the passed value
			  If not (TitlebarView = Nil) Then
			    If (PrivateTitlebarTextVisible) Then
			      TitlebarView.frameTop = Self.NSWindowMBS.frame.Height - 21.0
			    Else
			      TitlebarView.frameTop = Self.NSWindowMBS.frame.Height
			    End If
			  End If
			  
			  //raise the TitlebarTextVisibilityChanged event with the passed value
			  RaiseEvent TitlebarTextVisibilityChanged(PrivateTitlebarTextVisible)
			End Set
		#tag EndSetter
		TitlebarTextVisible As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private TitlebarView As CustomNSViewMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TopLabel As NSTextViewMBS
	#tag EndProperty


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
			InitialValue="True"
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
		#tag ViewProperty
			Name="TitlebarTextVisible"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TitlebarTextColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
