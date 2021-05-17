#tag Class
Protected Class DownloadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  
		  if dltotal=0 then
		    message = "Downloading..."
		  else
		    
		    // add the existing bytes so users are not confused.
		    // The values are normally relative to a download!
		    dlnow=dlnow+offset
		    dltotal=dltotal+offset
		    
		    message = "Downloading "+Format(dlnow/dltotal,"0%")+" "+Format(dlnow/1024,"0")+" of "+Format(dltotal/1024,"0")+" KB"
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Write(data as string, dataSize as Integer) As integer
		  b.Write data
		  
		  Return lenb(Data)
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		b As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		Message As string
	#tag EndProperty

	#tag Property, Flags = &h0
		offset As int64
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
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="offset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="int64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
