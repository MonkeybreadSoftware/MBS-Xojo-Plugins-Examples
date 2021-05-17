#tag Class
Protected Class MBSBufferStream
Implements MBSStream
	#tag Method, Flags = &h0
		Sub Constructor(dest as MBSStream, BufferSize as integer)
		  theDestination=dest
		  theBufferSize=BufferSize
		  theBuffer=NewMemoryBlock(BufferSize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  if thePosition>0 then
		    // write buffer to output
		    theDestination.Write theBuffer.StringValue(0,thePosition)
		    thePosition=0
		    theBuffer=nil
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(count as integer) As string
		  Return theDestination.Read(count) // do nothing like dummy
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(buffer as string)
		  dim l,c,w as integer
		  dim p as integer
		  
		  l=lenb(buffer) // bytes to write
		  
		  if l>theBufferSize and thePosition=0 then
		    // if nothing in buffer and big block, just send through
		    
		    theDestination.Write buffer
		    
		  else
		    
		    p=0 // position in source buffer
		    
		    while l>0
		      c=theBufferSize-thePosition // c=free space
		      w=l // bytes to write
		      if w>c then // limit to free space
		        w=c
		      end if
		      
		      theBuffer.StringValue(thePosition,w)=midb(buffer,p+1,w)
		      p=p+w
		      l=l-w
		      thePosition=thePosition+w
		      
		      if thePosition=theBufferSize then // flush buffer
		        theDestination.Write theBuffer.StringValue(0,thePosition)
		        thePosition=0
		      end if
		      
		    wend
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private theBuffer As memoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theBufferSize As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private theDestination As MBSStream
	#tag EndProperty

	#tag Property, Flags = &h21
		Private thePosition As integer
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
