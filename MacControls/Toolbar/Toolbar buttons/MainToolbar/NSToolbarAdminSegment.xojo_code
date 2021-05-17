#tag Class
Protected Class NSToolbarAdminSegment
Inherits NSSegmentedControlMBS
	#tag Event
		Sub Action()
		  Select case selectedSegment
		  case 0
		    Window1.Label1.Text="Admin button=0"
		  case 1
		    Window1.Label1.Text="Admin button=1"
		  case 2
		    Window1.Label1.Text="Admin button=2"
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor( 0,0,104,MainToolbarNSSegmentHeight )
		  
		  // size is calculated like this: 3px + segmentWidth + 1px + segmentWidth + 3px
		  segmentCount=3
		  segmentStyle=NSSegmentedControlMBS.NSSegmentStyleRoundRect
		  trackingMode=NSSegmentedControlMBS.NSSegmentSwitchTrackingMomentary
		  
		  // Segments
		  dim p As NSImageMBS
		  
		  p=New NSImageMBS( PreferencesButtonTemplate )
		  p.setSize( 18,18 )
		  p.isTemplate=true
		  imageForSegment(0)=p
		  tagForSegment(0)=0
		  widthForSegment(0)=32
		  
		  p=New NSImageMBS( UserButtonTemplate )
		  p.setSize( 20,18 )
		  p.isTemplate=true
		  imageForSegment(1)=p
		  tagForSegment(1)=1
		  widthForSegment(1)=32
		  
		  p=New NSImageMBS( SystemNewFolderTemplate )
		  p.setSize( 20,18 )
		  p.isTemplate=true
		  imageForSegment(2)=p
		  tagForSegment(2)=2
		  widthForSegment(2)=32
		  
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
