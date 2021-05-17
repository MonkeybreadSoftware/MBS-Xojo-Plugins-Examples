#tag Module
Protected Module AppleRemoteModule
	#tag Method, Flags = &h0
		Sub addAppleRemoteListener(receivers As AppleRemoteReceiver)
		  initRemote
		  
		  listeners.Append receivers
		  
		  Exception
		    MsgBox "Exception"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub destroyRemote()
		  if AppleRemote <> nil then
		    stopListening
		    AppleRemote = nil
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRemote() As appleRemoteHandler
		  return AppleRemote
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initRemote()
		  if appleRemote <> nil then
		    if not isAppleRemoteAvaliable then
		      destroyRemote 
		    else
		      if AppleRemote.ListeningToRemote = FALSE then
		        AppleRemote.startListening
		      end if
		    end if
		  else
		    AppleRemote = new AppleRemoteHandler
		    if not isAppleRemoteAvaliable then
		      destroyRemote
		    else
		      AppleRemote.startListening
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isAppleRemoteAvaliable() As boolean
		  Dim avaliable As Boolean
		  
		  if appleRemote <> nil then
		    return AppleRemote.remoteAvailable
		  else
		    AppleRemote = new AppleRemoteHandler
		    avaliable = AppleRemote.RemoteAvailable
		    destroyRemote
		    return avaliable
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendPressToListeners(Extends arH As AppleRemoteHandler, button As integer, released As Boolean)
		  Dim arL As AppleRemoteReceiver
		  for each arL in listeners
		    arL.RemoteButtonPressed button, released
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopListening()
		  if AppleRemote.ListeningToRemote = TRUE then
		    AppleRemote.stopListening
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected appleRemote As AppleRemoteHandler
	#tag EndProperty

	#tag Property, Flags = &h0
		keyMode As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected listeners() As AppleRemoteReceiver
	#tag EndProperty


	#tag Constant, Name = kKeyModeCursor, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kKeyModeKeyboard, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="keyMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
