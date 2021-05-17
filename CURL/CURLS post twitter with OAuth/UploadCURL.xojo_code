#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Sub DebugMessage(infotype as integer, data as string, dataSize as Integer)
		  System.DebugLog str(infotype)
		  System.DebugLog data
		End Sub
	#tag EndEvent

	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  'if uplist<>Nil then
		  'if ultotal=0 then
		  'uplist.AddRow "Uploading..."
		  'else
		  'uplist.AddRow "Uploading "+Format(ulnow/ultotal,"0%")
		  'end if
		  'end if
		End Function
	#tag EndEvent

	#tag Event
		Function Write(data as string, dataSize as Integer) As integer
		  result=result+data
		  Return lenb(data)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		result As string
	#tag EndProperty

	#tag Property, Flags = &h0
		uplist As Listbox
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
			Name="result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
