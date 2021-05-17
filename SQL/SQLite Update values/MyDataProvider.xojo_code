#tag Class
Protected Class MyDataProvider
Inherits SQLDataProviderMBS
	#tag Event
		Function Read(byref PieceType as integer, Length as UInt32) As string
		  
		  if (PieceType = kFirstPiece) then
		    b=file.OpenAsBinaryFile
		    
		    size=0
		    if b=nil then
		      MsgBox "Failed to open file for reading!"
		    end if
		  end if
		  
		  dim buf as string = b.Read(Length)
		  
		  size=size+lenb(buf) // count how much we read already
		  
		  // show progress
		  MsgBox str(size)+" bytes of file read."
		  
		  if b.EOF then
		    PieceType = kLastPiece
		    b.Close
		    b=nil
		  end if
		  
		  return buf
		  
		End Function
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
