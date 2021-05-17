#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub NewDocument()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.m4v")
		  if f.Exists then
		    Process f
		  else
		    MsgBox "Please drop a movie on this application."
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if AVAssetExportSessionMBS.available = false then
		    MsgBox "Please run on Mac OS X 10.7 or newer."
		    quit
		  end if
		  
		  Generators = new Dictionary
		  assets     = new Dictionary
		  files      = new Dictionary
		  avEvents   = new MyAVFoundationMBS
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  Process item
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Process(f as FolderItem)
		  dim a as AVAssetMBS = AVAssetMBS.assetWithFile(f)
		  
		  if a = nil then
		    MsgBox "Failed to read "+f.Name
		    Return
		  end if
		  
		  // make ten thumbnails starting 10 seconds from start
		  dim g as new AVAssetImageGeneratorMBS(a)
		  
		  // build list of times
		  dim times() as CMTimeMBS
		  dim duration as CMTimeMBS = a.duration
		  dim FiveSeconds as Double = duration.Timescale * 5
		  for i as integer = 0 to 9
		    dim t as CMTimeMBS = CMTimeMBS.Make(FiveSeconds + duration.Value*i/11, duration.Timescale)
		    
		    times.Append t
		  next
		  
		  // with tag we pass reference numer of the item in Dictionary
		  tagCounter = tagCounter +1 
		  
		  dim tag as integer = tagCounter
		  
		  Generators.Value(tag) = g
		  assets.Value(tag) = a
		  files.Value(tag) = f
		  
		  g.generateCGImagesAsynchronouslyForTimes(times, tag)
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		assets As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		avEvents As MyAVFoundationMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		files As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Generators As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		tagCounter As Integer
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
		#tag ViewProperty
			Name="tagCounter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
