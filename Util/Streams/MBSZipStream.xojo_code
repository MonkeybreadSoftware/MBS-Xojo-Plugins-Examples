#tag Class
Protected Class MBSZipStream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(d as MBSStream, Level as integer=9)
		  theDestination=d
		  theLevel=Level
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(n as integer) As string
		  dim s as string
		  dim m as MemoryBlock
		  dim OrigLen, BlockLen as integer
		  
		  do
		    if n=lenb(ReadBuf) then
		      s=ReadBuf
		      ReadBuf=""
		      Return s
		    elseif n<lenb(ReadBuf) then
		      s=leftb(ReadBuf,n)
		      ReadBuf=mid(ReadBuf,n+1)
		      
		      Return s
		    end if
		    
		    s=theDestination.Read(8)
		    
		    if s="" then
		      s=readbuf // no more data, return what we have
		      readbuf=""
		      Return s
		    end if
		    
		    m=s
		    m.LittleEndian=false
		    OrigLen=m.Long(0)
		    BlockLen=m.Long(4)
		    
		    s=theDestination.Read(BlockLen)
		    
		    if s="" then
		      s=readbuf // no more data, return what we have
		      readbuf=""
		      Return s
		    end if
		    
		    ReadBuf=ReadBuf+DecompressZLibMBS(s,OrigLen)
		    
		  loop
		  
		  
		  Exception 
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  dim s as string
		  dim m as MemoryBlock
		  
		  if data<>"" then
		    s=CompressZLibMBS(data,theLevel) // needs Compression Plugin
		    
		    m=NewMemoryBlock(8)
		    m.LittleEndian=false
		    m.long(0)=lenb(data)
		    m.long(4)=lenb(s)
		    
		    theDestination.Write m
		    theDestination.Write s
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		A stream which compresses all stuff going through
		Please do not use with small blocks as it'll be inefficient
		Better e.g. 100KB blocks
		
		Use MBSBufferStream for better results
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private ReadBuf As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theDestination As MBSStream
	#tag EndProperty

	#tag Property, Flags = &h0
		theLevel As integer
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
			Name="theLevel"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
