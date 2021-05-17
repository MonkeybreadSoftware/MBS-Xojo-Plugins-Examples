#tag Class
Protected Class MyIKPictureTakerMBS
Inherits IKPictureTakerMBS
	#tag Event
		Sub Finished(returnCode as integer)
		  dim n as NSImageMBS
		  dim f as FolderItem
		  dim b as BinaryStream
		  
		  window1.Title=str(returnCode)
		  if returnCode=1 then // ok
		    n=me.outputImage
		    
		    window1.Backdrop=n.CopyPicture
		    window1.Refresh // refresh issue :-(
		  else
		    
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
