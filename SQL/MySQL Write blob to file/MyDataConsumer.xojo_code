#tag Class
Protected Class MyDataConsumer
Inherits SQLDataConsumerMBS
	#tag Event
		Sub Write(PieceType as integer, data as string, Length as UInt32, BlobSize as UInt32)
		  if PieceType = kFirstPiece or PieceType = kOnePiece then
		    size = 0
		    b=file.CreateBinaryFile("")
		    
		    if b=nil then
		      MsgBox "Failed to create the file!"
		      Return
		    end if
		  end if
		  
		  b.Write data
		  
		  size=size+Length
		  
		  // show progress
		  MsgBox str(size)+" bytes of "+str(BlobSize)+" read."
		  
		  if PieceType = kLastPiece or PieceType = kOnePiece then
		    b.Close
		    b=nil
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(f as FolderItem)
		  file=f
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private b As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Size As UInt64
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
