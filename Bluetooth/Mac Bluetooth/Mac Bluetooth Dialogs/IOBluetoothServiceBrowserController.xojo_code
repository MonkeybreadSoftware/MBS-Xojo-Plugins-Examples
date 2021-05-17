#tag Class
Protected Class IOBluetoothServiceBrowserController
Inherits IOBluetoothServiceBrowserControllerMBS
	#tag Event
		Sub SheetDone(returnCode as Integer, tag as Variant)
		  
		  select case returnCode 
		  case me.kIOBluetoothUISuccess 
		    List.AddRow "Success"
		    
		  case me.kIOBluetoothUIUserCanceledErr
		    List.AddRow "Cancelled"
		    
		  end Select
		  
		  
		  dim serviceRecords() as IOBluetoothSDPServiceRecordMBS = me.Results
		  
		  for each serviceRecord as IOBluetoothSDPServiceRecordMBS in serviceRecords
		    
		    List.AddRow serviceRecord.ServiceName
		    
		    'dim d as Dictionary = serviceRecord.Properties
		    'Break
		    
		  next
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		List As Listbox
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
