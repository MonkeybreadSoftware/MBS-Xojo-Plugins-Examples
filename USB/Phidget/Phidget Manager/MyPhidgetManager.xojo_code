#tag Class
Protected Class MyPhidgetManager
Inherits PhidgetManagerMBS
	#tag Event
		Sub Attach(devicehandle as integer)
		  dim p as new PhidgetMBS
		  
		  p.Handle=devicehandle
		  
		  MainWindow.list.AddRow "Device attached"
		  MainWindow.list.AddRow "   Name: "+p.GetDeviceName
		  MainWindow.list.AddRow "   Serialnumber: "+str(p.GetSerialNumber)
		  MainWindow.list.AddRow "   Device type: "+str(p.GetDeviceType)
		  MainWindow.list.AddRow "   Device label: "+p.GetDeviceLabel
		  MainWindow.list.AddRow ""
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Detach(devicehandle as integer)
		  dim p as new PhidgetMBS
		  
		  p.Handle=devicehandle
		  
		  MainWindow.list.AddRow "Device detached"
		  MainWindow.list.AddRow "   Name: "+p.GetDeviceName
		  MainWindow.list.AddRow "   Serialnumber: "+str(p.GetSerialNumber)
		  MainWindow.list.AddRow "   Device type: "+str(p.GetDeviceType)
		  MainWindow.list.AddRow "   Device label: "+p.GetDeviceLabel
		  MainWindow.list.AddRow ""
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(errorCode as integer, errorDescription as string)
		  
		  MainWindow.list.AddRow "Error "+str(errorCode)+": "+errorDescription
		  MainWindow.list.AddRow ""
		  
		  
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
