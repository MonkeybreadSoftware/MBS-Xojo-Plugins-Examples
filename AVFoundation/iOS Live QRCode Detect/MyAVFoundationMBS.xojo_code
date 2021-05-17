#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureOutputDidOutputMetadataObjects(captureOutput as AVCaptureOutputMBS, metadataObjects() as AVMetadataObjectMBS, connection as AVCaptureConnectionMBS)
		  
		  If metadataObjects.Count > 0 Then
		    
		    For Each obj As AVMetadataObjectMBS In metadataObjects
		      
		      // Ad here your code to handle the read qr-code value
		      
		      Dim Type As String = obj.Type
		      System.DebugLog "Type: " + Type
		      
		      If Type = AVMetadataObjectMBS.AVMetadataObjectTypeQRCode Then
		        
		        Dim Barcode As String = obj.stringValue
		        
		        System.DebugLog "Found QR-Code: " + Barcode
		        
		        If LastString <> Barcode Then
		          LastString = Barcode
		          
		          MessageBox "Found QR-Code: "+Barcode 
		        End If
		        
		      End If
		      
		    Next
		    
		  End If
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h21
		Private LastString As string
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
