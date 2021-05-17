#tag Class
Protected Class MyEdsCameraStateEventHandlerMBS
Inherits EdsCameraStateEventHandlerMBS
	#tag Event
		Function StateChanged(StateEvent as UInt32, EventData as UInt32) As integer
		  if StateEvent = EDSModuleMBS.kEdsStateEvent_Shutdown then
		    PicWindow.close
		    MainWindow.clear
		    
		    MsgBox "Camera disconnected."
		    
		  end if
		  
		  
		End Function
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
