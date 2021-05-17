#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const kCMPersistentTrackID_Invalid = 0
		  
		  AVFoundation = new myAVFoundationMBS
		  
		  dim videoFile as FolderItem = SpecialFolder.Desktop.Child("video.m4v")
		  dim audioFile as FolderItem = SpecialFolder.Desktop.Child("audio.m4a")
		  
		  if not videoFile.Exists or not audioFile.Exists then
		    break
		    Return
		  end if
		  
		  //Create AVMutableComposition Object which will hold our multiple AVMutableCompositionTrack or we can say it will hold our video and audio files.
		  dim mixComposition as AVMutableCompositionMBS = AVMutableCompositionMBS.composition
		  
		  //Now first load your audio file using AVURLAsset. Make sure you give the correct path of your videos.
		  dim audioAsset as new AVURLAssetMBS(audioFile)
		  dim audio_timeRange as CMTimeRangeMBS = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero, audioAsset.duration)
		  
		  //Now we are creating the first AVMutableCompositionTrack containing our audio and add it to our AVMutableComposition object.
		  dim b_compositionAudioTrack as AVMutableCompositionTrackMBS = mixComposition.addMutableTrackWithMediaType(AVFoundationMBS.AVMediaTypeAudio, kCMPersistentTrackID_Invalid)
		  dim audiotracks() as AVAssetTrackMBS = audioAsset.tracksWithMediaType(AVFoundation.AVMediaTypeAudio)
		  dim error as NSErrorMBS
		  call b_compositionAudioTrack.insertTimeRange(audio_timeRange, audiotracks(0), CMTimeMBS.kCMTimeZero, error)
		  
		  //Now we will load video file.
		  dim videoAsset as new AVURLAssetMBS(videoFile)
		  dim video_timeRange as CMTimeRangeMBS = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero,audioAsset.duration)
		  
		  //Now we are creating the second AVMutableCompositionTrack containing our video and add it to our AVMutableComposition object.
		  dim a_compositionVideoTrack as AVMutableCompositionTrackMBS = mixComposition.addMutableTrackWithMediaType(AVFoundationMBS.AVMediaTypeVideo, kCMPersistentTrackID_Invalid)
		  dim videotracks() as AVAssetTrackMBS = videoAsset.tracksWithMediaType(AVFoundation.AVMediaTypeVideo)
		  call a_compositionVideoTrack.insertTimeRange(video_timeRange, videotracks(0), CMTimeMBS.kCMTimeZero, error)
		  
		  //decide the path where you want to store the final video created with audio and video merge.
		  dim outputFile as FolderItem = SpecialFolder.Desktop.Child("final.mov")
		  
		  //Now create an AVAssetExportSession object that will save your final video at specified path.
		  dim assetExport as new AVAssetExportSessionMBS(mixComposition, AVAssetExportSessionMBS.AVAssetExportPresetPassthrough)
		  assetExport.outputFileType = "com.apple.quicktime-movie"
		  assetExport.outputFile = outputFile
		  
		  assetExport.exportAsynchronously
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		AVFoundation As myAVFoundationMBS
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
