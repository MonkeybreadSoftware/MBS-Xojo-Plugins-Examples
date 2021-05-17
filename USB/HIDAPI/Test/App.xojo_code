#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  // optionally load library
		  
		  '// change name of library to your name
		  'dim f as FolderItem = FindFile("libhidapi.dylib")
		  '
		  '
		  'if HIDAPIDeviceMBS.LoadLibrary(f) then
		  'print "Library loaded."
		  'else
		  'print "Failed to load library."+EndOfLine+EndOfLine+HIDAPIDeviceMBS.LoadError
		  'end if
		  
		  
		  // init
		  if HIDAPIDeviceMBS.Init <> 0 then
		    Break // failed to initialize
		    Return 1
		  end if
		  
		  
		  
		  // Enumerate and print the HID devices on the system
		  dim currentDevice as HIDAPIDeviceInfoMBS = HIDAPIDeviceMBS.Enumerate(0,0)
		  
		  while currentDevice <> nil
		    print "Device Found. Type: "+hex(currentDevice.VendorID)+" "+hex(currentDevice.ProductID)+", path: "+_
		    currentDevice.Path+", serial number: "+currentDevice.SerialNumber
		    print "Manufacturer: "+currentDevice.ManufacturerString
		    print "Product: "+currentDevice.ProductString
		    
		    currentDevice = currentDevice.NextDevice
		  wend
		  
		  
		  
		  // Open the device using the VID, PID,
		  // and optionally the Serial number.
		  dim d as HIDAPIDeviceMBS = HIDAPIDeviceMBS.Open(&h4d8, &h3f, "")
		  
		  // Read the Manufacturer String
		  dim s as string = d.ManufacturerString
		  print "Manufacturer String: "+s
		  
		  // Read the Product String
		  s = d.ProductString
		  print "Product String: "+s
		  
		  // Read the Serial Number String
		  s = d.SerialNumber
		  print "Serial Number String: "+s
		  print ""
		  
		  // Send a Feature Report to the device
		  dim buf as new MemoryBlock(17)
		  
		  buf.UInt8Value(0) = 2 // First byte is report number
		  buf.UInt8Value(1) = &ha0
		  buf.UInt8Value(2) = &h0a
		  dim r as integer 
		  r = d.SendFeatureReport(buf)
		  
		  // Read a Feature Report from the device
		  buf = d.GetFeatureReport(2, 17)
		  
		  // Print out the returned buffer.
		  print "Feature Report: "+EncodeHex(buf)
		  
		  // Set the hid_read() function to be non-blocking.
		  d.NonBlocking = true
		  
		  // Send an Output report to toggle the LED (cmd &h80)
		  buf = new MemoryBlock(65)
		  buf.UInt8Value(0) = 1 // First byte is report number
		  buf.UInt8Value(1) = &h80
		  r = d.Write(buf)
		  
		  // Send an Output report to request the state (cmd &h81)
		  buf.UInt8Value(1) = &h81
		  r = d.Write(buf)
		  
		  // Read requested state
		  buf = d.Read(65)
		  if (buf = nil) then
		    print "Unable to read."
		  else
		    // Print out the returned buffer.
		    print EncodeHex(buf)
		  end if
		  
		  
		  
		  Finally
		    
		    call HIDAPIDeviceMBS.Shutdown
		    
		    
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
