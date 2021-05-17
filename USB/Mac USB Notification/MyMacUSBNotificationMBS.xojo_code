#tag Class
Protected Class MyMacUSBNotificationMBS
Inherits MacUSBNotificationMBS
	#tag Event
		Sub DeviceAdded(properties as dictionary, NewDevice as boolean, ClassName as string, DeviceName as string, DeviceHandle as integer)
		  dim l as listbox = window1.List
		  l.AddRow "Added"
		  
		  if properties<>Nil then
		    l.Cell(l.LastIndex,1)=hex(properties.Lookup("idVendor", 0))
		    l.Cell(l.LastIndex,2)=properties.Lookup("USB Vendor Name", "")
		    l.Cell(l.LastIndex,3)=hex(properties.Lookup("idProduct", 0))
		    l.Cell(l.LastIndex,4)=properties.Lookup("USB Product Name", "")
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceRemoved(properties as dictionary, NewDevice as boolean, ClassName as string, DeviceName as string, DeviceHandle as integer)
		  dim l as listbox = window1.List
		  l.AddRow "Removed"
		  
		  if properties<>Nil then
		    l.Cell(l.LastIndex,1)=hex(properties.Lookup("idVendor", 0))
		    l.Cell(l.LastIndex,2)=properties.Lookup("USB Vendor Name", "")
		    l.Cell(l.LastIndex,3)=hex(properties.Lookup("idProduct", 0))
		    l.Cell(l.LastIndex,4)=properties.Lookup("USB Product Name", "")
		  end if
		  
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
