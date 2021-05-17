#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureStillImageAsynchronouslyCompleted(CaptureStillImageOutput as AVCaptureStillImageOutputMBS, prepareJpegStillImage as boolean, tag as variant, error as NSErrorMBS, imageDataSampleBuffer as CMSampleBufferMBS, JpegStillImage as memoryblock)
		  dim pic as Picture = Picture.FromData(JpegStillImage)
		  
		  dim p as new PhotoWindow
		  p.Backdrop = pic
		  p.Width = pic.Width
		  p.Height = pic.Height
		  p.Left = MainWindow.Left + 20 + MainWindow.Width
		  p.top = MainWindow.top
		  p.show
		  
		  
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
