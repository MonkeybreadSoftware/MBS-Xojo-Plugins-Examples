#tag Class
Protected Class mySLRequestMBS
Inherits SLRequestMBS
	#tag Event
		Sub performRequestCompleted(responseData as memoryblock, urlResponse as NSURLResponseMBS, error as NSErrorMBS, tag as variant)
		  dim n as integer = urlResponse.statusCode
		  
		  if n = 200 then
		    MsgBox "OK"
		  else
		    
		    MsgBox "Failed with HTTP Status: "+str(n)+" "+urlResponse.localizedStringForStatusCode(n)
		    
		    dim f as FolderItem = SpecialFolder.Desktop.Child("twitter response.txt")
		    dim b as BinaryStream = BinaryStream.Create(f, true)
		    b.Write responseData
		    b.Close
		    
		  end if
		  
		End Sub
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
