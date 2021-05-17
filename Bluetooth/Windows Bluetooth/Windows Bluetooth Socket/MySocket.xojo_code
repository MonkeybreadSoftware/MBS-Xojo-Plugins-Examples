#tag Class
Protected Class MySocket
Inherits WindowsBlueToothSocketMBS
	#tag Event
		Sub DataAvailable()
		  dim s as string = me.ReadAll
		  dim e as string = EncodeHex(s)
		  dim data as MemoryBlock = s
		  
		  MainWindow.log "Data received: "+e
		  
		  
		  
		  
		  if EVQueryInputDeviceList and mid(e, 9, 4) = "0221" then
		    
		    // e.g. 0800000002217E101D06
		    dim Port0 as integer = data.UInt8Value(5) // e.g. 21 = EV3 IR sensor
		    dim Port1 as integer = data.UInt8Value(6) // e.g. 7E = Port empty or not available
		    dim Port2 as integer = data.UInt8Value(7) // e.g. 10 = EV3 touch sensor
		    dim Port3 as integer = data.UInt8Value(8) // e.g. 1D = EV3 color sensor
		    
		    MainWindow.log "Port0: "+str(Port0)+" "+GetEVSensorType(port0)
		    MainWindow.log "Port1: "+str(Port1)+" "+GetEVSensorType(port1)
		    MainWindow.log "Port2: "+str(Port2)+" "+GetEVSensorType(port2)
		    MainWindow.log "Port3: "+str(Port3)+" "+GetEVSensorType(port3)
		    
		    EVQueryInputDeviceList = false
		  end if
		  
		  if EVListFiles and mid(e, 9, 4) = "0399" then
		    // got file listing
		    
		    s = data.StringValue(12, data.size-12)
		    
		    s = DefineEncoding(s, encodings.UTF8)
		    s = ReplaceLineEndings(s, EndOfLine)
		    dim lines() as string = split(s, EndOfLine)
		    for each line as string in lines
		      MainWindow.log "> "+line
		    next
		    
		    
		    
		    EVListFiles = false
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  log "Error: "+str(me.Lasterror)
		End Sub
	#tag EndEvent

	#tag Event
		Sub NewConnection()
		  log "New connection"
		  
		  dim NewSocket as new MySocket
		  dim RemoteAddress as string
		  dim RemotePort as integer
		  
		  dim s as WindowsBlueToothSocketMBS = me.Accept(RemoteAddress, RemotePort, NewSocket)
		  
		  if s = nil then
		    
		    log "Accept error: " + str(me.Lasterror) + " " + me.LasterrorMessage
		    
		  else
		    
		    MainWindow.Connections.Append NewSocket
		    
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendComplete()
		  log "Send complete"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetEVSensorType(n as integer) As string
		  
		  // Types defined in "typedata.rcf"
		  const TYPE_NXT_TOUCH                =   1  //!< Device is NXT touch sensor
		  const TYPE_NXT_LIGHT                =   2  //!< Device is NXT light sensor
		  const TYPE_NXT_SOUND                =   3  //!< Device is NXT sound sensor
		  const TYPE_NXT_COLOR                =   4  //!< Device is NXT color sensor
		  const TYPE_NXT_ULTRASONIC           =   5  //!< Device is NXT ultra sonic sensor
		  const TYPE_NXT_TEMPERATURE          =   6  //!< Device is NXT temperature sensor
		  const TYPE_TACHO                    =   7  //!< Device is EV3/NXT tacho motor
		  const TYPE_MINITACHO                =   8  //!< Device is EV3 mini tacho motor
		  const TYPE_NEWTACHO                 =   9  //!< Device is EV3 new tacho motor
		  
		  const TYPE_TOUCH                    =  16  //!< Device is EV3 touch sensor
		  
		  // Types defined in known EV3 digital devices
		  const TYPE_COLOR                    =  29  //!< Device is EV3 color sensor
		  const TYPE_ULTRASONIC               =  30  //!< Device is EV3 ultra sonic sensor
		  const TYPE_GYRO                     =  32  //!< Device is EV3 gyro sensor
		  const TYPE_IR                       =  33  //!< Device is EV3 IR sensor
		  
		  // Type range reserved for third party devices
		  const TYPE_THIRD_PARTY_START        =  50
		  const TYPE_THIRD_PARTY_END          =  98
		  
		  // Special types
		  const TYPE_ENERGYMETER              =  99  //!< Device is energy meter
		  const TYPE_IIC_UNKNOWN              = 100  //!< Device type is not known yet
		  const TYPE_NXT_TEST                 = 101  //!< Device is a NXT ADC test sensor
		  
		  const TYPE_NXT_IIC                  = 123  //!< Device is NXT IIC sensor
		  const TYPE_TERMINAL                 = 124  //!< Port is connected to a terminal
		  const TYPE_UNKNOWN                  = 125  //!< Port not empty but type has not been determined
		  const TYPE_NONE                     = 126  //!< Port empty or not available
		  const TYPE_ERROR                    = 127  //!< Port not empty and type is invalid
		  
		  if n >= TYPE_THIRD_PARTY_START and n <= TYPE_THIRD_PARTY_END then
		    return "Third Party Sensor"
		  end if
		  
		  Select case n
		    // Types defined in "typedata.rcf"
		  case TYPE_NXT_TOUCH
		    return "Device is NXT touch sensor"
		  case TYPE_NXT_LIGHT
		    return "Device is NXT light sensor"
		  case TYPE_NXT_SOUND
		    return "Device is NXT sound sensor"
		  case TYPE_NXT_COLOR
		    return "Device is NXT color sensor"
		  case TYPE_NXT_ULTRASONIC
		    return "Device is NXT ultra sonic sensor"
		  case TYPE_NXT_TEMPERATURE
		    return "Device is NXT temperature sensor"
		  case TYPE_TACHO
		    return "Device is EV3/NXT tacho motor"
		  case TYPE_MINITACHO
		    return "Device is EV3 mini tacho motor"
		  case TYPE_NEWTACHO
		    return "Device is EV3 new tacho motor"
		    
		  case TYPE_TOUCH
		    return "Device is EV3 touch sensor"
		    
		    // Types defined in known EV3 digital devices
		  case TYPE_COLOR
		    return "Device is EV3 color sensor"
		  case TYPE_ULTRASONIC
		    return "Device is EV3 ultra sonic sensor"
		  case TYPE_GYRO
		    return "Device is EV3 gyro sensor"
		  case TYPE_IR
		    return "Device is EV3 IR sensor"
		    
		    // Special types
		  case TYPE_ENERGYMETER
		    return "Device is energy meter"
		  case TYPE_IIC_UNKNOWN
		    return "Device type is not known yet"
		  case TYPE_NXT_TEST
		    return "Device is a NXT ADC test sensor"
		    
		  case TYPE_NXT_IIC
		    return "Device is NXT IIC sensor"
		  case TYPE_TERMINAL
		    return "Port is connected to a terminal"
		  case TYPE_UNKNOWN
		    return "Port not empty but type has not been determined"
		  case TYPE_NONE
		    return "Port empty or not available"
		  case TYPE_ERROR
		    return "Port not empty and type is invalid"
		    
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string)
		  Mainwindow.List.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EVListFiles As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EVQueryInputDeviceList As Boolean
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
		#tag ViewProperty
			Name="EVListFiles"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EVQueryInputDeviceList"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
