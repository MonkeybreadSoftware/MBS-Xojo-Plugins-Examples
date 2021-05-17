#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  dim s as string
		  
		  if ultotal=0 then
		    s="Uploading..."
		  else
		    
		    dim d as Double = ulnow/ultotal
		    currentProgress = 100*d
		    
		    s="Uploading "+Format(d,"-0%")+" "+Format(ulnow/1024.0,"0")+" of "+format(ultotal/1024.0,"0")+" KB"
		  end if
		  
		  status = s
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function Read(count as integer) As string
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
		currentProgress As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		status As string
	#tag EndProperty

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
		#tag ViewProperty
			Name="currentProgress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="status"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
