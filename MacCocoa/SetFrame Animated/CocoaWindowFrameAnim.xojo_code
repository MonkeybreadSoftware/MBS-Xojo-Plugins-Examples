#tag Class
Protected Class CocoaWindowFrameAnim
Inherits NSAnimationMBS
	#tag Event
		Sub CurrentProgressChanged(progress as double)
		  dim f as new NSRectMBS
		  f.Origin = NSMakePointMBS (origFrame.X + dL * progress, origFrame.Y + dT * progress)
		  f.Size = NSMakeSizeMBS (origFrame.Width + dW * progress, origFrame.Height + dH * progress)
		  win.NSWindowMBS.setFrame (f, true, true)
		  
		  if progress = 1 then
		    ' done
		  end
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Shared Sub Move(w as Window, deltaLeft as Integer, deltaTop as Integer, duration as Double = 0.25)
		  MoveResize w, deltaLeft, deltaTop, 0, 0, duration
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub MoveResize(w as Window, deltaLeft as Integer, deltaTop as Integer, deltaWidth as Integer, deltaHeight as Integer, duration as Double = 0.25)
		  dim anim as new CocoaWindowFrameAnim (duration, NSAnimationEaseInOut)
		  anim.SetWindowDeltaLeftTopWidthHeight w, deltaLeft, deltaTop, deltaWidth, deltaHeight
		  anim.animationBlockingMode = NSAnimationBlocking // -> startAnimation returns only after animation is complete
		  anim.frameRate = 30 // frames per second
		  anim.startAnimation
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Resize(w as Window, deltaWidth as Integer, deltaHeight as Integer, duration as Double = 0.25)
		  MoveResize w, 0, 0, deltaWidth, deltaHeight, duration
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetWindowDeltaLeftTopWidthHeight(w as Window, dl as Integer, dt as Integer, dw as Integer, dh as Integer)
		  self.win = w
		  self.origFrame = w.NSWindowMBS.frame
		  self.dT = -dt-dh ' because NSRect uses inverted coordinates
		  self.dL = dl
		  self.dW = dw
		  self.dH = dh
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private dH As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dL As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dT As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dW As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private origFrame As NSRectMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private win As Window
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
	#tag EndViewBehavior
End Class
#tag EndClass
