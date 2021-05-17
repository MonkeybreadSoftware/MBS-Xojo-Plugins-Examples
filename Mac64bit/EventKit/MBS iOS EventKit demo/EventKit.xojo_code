#tag Module
Protected Module EventKit
	#tag Method, Flags = &h1
		Protected Sub getEventStore()
		  if EventKit.EventStore = Nil then
		    EventKit.EventStore = new ourEventStore
		    if EventKit.EventStore.authorizationStatusForEntityType( EKEventStoreMBS.kEntityTypeEvent ) = EKEventStoreMBS.kAuthorizationStatusNotDetermined then
		      EventKit.EventStore.requestAccessToEntityType( EKEventStoreMBS.kEntityTypeEvent )
		    elseif EventKit.EventStore.authorizationStatusForEntityType( EKEventStoreMBS.kEntityTypeEvent ) = EKEventStoreMBS.kAuthorizationStatusAuthorized then
		      EventKit.bEventPermissionGranted = True
		    else
		      EventKit.bEventPermissionGranted = False
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		bEventPermissionGranted As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EventStore As ourEventStore
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
			Name="bEventPermissionGranted"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
