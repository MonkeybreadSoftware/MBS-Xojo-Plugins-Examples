#tag Class
Protected Class DownloadCURL
Inherits CURLSMBS
	#tag Event
		Sub DebugMessage(infotype as integer, data as string, dataSize as Integer)
		  // shows debug stuff
		  // System.DebugLog str(infotype)+" "+data
		End Sub
	#tag EndEvent

	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if dltotal=0 then
		    Message = "Downloading..."
		  else
		    Message = "Downloading "+Format(dlnow/dltotal,"0%")
		  end if
		  
		  // show in console
		  // System.DebugLog list.Cell(listindex,0)
		  
		  // this may improve GUI responses
		  // app.DoEvents
		  
		  Return Window1.stopped
		End Function
	#tag EndEvent

	#tag Event
		Function Write(data as string, dataSize as Integer) As integer
		  // using stream allows us to handle more data than fits in memory
		  
		  b.Write data
		  size = size + lenb(data)
		  Return lenb(Data)
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		b As binaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Message As string
	#tag EndProperty

	#tag Property, Flags = &h0
		size As Int64
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
			Name="done"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="size"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Int64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
