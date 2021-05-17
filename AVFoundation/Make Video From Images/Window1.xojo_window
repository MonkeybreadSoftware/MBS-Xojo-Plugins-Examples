#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   968561281
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Make Video From Images"
   Visible         =   True
   Width           =   600
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   0
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  AVFoundation = new MyAVFoundationMBS
		  
		  pic = new Picture(Width, Height, 32)
		  buffer = new CVPixelBufferMBS(pic)
		  
		  file = SpecialFolder.Desktop.Child("test.m4v")
		  if file.Exists then file.Delete
		  
		  dim error as NSErrorMBS
		  videoWriter = New AVAssetWriterMBS(file, AVFoundation.AVFileTypeMPEG4, error)
		  
		  if videoWriter = nil then
		    MsgBox "Failed to create video writer!"
		    break
		    Return
		  end if
		  
		  dim videoSettings as new Dictionary
		  videoSettings.Value(AVFoundation.AVVideoCodecKey) = AVFoundation.AVVideoCodecH264
		  videoSettings.Value(AVFoundation.AVVideoWidthKey) = Width
		  videoSettings.Value(AVFoundation.AVVideoHeightKey) = height
		  
		  videoWriterInput = AVAssetWriterInputMBS.assetWriterInputWithMediaType(AVFoundation.AVMediaTypeVideo, videoSettings)
		  
		  if videoWriterInput = nil then
		    MsgBox "Failed to create video writer input!"
		    break
		    Return
		  end if
		  
		  dim options as new Dictionary
		  options.Value(CVPixelBufferMBS.kCVPixelBufferWidthKey) = buffer.Width
		  options.Value(CVPixelBufferMBS.kCVPixelBufferHeightKey) = buffer.Height
		  options.Value(CVPixelBufferMBS.kCVPixelBufferPixelFormatTypeKey) = buffer.kCVPixelFormatType_32ARGB
		  
		  adaptor = AVAssetWriterInputPixelBufferAdaptorMBS.assetWriterInputPixelBufferAdaptorWithAssetWriterInput(videoWriterInput, options)
		  
		  if adaptor = nil then
		    MsgBox "Failed to create adaptor!"
		    break
		    Return
		  end if
		  
		  if not videoWriter.canAddInput(videoWriterInput) then
		    break
		  end if
		  
		  // allows to go faster than real time...
		  videoWriterInput.expectsMediaDataInRealTime = true
		  
		  videoWriter.addInput videoWriterInput
		  
		  //Start a session:
		  if not videoWriter.startWriting then
		    MsgBox "Failed to start writing."
		    break
		    Return
		  end if
		  
		  videoWriter.startSessionAtSourceTime CMTimeMBS.kCMTimeZero
		  
		  if buffer.Handle = 0 then
		    MsgBox "Failed to create CVPixelBufferMBS."
		    break
		    Return
		  end if
		  
		  timer1.mode = 2
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		adaptor As AVAssetWriterInputPixelBufferAdaptorMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		AVFoundation As MyAVFoundationMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		buffer As CVPixelBufferMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		videoWriter As AVAssetWriterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		videoWriterInput As AVAssetWriterInputMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  if adaptor.assetWriterInput.isReadyForMoreMediaData = false then Return
		  
		  dim g as Graphics = pic.Graphics
		  
		  dim c as integer = counter*255/pic.height
		  g.ForeColor = rgb(c, 0, 0)
		  g.Drawline 0, counter, g.Width, counter
		  
		  buffer.Flush
		  
		  dim t as CMTimeMBS = CMTimeMBS.Make(600/30*counter, 600) // 30fps in 600 time units per second0
		  call adaptor.appendPixelBuffer(buffer, t)
		  
		  'call adaptor.appendPicture(pic, t)
		  
		  
		  counter = counter + 1
		  
		  
		  if counter = g.Height then
		    
		    // finish
		    me.mode = 0
		    
		    videoWriterInput.markAsFinished
		    dim endtime as CMTimeMBS = CMTimeMBS.Make(600/30*counter, 600) // 30fps in 600 time units per second0
		    videoWriter.endSessionAtSourceTime endtime
		    if not videoWriter.finishWriting then
		      MsgBox "Failed to finish writing file."
		      'break
		      return
		    end if
		    
		    adaptor = nil
		    videoWriterInput = nil
		    videoWriter = nil
		    
		    // done
		    beep
		    file.Launch
		    
		  end if
		  
		  Backdrop = pic
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
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
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="counter"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
