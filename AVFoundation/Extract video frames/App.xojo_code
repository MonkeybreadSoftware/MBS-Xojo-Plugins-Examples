#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim av as new MyAVFoundationMBS
		  
		  // load a movie
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.mov")
		  dim a as AVAssetMBS = AVAssetMBS.assetWithFile(f)
		  
		  // wait for loading?
		  dim e as NSErrorMBS
		  'dim status as integer = a.statusOfValueForKey("duration", e)
		  'while status = a.AVKeyValueStatusLoading
		  'status = a.statusOfValueForKey("duration", e)
		  'wend
		  
		  // create an asset reader
		  dim ar as new AVAssetReaderMBS(a, e)
		  
		  if e <> nil then
		    MsgBox e.localizedDescription
		    Return
		  end if
		  
		  // find the video track
		  dim VideoTracks() as AVAssetTrackMBS = a.tracksWithMediaType(av.AVMediaTypeVideo)
		  dim VideoTrack as AVAssetTrackMBS = VideoTracks(0)
		  
		  // setup track output
		  dim d as new Dictionary
		  d.Value(CVPixelBufferMBS.kCVPixelBufferPixelFormatTypeKey) = CVPixelBufferMBS.kCVPixelFormatType_32ARGB
		  
		  dim arto as new AVAssetReaderTrackOutputMBS(VideoTrack, d)
		  ar.addOutput arto
		  
		  // start it!
		  ar.startReading
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child(f.name+" frames")
		  folder.CreateAsFolder
		  
		  // look over track and get all samples and write them to disk as jpg files
		  dim n as integer = 0
		  
		  while ar.status = ar.AVAssetReaderStatusReading
		    dim b as CMSampleBufferMBS = arto.NextSampleBuffer
		    
		    if b <> nil then
		      dim buf as CVImageBufferMBS = b.ImageBuffer
		      if buf <> nil then
		        
		        'dim ci as CIImageMBS = buf.CIImage
		        'dim nsi as NSImageMBS = buf.NSImage
		        'dim pic as Picture = nsi.CopyPicture
		        dim jpegData as MemoryBlock = buf.JPEG
		        
		        n = n + 1
		        
		        if jpegData <> nil then
		          dim name as string = str(n, "00000")+".jpg"
		          dim file as FolderItem = folder.child(name)
		          
		          dim bb as BinaryStream = BinaryStream.Create(file, true)
		          bb.Write jpegData
		        end if
		      end if
		    end if
		  wend
		  
		End Sub
	#tag EndEvent


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
