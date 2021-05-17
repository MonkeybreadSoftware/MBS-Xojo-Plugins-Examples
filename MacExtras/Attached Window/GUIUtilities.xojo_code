#tag Module
Protected Module GUIUtilities
	#tag Method, Flags = &h0
		Function TrueBoundary(extends theContainerControl As ContainerControl) As BoundaryRect
		  
		  'gets the boundary of a container control in relation to the screen and not the parent
		  
		  dim theBoundary as new BoundaryRect
		  theBoundary.height = theContainerControl.height
		  theBoundary.width = theContainerControl.width
		  theBoundary.top = theContainerControl.top
		  theBoundary.left = theContainerControl.left
		  
		  'loop up the containing chain
		  dim theWindow as ContainerControl = theContainerControl
		  while theWindow isa containercontrol
		    theBoundary.top = theBoundary.top + theWindow.top
		    theBoundary.left = theBoundary.left + theWindow.left
		    theWindow = containercontrol(theWindow.window)
		  wend
		  
		  'add values for the window
		  'theBoundary.top = theBoundary.top + theWindow.top
		  'theBoundary.left = theBoundary.left + theWindow.left
		  
		  return theBoundary
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueBoundary(Extends theRectControl As RectControl) As BoundaryRect
		  
		  'gets the boundary of a rect control in relation to the screen and not the parent
		  
		  dim theBoundary as new BoundaryRect
		  theBoundary.height = theRectControl.height
		  theBoundary.width = theRectControl.width
		  theBoundary.top = theRectControl.top
		  theBoundary.left = theRectControl.left
		  
		  'loop up the containing chain
		  dim theWindow as window = theRectControl.window
		  while theWindow isa containercontrol
		    theBoundary.top = theBoundary.top + theWindow.top
		    theBoundary.left = theBoundary.left + theWindow.left
		    theWindow = containercontrol(theWindow).window
		  wend
		  
		  'add values for the window
		  'theBoundary.top = theBoundary.top + theWindow.top
		  'theBoundary.left = theBoundary.left + theWindow.left
		  
		  return theBoundary
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueWindow(Extends theRectControl As RectControl) As Window
		  
		  'return the uppermost window of a container control
		  return theRectControl.window.truewindow
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueWindow(Extends theWindow As Window) As Window
		  
		  'return the uppermost window of a container control
		  if theWindow isa containercontrol then
		    return containercontrol(theWindow).window.truewindow
		  else
		    return theWindow
		  end
		  
		End Function
	#tag EndMethod


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
			InitialValue="2147483648"
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
End Module
#tag EndModule
