#tag Class
Protected Class MLUpdateProgressHandlers
Inherits MLUpdateProgressHandlersMBS
	#tag Event
		Sub completionHandler(context as MLUpdateContextMBS)
		  list.AddRow "Complete"
		  
		  dim r as Boolean
		  dim error as NSErrorMBS
		  
		  r = context.writeToFile(OutputFile, error)
		  if r then
		    list.AddRow "Model saved."
		  else
		    list.AddRow "Failed to save model."
		    list.AddRow error.LocalizedDescription
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub progressHandler(context as MLUpdateContextMBS)
		  dim s as string
		  
		  select case context.ProgressEvent
		  case context.ProgressEventTrainingBegin
		    s = "TrainingBegin"
		  case context.ProgressEventEpochEnd
		    s = "EpochEnd"
		  case context.ProgressEventMiniBatchEnd
		    s = "MiniBatchEnd"
		  else
		    s = str(context.ProgressEvent)
		  end Select
		  
		  list.AddRow "Progress "+s
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputFile As FolderItem
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
