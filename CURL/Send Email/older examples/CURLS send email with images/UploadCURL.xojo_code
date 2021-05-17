#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Sub DebugMessage(infotype as integer, data as string, dataSize as Integer)
		  #Pragma unused dataSize
		  #pragma unused infotype
		  
		  t.WriteLine data
		  t.Flush
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  #pragma unused percent
		  #Pragma unused dlnow
		  #Pragma unused dltotal
		  
		  if ultotal=0 then
		    ProgressMessage = "Uploading..."
		  else
		    ProgressMessage = "Uploading "+Format(ulnow/ultotal,"-0%")+" "+stR(ulnow)+" of "+str(ultotal)
		  end if
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.log")
		  
		  t = TextOutputStream.Create(f)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressMessage As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private t As TextOutputStream
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
			Name="ProgressMessage"
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
	#tag EndViewBehavior
End Class
#tag EndClass
