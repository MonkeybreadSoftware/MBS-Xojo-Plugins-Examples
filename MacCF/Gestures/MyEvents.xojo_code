#tag Class
Protected Class MyEvents
Inherits CarbonApplicationEventsMBS
	#tag Event
		Function GestureEnded(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer) As boolean
		  window1.v.FillColor=&c000000
		  window1.redraw
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GestureMagnify(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer, MagnificationAmount as double) As boolean
		  window1.v.Scale=window1.v.Scale+MagnificationAmount
		  window1.redraw
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GestureRotate(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer, RotationAmount as double) As boolean
		  const pi=3.14159265
		  
		  window1.v.Rotation=window1.v.Rotation-RotationAmount/180.0*pi
		  window1.redraw
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GestureStarted(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer) As boolean
		  window1.v.FillColor=&cFF0000
		  window1.redraw
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function GestureSwipe(GlobalMouseX as double, GlobalMouseY as double, WindowHandle as integer, WindowMouseX as double, WindowMouseY as double, WindowPartCode as integer, KeyModifiers as integer, SwipeDirectionX as double, SwipeDirectionY as double) As boolean
		  window1.init
		  window1.redraw
		  
		  
		End Function
	#tag EndEvent


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
