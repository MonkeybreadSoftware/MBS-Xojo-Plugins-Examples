#tag Class
Protected Class MyMediaKeysMBS
Inherits MediaKeysMBS
	#tag Event
		Sub receivedMediaKeyEvent(e as NSEventMBS, keyCode as integer, keyFlags as integer, keyState as integer, keyRepeat as integer)
		  dim l as listbox = window1.List
		  
		  dim s as string = " - "+str(ticks)
		  
		  if keyState = 1 then
		    s = s + " down"
		  else
		    s = s + " up"
		  end if
		  
		  if keyRepeat>0 then
		    s = s + " repeated"
		  end if
		  
		  dim name as string 
		  
		  Select case KeyCode
		  case me.kMediaKeySoundUp
		    name="SoundUp"
		  case me.kMediaKeySoundDown
		    name="SoundDown"
		  case me.kMediaKeyBrightnessUp
		    name="BrightnessUp"
		  case me.kMediaKeyBrightnessDown
		    name="BrightnessDown"
		  case me.kMediaKeyCapsLock
		    name="CapsLock"
		  case me.kMediaKeyHelp
		    name="Help"
		  case me.kMediaKeyPower
		    name="Power"
		  case me.kMediaKeyMute
		    name="Mute"
		  case me.kMediaKeyUpArrow
		    name="UpArrow"
		  case me.kMediaKeyDownArrow
		    name="DownArrow"
		  case me.kMediaKeyNumLock
		    name="NumLock"
		    
		  case me.kMediaKeyContrastUp
		    name="ContrastUp"
		  case me.kMediaKeyContrastDown
		    name="ContrastDown"
		  case me.kMediaKeyLaunchPanel
		    name="LaunchPanel"
		  case me.kMediaKeyEject
		    name="Eject"
		  case me.kMediaKeyVideoMirror
		    name="VideoMirror"
		    
		  case me.kMediaKeyPlay
		    name="Play"
		  case me.kMediaKeyNext
		    name="Next"
		  case me.kMediaKeyPrevious
		    name="Previous"
		  case me.kMediaKeyFast
		    name="Fast"
		  case me.kMediaKeyRewind
		    name="Rewind"
		    
		  case me.kMediaKeyIlluminationUp
		    name="IlluminationUp"
		  case me.kMediaKeyIlluminationDown
		    name="IlluminationDown"
		  case me.kMediaKeyIlluminationToggle
		    name="IlluminationToggle"
		    
		  else
		    name = "other: "+str(KeyCode)
		  end Select
		  
		  l.InsertRow 0, name+s
		  
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
