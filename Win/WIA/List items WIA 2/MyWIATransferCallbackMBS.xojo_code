#tag Class
Protected Class MyWIATransferCallbackMBS
Inherits WIATransferCallbackMBS
	#tag Event
		Function GetNextStream(ItemName as string, FullItemName as string) As WIAStreamMBS
		  dim f as FolderItem = SpecialFolder.Desktop.Child(ItemName)
		  dim s as new WIAStreamMBS(WIAStreamMBS.kModeWrite + WIAStreamMBS.kModeCreate, f)
		  
		  Return s
		  
		End Function
	#tag EndEvent

	#tag Event
		Function TransferCallback(w as WIATransferParamsMBS) As integer
		  dim p as integer = W.PercentComplete
		  
		  MainWindow.bar.Value = p
		  
		  
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
