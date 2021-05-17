#tag Class
Protected Class MBSAESstream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(dest as MBSStream, key as string)
		  dim m as MemoryBlock
		  
		  d=Dest
		  aes=new AESMBS
		  
		  m=key
		  
		  if not aes.SetKey(m,128) then
		    Raise new RuntimeException
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(n as integer) As string
		  dim s as string
		  dim i,c as integer
		  dim m as MemoryBlock
		  dim ms as MemoryBlock
		  dim offset as integer
		  dim OrigLen as integer
		  dim BlockLen as integer
		  
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
		    
		    s=d.Read(8)
		    if s="" then
		      s=readbuf // no more data, return what we have
		      readbuf=""
		      Return s
		    end if
		    
		    m=s
		    m.LittleEndian=false
		    OrigLen=m.Long(0)
		    BlockLen=m.Long(4)
		    s=d.Read(BlockLen)
		    if s="" then
		      Return ""
		    end if
		    
		    c=BlockLen\16
		    offset=0
		    ms=s
		    
		    for i=1 to c
		      
		      m=ms.StringValue(offset,16)
		      
		      aes.Decrypt m
		      
		      ms.StringValue(offset,16)=m.StringValue(0,16)
		      
		      offset=offset+16
		    next
		    
		    ReadBuf=ReadBuf+ms.StringValue(0,OrigLen)
		  loop
		  
		  Exception 
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(data as string)
		  dim s as string
		  dim i,c as integer
		  dim m as MemoryBlock
		  dim ms as MemoryBlock
		  dim offset as integer
		  
		  s=data+"                  " // to pad to a 16 byte len
		  
		  c=lenb(s)\16
		  offset=0
		  ms=s
		  
		  for i=1 to c
		    
		    m=ms.StringValue(offset,16)
		    
		    aes.Encrypt m
		    
		    ms.StringValue(offset,16)=m.StringValue(0,16)
		    
		    offset=offset+16
		  next
		  
		  m=NewMemoryBlock(8)
		  m.LittleEndian=false
		  m.long(0)=lenb(data)
		  m.long(4)=c*16
		  
		  d.Write m
		  d.Write ms.StringValue(0,c*16)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aes As AESMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		d As MBSStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReadBuf As string
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
	#tag EndViewBehavior
End Class
#tag EndClass
