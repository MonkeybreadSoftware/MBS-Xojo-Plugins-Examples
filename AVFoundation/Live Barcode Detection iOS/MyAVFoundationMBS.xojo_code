#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureOutputDidOutputSampleBuffer(captureOutput as AVCaptureOutputMBS, OutputSampleBuffer as CMSampleBufferMBS, connection as AVCaptureConnectionMBS, features as variant)
		  
		  if win <> nil and features <> nil then
		    
		    Dim list As iOSMobileTable = win.list
		    list.RemoveAllRows
		    
		    dim cifeatures() as variant = features
		    
		    for each cifeature as CIFeatureMBS in cifeatures
		      
		      list.AddRow cifeature.type
		      
		      dim bounds as CGRectMBS = cifeature.bounds
		      list.AddRow _
		      bounds.Left.ToString + "/" + _
		      bounds.Top.ToString  + "-" + _
		      bounds.Width.ToString + "/"+ _
		      bounds.Height.ToString
		      
		      if cifeature isa CIQRCodeFeatureMBS then
		        dim f as CIQRCodeFeatureMBS = CIQRCodeFeatureMBS(cifeature)
		        list.AddRow f.messageString
		        
		      end if
		      
		      
		    next
		    
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		win As MainScreen
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
