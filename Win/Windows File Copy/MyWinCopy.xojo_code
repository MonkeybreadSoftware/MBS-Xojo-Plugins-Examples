#tag Class
Protected Class MyWinCopy
Inherits WindowsFileCopyMBS
	#tag Event
		Function Progress(TotalFileSize as int64, TotalBytesTransferred as int64, StreamSize as int64, StreamBytesTransferred as Int64, StreamNumber as integer, Reason as integer) As integer
		  MainWindow.List.AddRow "Progress..."
		  MainWindow.List.AddRow "TotalFileSize: "+str(TotalFileSize)
		  MainWindow.List.AddRow "TotalBytesTransferred: "+str(TotalBytesTransferred)
		  MainWindow.List.AddRow "StreamSize: "+str(StreamSize)
		  MainWindow.List.AddRow "StreamBytesTransferred: "+str(StreamBytesTransferred)
		  MainWindow.List.AddRow "StreamNumber: "+str(StreamNumber)
		  
		  dim s as string="?"
		  Select case Reason
		  case me.CallbackChunkFinished
		    s="ChunkFinished"
		  case me.CallbackStreamSwitched
		    s="StreamSwitched"
		  end Select
		  
		  MainWindow.List.AddRow "Reason: "+str(Reason)+" = "+s
		  
		  
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
	#tag EndViewBehavior
End Class
#tag EndClass
