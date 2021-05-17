#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if ultotal=0 then
		    List.addrow "Uploading..."
		  else
		    List.addrow "Uploading "+Format(ulnow/ultotal,"-0%")+" "+stR(ulnow)+" of "+str(ultotal)
		  end if
		  
		  if DoCancelLater and ulnow > ultotal / 2 then
		    // cancel at 50 %
		    
		    List.addrow "Cancel here"
		    Return true
		    
		  end if
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		DoCancelLater As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		List As listbox
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
			Name="DoCancelLater"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
