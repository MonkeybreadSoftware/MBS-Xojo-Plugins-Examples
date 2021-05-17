#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureOutputDidOutputSampleBuffer(captureOutput as AVCaptureOutputMBS, OutputSampleBuffer as CMSampleBufferMBS, connection as AVCaptureConnectionMBS, features as variant)
		  
		  If win <> Nil And Not RequestRunning Then
		    
		    Dim ImageBuffer As CVImageBufferMBS = OutputSampleBuffer.ImageBuffer
		    
		    
		    If barcodeDetectRequest = Nil Then
		      barcodeDetectRequest = New VNDetectBarcodesRequestMBS(WeakAddressOf RequestCompleted)
		      
		      // Restrict detection to most common symbologies.
		      Dim symbologies() As String
		      symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyQR
		      symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyEAN13
		      symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyEAN8
		      symbologies.append VNBarcodeObservationMBS.VNBarcodeSymbologyUPCE
		      
		      barcodeDetectRequest.setSymbologies symbologies
		    End If
		    
		    
		    Dim requests() As VNRequestMBS
		    Requests.Append barcodeDetectRequest
		    
		    imageRequestHandler = VNImageRequestHandlerMBS.RequestWithCVPixelBuffer(ImageBuffer)
		    
		    imageRequestHandler.performRequestsAsync(requests, WeakAddressOf performRequestsCompleted )
		    
		    RequestRunning = True
		    
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


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  If s = last Then Return // ignore duplicate
		  
		  List.AddRow s
		  last = s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub performRequestsCompleted(Requests() as VNRequestMBS, result as boolean, error as NSErrorMBS, tag as Variant)
		  Dim list As Listbox = win.List
		  
		  If result Then
		    'Log "performRequests succeeded."
		  Else
		    Log "performRequests failed."
		  End If
		  
		  If error <> Nil Then
		    Log "Error: " + error.LocalizedDescription
		  End If
		  
		  RequestRunning = False
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RequestCompleted(request as VNRequestMBS, error as NSErrorMBS, tag as Variant)
		  Dim list As Listbox = win.List
		  
		  If error <> Nil Then
		    Log request.className+" failed: "+error.LocalizedDescription
		  Else
		    'Log request.className+" succeeded"
		    
		    Dim results() As VNObservationMBS = request.results
		    
		    If results.Ubound >= 0 Then
		      For Each result As VNObservationMBS In results
		        
		        If result IsA VNBarcodeObservationMBS Then
		          Dim bresult As VNBarcodeObservationMBS = VNBarcodeObservationMBS(result)
		          
		          Log bresult.symbology+": "+bresult.payloadStringValue
		          
		        End If
		      Next
		    End If
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		barcodeDetectRequest As VNDetectBarcodesRequestMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		imageRequestHandler As VNImageRequestHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		last As string
	#tag EndProperty

	#tag Property, Flags = &h0
		List As Listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		RequestRunning As Boolean
	#tag EndProperty

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
		#tag ViewProperty
			Name="RequestRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="last"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
