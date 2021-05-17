#tag Class
Protected Class AppleRemoteHandler
Inherits AppleRemoteMBS
	#tag Event
		Sub ButtonPressed(ButtonID as integer, PressedDown as boolean, clickCount as Integer)
		  Dim np As Boolean
		  np = not PressedDown
		  Select case ButtonID
		  case kRemoteButtonVolumePlus ' Up Button
		    sendToListeners kRemoteButtonVolumePlus, np
		  case kRemoteButtonVolumeMinus ' Down Button
		    sendToListeners kRemoteButtonVolumeMinus, np
		  case kRemoteButtonMenu ' Menu Button
		    sendToListeners kRemoteButtonMenu, np
		  case kRemoteButtonPlay ' Play Button
		    sendToListeners kRemoteButtonPlay, np
		  case kRemoteButtonRight ' Right Button
		    sendToListeners kRemoteButtonRight, np
		  case kRemoteButtonLeft ' Left Button
		    sendToListeners kRemoteButtonLeft, np
		  case kRemoteButtonRightHold ' Right Button (Hold)
		    sendToListeners kRemoteButtonRightHold, np
		  case kRemoteButtonLeftHold ' Left Button (Hold)
		    sendToListeners kRemoteButtonLeftHold, np
		  case kRemoteButtonMenuHold ' Menu Button (Hold)
		    sendToListeners kRemoteButtonMenuHold, np
		  case kRemoteButtonPlaySleep ' Play Button (Hold Time To Sleep Computer)
		    sendToListeners kRemoteButtonPlaySleep, np
		  case kRemoteControlSwitched ' Control Switched
		    sendToListeners kRemoteControlSwitched, np
		  else
		    MsgBox "Unknown Apple Remote Button Pressed"
		  end Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub SendToListeners(buttonCode As integer, released As boolean)
		  me.SendPressToListeners buttonCode, released
		End Sub
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
