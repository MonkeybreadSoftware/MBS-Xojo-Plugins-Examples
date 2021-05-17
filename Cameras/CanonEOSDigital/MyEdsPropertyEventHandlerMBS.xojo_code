#tag Class
Protected Class MyEdsPropertyEventHandlerMBS
Inherits EdsPropertyEventHandlerMBS
	#tag Event
		Function PropertyChanged(PropertyEvent as UInt32, PropertyID as UInt32, Param as UInt32) As integer
		  System.DebugLog CurrentMethodName
		  
		  if PropertyID = EdsBaseMBS.kEdsPropID_Evf_OutputDevice then
		    System.DebugLog "kEdsPropID_Evf_OutputDevice"
		    
		    dim device as UInt32 = camera.GetPropertyDataUInt32(camera.kEdsPropID_Evf_OutputDevice)
		    
		    if not Active and BitwiseAnd(device, EDSModuleMBS.kEdsEvfOutputDevice_PC)<>0 then
		      System.DebugLog "Output To PC started..."
		      
		      Active = true
		      PicWindow.timer1.Mode = 2
		      
		    end if
		    
		    if Active and BitwiseAnd(device, EDSModuleMBS.kEdsEvfOutputDevice_PC) = 0 then
		      
		      System.DebugLog "Output To PC stopped..."
		      
		      'PicWindow.timer1.Mode = 0
		      Active = false
		    end if
		    
		    
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		Active As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		camera As EdsCameraMBS
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
			Name="Active"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
