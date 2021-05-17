#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim InputFile As FolderItem = GetFolderItem("/Users/cs/Desktop/test.MOV", FolderItem.PathTypeNative)
		  
		  If Not InputFile.Exists Then
		    // please change path!
		    Break
		    return
		  End If
		  
		  
		  Dim outputFile As FolderItem = SpecialFolder.Desktop.Child("test.aac")
		  
		  Call export(InputFile, 1.0, 1.0, outputFile)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function export(InputFile as FolderItem, floRate as double, floPitch as Double, DestFile as FolderItem) As Boolean
		  // floRate = Float of playback rate (e.g. 0.5 = 50% speed)
		  // floPitch = Float for pitch change required
		  // DestFile = Filename of file where to put
		  
		  System.debuglog("Exporting...")
		  
		  Dim engine As New AVAudioEngineMBS
		  Dim player As New AVAudioPlayerNodeMBS
		  Dim pitchEffect As New AVAudioUnitTimePitchMBS
		  
		  // We found the file in the folder.
		  system.debuglog("Audio file obtained")
		  
		  Dim error As NSErrorMBS
		  
		  Dim file As New AVAudioFileMBS(InputFile, error)
		  If error <> Nil Then
		    Dim e As String = error.LocalizedDescription
		    System.DebugLog "Failed to open file: "+e
		    Break
		    Return false
		  End If
		  
		  system.debuglog("File opened OK")
		  
		  Dim Format As AVAudioFormatMBS = file.processingFormat
		  
		  
		  // Set the pitch-shift amount (100 cents = 1 semitone).
		  pitchEffect.pitch = floPitch // semitone
		  pitchEffect.overlap = 32.0 // more overlapping windows = less artifacts - Max = 32
		  pitchEffect.rate = floRate // Rate
		  
		  // Add nodes to engine.
		  engine.attachNode(player)
		  engine.attachNode(pitchEffect)
		  
		  // Connect the player's output to the effect's input.
		  engine.connect(player, pitchEffect, file.processingFormat)
		  
		  // Connect the effect's output to the main mixer input.
		  engine.connect(pitchEffect, engine.mainMixerNode, file.processingFormat)
		  
		  // Schedule the file and start the engine.
		  player.scheduleFile(file, Nil)
		  
		  // Set engine to manual rendering.
		  
		  // The maximum number of frames the engine renders in any single render call.
		  Dim maxFrames As Integer = 4096
		  
		  Dim mode As Integer = AVAudioEngineMBS.ManualRenderingModeOffline
		  Dim r As Boolean
		  r = engine.enableManualRenderingMode(mode, Format, maxFrames, error)
		  
		  If error <> Nil Then
		    Dim e As String = error.LocalizedDescription
		    System.DebugLog "Failed to enable manual rendering mode: "+e
		    Break
		    Return False
		  End If
		  
		  // Start engine.
		  If engine.startAndReturnError(error) then
		    System.debuglog("Engine started")
		  Else
		    Dim e As String = error.LocalizedDescription
		    System.DebugLog "Engine failed to start: "+e
		    Break
		    Return False
		  End If
		  
		  // Play the file.
		  player.play
		  
		  // The output buffer to which the engine renders the processed data.
		  dim buffer as new AVAudioPCMBufferMBS(engine.manualRenderingFormat, engine.manualRenderingMaximumFrameCount)
		  
		  // Setup our output file to export to.
		  Dim outputFile As New AVAudioFileMBS(DestFile, file.fileFormat.settings, error)
		  
		  
		  If error <> Nil Then
		    Dim e As String = error.LocalizedDescription
		    System.DebugLog "Failed to create output file: "+e
		    Break
		    Return false
		  End If
		  
		  
		  // Need to work out what the new length would be based on the rate passed.
		  // This prevents output ending early or having silence at end of output.
		  Dim newLength As Double = file.length * (1.0 / floRate)
		  newLength = Ceil(newLength) // round up
		  Dim newLengthInt As Integer = newLength
		  
		  // Render output to buffer and output buffer content to file in loop.
		  While engine.manualRenderingSampleTime < newLength 
		    
		    
		    // Work out how many frames to render.
		    Dim frameCount As Int64 = newLengthInt - engine.manualRenderingSampleTime
		    Dim framesToRender As Int64 = Min(frameCount, buffer.frameCapacity)
		    
		    // Render offline to buffer.
		    Dim status As Integer = engine.renderOffline(framesToRender, buffer, error)
		    
		    If error <> Nil Then
		      Dim e As String = error.LocalizedDescription
		      System.DebugLog "Failed to render offline: "+e
		      Break
		      Return False
		    End If
		    
		    // Check if we had success.
		    Select Case status
		      
		    Case AVAudioEngineMBS.ManualRenderingStatusSuccess
		      // The data rendered successfully. Write it to the output file.
		      Call outputFile.writeFromBuffer(buffer, error)
		      
		      If error <> Nil Then
		        Dim e As String = error.LocalizedDescription
		        System.DebugLog "Failed to write buffer: "+e
		        Break
		        Return False
		      End If
		      
		    Case AVAudioEngineMBS.ManualRenderingStatusInsufficientDataFromInputNode
		      // Applicable only when using the input node as one of the sources.
		      Break
		      
		    Case AVAudioEngineMBS.ManualRenderingStatusCannotDoInCurrentContext
		      // The engine couldn't render in the current render call.
		      // Retry in the next iteration.
		      Break
		      
		    Case AVAudioEngineMBS.ManualRenderingStatusError
		      // An error occurred while rendering the audio.
		      System.DebugLog("Manual offline rendering failed.")
		      Break
		    Else
		      // Something unexpected.
		      // We'll retry in the next iteration.
		      Break
		      
		    End Select
		    
		  Wend
		  
		  // Stop the player node and engine.
		  player.stop
		  engine.stop
		  
		  player = Nil
		  engine = Nil
		  
		  System.debuglog("Audio file exported")
		  return true
		  
		  // catch all exceptions
		  Exception re As RuntimeException
		    System.DebugLog "Got exception: "+Introspection.GetType(re).name
		    System.DebugLog Str(re.errorNumber)+": "+re.message
		    Break
		    Return False
		    
		    
		    
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
