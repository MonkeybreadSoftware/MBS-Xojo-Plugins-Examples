#tag Class
Protected Class MyGameKitMBS
Inherits GameKitMBS
	#tag Event
		Sub authenticateCompleted(localPlayer as GKLocalPlayerMBS, error as NSErrorMBS, tag as variant)
		  // here we get result from authentication method 10.8
		  
		  // isAuthenticated will tell if things went well.
		  // Also error gives details
		  
		  if localPlayer <>nil then
		    if localPlayer.isAuthenticated then
		      Log("authenticateCompleted event. Method 10.8 authenticated local player")
		    else
		      Log("authenticateCompleted event. But local player is NOT authenticated")
		    end if
		    //report on local player parameters
		    window1.Check(localPlayer)
		  else
		    Log("authenticateCompleted event. But local player still nil")
		  end if
		  
		  if error<>Nil then
		    Log "authenticateCompleted event. Error msg: "+error.localizedDescription
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub authenticateHandler(LocalPlayer as GKLocalPlayerMBS, viewController as NSViewControllerMBS, error as NSErrorMBS, tag as variant, viewControllerHandle as integer)
		  ////////////////  Apple's Xcode OS X 10.8.2 authenticate code example
		  '(void) authenticateLocalPlayer
		  ' {
		  ' GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
		  ' localPlayer.authenticateHandler = ^(UIViewController *viewController, NSError *error){
		  '  if (viewController != nil)
		  '   {
		  //showAuthenticationDialogWhenReasonable: is an example method name. Create your own method that displays an authentication view when appropriate for your app.
		  '   [self showAuthenticationDialogWhenReasonable: viewController];
		  '   }
		  '  else if (localPlayer.isAuthenticated)
		  '  {
		  //authenticatedPlayer: is an example method name. Create your own method that is called after the local player is authenticated.
		  '  [self authenticatedPlayer: localPlayer];
		  '  }
		  '  else
		  '   {
		  '    [self disableGameCenter];
		  '   }
		  '  }];
		  ' }
		  ////////////////
		  
		  dim dialogController as GKDialogControllerMBS
		  
		  Log("authenticateHandler started")
		  
		  if (viewController<>nil) then
		    //this should indicate that there is no localPlayer
		    //dialog allows player to sign in
		    Log("authenticateHandler asking player to sign in")
		    if dialogController = nil then
		      dialogController = new GKDialogControllerMBS
		    end if
		    
		    call dialogController.presentViewController viewController
		    
		  elseif LocalPlayer.isAuthenticated then
		    Log("authenticateHandler reports authenticated by new 10.8.2 method")
		    window1.Check(LocalPlayer)
		  end if
		  if error<>nil then
		    Log("authenticateHandler found error: "+error.LocalizedDescription)
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PlayerAuthenticationDidChange(player as GKPlayerMBS)
		  '- (void)authenticationChanged {
		  
		  '  if ([GKLocalPlayer localPlayer].isAuthenticated && !userAuthenticated) {
		  '    NSLog(@"Authentication changed: player authenticated.");
		  '    userAuthenticated = TRUE;
		  '  } else if (![GKLocalPlayer localPlayer].isAuthenticated && userAuthenticated) {
		  '    NSLog(@"Authentication changed: player not authenticated");
		  '    userAuthenticated = FALSE;
		  '  }
		  '}
		  ////////////////////
		  
		  Log("playerAuthenticationDidChange event")
		  
		  if GKLocalPlayerMBS(player).isAuthenticated AND NOT pBoolUserAuthenticated then
		    pBoolUserAuthenticated=true
		  elseif NOT GKLocalPlayerMBS(player).isAuthenticated AND pBoolUserAuthenticated then
		    pBoolUserAuthenticated=false
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  System.DebugLog s
		  window1.Listbox1.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		pBoolUserAuthenticated As Boolean
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
			Name="pBoolUserAuthenticated"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
