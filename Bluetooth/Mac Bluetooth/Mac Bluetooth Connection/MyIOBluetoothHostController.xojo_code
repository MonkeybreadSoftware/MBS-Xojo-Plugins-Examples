#tag Class
Protected Class MyIOBluetoothHostController
Inherits IOBluetoothHostControllerMBS
	#tag Event
		Sub PoweredOff()
		  MainWindow.List.AddRow "Power off"
		End Sub
	#tag EndEvent

	#tag Event
		Sub PoweredOn()
		  MainWindow.List.AddRow "Power on"
		End Sub
	#tag EndEvent

	#tag Event
		Sub readLinkQualityForDeviceCompleted(device as IOBluetoothDeviceMBS, HCILinkQuality as Integer, error as Integer)
		  MainWindow.List.AddRow device.name+": "+str(HCILinkQuality)
		End Sub
	#tag EndEvent

	#tag Event
		Sub readRSSIForDeviceCompleted(device as IOBluetoothDeviceMBS, HCIRSSIValue as Integer, error as Integer)
		  MainWindow.List.AddRow device.name+": "+str(HCIRSSIValue)
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
