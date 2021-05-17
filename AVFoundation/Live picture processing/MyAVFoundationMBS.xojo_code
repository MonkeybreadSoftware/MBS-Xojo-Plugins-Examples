#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureOutputDidOutputSampleBuffer(captureOutput as AVCaptureOutputMBS, OutputSampleBuffer as CMSampleBufferMBS, connection as AVCaptureConnectionMBS, features as variant)
		  
		  if win <> nil then
		    dim ImageBuffer as CVImageBufferMBS = OutputSampleBuffer.ImageBuffer
		    if ImageBuffer <> nil then
		      dim image as NSImageMBS = ImageBuffer.NSImage
		      
		      if image <> nil then
		        
		        // this may request size of window, so image may get reduced in size
		        image.setSize win.Width, win.Height
		        
		        dim currentPicture as Picture = image.CopyPicture'WithAlpha
		        
		        // show in window
		        win.currentImage = image
		        win.currentPicture = currentPicture
		        win.OutputCanvas.Invalidate
		        
		      end if
		      
		      
		      
		      dim now as Double = Microseconds
		      dim delta as Double = (now - win.LastTicks) / 1000000.0
		      
		      win.LastTicks = now
		      win.Title = Format(1.0/delta, "0.0")+" fps"
		      
		    end if
		  end if
		  
		End Sub
	#tag EndEvent

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


	#tag Property, Flags = &h0
		win As MainWindow
	#tag EndProperty


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
