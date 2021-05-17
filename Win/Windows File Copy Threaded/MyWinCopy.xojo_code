#tag Class
Protected Class MyWinCopy
Inherits WindowsFileCopyMBS
	#tag Event
		Function Progress(TotalFileSize as int64, TotalBytesTransferred as int64, StreamSize as int64, StreamBytesTransferred as Int64, StreamNumber as integer, Reason as integer) As integer
		  dim p as integer = 100*TotalBytesTransferred/TotalFileSize
		  
		  if p<>last then // reduce number of addrows...
		    MainWindow.Log "Progress "+str(TotalBytesTransferred)+" of "+str(TotalFileSize)+" = "+Format(TotalBytesTransferred/TotalFileSize,"0%")
		    
		    last = p
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		last As Integer
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
			InitialValue="2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="last"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
