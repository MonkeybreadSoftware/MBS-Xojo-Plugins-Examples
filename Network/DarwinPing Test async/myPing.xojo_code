#tag Class
Protected Class myPing
Inherits DarwinPingMBS
	#tag Event
		Sub AddressResolved(ip as string)
		  l.addrow "Resolved address "+HostToPing+" = "+ip
		End Sub
	#tag EndEvent

	#tag Event
		Sub Finished(NumberPacketsSent as integer, NumberPacketsReceived as integer)
		  l.addrow "Finished sent: "+str(NumberPacketsSent)+", received: "+str(NumberPacketsReceived)+", "+Format(NumberPacketsReceived/NumberPacketsSent,"0%")
		End Sub
	#tag EndEvent

	#tag Event
		Sub NextPing(PacketSequenceNumber as integer)
		  l.addrow "Next ping "+str(PacketSequenceNumber)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Response(PacketSequenceNumber as integer, ttl as integer, RoundTripTimeInMS as double)
		  l.addrow "Response "+str(PacketSequenceNumber)+", ttl: "+str(ttl)+", time: "+str(RoundTripTimeInMS)+" ms"
		End Sub
	#tag EndEvent

	#tag Event
		Sub SentError(PacketSequenceNumber as integer)
		  l.addrow "SentError "+str(PacketSequenceNumber)
		End Sub
	#tag EndEvent

	#tag Event
		Sub SentSuccess(PacketSequenceNumber as integer)
		  l.addrow "SentSuccess "+str(PacketSequenceNumber)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Timeout(PacketSequenceNumber as integer)
		  l.addrow "Timeout "+str(PacketSequenceNumber)
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		l As listbox
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
