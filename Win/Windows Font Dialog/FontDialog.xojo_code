#tag Class
Protected Class FontDialog
Inherits WindowsFontDialogMBS
	#tag Event
		Sub Apply()
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.PropertiesToControls
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub BoundsChanged()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub BoundsChanging()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotFocus()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Hide()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Init()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub LostFocus()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Show()
		  System.DebugLog CurrentMethodName
		  
		End Sub
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
