#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  timer = Nil
		  
		  if dis<>nil then
		    dis.FadeGammaTo(1000, RGB(0, 0, 0), 200)
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if not ResolutionLibraryPresentMBS then
		    msgBox "The library RezLib was not found. Please place this library into the Realbasic or after compiling into your application folder."
		  end if
		  
		  dis = GetDisplayMBS(0)
		  hue = 0
		  
		  if dis<>Nil then
		    timer = New OurTimer
		    timer.Period = 2
		    timer.Mode = 2
		    
		    dis.FadeGammaTo(500, HSV(App.hue, 1, 1), 200)
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		dis As DisplayMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		hue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		timer As Timer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="hue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
