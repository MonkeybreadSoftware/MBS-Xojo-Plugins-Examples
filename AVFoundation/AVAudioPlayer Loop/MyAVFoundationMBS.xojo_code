#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub audioPlayerDidFinishPlaying(player as AVAudioPlayerMBS, successful as boolean)
		  if successful then
		    log "Player "+player.name+" is done successfully."
		  else
		    log "Player "+player.name+" is done with problem."
		  end if
		  
		  dim Players() as AVAudioPlayerMBS = app.Players
		  
		  dim u as integer = Players.Ubound
		  // index of current one
		  dim i as integer = players.IndexOf(player)
		  
		  // index of next one
		  dim n as integer = i + 1
		  if n > u then
		    n = 0
		  end if
		  
		  
		  dim p as AVAudioPlayerMBS = players(n)
		  
		  log "Play " + p.Name
		  call p.play
		  
		  
		  
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
