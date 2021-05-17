#tag Class
Protected Class NSToolbarFlagPopupSegment
Inherits NSSegmentedControlMBS
	#tag Event
		Sub Action()
		  if selectedSegment=0 then
		    Window1.Label1.Text="Flag button=0"
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor( 0,0,51,MainToolbarNSSegmentHeight )
		  
		  // size is calculated like this:
		  // 3px + segmentWidth + 1px + segmentWidth + 3px
		  segmentCount=2
		  segmentStyle=NSSegmentedControlMBS.NSSegmentStyleRoundRect
		  trackingMode=NSSegmentedControlMBS.NSSegmentSwitchTrackingMomentary
		  
		  // Segments
		  imageForSegment(0)=New NSImageMBS( Flags01 )
		  tagForSegment(0)=0
		  widthForSegment(0)=28
		  
		  dim p As New NSImageMBS( MenuGlyphTemplate )
		  p.setSize( 9,9 )
		  p.isTemplate=true
		  imageForSegment(1)=p
		  tagForSegment(1)=1
		  widthForSegment(1)=16
		  
		  // Menu for segment 1
		  dim m As NSFlagMenuItem
		  FlagMenu=New NSMenuMBS("Flag Menu")
		  
		  m=New NSFlagMenuItem
		  m.CreateMenuItem("Red")
		  m.Image=New NSImageMBS( Flags01 )
		  m.Enabled=true
		  m.tag=1
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  FlagMenu.addItem m
		  
		  m=New NSFlagMenuItem
		  m.CreateMenuItem("Orange")
		  m.Image=New NSImageMBS( Flags02 )
		  m.Enabled=true
		  m.tag=2
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  FlagMenu.addItem m
		  
		  m=New NSFlagMenuItem
		  m.CreateMenuItem("Yellow")
		  m.Image=New NSImageMBS( Flags03 )
		  m.Enabled=true
		  m.tag=3
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  FlagMenu.addItem m
		  
		  m=New NSFlagMenuItem
		  m.CreateMenuItem("Green")
		  m.Image=New NSImageMBS( Flags04 )
		  m.Enabled=true
		  m.tag=4
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  FlagMenu.addItem m
		  
		  m=New NSFlagMenuItem
		  m.CreateMenuItem("Blue")
		  m.Image=New NSImageMBS( Flags05 )
		  m.Enabled=true
		  m.tag=5
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  FlagMenu.addItem m
		  
		  // Add the menu to segment 1
		  menuForSegment(1)=FlagMenu
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DelegateForMenuAction(SelectedTag As Integer)
		  for i As Integer=0 to UBound( items )
		    if items(i).tag=SelectedTag then
		      imageForSegment(0)=items(i).Image
		      Window1.Label1.Text="Flag menu="+items(i).Title
		      Exit
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FlagMenu As NSMenuMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected items() As NSFlagMenuItem
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
