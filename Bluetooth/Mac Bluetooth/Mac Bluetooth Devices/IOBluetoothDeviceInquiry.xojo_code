#tag Class
Protected Class IOBluetoothDeviceInquiry
Inherits IOBluetoothDeviceInquiryMBS
	#tag Event
		Sub Complete(error as Integer, aborted as Boolean)
		  mainWindow.Completed
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceFound(device as IOBluetoothDeviceMBS)
		  dim f as string
		  dim p as string
		  
		  if device.isPaired then
		    p = "✔︎"
		  end if
		  
		  if device.isFavorite then
		    f = "✔︎"
		  end if
		  
		  list.AddRow device.name, device.addressString, f, p
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Started()
		  MainWindow.Started
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
