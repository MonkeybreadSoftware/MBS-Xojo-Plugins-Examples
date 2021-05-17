#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if ultotal=0 then
		    window1.listbox1.addrow "Uploading..."
		  else
		    window1.listbox1.addrow "Uploading "+Format(ulnow/ultotal,"-0%")+" "+stR(ulnow)+" of "+str(ultotal)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function Read(count as integer) As string
		  // using stream methods allows us to handle more data than fits in memory
		  Return stream.Read(count)
		End Function
	#tag EndEvent

	#tag Event
		Function RestartRead() As boolean
		  stream.position=0
		  Return false // no error
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		stream As binaryStream
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
