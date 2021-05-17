#tag Class
Protected Class MyNSKeyValueObserverMBS
Inherits NSKeyValueObserverMBS
	#tag Event
		Function observedValueForKeyPathChanged(keyPath as string, target as variant, change as dictionary, context as variant, ChangeNSDictionaryRef as Integer) As boolean
		  // with context we know which thing we observe and what to do
		  dim contextString as string = context
		  
		  System.DebugLog CurrentMethodName+" "+keyPath+" "+contextString
		  
		  if contextString = MovieWindow.AVSPPlayerItemStatusContext then
		    
		    dim status as integer = change.value(NSKeyValueChangeNewKey)
		    
		    dim enable as Boolean = false
		    select case (status)
		    case AVPlayerItemMBS.AVPlayerItemStatusUnknown
		      
		    case AVPlayerItemMBS.AVPlayerItemStatusReadyToPlay
		      enable = true
		    case AVPlayerItemMBS.AVPlayerItemStatusFailed
		      
		      // show error
		      movieWindow.stopLoadingAnimationAndHandleError movieWindow.player.currentItem.error
		      
		    end Select
		    
		    movieWindow.PlayButton.Enabled = enable
		    movieWindow.ForwardButton.Enabled = enable
		    movieWindow.RewButton.Enabled = enable
		    
		    Return true
		    
		    
		  elseif contextString = MovieWindow.AVSPPlayerRateContext then
		    
		    dim rate as Double = change.Value(NSKeyValueChangeNewKey)
		    if rate <> 1 then
		      movieWindow.PlayButton.Caption = "Play"
		    else
		      movieWindow.PlayButton.Caption = "Pause"
		    end if
		    
		    Return true
		    
		  elseif contextString = MovieWindow.AVSPPlayerLayerReadyForDisplay then
		    
		    dim b as Boolean = change.Value(NSKeyValueChangeNewKey)
		    if b then
		      // The AVPlayerLayer is ready for display. Hide the loading spinner and show it.
		      movieWindow.stopLoadingAnimationAndHandleError nil
		      movieWindow.playerLayer.Hidden = false
		      movieWindow.playerLayer.setNeedsDisplay
		    end if
		    
		    Return true
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		movieWindow As MovieWindow
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
