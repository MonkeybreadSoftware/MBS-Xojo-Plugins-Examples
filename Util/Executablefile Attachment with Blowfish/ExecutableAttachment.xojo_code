#tag Module
Protected Module ExecutableAttachment
	#tag Method, Flags = &h1
		Protected Sub Close()
		  // Closes stream to clean up
		  
		  stream=nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateFile(file as folderitem, template as folderitem) As boolean
		  // Create a new file based on an exe file on disc.
		  // file can be app.ExecutableFile
		  
		  dim bo as BinaryStream
		  dim bi as BinaryStream
		  
		  if template<>nil and file<>Nil then
		    bi=template.OpenAsBinaryFile(False)
		    if bi<>nil then
		      bo=file.CreateBinaryFile("application/binary")
		      if bo<>nil then
		        bo.Write bi.Read(bi.Length)
		        
		        return Init(bo,true)
		      end if
		    end if
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateFile(file as folderitem, template as string) As boolean
		  // creates file based on string
		  // you can drop an exe file into the project as a binary data file
		  // and use it for the template string
		  
		  dim bo as BinaryStream
		  
		  if template<>"" and file<>Nil then
		    bo=file.CreateBinaryFile("application/binary")
		    if bo<>nil then
		      bo.Write template
		      
		      return Init(bo,true)
		    end if
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Init(b as binaryStream, created as boolean) As boolean
		  dim p as integer
		  dim n as Integer
		  
		  b.Position=0
		  b.LittleEndian=true
		  
		  // All DOS applications have MZ on the beginning
		  if b.ReadUInt8=77 then // M
		    if b.ReadUInt8=90 then // Z
		      
		      if created then
		        Position=b.Length
		        stream=b
		        Return true
		      end if
		      
		      b.Position=b.Length-8
		      
		      n=b.ReadInt32
		      
		      if n=&h20975867 then // our magic value!
		        
		        p=b.ReadInt32
		        
		        if p>100000 then
		          position=p
		          stream=b
		          Return true
		        end if
		      else
		        position=b.Length
		        stream=b
		        Return true
		      end if
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OpenFile(file as folderitem, Write as boolean) As boolean
		  // opens a file 
		  // Write must be false if file is app.ExecutableFile
		  
		  dim b as BinaryStream
		  
		  if file<>Nil then
		    b=file.OpenAsBinaryFile(write)
		    if b<>nil then
		      Return init(b,false)
		    else
		      System.DebugLog "OpenFile: failed to open "+file.name
		    end if
		  else
		    System.DebugLog "OpenFile: file=nil"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Read() As String
		  // Reads contents
		  // Remember that text encoding is binary for this string!
		  
		  stream.Position=position
		  return stream.Read(stream.Length-position-8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Write(s as string)
		  // Writes
		  
		  stream.Position=position
		  stream.Write s
		  stream.WriteInt32 &h20975867
		  stream.WriteInt32 position
		  stream.Length=stream.Position // cut away rest
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private position As integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private stream As binaryStream
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
End Module
#tag EndModule
