#tag Class
Protected Class MyGameKitMBS
Inherits GameKitMBS
	#tag Event
		Sub authenticateCompleted(localPlayer as GKLocalPlayerMBS, error as NSErrorMBS, tag as variant)
		  // here we get result from authentication
		  
		  // isAuthenticated will tell if things went well.
		  // Also error gives details
		  
		  window1.Check
		  
		  if error<>Nil then
		    log error.localizedDescription
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub authenticateHandler(LocalPlayer as GKLocalPlayerMBS, viewController as NSViewControllerMBS, error as NSErrorMBS, tag as variant, viewControllerHandle as integer)
		  if error<>nil then
		    MsgBox error.LocalizedDescription
		    Return
		  end if
		  
		  if viewController<>nil then
		    
		    if DialogController = nil then
		      DialogController = new GKDialogControllerMBS
		    end if
		    
		    call DialogController.presentViewController viewController
		    
		  else
		    if LocalPlayer.isAuthenticated then
		      MsgBox "Authenticated"
		      
		    end if
		    
		    
		    window1.Check
		    
		    
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  System.DebugLog s
		  window1.Listbox1.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DialogController As GKDialogControllerMBS
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
