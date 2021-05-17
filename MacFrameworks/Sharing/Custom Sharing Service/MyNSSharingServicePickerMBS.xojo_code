#tag Class
Protected Class MyNSSharingServicePickerMBS
Inherits NSSharingServicePickerMBS
	#tag Event
		Function delegateForSharingService(service as NSSharingServiceMBS) As NSSharingServiceDelegateMBS
		  Return globals.mydelegate
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub didChooseSharingService(service as NSSharingServiceMBS)
		  if service <>nil then
		    MsgBox CurrentMethodName+": "+service.title
		  else
		    MsgBox CurrentMethodName+": nil"
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function sharingServicesForItems(items as NSSharingServiceItemsMBS, proposedServices() as NSSharingServiceMBS) As NSSharingServiceMBS()
		  // add us if we can handle it
		  
		  if customService.canPerformWithItems(items) then
		    proposedServices.Append customService
		  end if
		  
		  Return proposedServices
		  
		End Function
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
