#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureOutputDidOutputSampleBuffer(captureOutput as AVCaptureOutputMBS, OutputSampleBuffer as CMSampleBufferMBS, connection as AVCaptureConnectionMBS, features as variant)
		  
		  if win <> nil and features <> nil then
		    
		    dim list as listbox = win.list
		    list.DeleteAllRows
		    
		    dim cifeatures() as variant = features
		    
		    for each cifeature as CIFeatureMBS in cifeatures
		      
		      list.AddRow cifeature.type
		      
		      dim bounds as CGRectMBS = cifeature.bounds
		      list.AddRow str(bounds.Left)+"/"+str(bounds.Top)+"-"+str(bounds.Width)+"/"+str(bounds.Height)
		      
		      if cifeature isa CIQRCodeFeatureMBS then
		        dim f as CIQRCodeFeatureMBS = CIQRCodeFeatureMBS(cifeature)
		        list.AddRow f.messageString
		        
		      end if
		      
		      
		    next
		    
		    
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
