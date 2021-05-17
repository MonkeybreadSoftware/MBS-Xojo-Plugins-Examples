#tag Class
Protected Class DownloadCURL
Inherits CURLSMBS
	#tag Event
		Sub DebugMessage(infotype as integer, data as string, dataSize as Integer)
		  t.WriteLine data
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if dltotal=0 then
		    window1.ResultText.text="Downloading..."
		  else
		    window1.ResultText.text="Downloading "+Format(dlnow/dltotal,"0%")
		  end if
		  
		  Return false
		End Function
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("log.txt")
		  t = TextOutputStream.Create(f)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		b As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h0
		t As TextOutputStream
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
