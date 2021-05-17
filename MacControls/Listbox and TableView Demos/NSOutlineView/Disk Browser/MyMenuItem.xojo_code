#tag Class
Protected Class MyMenuItem
Inherits NSMenuItemMBS
	#tag Event
		Sub Action()
		  mAction.Invoke (me)
		End Sub
	#tag EndEvent


	#tag DelegateDeclaration, Flags = &h0
		Delegate Sub ActionProc(menuItem as MyMenuItem)
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h1000
		Sub Constructor(title as String, ttag as Variant, actionHandler as ActionProc)
		  me.myTag = ttag
		  mAction = actionHandler
		  super.Constructor (title)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mAction As ActionProc
	#tag EndProperty

	#tag Property, Flags = &h0
		myTag As Variant
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
