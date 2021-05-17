#tag Class
Protected Class MyDRBurnProgressPanelMBS
Inherits DRBurnProgressPanelMBS
	#tag Event
		Function burnProgressPanelBurnDidFinish(burn as DRBurnMBS) As boolean
		  System.DebugLog "burnProgressPanelBurnDidFinish in Xojo"
		  
		  logwindow.list.addrow "burnProgressPanelBurnDidFinish Event"
		  app.YieldToNextThread
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub burnProgressPanelDidFinish()
		  System.DebugLog "burnProgressPanelDidFinish in Xojo"
		  
		  logwindow.list.addrow "burnProgressPanelDidFinish Event"
		  app.YieldToNextThread
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub burnProgressPanelWillBegin()
		  System.DebugLog "burnProgressPanelBurnWillBegin in Xojo"
		  
		  logwindow.list.addrow "burnProgressPanelBurnWillBegin Event"
		  app.YieldToNextThread
		  
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
