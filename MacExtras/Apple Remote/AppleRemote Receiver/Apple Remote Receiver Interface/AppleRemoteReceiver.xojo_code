#tag Interface
Protected Interface AppleRemoteReceiver
	#tag Method, Flags = &h0
		Sub RemoteButtonPressed(button As integer, released As boolean)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = Copyright and other info
		© Jordan Pittman
		© Monkey Bread Software
		
		
		Hello, My Name is Jordan Pittman, I based this project off of MBS's AppleRemoteMBS Plugin/Plugin Part.
		
		This Class Allows you to implement an Interface and all the background code will do the rest.
		
		Anyway, the Interface (AppleRemoteReceiver) has 1 method, RemoteButtonPressed(button As Integer)
		
		buttons are defined as ants in the AppleRemoteModule but here is the list
		
		
		 kRemoteButtonUp = 1
		
		 kRemoteButtonDown = 2
		
		 kRemoteButtonMenu = 3
		
		 kRemoteButtonPlay = 4
		
		 kRemoteButtonRight = 5
		
		 kRemoteButtonLeft = 6
		
		 kRemoteButtonHoldRight = 7
		
		 kRemoteButtonHoldLeft = 8
		
		 kRemoteButtonHoldMenu = 9
		
		 kRemoteButtonPlaySleep = 10
		
		 kRemoteControlSwitched = 11
		
		 kRemoteButtonHoldUp = 12
		
		 kRemoteButtonHoldDown = 13
		
	#tag EndNote


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
	#tag EndViewBehavior
End Interface
#tag EndInterface
