#tag Class
Protected Class UploadCURL
Inherits CURLSMBS
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  if ultotal=0 then
		    MainWindow.listbox1.addrow "Uploading..."
		  else
		    MainWindow.listbox1.addrow "Uploading "+Format(ulnow/ultotal,"-0%")+" "+stR(ulnow)+" of "+str(ultotal)
		  end if
		End Function
	#tag EndEvent


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
