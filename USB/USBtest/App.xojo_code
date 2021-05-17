#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // This is for the Custom Computer Services Inc. 
		  // PIC24 development board. http://www.ccsinfo.com/product_info.php?products_id=usb-pic24-kit
		  
		  
		  
		  // At present this is for Mac only, will need to add target testing and Windows code
		  
		  App.mycount = 0
		  if not InitInstance then
		    quit
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function FindDevice() As MyHID
		  dim h as MyHID
		  dim p as string
		  
		  h=new MyHID
		  
		  if h.FindFirstDevice then
		    
		    // compare here Product name, ProductID and VendorID
		    p=h.Product
		    if left(p,3)="CCS" then
		      Return h
		    end if
		    
		    while h.FindNextDevice
		      
		      p=h.Product
		      if left(p,3)="CCS" then
		        Window1.statusField.BackColor = &C00FF00
		        Window1.statusField.Text = "CCS demo Connected"
		        Return h
		      end if
		      
		    wend
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InitInstance() As boolean
		  if OpenUSBDevice = False Then
		    Return False
		  Else
		    Return True
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenUSBDevice() As boolean
		  
		  h=FindDevice
		  
		  if h=nil then
		    MsgBox "No CCS device found."
		    quit
		    Return false
		  end if
		  
		  h.Connect
		  
		  if h.Lasterror<>0 then
		    MsgBox "Failed to connect to CCS Device."
		    quit
		    Return false
		  end if
		  
		  h.InstallCallback
		  
		  Return true
		End Function
	#tag EndMethod


	#tag Note, Name = Description
		This is a test program that enumerates a USB HID device on a Custom Computer Services Inc PIC24 USB development board. 
		After enumeration a 'Request message' button on Window1 can be used to send a specific character via USB to the 
		development board. On receipt of the 'Request message' character the PIC development board sends five 16 byte packets
		containing the test string. These packets are received and displayed in an edit field in Window1.
		
		Further development hopes to provide a text field to contain user test strings which can be sent to the PIC development 
		board to be displayed on the LCD display.
		
		A version to compile for Windows is also planned.
		
		Written by:
		Vern hardingham
		Resonant Light Technology Inc.
		British Columbia,
		Canada
		vern@resonantlight.com
		
	#tag EndNote


	#tag Property, Flags = &h0
		h As myHID
	#tag EndProperty

	#tag Property, Flags = &h0
		myCount As Integer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="myCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
