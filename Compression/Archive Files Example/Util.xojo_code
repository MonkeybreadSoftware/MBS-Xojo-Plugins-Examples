#tag Module
Protected Module Util
	#tag Method, Flags = &h0
		Sub AddFile(b as binaryStream, file as folderitem)
		  dim n as string
		  dim l,ll as integer
		  dim bb as BinaryStream
		  dim s as string
		  dim ss as string
		  
		  b.Write "FILE"
		  
		  // first name
		  
		  n=file.Name
		  
		  l=lenb(n)
		  b.WriteInt32 l
		  b.Write n
		  
		  // creator
		  
		  n=file.MacCreator
		  l=lenb(n)
		  b.WriteInt32 l
		  b.Write n
		  
		  // type
		  
		  n=file.MacCreator
		  l=lenb(n)
		  b.WriteInt32 l
		  b.Write n
		  
		  // content
		  
		  l=0
		  bb=file.OpenAsBinaryFile(false)
		  
		  if bb<>nil then
		    l=bb.Length
		    s=bb.Read(l)
		  end if
		  
		  b.WriteInt32 l // uncompressed size
		  
		  if l>0 then
		    
		    ss=CompressZLibMBS(s,9)
		    
		    ll=lenb(ss)
		    
		    if ll>=l then // compressed bigger than uncompressed?
		      ss=S
		      ll=l
		    end if
		    
		    b.WriteInt32 ll
		    b.Write ss
		  else
		    b.WriteInt32 0 // nothing inside
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountFiles(b as binaryStream) As integer
		  dim n,count as integer
		  dim s as string
		  dim l,c as integer
		  
		  n=b.Position
		  
		  b.Position=0 // start at start
		  
		  count=0
		  while not b.eof
		    s=b.Read(4)
		    
		    if s="FILE" then
		      count=count+1
		      
		      l=b.ReadInt32
		      s=b.Read(l)
		      
		      l=b.ReadInt32
		      s=b.Read(l)
		      
		      l=b.ReadInt32
		      s=b.Read(l)
		      
		      l=b.ReadInt32
		      c=b.ReadInt32
		      s=b.Read(c)
		      
		    end if
		    
		  wend
		  
		  
		  b.Position=n
		  Return count
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractFile(b as binaryStream, index as integer, dest as folderitem) As folderitem
		  dim n,count as integer
		  dim s,Name,Type,Creator,Content as string
		  dim l,c as integer
		  dim f as FolderItem
		  dim bb as BinaryStream
		  
		  n=b.Position
		  
		  b.Position=0 // start at start
		  
		  count=0
		  while not b.eof
		    s=b.Read(4)
		    
		    if s="FILE" then
		      count=count+1
		      
		      l=b.ReadInt32
		      Name=b.Read(l)
		      
		      l=b.ReadInt32
		      Creator=b.Read(l)
		      
		      l=b.ReadInt32
		      Type=b.Read(l)
		      
		      l=b.ReadInt32
		      c=b.ReadInt32
		      Content=b.Read(c)
		      
		      if index=count then
		        if l<>c then // decompress if needed
		          Content=DecompressZLibMBS(Content,l)
		        end if
		        
		        f=dest.Child(name)
		        
		        bb=f.CreateBinaryFile("application/binary")
		        
		        if bb=nil then
		          f=nil
		        else
		          bb.Write content
		          bb.Close
		          
		          #If RBVersion < 2019
		            f.MacType = type
		            f.MacCreator = Creator
		          #endif
		        End If
		      End If
		    end if
		    
		  wend
		  
		  
		  b.Position=n
		  Return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractPicture(b as binaryStream, index as integer) As picture
		  dim n,count as integer
		  dim s,Name,Type,Creator,Content as string
		  dim l,c as integer
		  
		  n=b.Position
		  
		  b.Position=0 // start at start
		  
		  count=0
		  while not b.eof
		    s=b.Read(4)
		    
		    if s="FILE" then
		      count=count+1
		      
		      l=b.ReadInt32
		      Name=b.Read(l)
		      
		      l=b.ReadInt32
		      Creator=b.Read(l)
		      
		      l=b.ReadInt32
		      Type=b.Read(l)
		      
		      l=b.ReadInt32
		      c=b.ReadInt32
		      Content=b.Read(c)
		      
		      if index=count then
		        if l<>c then // decompress if needed
		          Content=DecompressZLibMBS(Content,l)
		        end if
		        
		        b.Position=n
		        Return picture.FromData(content)
		      end if
		    end if
		    
		  wend
		  
		  
		  b.Position=n
		  
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
End Module
#tag EndModule
