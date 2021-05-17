#tag Class
Protected Class MyDRBurnSetupPanelMBS
Inherits DRBurnSetupPanelMBS
	#tag Event
		Function DeviceContainsSuitableMedia(device as DRDeviceMBS, byref prompt as string) As boolean
		  System.DebugLog "DeviceContainsSuitableMedia in Xojo"
		  
		  logwindow.list.addrow "DeviceContainsSuitableMedia: "+device.displayName
		  
		  app.YieldToNextThread
		  
		  // allow device
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Function DeviceCouldBeTarget(device as DRDeviceMBS) As boolean
		  System.DebugLog "DeviceCouldBeTarget in Xojo"
		  
		  logwindow.list.addrow "DeviceCouldBeTarget: "+device.displayName
		  
		  app.YieldToNextThread
		  
		  // allow device
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DeviceSelectionChanged(device as DRDeviceMBS)
		  System.DebugLog "DeviceSelectionChanged in Xojo"
		  
		  if device=nil then
		    logwindow.list.addrow "DeviceSelectionChanged: nil"
		  else
		    logwindow.list.addrow "DeviceSelectionChanged: "+device.displayName
		  end if
		  
		  app.YieldToNextThread
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function SetupPanelShouldHandleMediaReservations() As boolean
		  System.DebugLog "SetupPanelShouldHandleMediaReservation in Xojo"
		  
		  logwindow.list.addrow "SetupPanelShouldHandleMediaReservation"
		  
		  app.YieldToNextThread
		  
		  // let the panel do it's job
		  Return true
		  
		  
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
