#tag Class
Protected Class MyWinPointerEventsMBS
Inherits WinPointerEventsMBS
	#tag Event
		Function Gesture(info as WinGestureInfoMBS) As boolean
		  log CurrentMethodName
		  
		  Select case info.ID
		  case info.kGestureIDBegin
		    log "Begin"
		  case info.kGestureIDEnd
		    log "End"
		  case info.kGestureIDPan
		    log "Pan"
		  case info.kGestureIDPressAndTap
		    log "PressAndTap"
		  case info.kGestureIDRotate
		    log "Rotate "+str(info.RotateAngle)
		  case info.kGestureIDTwoFingerTap
		    log "TwoFingerTap"
		  case info.kGestureIDZoom
		    log "Zoom"
		  end Select
		  
		  
		  log "Location: "+str(info.LocationX)+"/"+str(info.Locationy)
		  
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub GestureNotify()
		  log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function PointerDeviceChange(Change as Integer, Param as Integer) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerDeviceInRange(Param1 as Integer, Param2 as Integer) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerDeviceOutOfRange(Param1 as Integer, Param2 as Integer) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerDown(PointerID as Integer, Flags as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName+" ID: "+str(PointerID)+" at "+str(x)+"/"+str(y)
		End Function
	#tag EndEvent

	#tag Event
		Function PointerEnter(PointerID as Integer, Flags as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName+" ID: "+str(PointerID)+" at "+str(x)+"/"+str(y)
		  
		  Select case info.pointerType
		  case info.kTypePointer
		    log "PointerType: Pointer"
		  case info.kTypeTouch
		    log "PointerType: Touch"
		  case info.kTypePen
		    log "PointerType: Pen"
		  case info.kTypeMouse
		    log "PointerType: Mouse"
		  case info.kTypeTouchpad
		    log "PointerType: Touchpad"
		  end Select
		End Function
	#tag EndEvent

	#tag Event
		Function PointerHWheel(PointerID as Integer, Delta as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerLeave(PointerID as Integer, Flags as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerUp(PointerID as Integer, Flags as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName+" ID: "+str(PointerID)+" at "+str(x)+"/"+str(y)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerUpdate(PointerID as Integer, Flags as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName+" ID: "+str(PointerID)+" at "+str(x)+"/"+str(y)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PointerWheel(PointerID as Integer, Delta as Integer, X as Integer, Y as Integer, info as WinPointerInfoMBS) As boolean
		  log CurrentMethodName
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  list.ScrollPosition = list.ListCount
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As Listbox
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
	#tag EndViewBehavior
End Class
#tag EndClass
