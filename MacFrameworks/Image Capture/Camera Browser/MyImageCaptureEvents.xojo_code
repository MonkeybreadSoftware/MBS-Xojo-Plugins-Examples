#tag Class
Protected Class MyImageCaptureEvents
Inherits ImageCaptureEventsMBS
	#tag Event
		Sub cameraDeviceDidAddItem(camera as ICCameraDeviceMBS, item as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidAddItems(camera as ICCameraDeviceMBS, items() as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidBecomeReadyWithCompleteContentCatalog(camera as ICCameraDeviceMBS)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.CheckCamera
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidChangeCapability(camera as ICCameraDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidCompleteDeleteFilesWithError(camera as ICCameraDeviceMBS, error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidDownloadFile(file as ICCameraFileMBS, error as NSErrorMBS, options as Dictionary, device as ICCameraDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidReadData(data as Memoryblock, file as ICCameraFileMBS, error as NSErrorMBS, device as ICCameraDeviceMBS)
		  System.DebugLog CurrentMethodName
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child(file.Name)
		  dim b as BinaryStream = BinaryStream.Create(f)
		  b.Write data
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidReceiveDownloadProgressForFile(file as ICCameraFileMBS, downloadedBytes as UInt64, maxBytes as UInt64)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidReceiveMetadataForItem(camera as ICCameraDeviceMBS, item as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.didReceiveMetadataForItem item
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidReceivePTPEvent(camera as ICCameraDeviceMBS, eventData as MemoryBlock)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidReceiveThumbnailForItem(camera as ICCameraDeviceMBS, item as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.didReceiveThumbnailForItem item
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidRemoveItem(camera as ICCameraDeviceMBS, item as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.didRemoveItems array(item)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidRemoveItems(camera as ICCameraDeviceMBS, items() as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		  
		  MainWindow.didRemoveItems items
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidRenameItems(camera as ICCameraDeviceMBS, items() as ICCameraItemMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidSendPTPCommand(command as Memoryblock, data as Memoryblock, response as MemoryBlock, error as NSErrorMBS, device as ICCameraDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub cameraDeviceDidUploadFile(fileURL as string, file as FolderItem, error as NSErrorMBS, device as ICCameraDeviceMBS)
		  System.DebugLog CurrentMethodName
		End Sub
	#tag EndEvent

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
		  
		  if BitwiseAnd(device.type, device.ICDeviceTypeMaskCamera) = device.ICDeviceTypeMaskCamera then
		    MainWindow.AddDevice ICCameraDeviceMBS(device)
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
		  
		  'MainWindow.didReceiveStatusInformation Status
		  
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
