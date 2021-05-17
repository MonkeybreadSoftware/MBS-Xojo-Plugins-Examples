#tag Class
Protected Class MyWinNotification
Inherits WinNotificationMBS
	#tag Event
		Sub GotNotification(Message as Integer, Name as string, Value1 as Integer, Value2 as Integer, byref Result as Integer, byref Handled as boolean)
		  const WM_TIMECHANGE = &h001E
		  const WM_ACTIVATEAPP = &h1C
		  const WM_DISPLAYCHANGE = &h7E
		  const WM_DEVICECHANGE = &h0219
		  
		  Select case Message
		  case WM_TIMECHANGE
		    Mainwindow.list.InsertRow 0, "System time changed."
		    
		  case WM_ACTIVATEAPP
		    Mainwindow.list.InsertRow 0, "App switched."
		    
		  case WM_DISPLAYCHANGE
		    Mainwindow.list.InsertRow 0, "Display Switched."
		    
		    // http://msdn.microsoft.com/de-de/library/windows/desktop/dd145210(v=vs.85).aspx
		    // value1 = wParam, value2 = LParam
		    Mainwindow.list.InsertRow 1, "New bit depth: "+str(value1)
		    Mainwindow.list.InsertRow 2, "New width: "+str(LoWordMBS(value2))
		    Mainwindow.list.InsertRow 3, "New height: "+str(HiWordMBS(value2))
		    
		    
		  case WM_DEVICECHANGE
		    Mainwindow.list.InsertRow 0, "Drive Changed."
		    // http://msdn.microsoft.com/en-us/library/windows/desktop/aa363480(v=vs.85).aspx
		    
		    const DBT_DEVICEARRIVAL              = &h8000  // system detected a new device
		    const DBT_DEVICEQUERYREMOVE          = &h8001  // wants to remove, may fail
		    const DBT_DEVICEQUERYREMOVEFAILED    = &h8002  // removal aborted
		    const DBT_DEVICEREMOVEPENDING        = &h8003  // about to remove, still avail.
		    const DBT_DEVICEREMOVECOMPLETE       = &h8004  // device is gone
		    const DBT_DEVICETYPESPECIFIC         = &h8005  // type specific event
		    
		    Select case Value1
		    case DBT_DEVICEARRIVAL
		      Mainwindow.list.InsertRow 1, "system detected a new device"
		    case DBT_DEVICEQUERYREMOVE
		      Mainwindow.list.InsertRow 1, "wants to remove, may fail"
		    case DBT_DEVICEQUERYREMOVEFAILED
		      Mainwindow.list.InsertRow 1, "removal aborted"
		    case DBT_DEVICEREMOVEPENDING
		      Mainwindow.list.InsertRow 1, "about to remove, still avail."
		    case DBT_DEVICEREMOVECOMPLETE
		      Mainwindow.list.InsertRow 1, "device is gone"
		    case DBT_DEVICETYPESPECIFIC
		      Mainwindow.list.InsertRow 1, "type specific event"
		    end Select
		    
		  else
		    Mainwindow.list.InsertRow 0, name+": "+str(value1)+", "+str(value2)
		    
		  end Select
		  
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
