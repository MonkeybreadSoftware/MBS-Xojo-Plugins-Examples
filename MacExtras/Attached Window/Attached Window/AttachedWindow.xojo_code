#tag Class
Protected Class AttachedWindow
	#tag Method, Flags = &h0
		Sub Constructor(hasParentWindow as Window, theControl as RectControl, theText as String)
		  
		  theParentWindow = hasParentWindow
		  
		  'calculate string width
		  dim tempPic as new Picture(1, 1, 32)
		  tempPic.Graphics.DrawString(theText, 0, tempPic.Graphics.TextHeight + tempPic.Graphics.TextAscent, WindowWidth)
		  dim StringHeight as Integer = tempPic.Graphics.StringHeight(theText, WindowWidth)
		  
		  dim theNSWindow as NSWindowMBS = theParentWindow.NSWindowMBS
		  
		  if InternalAttachedWindow <> Nil then
		    theNSWindow.removeChildWindow InternalAttachedWindow
		    InternalAttachedWindow.hide
		    InternalAttachedWindow = nil
		  end if
		  
		  dim side as integer = MAAttachedWindowMBS.MAPositionAutomatic
		  dim WindowPoint as NSPointMBS
		  WindowPoint = new NSPointMBS(theControl.TrueBoundary.left + theControl.Width/2, hasParentWindow.Height - (theControl.TrueBoundary.Top + theControl.Height))
		  
		  
		  'create text field and style it
		  const Border = 10
		  dim theTextField as new NSTextFieldMBS(Border, Border, WindowWidth, StringHeight + Border)
		  theTextField.StringValue = theText
		  theTextField.Editable = false
		  theTextField.textColor = NSColorMBS.whiteColor
		  theTextField.backgroundColor = NSColorMBS.blackColor
		  theTextField.Bordered = true
		  
		  'add text field to window
		  dim TextFieldView as new NSViewMBS(0, 0, WindowWidth + 20, StringHeight + 30)
		  TextFieldView.addSubview theTextField
		  
		  'style window
		  InternalAttachedWindow = MAAttachedWindowMBS.attachedWindow(TextFieldView, WindowPoint, theNSWindow, side, Border)
		  InternalAttachedWindow.borderColor = NSColorMBS.whiteColor
		  InternalAttachedWindow.backgroundColor = NSColorMBS.blackColor
		  InternalAttachedWindow.viewMargin = 4
		  InternalAttachedWindow.borderWidth = 3
		  InternalAttachedWindow.cornerRadius = 8
		  InternalAttachedWindow.drawsRoundCornerBesideArrow = true
		  InternalAttachedWindow.arrowBaseWidth = 20
		  InternalAttachedWindow.arrowHeight = 15
		  InternalAttachedWindow.hasArrow = true
		  InternalAttachedWindow.alphaValue = 0.9
		  
		  'create and show attached window
		  theNSWindow.addChildWindow InternalAttachedWindow, NSWindowMBS.NSWindowAbove
		  InternalAttachedWindow.show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Hide()
		  
		  dim theNSWindow as NSWindowMBS = theParentWindow.NSWindowMBS
		  
		  if InternalAttachedWindow <> Nil then
		    theNSWindow.removeChildWindow InternalAttachedWindow
		    
		    dim theAnimator as NSWindowMBS = InternalAttachedWindow.animator
		    if theAnimator = nil then
		      InternalAttachedWindow.hide // hide normal
		    else
		      theAnimator.alphaValue = 0.0 // hide with CoreAnimation
		    end if
		    
		    InternalAttachedWindow = nil
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private InternalAttachedWindow As MAAttachedWindowMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theParentWindow As Window
	#tag EndProperty


	#tag Constant, Name = WindowWidth, Type = Double, Dynamic = False, Default = \"300", Scope = Private
	#tag EndConstant


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
			InitialValue="-2147483648"
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
	#tag EndViewBehavior
End Class
#tag EndClass
