#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  
		  
		  // select work folder
		  dim x as FolderItem = SelectFolder
		  
		  if x <> nil then
		    
		    Work x
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'Register Plugins
		  
		  f = new MyAVFoudationMBS
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ParseTime(t as string) As CMTimeMBS
		  if instr(t, ":") > 0 then
		    dim m as string = NthField(t, ":", 1)
		    dim s as string = NthField(t, ":", 2)
		    
		    dim z as Double = val(s) + val(m) * 60
		    
		    Return CMTimeMBS.MakeWithSeconds(z)
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Work(Folder as FolderItem)
		  // we read a list.txt in folder with file names and times
		  // Name tab StartTime tab EndTime
		  // we merge all videos by adding the video together
		  
		  // than we crop videos
		  
		  
		  //Create AVMutableComposition Object which will hold our multiple AVMutableCompositionTrack or we can say it will hold our video and audio files.
		  
		  dim f as FolderItem = folder.Child("list.txt")
		  dim tis as TextInputStream = TextInputStream.Open(f)
		  dim error as NSErrorMBS
		  
		  dim tab as string = encodings.UTF8.Chr(9)
		  
		  dim m as AVMutableCompositionMBS = AVMutableCompositionMBS.composition
		  
		  while not tis.EOF
		    dim line as string = tis.ReadLine(encodings.UTF8)
		    
		    dim name    as string = NthField(line, tab, 1)
		    dim abZeit  as string = NthField(line, tab, 2)
		    dim bisZeit as string = NthField(line, tab, 3)
		    
		    dim file as FolderItem = folder.Child(name)
		    dim asset as AVAssetMBS = AVAssetMBS.assetWithFile(file)
		    
		    log "Add "+file.DisplayName
		    
		    dim len as CMTimeMBS = asset.duration
		    log "Duration "+str(len.Seconds)
		    
		    dim sourceTimeRange as CMTimeRangeMBS = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero, len)
		    if abZeit <> "" then
		      dim t as CMTimeMBS = ParseTime(abZeit)
		      if t <> nil then
		        sourceTimeRange = CMTimeRangeMBS.Make(t, len.Subtract(t))
		        log "Start at "+str(t.Seconds)
		      end if
		    end if
		    
		    if bisZeit <> "" then
		      dim t as CMTimeMBS = ParseTime(bisZeit)
		      if t <> nil then
		        sourceTimeRange = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero, t)
		        log "End at "+str(t.Seconds)
		      end if
		    end if
		    
		    
		    call m.insertTimeRange(sourceTimeRange, asset, m.duration, error)
		    if error <> nil then
		      dim e as string = error.LocalizedDescription
		      break
		      MsgBox e 
		      quit
		    end if
		    
		    
		  wend
		  
		  log "Total duration: "+str(m.duration.Seconds)+" seconds"
		  
		  dim timeRange as CMTimeRangeMBS = CMTimeRangeMBS.Make(CMTimeMBS.kCMTimeZero, m.duration)
		  log "timeRange: "+timeRange.Description
		  
		  
		  // now crop to 1440x600 pixel
		  
		  videoComposition = AVMutableVideoCompositionMBS.mutableVideoComposition
		  videoComposition.frameDuration = CMTimeMBS.Make(1, 30)
		  videoComposition.renderSize = CGMakeSizeMBS(1440, 600)
		  
		  dim Instructions() as AVMutableVideoCompositionInstructionMBS
		  
		  
		  dim mvideotracks() as AVAssetTrackMBS = m.tracksWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  log "videotracks count: "+str(mvideotracks.Ubound+1)
		  
		  dim instruction as AVMutableVideoCompositionInstructionMBS = AVMutableVideoCompositionInstructionMBS.videoCompositionInstruction
		  instruction.timeRange = CMTimeRangeMBS.AllTimeRange
		  
		  dim transformers() as AVMutableVideoCompositionLayerInstructionMBS
		  for each videoTrack as AVAssetTrackMBS in mvideotracks
		    
		    dim transformer as AVMutableVideoCompositionLayerInstructionMBS = AVMutableVideoCompositionLayerInstructionMBS.videoCompositionLayerInstructionWithAssetTrack(videoTrack)
		    log "Video track time range: "+videoTrack.timeRange.Description
		    
		    // here we define area of interest
		    dim r as CGRectMBS = CGMakeRectMBS(15, 450, 1440, 600)
		    transformer.setCropRectangle(r, CMTimeMBS.kCMTimeZero)
		    
		    // and use a transform to move pixels into visible area of render size above
		    dim trans as CGAffineTransformMBS = CGAffineTransformMBS.MakeTranslation(-r.Origin.x, -r.Origin.y)
		    transformer.setTransform(trans, CMTimeMBS.kCMTimeZero)
		    transformers.append transformer
		    
		  next
		  instruction.setLayerInstructions transformers
		  Instructions.Append instruction
		  
		  //add the transformer layer instructions, then add to video composition
		  videoComposition.setInstructions instructions
		  
		  // start export
		  e = new AVAssetExportSessionMBS(m, AVAssetExportSessionMBS.AVAssetExportPresetAppleM4VAppleTV)
		  e.timeRange = timeRange
		  e.shouldOptimizeForNetworkUse = true
		  e.videoComposition = videoComposition
		  
		  dim filetypes() as string = e.supportedFileTypes
		  e.outputFileType = FileTypes(0)
		  e.OutputFile = SpecialFolder.Desktop.Child(folder.name+"."+e.outputFileExtension)
		  
		  ProgressWindow.e = e
		  ProgressWindow.show
		  
		  e.exportAsynchronously(nil)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		e As AVAssetExportSessionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		f As MyAVFoudationMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoComposition As AVMutableVideoCompositionMBS
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
