#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   124882943
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Log"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // this is ID of our Bluetooth Heart Rate Monitor: 180D
		  dim ServiceUUID as string = "{0000180D-0000-1000-8000-00805F9B34FB}"
		  
		  // look in registry for path of connected devices
		  dim paths() as String = WindowsBlueToothLEMBS.DevicePathsForClassGUID(ServiceUUID)
		  
		  if paths = nil then
		    list.Log "Failed to list."
		    Return
		  elseif UBound(paths) < 0 then
		    list.Log "Device not found"
		    return
		  end if
		  
		  dim path as string = paths(0)
		  list.log "Path: "+path
		  
		  
		  ble = new MyWindowsBlueToothLEMBS(path)
		  ble.list = list
		  
		  dim Services() as WindowsBlueToothLEServiceMBS = ble.Services
		  
		  if Services = nil then
		    list.log "Failed to query Services" + str(ble.LastError) + " " + ble.LastErrorMessage
		    return
		  end if
		  
		  list.log str(Services.Ubound+1)+" services found"
		  
		  for each service as WindowsBlueToothLEServiceMBS in Services
		    list.log "Service found with UUID "+service.ServiceUUID+" and AttributeHandle "+str(service.AttributeHandle)
		    
		    dim Characteristics() as WindowsBlueToothLECharacteristicMBS = ble.Characteristics(service)
		    if Characteristics = nil then
		      list.log "Failed to query Characteristics" + str(ble.LastError) + " " + ble.LastErrorMessage
		    else
		      for each Characteristic as WindowsBlueToothLECharacteristicMBS in Characteristics
		        list.log "  Characteristic found: "+Characteristic.CharacteristicUuid
		        list.log "    IsReadable: "+yesno(Characteristic.IsReadable)
		        list.log "    IsWritable: "+yesno(Characteristic.IsWritable)
		        list.log "    IsNotifiable: "+yesno(Characteristic.IsNotifiable)
		        
		        if Characteristic.IsNotifiable then
		          ble.RegisterChangeEvent array(Characteristic)
		        end if
		        
		        dim Descriptors() as WindowsBlueToothLEDescriptorMBS = ble.Descriptors(Characteristic)
		        if Descriptors = nil then
		          list.log "Failed to query Descriptors" + str(ble.LastError) + " " + ble.LastErrorMessage
		        else
		          for each Descriptor as WindowsBlueToothLEDescriptorMBS in Descriptors
		            list.log "    Descriptor found: "+Descriptor.DescriptorUuid
		            list.log "    Descriptor type: "+str(Descriptor.DescriptorType)
		            
		            dim dv as WindowsBlueToothLEDescriptorValueMBS = ble.GetDescriptorValue(Descriptor)
		            if dv = nil or ble.LastError <> 0 then
		              list.Log "    Descriptor witout data: "+ble.LastErrorMessage
		            else
		              list.log "     DescriptorUuid: "+dv.DescriptorUuid
		              list.log "      DescriptorType: "+str(dv.DescriptorType)
		              if dv.Data <> nil then
		                dim d as string = dv.data
		                list.log "     Data: "+EncodeHex(d)
		                'if Encodings.UTF16LE.IsValidData(d) then
		                d = DefineEncoding(d, encodings.UTF16LE)
		                list.log "      Data as UTF16: "+d
		                'end if
		                
		                dv.data = ConvertEncoding("Xojo"+chr(0), encodings.UTF16LE)
		                
		                if ble.SetDescriptorValue(Descriptor, dv) then
		                  // ok
		                else
		                  list.Log "    Descriptor write failed: "+ble.LastErrorMessage
		                end if
		              end if
		            end if
		          next
		        end if
		        
		        if Characteristic.IsWritable then
		          dim data as new MemoryBlock(4)
		          data.Int32Value(0) = &h12345678
		          
		          dim WriteID as int64 = ble.BeginReliableWrite
		          if ble.LastError <> 0 then
		            list.Log "    BeginReliableWrite failed: "+ble.LastErrorMessage
		          else
		            list.log "Write ID: "+str(WriteID)
		            call ble.SetCharacteristicValue(Characteristic, data, WriteID) 
		            list.log "Write value done: "+ble.LastErrorMessage
		            ble.EndReliableWrite WriteID
		          end if
		        end if
		        
		        if Characteristic.IsReadable then
		          dim data as MemoryBlock = ble.GetCharacteristicValue(Characteristic)
		          if data <> nil then
		            list.log "    Value: "+EncodeHex(data)
		          else
		            list.log "No data read: "+ble.LastErrorMessage
		          end if
		        end if
		        
		      next
		      
		    end if
		  next
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ble As MyWindowsBlueToothLEMBS
	#tag EndProperty


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
