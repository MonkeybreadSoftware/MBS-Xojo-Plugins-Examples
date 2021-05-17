#tag Class
Protected Class MyAppleRemote
Inherits AppleRemoteMBS
	#tag Event
		Sub ButtonPressed(ButtonID as integer, PressedDown as boolean, clickCount as Integer)
		  dim s as string
		  dim t as string
		  
		  Select case ButtonID
		  case kRemoteButtonVolumePlus
		    t="Volume plus"
		  case kRemoteButtonVolumeMinus
		    t="Volume minus"
		  case kRemoteButtonMenu
		    t="Menu"
		  case kRemoteButtonPlay
		    t="PLay"
		  case kRemoteButtonRight
		    t="Right"
		  case kRemoteButtonLeft
		    t="Left"
		  case kRemoteButtonRightHold
		    t="Right Hold"
		  case kRemoteButtonLeftHold
		    t="Left Hold"
		  case kRemoteButtonMenuHold
		    t="Menu Hold"
		  case kRemoteButtonPlaySleep
		    t="Play Sleep"
		  case kRemoteControlSwitched
		    t="control switched"
		  else
		    t="?"
		  end Select
		  
		  if ButtonID<>kRemoteControlSwitched then
		    s=str(ButtonID)+" ("+t+")"
		    
		    if PressedDown then
		      s=s+" down "
		    else
		      s=S+" up "
		    end if
		    
		    Window1.ListBox1.AddRow s
		    window1.ListBox1.ListIndex=window1.ListBox1.LastIndex
		  end if
		  
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
