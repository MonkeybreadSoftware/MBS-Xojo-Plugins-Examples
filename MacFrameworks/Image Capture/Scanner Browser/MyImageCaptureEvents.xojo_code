#tag Class
Protected Class MyImageCaptureEvents
Inherits ImageCaptureEventsMBS
	#tag Event
		Sub deviceBrowserDeviceDidChangeName(browser as ICDeviceBrowserMBS, device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceBrowserDeviceDidChangeSharingState(browser as ICDeviceBrowserMBS, device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceBrowserDidAddDevice(browser as ICDeviceBrowserMBS, device as ICDeviceMBS, moreComing as boolean)
		  System.DebugLog CurrentMethodName
		  
		  if BitwiseAnd(device.type, device.ICDeviceTypeMaskScanner) = device.ICDeviceTypeMaskScanner then
		    MainWindow.AddDevice ICScannerDeviceMBS(device)
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceBrowserDidEnumerateLocalDevices(browser as ICDeviceBrowserMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceBrowserDidRemoveDevice(browser as ICDeviceBrowserMBS, device as ICDeviceMBS, moreGoing as boolean)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceBrowserRequestsSelectDevice(browser as ICDeviceBrowserMBS, device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidBecomeReady(device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		  
		  if device isa ICScannerDeviceMBS then
		    
		    MainWindow.deviceDidBecomeReady ICScannerDeviceMBS(Device)
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidChangeName(device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidChangeSharingState(device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidCloseSessionWithError(device as ICDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidEncounterError(device as ICDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  MsgBox error.LocalizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidOpenSessionWithError(device as ICDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidReceiveButtonPress(device as ICDeviceMBS, buttonType as String)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidReceiveCustomNotification(device as ICDeviceMBS, notification as Dictionary, data as Memoryblock)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidReceiveStatusInformation(device as ICDeviceMBS, status as Dictionary)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.didReceiveStatusInformation Status
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidRemove(device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.didRemoveDevice device
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub deviceDidSendMessage(messageCode as UInt32, data as Memoryblock, error as NSErrorMBS, device as ICDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidBecomeAvailable(scanner as ICScannerDeviceMBS)
		  System.DebugLog CurrentMethodName
		  scanner.requestOpenSession
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidCompleteOverviewScanWithError(scanner as ICScannerDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  MainWindow.didCompleteOverviewScan scanner
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidCompleteScanWithError(scanner as ICScannerDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  MainWindow.didCompleteScan
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidScanToBandData(scanner as ICScannerDeviceMBS, Data as ICScannerBandDataMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidScanToURL(scanner as ICScannerDeviceMBS, URL as string, file as folderitem, data as MemoryBlock)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub scannerDeviceDidSelectFunctionalUnit(scanner as ICScannerDeviceMBS, functionalUnit as variant, Error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
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
