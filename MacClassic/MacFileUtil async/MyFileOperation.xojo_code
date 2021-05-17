#tag Class
Protected Class MyFileOperation
Inherits MacFileOperationMBS
	#tag Event
		Sub StatusChanged(status as MacFileOperationStatusMBS)
		  
		  dim path as string
		  
		  if status.CurrentItem<>nil then
		    path=status.CurrentItem.UnixpathMBS
		  end if
		  
		  MainWindow.List.AddRow "Status Changed: "+StageString(status.Stage)+", Error: "+str(status.Error)+", Current Item: "+path
		  
		  MainWindow.CurrentItem.text=path
		  
		  MainWindow.Bytes.text=FormatBytes(status.bytesComplete)+" of "+FormatBytes(status.TotalBytes)+", "+FormatBytes(status.BytesRemaining)+" remaining."
		  MainWindow.objects.text=FormatItems(status.ObjectsComplete)+" of "+FormatItems(status.TotalObjects)+", "+FormatItems(status.ObjectsRemaining)+" remaining."
		  MainWindow.visibleObjects.text=FormatItems(status.UserVisibleObjectsComplete)+" of "+FormatItems(status.TotalUserVisibleObjects)+", "+FormatItems(status.UserVisibleObjectsRemaining)+" remaining."
		  MainWindow.Throughput.text=FormatBytes(status.Throughput)+" per second"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FormatBytes(n as int64) As string
		  if n=-1 then
		    Return "?"
		  else
		    Return Format(n/1024.0/1024.0,"-0")+" MB"
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatItems(n as int64) As string
		  if n=-1 then
		    Return "?"
		  else
		    Return Format(n,"-0")
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StageString(n as integer) As string
		  Select case n
		  case kFSOperationStageComplete
		    Return "Complete"
		  case kFSOperationStagePreflighting
		    Return "Preflighting"
		  case kFSOperationStageRunning
		    Return "Running"
		  case kFSOperationStageUndefined
		    Return "Undefined"
		  end Select
		  
		End Function
	#tag EndMethod


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
