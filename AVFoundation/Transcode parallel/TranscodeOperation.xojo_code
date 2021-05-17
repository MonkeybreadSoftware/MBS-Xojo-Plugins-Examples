#tag Class
Protected Class TranscodeOperation
	#tag Method, Flags = &h0
		Sub Cleanup()
		  
		  if assetWriter<>nil then
		    call assetWriter.finishWriting
		  end if
		  
		  if assetReader<>nil then
		    assetReader.cancelReading
		  end if
		  
		  app.log "Done. File size is "+str(exportFile.Length)+" bytes."
		  
		  
		  // release a lot of stuff
		  assetReader = nil
		  assetReaderOutput = nil
		  assetWriter = nil
		  assetWriterInput = nil
		  
		  
		  
		  Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  
		  // remove from global list
		  dim n as integer = Operations.IndexOf(self)
		  
		  if n>=0 then
		    Operations.Remove n
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // get a new ID
		  static IDCounter as integer
		  
		  IDCounter = IDCounter + 1
		  ID = IDCounter
		  
		  Operations.Append self
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Operation(ID as integer) As TranscodeOperation
		  for each o as TranscodeOperation in Operations
		    if o.ID = ID then
		      Return o
		    end if
		  next
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		assetReader As AVAssetReaderMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		assetReaderOutput As AVAssetReaderOutputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		assetWriter As AVAssetWriterMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		assetWriterInput As AVAssetWriterInputMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		exportFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Operations() As TranscodeOperation
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
			InitialValue="-2147483648"
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
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
