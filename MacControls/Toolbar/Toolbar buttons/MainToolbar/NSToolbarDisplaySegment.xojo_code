#tag Class
Protected Class NSToolbarDisplaySegment
Inherits NSSegmentedControlMBS
	#tag Event
		Sub Action()
		  Select case selectedSegment
		  case 0
		    Window1.Label1.Text="Display button=0"
		  case 1
		    Window1.Label1.Text="Display button=1"
		  case 2
		    Window1.Label1.Text="Display button=2"
		  case 3
		    Window1.Label1.Text="Display button=3"
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor( 0,0,137,MainToolbarNSSegmentHeight )
		  
		  // size is calculated like this: 3px + segmentWidth + 1px + segmentWidth + 3px
		  segmentCount=4
		  segmentStyle=NSSegmentedControlMBS.NSSegmentStyleRoundRect
		  trackingMode=NSSegmentedControlMBS.NSSegmentSwitchTrackingSelectOne
		  selectedSegment=0
		  
		  // Segments
		  dim p As NSImageMBS
		  
		  p=New NSImageMBS( PresentationTwoListesTemplate )
		  p.setSize( 20,18 )
		  p.isTemplate=true
		  imageForSegment(0)=p
		  tagForSegment(0)=0
		  widthForSegment(0)=32
		  
		  p=New NSImageMBS( PresentationListAndPreviewTemplate )
		  p.setSize( 20,18 )
		  p.isTemplate=true
		  imageForSegment(1)=p
		  tagForSegment(1)=1
		  widthForSegment(1)=32
		  
		  p=New NSImageMBS( PresentationGridViewTemplate )
		  p.setSize( 20,18 )
		  p.isTemplate=true
		  imageForSegment(2)=p
		  tagForSegment(2)=2
		  widthForSegment(2)=32
		  
		  p=New NSImageMBS( PresentationSettingsTemplate )
		  p.setSize( 20,18 )
		  p.isTemplate=true
		  imageForSegment(3)=p
		  tagForSegment(3)=3
		  widthForSegment(3)=32
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
