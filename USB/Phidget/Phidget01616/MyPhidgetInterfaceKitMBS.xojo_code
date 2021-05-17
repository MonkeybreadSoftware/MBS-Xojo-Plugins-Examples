#tag Class
Protected Class MyPhidgetInterfaceKitMBS
Inherits PhidgetInterfaceKitMBS
	#tag Event
		Sub Attach()
		  
		  Window1.Listbox1.AddRow "Attached"
		  
		  Dim numInputs as integer = app.p.getInputCount
		  Dim numOutputs as integer = app.p.getOutputCount
		  
		  // DEBUG: To simulate Phidget interface kit 0-0-4 or 8-8-8 uncomment the appropriate lines below
		  'numInputs = 8            'or 4
		  'numOutputs = 8          'or 0
		  
		  Window1.StaticText7.Text =app.p.GetDeviceName
		  Window1.StaticText8.Text =app.p.GetDeviceLabel
		  Window1.StaticText9.Text =app.p.GetDeviceType
		  Window1.StaticText10.Text =str(app.p.GetDeviceStatus)
		  Window1.StaticText11.Text =str(app.p.GetDeviceVersion)
		  Window1.StaticText12.Text =str(app.p.GetSerialNumber)
		  Window1.StaticText14.Text =str(numInputs)
		  Window1.StaticText16.Text =str(numOutputs)
		  
		  //Show or hide checkboxes as needed
		  dim i as integer
		  for i =0 to 15
		    Window1.Checkbox1(i).Visible = (i < numInputs)
		    Window1.Checkbox17(i).Visible = (i < numOutputs)
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Detach()
		  
		  Window1.Listbox1.AddRow "Detached"
		  
		  //need to be sure all DI and DO boxes are reset and invisible on dettach...
		  dim i as integer
		  for i = 0 to 15
		    Window1.Checkbox1(i).Value = False
		    Window1.Checkbox1(i).Visible = False
		    Window1.Checkbox17(i).Value = False
		    Window1.Checkbox17(i).Visible = False
		  next i
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(errorCode as integer, errorDescription as string)
		  
		  Window1.Listbox1.AddRow "Error " + str(errorCode)+": "+errorDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub InputChanged(index as integer, value as integer)
		  //Set Input Checkboxes as needed
		  Window1.CheckBox1(index).value = (value = 1)
		  Window1.CheckBox1(index).Bold = (value = 1)
		  
		  //Log any changes in digital inputs
		  //NOTE: Entry displays the 1-based input number, not the 0-based index number 
		  Window1.ListBox1.Addrow "Input changed at DI#: "+str(index+1)+" New value: " +str(value)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OutputChanged(index as integer, value as integer)
		  //Log any changes in digital outputs
		  //NOTE: Entry displays the 1-based output number, not the 0-based index number 
		  Window1.ListBox1.Addrow "Output changed at DO#: "+str(index+1)+" New value: " +str(value)
		  
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
