#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  if AVFoundation.available = false then
		    MsgBox "Please run on Mac OS X 10.7 and newer."
		    quit
		  end if
		  
		  AVFoundation = new MyAVFoundation
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.m4a")
		  
		  if f.Exists = false then
		    MsgBox "This example needs a test.m4a file on your desktop."
		    quit
		  end if
		  
		  Run f, 1, ".m4a", AVFoundationMBS.AVFileTypeMPEG4, AVFoundationMBS.kAudioFormatMPEG4AAC
		  Run f, 2, ".m4a", AVFoundationMBS.AVFileTypeMPEG4,  AVFoundationMBS.kAudioFormatMPEG4AAC
		  
		  Run f, 1, ".wav", AVFoundationMBS.AVFileTypeWAVE, AVFoundationMBS.kAudioFormatLinearPCM
		  Run f, 2, ".wav", AVFoundationMBS.AVFileTypeWAVE, AVFoundationMBS.kAudioFormatLinearPCM
		  
		  Run f, 1, " Apple Lossless.m4a", AVFoundationMBS.AVFileTypeAppleM4A, AVFoundationMBS.kAudioFormatAppleLossless
		  Run f, 2, " Apple Lossless.m4a", AVFoundationMBS.AVFileTypeAppleM4A, AVFoundationMBS.kAudioFormatAppleLossless
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  LogWindow.list.addrow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveFileToTrash(f as FolderItem)
		  
		  dim r as FolderItem
		  call MacFileOperationMBS.MoveObjectToTrashSync(f, r, MacFileOperationMBS.kFSFileOperationDefaultOptions)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(file as folderitem, channels as integer, extension as string, OutputFileType as string, format as string)
		  
		  dim songAsset as AVURLAssetMBS = AVURLAssetMBS.URLAssetWithFile(file)
		  dim assetError as NSErrorMBS
		  
		  dim assetReader as AVAssetReaderMBS = AVAssetReaderMBS.assetReaderWithAsset(songAsset, assetError)
		  if assetError<>nil then
		    dim e as string = assetError.localizedDescription
		    log "Error: "+e
		    
		    break
		    Return
		  end if
		  
		  dim audioSettings as Dictionary = nil // no settings
		  dim tracks() as AVAssetTrackMBS = songAsset.tracks
		  dim assetReaderOutput as AVAssetReaderAudioMixOutputMBS = AVAssetReaderAudioMixOutputMBS.assetReaderAudioMixOutputWithAudioTracks(tracks, audioSettings)
		  
		  if not assetReader.canAddOutput(assetReaderOutput) then
		    break
		    log "can't add reader output... die!"
		    return
		  end if
		  
		  assetReader.addOutput(assetReaderOutput)
		  
		  dim exportFile as folderitem = SpecialFolder.Desktop.Child("test"+str(channels)+extension)
		  
		  if exportFile<>Nil then
		    MoveFileToTrash exportFile
		    
		    exportFile = SpecialFolder.Desktop.Child("test"+str(channels)+extension)
		  end if
		  
		  dim assetWriter as AVAssetWriterMBS = AVAssetWriterMBS.assetWriterWithFile(exportFile, outputFileType, assetError)
		  if assetError<>nil then
		    dim e as string = assetError.localizedDescription
		    log "Error: "+e
		    break
		    Return
		  end if
		  
		  
		  dim channelLayout as new QTAudioChannelLayoutMBS
		  if channels = 1 then
		    channelLayout.ChannelLayoutTag = QTAudioChannelLayoutMBS.kAudioChannelLayoutTag_Mono
		  elseif channels = 2 then
		    channelLayout.ChannelLayoutTag = QTAudioChannelLayoutMBS.kAudioChannelLayoutTag_Stereo
		  else
		    break
		  end if
		  
		  dim outputSettings as new Dictionary
		  
		  if format = AVFoundationMBS.kAudioFormatLinearPCM then // uncompressed needs extra values
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMBitDepthKey) = 16
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMIsNonInterleaved) = false
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMIsFloatKey) = false
		    outputSettings.Value(AVFoundationMBS.AVLinearPCMIsBigEndianKey) = false
		  end if
		  
		  if format = AVFoundationMBS.kAudioFormatAppleLossless then
		    outputSettings.Value(AVFoundationMBS.AVEncoderBitDepthHintKey) = 16
		  end if
		  
		  outputSettings.Value(AVFoundationMBS.AVFormatIDKey) = OSTypeFromStringMBS(format)
		  outputSettings.Value(AVFoundationMBS.AVSampleRateKey) = 44100.0
		  outputSettings.Value(AVFoundationMBS.AVNumberOfChannelsKey) = channels
		  outputSettings.Value(AVFoundationMBS.AVChannelLayoutKey) = channelLayout.Memory
		  
		  dim assetWriterInput as AVAssetWriterInputMBS = AVAssetWriterInputMBS.assetWriterInputWithMediaType(AVFoundationMBS.AVMediaTypeAudio, outputSettings)
		  
		  if assetWriter.canAddInput(assetWriterInput) then
		    assetWriter.addInput(assetWriterInput)
		  else
		    break
		    log "can't add asset writer input... die!"
		    return
		  end if
		  
		  assetWriterInput.expectsMediaDataInRealTime = false
		  
		  call assetWriter.startWriting
		  assetReader.startReading
		  
		  dim soundTrack as AVAssetTrackMBS = tracks(0)
		  dim startTime as CMTimeMBS = CMTimeMBS.Make(0, soundTrack.naturalTimeScale)
		  assetWriter.startSessionAtSourceTime(startTime)
		  
		  // keep all the objects around in a global object for this job
		  dim t as new TranscodeOperation
		  t.assetReader = assetReader
		  t.assetWriter = assetWriter
		  t.assetWriterInput = assetWriterInput
		  t.assetReaderOutput = assetReaderOutput
		  t.exportFile = exportFile
		  
		  
		  log "Starting conversion "+str(t.id)+"..."
		  
		  
		  // here we pass ID for job so we can later find it back
		  assetWriterInput.requestMediaDataWhenReadyOnQueue(assetWriterInput, AssetReaderOutput, t.id)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AVFoundation As MyAVFoundation
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
