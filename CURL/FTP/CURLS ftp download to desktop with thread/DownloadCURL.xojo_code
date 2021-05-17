#tag Class
Protected Class DownloadCURL
Inherits CURLSMBS
	#tag Event
		Sub DebugMessage(infotype as integer, data as string, dataSize as Integer)
		  if infotype = kINFO_HEADER_IN or infotype = kINFO_HEADER_OUT or infotype = kINFO_TEXT then
		    
		    if data.Encoding = nil then
		      data = DefineEncoding(data, encodings.ISOLatin1)
		    end if
		    
		    DebugMessages = DebugMessages + data
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if dltotal=0 then
		    ProgressMessage = "Downloading..."
		  else
		    ProgressMessage = "Downloading "+Format(dlnow/dltotal,"0%")
		  end if
		  
		  Return false
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		DebugMessages As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressMessage As string
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
			Name="DebugMessages"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProgressMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
