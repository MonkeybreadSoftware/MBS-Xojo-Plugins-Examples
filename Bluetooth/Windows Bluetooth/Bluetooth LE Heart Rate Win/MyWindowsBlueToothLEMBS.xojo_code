#tag Class
Protected Class MyWindowsBlueToothLEMBS
Inherits WindowsBlueToothLEMBS
	#tag Event
		Sub ChangeEvent(ChangedAttributeHandle as Integer, CharacteristicValue as MemoryBlock)
		  
		  list.log CurrentMethodName+" "+str(ChangedAttributeHandle)+": "+EncodeHex(CharacteristicValue)
		  
		  // show BPM based on the package content
		  dim data as MemoryBlock = CharacteristicValue
		  if data <> nil and data.size >= 2 then
		    dim bpm as integer
		    
		    if BitwiseAnd(data.UInt8Value(0), 1) = 0 then
		      
		      bpm = data.uint8Value(1)
		    else 
		      
		      bpm = data.uint8Value(1) * 256 + data.uint8Value(2)
		      
		    end if
		    
		    list.Log "BPM: "+str(bpm)
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
