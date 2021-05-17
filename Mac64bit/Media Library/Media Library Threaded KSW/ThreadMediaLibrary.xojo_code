#tag Class
Protected Class ThreadMediaLibrary
Inherits Thread
	#tag Event
		Sub Run()
		  Dim Options as New Dictionary
		  Dim dStarTicks As Double
		  
		  Options.Value(MLMediaLibraryMBS.MLMediaLoadIncludeSourcesKey) = Array(MLMediaSourceMBS.MLMediaSourceiTunesIdentifier)
		  MediaLibrary = New MLMediaLibraryMBS(Options)
		  
		  Const kTimeoutSeconds = 30
		  
		  Dim dSources As Dictionary
		  dStarTicks = Ticks
		  Do
		    dSources = MediaLibrary.mediaSources
		    me.Sleep(1)
		    me.TimedOut = (Ticks-dStarTicks)/60 > kTimeoutSeconds
		  Loop Until dSources <> Nil or me.TimedOut
		  If me.TimedOut Then Return
		  System.DebugLog Str((Ticks-dStarTicks)/60) + " seconds to load media sources."
		  
		  Dim xRootGroup As MLMediaGroupMBS
		  If dSources <> Nil Then
		    if dSources.Count = 0 then 
		      return
		    end if
		    
		    For Each x As Variant In dSources.Keys
		      Dim key_name As String = x
		      Dim xSource As MLMediaSourceMBS = dSources.Value(key_name)
		      dStarTicks = Ticks
		      Do
		        Dim xTest As MLMediaGroupMBS = xSource.rootMediaGroup
		        If xTest <> Nil Then
		          Select Case xTest.TypeIdentifier
		          Case MLMediaGroupMBS.MLiTunesRootGroupTypeIdentifier
		            xRootGroup = xTest
		          Else
		            System.DebugLog "Found " + xTest.Identifier + "; wanted: " + MLMediaGroupMBS.MLiTunesRootGroupTypeIdentifier
		          End Select
		        End If
		        me.Sleep(5)
		        me.TimedOut = (Ticks-dStarTicks)/60 > kTimeoutSeconds
		      Loop Until xRootGroup <> Nil or me.TimedOut
		      If me.TimedOut Then Return
		      System.DebugLog Str((Ticks-dStarTicks)/60) + " seconds to load root group."
		    Next
		  End If
		  
		  
		  Dim xChildGroups() As MLMediaGroupMBS
		  xChildGroups = xRootGroup.childGroups //Already loaded when we called
		  //Does not require waiting below as calling "rootMediaGroup" populated this already
		  'If xRootGroup <> Nil Then
		  'dStarTicks = Ticks
		  'Do
		  'xChildGroups = xRootGroup.childGroups //Already loaded when we called
		  'me.Sleep(1)
		  'me.TimedOut = (Ticks-dStarTicks)/60 > kTimeoutSeconds
		  'Loop Until uBound(xChildGroups) <> -1 or me.TimedOut
		  'If me.TimedOut Then Return
		  'System.DebugLog Str((Ticks-dStarTicks)/60) + " seconds to load childGroups."
		  'End If
		  
		  For Each xThisChildGroup As MLMediaGroupMBS In xChildGroups
		    Select Case xThisChildGroup.TypeIdentifier
		    Case MLMediaGroupMBS.MLiTunesAudioBooksPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesFolderPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesGeniusPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesiTunesUPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesMoviesPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesMusicPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesMusicVideosPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesPodcastPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesPurchasedPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesSavedGeniusPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesTVShowsPlaylistTypeIdentifier, _
		      MLMediaGroupMBS.MLiTunesVideoPlaylistTypeIdentifier
		      Dim xNew As New iTunesPlaylistKSW
		      xNew.Name = xThisChildGroup.Name
		      xNew.Type = xThisChildGroup.TypeIdentifier
		      me.Playlists.Append xNew
		    End Select
		  Next
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		MediaLibrary As MLMediaLibraryMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		Playlists() As iTunesPlaylistKSW
	#tag EndProperty

	#tag Property, Flags = &h0
		TimedOut As Boolean
	#tag EndProperty


	#tag ViewBehavior
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimedOut"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
