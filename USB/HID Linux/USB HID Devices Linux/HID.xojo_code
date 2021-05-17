#tag Class
Protected Class HID
Inherits LinuxHIDInterfaceMBS
	#tag Event
		Function MatchDevice(usbdev as LinuxUSBDeviceHandleMBS) As boolean
		  dim l as Listbox = window1.Listbox1
		  dim d as LinuxUSBDeviceDescriptionMBS = usbdev.Device.Descriptor
		  
		  l.AddRow d.ProductName
		  l.cell(l.LastIndex,1)=d.Manufacturer
		  l.cell(l.LastIndex,2)=d.SerialNumber
		  l.cell(l.LastIndex,3)=str(d.Product)
		  l.cell(l.LastIndex,4)=str(d.Vendor)
		  
		  dim s as string
		  dim n as integer = d.DeviceClass
		  Select case n
		  case d.kDeviceClassAudio
		    s = " Audio"
		  case d.kDeviceClassCOMM
		    s = " COMM"
		  case d.kDeviceClassDATA
		    s = " DATA"
		  case d.kDeviceClassHID
		    s = " HID"
		  case d.kDeviceClassHUB
		    s = " HUB"
		  case d.kDeviceClassMassStorage
		    s = " MassStorage"
		  case d.kDeviceClassPrinter
		    s = " Printer"
		  else
		    s = " ?"
		  end Select
		  
		  l.cell(l.LastIndex,5)=str(n)+s
		  l.cell(l.LastIndex,6)=str(d.DeviceSubClass)
		  l.cell(l.LastIndex,7)=str(d.DeviceProtocol)
		  l.cell(l.LastIndex,8)=str(d.MaxPacketSize0)
		  
		  Exception
		    
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
