#tag Class
Protected Class FadingInterfaceFx
Inherits OverlayMBS
	#tag Event
		Sub WindowShown()
		  RunFx
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub MakeScreenshot(TestMode As Boolean=False)
		  if TestMode then
		    // Set TestMode=True for testing with a color rectangle instead of the screenshot
		    dim p As New Picture( width,height,32 )
		    p.Graphics.ForeColor=&cB6000A
		    p.Graphics.FillRect 0,0,width,height
		    Pict=p
		  else
		    // Make the screenshot of the area defined
		    // by the overlay window's coordidates
		    Pict=ScreenshotRectMBS( Left,top,width,height )
		  end if
		  
		  dim m As New Picture( width,height,32 )
		  m.Graphics.ForeColor=&c000000
		  m.Graphics.FillRect 0,0,width,height
		  Mask=m
		  
		  UpdateShow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RunFx()
		  // Create and start the timer
		  ti=New FadingInterfaceFxTimer
		  ti.Mode=0
		  ti.win=Self
		  ti.StartFx(speed)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		speed As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ti As FadingInterfaceFxTimer
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
			Name="speed"
			Visible=false
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
