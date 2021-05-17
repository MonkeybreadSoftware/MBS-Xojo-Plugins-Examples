#tag Class
Protected Class NSToolbarOptionPopup
Inherits NSPopupButtonMBS
	#tag Event
		Sub Action()
		  dim n As Integer=indexOfSelectedItem
		  Window1.Label1.Text="Menu selected="+Str(n)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor( 0,0,40,MainToolbarNSButtonHeight )
		  
		  bezelStyle=NSButtonMBS.NSTexturedRoundedBezelStyle
		  pullsDown=true
		  addItemsWithTitles( Array( " ","menu1","menu2","menu3","menu4" ) ) // first item has no text " "
		  dim m As NSMenuItemMBS=itemAtIndex(0) // we add an image to the first item
		  m.Image=New NSImageMBS( ActionGearTemplate )
		  m.Image.setSize( 14,14 )
		  m.Image.IsTemplate=true
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
