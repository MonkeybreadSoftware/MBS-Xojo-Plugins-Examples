#tag Class
Protected Class NSToolbarEditorSegment
Inherits NSSegmentedControlMBS
	#tag Event
		Sub Action()
		  Select case selectedSegment
		  case 0
		    Window1.Label1.Text="Editor button=0"
		  case 1
		    Window1.Label1.Text="Editor button=1"
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor( 0,0,71,MainToolbarNSSegmentHeight )
		  
		  // size is calculated like this: 3px + segmentWidth + 1px + segmentWidth + 3px
		  segmentCount=2
		  segmentStyle=NSSegmentedControlMBS.NSSegmentStyleRoundRect
		  trackingMode=NSSegmentedControlMBS.NSSegmentSwitchTrackingMomentary
		  
		  // Segments
		  dim p As NSImageMBS
		  
		  p=New NSImageMBS( AddButtonTemplate )
		  p.setSize( 14,14 )
		  p.IsTemplate=true
		  imageForSegment(0)=p
		  tagForSegment(0)=0
		  widthForSegment(0)=32
		  
		  p=New NSImageMBS( EditButtonSmallTemplate )
		  p.setSize( 20,18 )
		  p.IsTemplate=true
		  imageForSegment(1)=p
		  tagForSegment(1)=1
		  widthForSegment(1)=32
		End Sub
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
