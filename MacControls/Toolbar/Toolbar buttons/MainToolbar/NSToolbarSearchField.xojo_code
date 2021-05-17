#tag Class
Protected Class NSToolbarSearchField
Inherits NSSearchFieldMBS
	#tag Event
		Sub Action()
		  Window1.Label1.Text="SearchField text="+Self.StringValue
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor( 0,0,200,MainToolbarNSSearchFieldHeight )
		  
		  // Menu
		  dim m As NSSearchFieldMenuItem
		  SearchMenu=New NSMenuMBS("Search Menu")
		  
		  m=New NSSearchFieldMenuItem
		  m.CreateMenuItem("Title begins with")
		  m.Enabled=true
		  m.tag=1
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  SearchMenu.addItem m
		  
		  m=New NSSearchFieldMenuItem
		  m.CreateMenuItem("Title contains")
		  m.Enabled=true
		  m.tag=2
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  SearchMenu.addItem m
		  
		  m=New NSSearchFieldMenuItem
		  m.CreateMenuItem("Title ends with")
		  m.Enabled=true
		  m.tag=3
		  m.ActionMethod=AddressOf DelegateForMenuAction
		  items.Append m
		  SearchMenu.addItem m
		  
		  // Add the menu to the searchfield
		  searchMenuTemplate = SearchMenu
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DelegateForMenuAction(SelectedTag As Integer)
		  for i As Integer=0 to UBound( items )
		    if items(i).tag=SelectedTag then
		      Window1.Label1.Text="SearchField menu="+items(i).Title
		      Exit
		    end if
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected items() As NSSearchFieldMenuItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SearchMenu As NSMenuMBS
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
