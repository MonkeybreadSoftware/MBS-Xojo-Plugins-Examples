#tag Class
Protected Class ImageCaptureEvents
Inherits ImageCaptureEventsMBS
	#tag Event
		Sub deviceDidEncounterError(device as ICDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  System.DebugLog error.LocalizedDescription
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidRemove(device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		  if device.HasOpenSession then
		    device.requestCloseSession
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidBecomeAvailable(scanner as ICScannerDeviceMBS)
		  System.DebugLog CurrentMethodName
		  if not scanner.HasOpenSession then
		    scanner.requestOpenSession
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
