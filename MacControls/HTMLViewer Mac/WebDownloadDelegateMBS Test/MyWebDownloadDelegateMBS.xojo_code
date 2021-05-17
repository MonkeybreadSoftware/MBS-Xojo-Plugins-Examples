#tag Class
Protected Class MyWebDownloadDelegateMBS
Inherits WebDownloadDelegateMBS
	#tag Event
		Sub decideDestinationWithSuggestedFilename(download as NSURLDownloadMBS, filename as string)
		  l.AddRow "Download to desktop folder."
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child(filename)
		  
		  download.setDestination file, false
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didBegin(download as NSURLDownloadMBS)
		  l.AddRow "Download did begin."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didCreateDestination(download as NSURLDownloadMBS, path as string, file as folderitem)
		  l.AddRow "Created Destination File: "+file.Name
		  
		  self.file = file
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinish(download as NSURLDownloadMBS)
		  l.AddRow "Download did finish."
		  
		  
		  if file<>nil then
		    // show file in finder
		    
		    dim w as new NSWorkspaceMBS
		    
		    call w.selectFile(File)
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveDataOfLength(download as NSURLDownloadMBS, length as UInt64)
		  downloaded = downloaded + length
		  
		  l.AddRow "Downloading "+Format(downloaded/expectedContentLength,"0%")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveResponse(download as NSURLDownloadMBS, response as NSURLResponseMBS)
		  expectedContentLength = response.expectedContentLength
		  l.AddRow "Did receive response: "+str(expectedContentLength)+" bytes"
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		downloaded As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		expectedContentLength As uint64
	#tag EndProperty

	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		l As listbox
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
			Name="expectedContentLength"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="uint64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="downloaded"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
