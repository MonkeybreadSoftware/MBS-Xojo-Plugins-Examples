#tag Class
Protected Class MyCocoamenuitem
Inherits NSMenuItemMBS
	#tag Event
		Sub Action()
		  Select case id
		  case 1
		    quit
		  case 2
		    ShowURL "http://www.monkeybreadsoftware.de"
		  case 3
		    app.update
		  case 10
		    pref.ShortName=not pref.ShortName
		    if pref.ShortName then
		      me.State=1
		    else
		      me.State=0
		    end if
		    app.update
		  end Select
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ID As integer
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
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
