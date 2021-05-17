#tag Class
Protected Class MovieOverlay
Inherits OverlayMBS
	#tag Method, Flags = &h1000
		Sub Constructor()
		  
		  Super.Constructor(50, 50, 600, 400)
		  
		  dim p as new Picture(600, 400)
		  dim M as new Picture(600, 400)
		  P.Graphics.FillRect 10, 10, 100, 100
		  M.Graphics.FillRect 10, 10, 100, 100
		  
		  
		  pict = m
		  mask = m
		  
		  w = self.NSWindow
		  
		  w.isOpaque = false
		  w.isMovableByWindowBackground = true
		  
		  dim c as NSViewMBS = self.NSView
		  c.wantsLayer = true
		  c.isHidden = False
		  
		  PlayerView = c
		  outputLayer = c.layer
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  app.AVFoundation.RemoveWindow self
		  
		  if player<>nil then
		    player.pause
		    player = nil
		  end if
		  
		  if PlayerObserver<>Nil then
		    PlayerObserver.removeObserver "currentItem.status", AVSPPlayerItemStatusContext
		    PlayerObserver = nil
		  end if
		  
		  if playerLayerObserver<>nil then
		    playerLayerObserver.removeObserver "readyForDisplay", AVSPPlayerLayerReadyForDisplay
		    playerLayerObserver = nil
		  end if
		  
		  playerLayer = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenFile(f as FolderItem)
		  // Create the AVPlayer, add rate and status observers
		  
		  player = new AVPlayerMBS
		  
		  
		  Title = f.DisplayName
		  
		  dim options as integer = NSKeyValueObserverMBS.kOptionNew
		  PlayerObserver = new MyNSKeyValueObserverMBS(player.Handle)
		  PlayerObserver.MovieOverlay = self
		  PlayerObserver.addObserver("currentItem.status", options, AVSPPlayerItemStatusContext)
		  
		  // Create an asset with our URL, asychronously load its tracks, its duration, and whether it's playable or protected.
		  // When that loading is complete, configure a player to play the asset.
		  asset = AVAssetMBS.assetWithFile(f)
		  dim assetKeysToLoadAndTest() as string = array("playable", "hasProtectedContent", "tracks", "duration")
		  
		  asset.loadValuesAsynchronouslyForKeys(assetKeysToLoadAndTest, self)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setUpPlayback(keys() as string)
		  // This method is called when the AVAsset for our URL has completing the loading of the values of the specified array of keys.
		  // We set up playback of the asset here.
		  
		  // First test whether the values of each of the keys we need have been successfully loaded.
		  for each key as string in keys
		    dim error as NSErrorMBS
		    
		    if asset.statusOfValueForKey(key, error) = asset.AVKeyValueStatusFailed then
		      stopLoadingAnimationAndHandleError(Error)
		      Return
		    end if
		  next
		  
		  if asset.isPlayable = false or asset.hasProtectedContent then
		    // We can't play this asset. Show the "Unplayable Asset" label.
		    stopLoadingAnimationAndHandleError nil
		    MsgBox "Can't play this asset."
		    Return
		  end if
		  
		  // We can play this asset.
		  // Set up an AVPlayerLayer according to whether the asset contains video.
		  dim tracks() as AVAssetTrackMBS = asset.tracksWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  if tracks.Ubound>=0 then
		    
		    // Create an AVPlayerLayer and add it to the player view if there is video, but hide it until it's ready for display
		    playerlayer = new AVPlayerLayerMBS(player)
		    PlayerLayer.frame = outputLayer.bounds
		    PlayerLayer.AutoresizingMask = CALayerMBS.kCALayerWidthSizable + CALayerMBS.kCALayerHeightSizable
		    PlayerLayer.Hidden = true
		    PlayerLayer.Opaque = false
		    PlayerLayer.backgroundColor = nil
		    PlayerLayer.shouldRasterize = true
		    
		    // make mask layer for donut
		    
		    dim p as new Picture(Width, Height, 32)
		    dim g as Graphics = p.mask.Graphics
		    dim cx as integer = g.Width/2
		    dim cy as integer = g.Height/2
		    g.ForeColor = &cFFFFFF
		    g.FillRect 0, 0, g.Width, g.Height
		    g.ForeColor = &c000000
		    g.FillOval cx-150, cy-150, 300, 300
		    g.ForeColor = &cFFFFFF
		    g.FillOval cx- 50, cy- 50, 100, 100
		    
		    
		    
		    
		    dim img as CGImageMBS = CGImageMBS.CreateImage(p)
		    
		    MaskLayer = new CALayerMBS
		    MaskLayer.contents = img
		    MaskLayer.frame = CGMakeRectMBS(0, 0, Width, Height)
		    maskLayer.backgroundColor = CGColorMBS.CreateDeviceGray(0, 0) // color is required
		    
		    PlayerLayer.backgroundColor = nil
		    PlayerLayer.Opaque = false
		    PlayerLayer.mask = nil
		    PlayerLayer.mask = MaskLayer
		    
		    
		    outputLayer.addSublayer playerLayer
		    
		    PlayerLayerObserver = new MyNSKeyValueObserverMBS(playerLayer.Handle)
		    PlayerLayerObserver.MovieOverlay = self
		    dim options as integer = PlayerLayerObserver.kOptionInitial + PlayerLayerObserver.kOptionNew
		    PlayerLayerObserver.addObserver "readyForDisplay", options, AVSPPlayerLayerReadyForDisplay
		    
		    
		    
		  else
		    
		    // This asset has no video tracks. Show the "No Video" label.
		    stopLoadingAnimationAndHandleError nil
		    MsgBox "Sorry, this asset has no video."
		  end if
		  
		  // Create a new AVPlayerItem and make it our player's current item.
		  dim playeritem as AVPlayerItemMBS = AVPlayerItemMBS.playerItemWithAsset(Asset)
		  
		  dim tag as integer = app.AVFoundation.addWindow(self)
		  
		  player.replaceCurrentItemWithPlayerItem(playeritem)
		  player.play
		  
		  w.invalidateShadow
		  Visible = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopLoadingAnimationAndHandleError(error as NSErrorMBS)
		  
		  
		  if error<>Nil then
		    MsgBox error.localizedDescription
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		asset As AVAssetMBS
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return player.currentTime.Seconds
			End Get
		#tag EndGetter
		currentTime As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DisableEvent As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  dim playerItem as AVPlayerItemMBS = player.currentItem
			  
			  if playerItem.status = playerItem.AVPlayerItemStatusReadyToPlay then
			    return playerItem.asset.duration.Seconds
			  else
			    return 0
			  end if
			  
			End Get
		#tag EndGetter
		duration As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		MaskLayer As CALayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		outputLayer As CALayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		player As AVPlayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		playerLayer As AVPlayerLayerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PlayerLayerObserver As MyNSKeyValueObserverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PlayerObserver As MyNSKeyValueObserverMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PlayerView As NSViewMBS
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return player.volume
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  player.volume = value
			End Set
		#tag EndSetter
		volume As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		w As NSWindowMBS
	#tag EndProperty


	#tag Constant, Name = AVSPPlayerItemStatusContext, Type = String, Dynamic = False, Default = \"AVSPPlayerItemStatusContext", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AVSPPlayerLayerReadyForDisplay, Type = String, Dynamic = False, Default = \"AVSPPlayerLayerReadyForDisplay", Scope = Public
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
			Name="currentTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisableEvent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="duration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="volume"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
