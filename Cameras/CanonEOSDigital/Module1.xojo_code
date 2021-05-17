#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Sub CheckError(o as EdsBaseMBS)
		  dim n as integer = o.Lasterror
		  
		  if n = 0 then Return // ok
		  
		  dim message as string = getErrorMessage(n)
		  
		  dim m as string = "Error "+str(n)+": "+Message
		  
		  System.DebugLog m
		  MsgBox m
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetErrorMessage(n as integer) As string
		  dim message as string = "?"
		  
		  Select case n
		  case EDSModuleMBS.EDS_ERR_UNIMPLEMENTED
		    message = "Not implemented"
		  case EDSModuleMBS.EDS_ERR_INTERNAL_ERROR
		    message = "Internal error"
		  case EDSModuleMBS.EDS_ERR_MEM_ALLOC_FAILED
		    message = "Memory allocation error"
		  case EDSModuleMBS.EDS_ERR_MEM_FREE_FAILED
		    message = "Memory release error"
		  case EDSModuleMBS.EDS_ERR_OPERATION_CANCELLED
		    message = "Operation canceled"
		  case EDSModuleMBS.EDS_ERR_INCOMPATIBLE_VERSION
		    message = "Version error"
		  case EDSModuleMBS.EDS_ERR_NOT_SUPPORTED
		    message = "Not supported"
		  case EDSModuleMBS.EDS_ERR_UNEXPECTED_EXCEPTION
		    message = "Unexpected exception"
		  case EDSModuleMBS.EDS_ERR_PROTECTION_VIOLATION
		    message = "Protection violation"
		  case EDSModuleMBS.EDS_ERR_MISSING_SUBCOMPONENT
		    message = "Missing subcomponent"
		  case EDSModuleMBS.EDS_ERR_SELECTION_UNAVAILABLE
		    message = "Selection unavailable"
		  case EDSModuleMBS.EDS_ERR_FILE_IO_ERROR
		    message = "IO error"
		  case EDSModuleMBS.EDS_ERR_FILE_TOO_MANY_OPEN
		    message = "Too many files open"
		  case EDSModuleMBS.EDS_ERR_FILE_NOT_FOUND
		    message = "File does not exist"
		  case EDSModuleMBS.EDS_ERR_FILE_OPEN_ERROR
		    message = "Open error"
		  case EDSModuleMBS.EDS_ERR_FILE_CLOSE_ERROR
		    message = "Close error"
		  case EDSModuleMBS.EDS_ERR_FILE_SEEK_ERROR
		    message = "Seek error"
		  case EDSModuleMBS.EDS_ERR_FILE_TELL_ERROR
		    message = "Tell error"
		  case EDSModuleMBS.EDS_ERR_FILE_READ_ERROR
		    message = "Read error"
		  case EDSModuleMBS.EDS_ERR_FILE_WRITE_ERROR
		    message = "Write error"
		  case EDSModuleMBS.EDS_ERR_FILE_PERMISSION_ERROR
		    message = "Permission error"
		  case EDSModuleMBS.EDS_ERR_FILE_DISK_FULL_ERROR
		    message = "Disk full"
		  case EDSModuleMBS.EDS_ERR_FILE_ALREADY_EXISTS
		    message = "File already exists"
		  case EDSModuleMBS.EDS_ERR_FILE_FORMAT_UNRECOGNIZED
		    message = "Format error"
		  case EDSModuleMBS.EDS_ERR_FILE_DATA_CORRUPT
		    message = "Invaliddata"
		  case EDSModuleMBS.EDS_ERR_FILE_NAMING_NA
		    message = "File naming error"
		  case EDSModuleMBS.EDS_ERR_DIR_NOT_FOUND
		    message = "Directory does not exist"
		  case EDSModuleMBS.EDS_ERR_DIR_IO_ERROR
		    message = "I/O error"
		  case EDSModuleMBS.EDS_ERR_DIR_ENTRY_NOT_FOUND
		    message = "No file in directory"
		  case EDSModuleMBS.EDS_ERR_DIR_ENTRY_EXISTS
		    message = "File in directory"
		  case EDSModuleMBS.EDS_ERR_DIR_NOT_EMPTY
		    message = "Directory full"
		  case EDSModuleMBS.EDS_ERR_PROPERTIES_UNAVAILABLE
		    message = "Property (and additional property information) unavailable"
		  case EDSModuleMBS.EDS_ERR_PROPERTIES_MISMATCH
		    message = "Property mismatch"
		  case EDSModuleMBS.EDS_ERR_PROPERTIES_NOT_LOADED
		    message = "Property not loaded"
		  case EDSModuleMBS.EDS_ERR_INVALID_PARAMETER
		    message = "Invalid function parameter"
		  case EDSModuleMBS.EDS_ERR_INVALID_HANDLE
		    message = "Handle error"
		  case EDSModuleMBS.EDS_ERR_INVALID_POINTER
		    message = "Pointer error"
		  case EDSModuleMBS.EDS_ERR_INVALID_INDEX
		    message = "Index error"
		  case EDSModuleMBS.EDS_ERR_INVALID_LENGTH
		    message = "Length error"
		  case EDSModuleMBS.EDS_ERR_INVALID_FN_POINTER
		    message = "FN pointer error"
		  case EDSModuleMBS.EDS_ERR_INVALID_SORT_FN
		    message = "Sort FN error"
		  case EDSModuleMBS.EDS_ERR_DEVICE_NOT_FOUND
		    message = "Device not found"
		  case EDSModuleMBS.EDS_ERR_DEVICE_BUSY
		    message = "Device busy Note: If a device busy error occurs, reissue the command after a while. The camera will become unstable."
		  case EDSModuleMBS.EDS_ERR_DEVICE_INVALID
		    message = "Device error"
		  case EDSModuleMBS.EDS_ERR_DEVICE_EMERGENCY
		    message = "Device emergency"
		  case EDSModuleMBS.EDS_ERR_DEVICE_MEMORY_FULL
		    message = "Device memory full"
		  case EDSModuleMBS.EDS_ERR_DEVICE_INTERNAL_ERROR
		    message = "Internal device error"
		  case EDSModuleMBS.EDS_ERR_DEVICE_INVALID_PARAMETER
		    message = "Device parameter invalid"
		  case EDSModuleMBS.EDS_ERR_DEVICE_NO_DISK
		    message = "No disk"
		  case EDSModuleMBS.EDS_ERR_DEVICE_DISK_ERROR
		    message = "Disk error"
		  case EDSModuleMBS.EDS_ERR_DEVICE_CF_GATE_CHANGED
		    message = "The CF gate has been changed"
		  case EDSModuleMBS.EDS_ERR_DEVICE_DIAL_CHANGED
		    message = "The dial has been changed"
		  case EDSModuleMBS.EDS_ERR_DEVICE_NOT_INSTALLED
		    message = "Device not installed"
		  case EDSModuleMBS.EDS_ERR_DEVICE_STAY_AWAKE
		    message = "Device connected in awake mode"
		  case EDSModuleMBS.EDS_ERR_DEVICE_NOT_RELEASED
		    message = "Device not released"
		  case EDSModuleMBS.EDS_ERR_STREAM_IO_ERROR
		    message = "Stream I/O error"
		  case EDSModuleMBS.EDS_ERR_STREAM_NOT_OPEN
		    message = "Stream open error"
		  case EDSModuleMBS.EDS_ERR_STREAM_ALREADY_OPEN
		    message = "Stream already open"
		  case EDSModuleMBS.EDS_ERR_STREAM_OPEN_ERROR
		    message = "Failed to open stream"
		  case EDSModuleMBS.EDS_ERR_STREAM_CLOSE_ERROR
		    message = "Failed to close stream"
		  case EDSModuleMBS.EDS_ERR_STREAM_SEEK_ERROR
		    message = "Stream seek error"
		  case EDSModuleMBS.EDS_ERR_STREAM_TELL_ERROR
		    message = "Stream tell error"
		  case EDSModuleMBS.EDS_ERR_STREAM_READ_ERROR
		    message = "Failed to read stream"
		  case EDSModuleMBS.EDS_ERR_STREAM_WRITE_ERROR
		    message = "Failed to write stream"
		  case EDSModuleMBS.EDS_ERR_STREAM_PERMISSION_ERROR
		    message = "Permission error"
		  case EDSModuleMBS.EDS_ERR_STREAM_COULDNT_BEGIN_THREAD
		    message = "Could not start reading thumbnail"
		  case EDSModuleMBS.EDS_ERR_STREAM_BAD_OPTIONS
		    message = "Invalid stream option"
		  case EDSModuleMBS.EDS_ERR_STREAM_END_OF_STREAM
		    message = "Invalid stream termination"
		  case EDSModuleMBS.EDS_ERR_COMM_PORT_IS_IN_USE
		    message = "Port in use"
		  case EDSModuleMBS.EDS_ERR_COMM_DISCONNECTED
		    message = "Port disconnected"
		  case EDSModuleMBS.EDS_ERR_COMM_DEVICE_INCOMPATIBLE
		    message = "Incompatible device"
		  case EDSModuleMBS.EDS_ERR_COMM_BUFFER_FULL
		    message = "Buffer full"
		  case EDSModuleMBS.EDS_ERR_COMM_USB_BUS_ERR
		    message = "USB bus error"
		  case EDSModuleMBS.EDS_ERR_USB_DEVICE_LOCK_ERROR
		    message = "Failed to lock the UI"
		  case EDSModuleMBS.EDS_ERR_USB_DEVICE_UNLOCK_ERROR
		    message = "Failed to unlock the UI"
		  case EDSModuleMBS.EDS_ERR_STI_UNKNOWN_ERROR
		    message = "Unknown STI"
		  case EDSModuleMBS.EDS_ERR_STI_INTERNAL_ERROR
		    message = "Internal STI error"
		  case EDSModuleMBS.EDS_ERR_STI_DEVICE_CREATE_ERROR
		    message = "Device creation error"
		  case EDSModuleMBS.EDS_ERR_STI_DEVICE_RELEASE_ERROR
		    message = "Device release error"
		  case EDSModuleMBS.EDS_ERR_DEVICE_NOT_LAUNCHED
		    message = "Device startup failed"
		  case EDSModuleMBS.EDS_ERR_ENUM_NA
		    message = "Enumeration terminated (there was no suitableenumeration item)"
		  case EDSModuleMBS.EDS_ERR_INVALID_FN_CALL
		    message = "Called in a mode when the function could not be used"
		  case EDSModuleMBS.EDS_ERR_HANDLE_NOT_FOUND
		    message = "Handle not found"
		  case EDSModuleMBS.EDS_ERR_INVALID_ID
		    message = "Invalid ID"
		  case EDSModuleMBS.EDS_ERR_WAIT_TIMEOUT_ERROR
		    message = "Timeout"
		  case EDSModuleMBS.EDS_ERR_SESSION_NOT_OPEN
		    message = "Session open error"
		  case EDSModuleMBS.EDS_ERR_INVALID_TRANSACTIONID
		    message = "Invalid transaction ID"
		  case EDSModuleMBS.EDS_ERR_INCOMPLETE_TRANSFER
		    message = "Transfer problem"
		  case EDSModuleMBS.EDS_ERR_INVALID_STRAGEID
		    message = "Storage error"
		  case EDSModuleMBS.EDS_ERR_DEVICEPROP_NOT_SUPPORTED
		    message = "Unsupported device property"
		  case EDSModuleMBS.EDS_ERR_INVALID_OBJECTFORMATCODE
		    message = "Invalid object format code"
		  case EDSModuleMBS.EDS_ERR_SELF_TEST_FAILED
		    message = "Failed self-diagnosis"
		  case EDSModuleMBS.EDS_ERR_PARTIAL_DELETION
		    message = "Failed in partial deletion"
		  case EDSModuleMBS.EDS_ERR_SPECIFICATION_BY_FORMAT_UNSUPPORTED
		    message = "Unsupported format specification"
		  case EDSModuleMBS.EDS_ERR_NO_VALID_OBJECTINFO
		    message = "Invalid object information"
		  case EDSModuleMBS.EDS_ERR_INVALID_CODE_FORMAT
		    message = "Invalid code format"
		    'case EDSModuleMBS.EDS_ERR_UNKNOWN_VENDER_CODE
		    'message = "Unknown vendor code"
		  case EDSModuleMBS.EDS_ERR_CAPTURE_ALREADY_TERMINATED
		    message = "Capture already terminated"
		  case EDSModuleMBS.EDS_ERR_INVALID_PARENTOBJECT
		    message = "Invalid parent object"
		  case EDSModuleMBS.EDS_ERR_INVALID_DEVICEPROP_FORMAT
		    message = "Invalid property format"
		  case EDSModuleMBS.EDS_ERR_INVALID_DEVICEPROP_VALUE
		    message = "Invalid property value"
		  case EDSModuleMBS.EDS_ERR_SESSION_ALREADY_OPEN
		    message = "Session already open"
		  case EDSModuleMBS.EDS_ERR_TRANSACTION_CANCELLED
		    message = "Transaction canceled"
		  case EDSModuleMBS.EDS_ERR_SPECIFICATION_OF_DESTINATION_UNSUPPORTED
		    message = "Unsupported destination specification"
		  case EDSModuleMBS.EDS_ERR_UNKNOWN_COMMAND
		    message = "Unknown command"
		  case EDSModuleMBS.EDS_ERR_OPERATION_REFUSED
		    message = "Operation refused"
		  case EDSModuleMBS.EDS_ERR_LENS_COVER_CLOSE
		    message = "Lens cover closed"
		  case EDSModuleMBS.EDS_ERR_OBJECT_NOTREADY
		    message = "Image data set not ready for live view"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_AF_NG
		    message = "Focus failed"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_RESERVED
		    message = "Reserved"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_MIRROR_UP_NG
		    message = "Currently configuring mirror up"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_SENSOR_CLEANING_NG
		    message = "Currently cleaning sensor"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_SILENCE_NG
		    message = "Currently performing silent operations"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_NO_CARD_NG
		    message = "Card not installed"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_CARD_NG
		    message = "Error writing to card"
		  case EDSModuleMBS.EDS_ERR_TAKE_PICTURE_CARD_PROTECT_NG
		    message = "Card write protected"
		    
		  end Select
		  
		  Return Message
		  
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
