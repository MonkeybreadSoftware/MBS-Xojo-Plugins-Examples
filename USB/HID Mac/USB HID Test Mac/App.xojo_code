#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  app.quitting=true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if TargetMachO then
		    MsgBox "This example does not work unless you modify it for your device!"
		  else
		    MsgBox "This example requires a Mac OS X target."
		  end if
		  
		  if not InitInstance then
		    quit
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckFirmware()
		  dim s as string
		  dim m as MemoryBlock
		  dim firmwareversion as integer
		  
		  // you can send data
		  h.Send "P"
		  
		  // and read data
		  m=h.Read(16)
		  
		  if m<>nil then
		    // for this example device, the device returns firmware version after you sent P command. 
		    
		    s=m.CString(0) // this device returns a C String in a 16byte package
		    
		    'MsgBox "firmwareversion: "+s
		    
		    firmwareversion=val(s)
		    if firmwareversion<10 then
		      MsgBox "Please reset the USB device!"
		      app.quitting=true
		      quit
		      Return
		    elseif firmwareversion<15 then
		      MsgBox "Firmware Version xxx below V1.5!"
		      app.quitting=true
		      quit
		      Return
		    end if
		  else
		    MsgBox "Failed to query Firmware version"
		    app.quitting=true
		    quit
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FindDevice() As MyHID
		  dim h as MyHID
		  dim p as string
		  
		  h=new MyHID
		  
		  if h.FindFirstDevice then
		    
		    // compare here Product name, ProductID and VendorID
		    p=h.Product
		    if left(p,3)="xxx" then
		      Return h
		    end if
		    
		    while h.FindNextDevice
		      
		      p=h.Product
		      if left(p,3)="xxx" then
		        Return h
		      end if
		      
		    wend
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitInstance() As boolean
		  
		  If OpenUSBDevice =false then
		    Return false
		    
		  else
		    CheckFirmware
		    
		  end if
		  
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenUSBDevice() As boolean
		  dim i as integer
		  
		  h=FindDevice
		  
		  if h=nil then
		    MsgBox "No xxx device found."
		    quit
		    Return false
		  end if
		  
		  h.Connect
		  
		  if h.Lasterror<>0 then
		    MsgBox "Failed to connect to xxx Device."
		    quit
		    Return false
		  end if
		  
		  h.InstallCallback
		  
		  Return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected h As myhid
	#tag EndProperty

	#tag Property, Flags = &h0
		quitting As boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="quitting"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
