#tag Class
Protected Class Work
Inherits thread
	#tag Event
		Sub Run()
		  log "Zip: "
		  
		  test
		  
		  log "BZip2: "
		  
		  test
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CompareFiles(fi as FolderItem, fo as FolderItem) As integer
		  dim bi,bo as BinaryStream
		  
		  bi=fi.OpenAsBinaryFile(false)
		  bo=fo.OpenAsBinaryFile(false)
		  
		  dim si,so as string
		  
		  si=bi.Read(bi.Length)
		  so=bo.Read(bo.Length)
		  
		  return StrCompBytesMBS(si,so)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CompressFile(fi as folderitem, fo as folderitem, chunk as integer, bzip as Boolean)
		  dim z as ZLibcompressMBS
		  dim o as String
		  dim bo,bi as BinaryStream
		  dim b as BZip2CompressMBS
		  
		  if bzip then
		    b = new BZip2CompressMBS
		  else
		    z = new ZLibcompressMBS(chunk)
		  end if
		  
		  bi = fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    break
		    errorMessage = "Can't open source file."
		    Return
		  end if
		  
		  bo = fo.CreateBinaryFile("application/x-compress")
		  if bo=nil then
		    break
		    errorMessage = "Can't open destination file."
		    Return
		  end if
		  
		  bo.LittleEndian=false
		  bo.WriteInt64 bi.Length
		  
		  if bzip then
		    b.InitZip(9)
		    
		    Progress1 = 0
		    
		    do
		      
		      if b.InputAvail=0 and not bi.eof then
		        if b.SetInput(bi.Read(chunk)) then
		          Progress1 = bi.Position*100.0/bi.Length
		          
		        else
		          Break
		          errorMessage = "SetInput failed!"
		          Return
		        end if
		      end if
		      
		      b.ProcessZip(False)
		      
		      o=b.GetOutput
		      bo.Write o
		      
		    loop until (lenb(o)=0 and b.OutputSize=0 and b.InputAvail=0 and bi.eof) or UserCancelled
		    
		    // maybe flush is needed?
		    
		    do
		      b.ProcessZip(true)
		      
		      o=b.GetOutput
		      bo.Write o
		      
		    loop until (lenb(o)=0 and b.OutputSize=0 and b.InputAvail=0 and bi.eof) or UserCancelled
		    
		    
		    // finish
		    
		    b.EndZip
		    
		    o=b.GetOutput
		    if o<>"" then
		      bo.Write o
		    end if
		  else
		    z.InitZip(9)
		    
		    Progress1 = 0
		    
		    do
		      
		      if z.InputAvail=0 and not bi.eof then
		        if z.SetInput(bi.Read(chunk)) then
		          Progress1 = bi.Position*100.0/bi.Length
		          
		        else
		          Break
		          errorMessage = "SetInput failed!"
		          Return
		        end if
		      end if
		      
		      z.ProcessZip(False)
		      
		      o=z.GetOutput
		      bo.Write o
		      
		    loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		    
		    // maybe flush is needed?
		    
		    do
		      z.ProcessZip(true)
		      
		      o=z.GetOutput
		      bo.Write o
		      
		    loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		    
		    
		    // finish
		    
		    z.EndZip
		    
		    o=z.GetOutput
		    if o<>"" then
		      bo.Write o
		    end if
		  end if
		  
		  bi.Close
		  bo.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DecompressFile(fi as FolderItem, fo as FolderItem, chunk as integer, bzip as Boolean)
		  // Decompress using the ZipCompressMBS class
		  
		  dim z as ZLibDecompressMBS
		  dim o as String
		  dim bo,bi as BinaryStream
		  dim l as integer
		  dim b as BZip2CompressMBS
		  
		  if bzip then
		    b = new BZip2CompressMBS
		  else
		    z=new ZLibDecompressMBS(chunk)
		  end if
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    errorMessage = "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("special/any")
		  if bo=nil then
		    break
		    errorMessage = "Can't open destination file."
		    Return
		  end if
		  
		  bi.LittleEndian=false
		  
		  l=bi.ReadInt64
		  
		  if bzip then
		    b.InitZip 9
		    
		    do
		      
		      if b.InputAvail=0 and not bi.eof then
		        if b.SetInput(bi.Read(30000)) then
		          Progress2 = bi.Position*100.0 / bi.Length
		          
		        else
		          break
		          // "SetInput failed!"
		          Return
		        end if
		      end if
		      
		      b.ProcessZip(False)
		      
		      o=b.GetOutput
		      bo.Write o
		      
		      // end when no data was created, no output is pending and no input is waiting and the file ended
		    loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		    
		    do
		      b.ProcessZip(true)
		      
		      o=b.GetOutput
		      bo.Write o
		      
		      // end when no data was created, no output is pending and no input is waiting and the file ended
		    loop until (lenb(o)=0 and b.OutputSize=0 and b.InputAvail=0 and bi.eof) or UserCancelled
		    
		    b.EndZip
		    
		    o=b.getOutput
		    if o<>"" then
		      bo.Write o
		    end if
		    
		  else
		    z.InitZip
		    
		    do
		      
		      if z.InputAvail=0 and not bi.eof then
		        if z.SetInput(bi.Read(30000)) then
		          Progress2 = bi.Position*100.0 / bi.Length
		          
		        else
		          break
		          // "SetInput failed!"
		          Return
		        end if
		      end if
		      
		      z.ProcessZip(False)
		      
		      o=z.GetOutput
		      bo.Write o
		      
		      // end when no data was created, no output is pending and no input is waiting and the file ended
		    loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		    
		    do
		      z.ProcessZip(true)
		      
		      o=z.GetOutput
		      bo.Write o
		      
		      // end when no data was created, no output is pending and no input is waiting and the file ended
		    loop until (lenb(o)=0 and z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		    
		    z.EndZip
		    
		    o=z.getOutput
		    if o<>"" then
		      bo.Write o
		    end if
		  end if
		  
		  bi.Close
		  bo.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Log(s as string)
		  logs.Append s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MakeTestData()
		  
		  // and some random data
		  dim m as MemoryBlock = New MemoryBlock(1024)
		  dim i,c as integer
		  dim r as new Random
		  
		  c=m.Size-1
		  for i=0 to c
		    m.Byte(i)=r.InRange(0,255)
		  next
		  
		  dim t as string = m.StringValue(0,m.Size)
		  dim a(-1) as string
		  
		  for i=0 to 300
		    a.Append t
		  next
		  
		  
		  data=join(a)
		  
		  log "Created test data: "+str(lenb(data))+" bytes"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PrepareFile(f as FolderItem, len as integer)
		  
		  dim stream as BinaryStream=f.CreateBinaryFile("")
		  dim d as string = leftb(data,len)
		  
		  stream.Write d
		  stream.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test(bzip as Boolean = false)
		  MakeTestData
		  TestFunction
		  TestClass 1024
		  TestClass 10240
		  TestClass 102400
		  TestClass 1024000
		  TestClass 10240000
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestClass(chunk as integer, bzip as Boolean = false)
		  for i as integer=1 to 10
		    log "Test Compress class"
		    
		    Progress2 = 0
		    Progress1 = 0
		    
		    dim len as integer=rnd*len(data)+1
		    dim uncompressedfile as FolderItem=SpecialFolder.Desktop.Child("ZipTests uncompressed file")
		    dim compressedfile   as FolderItem=SpecialFolder.Desktop.Child("ZipTests compressed file")
		    dim decompressedfile as FolderItem=SpecialFolder.Desktop.Child("ZipTests decompressed file")
		    
		    PrepareFile uncompressedfile,len
		    
		    log "   Uncompressed "+str(uncompressedfile.Length)+" bytes"
		    
		    CompressFile uncompressedfile,compressedfile,chunk, bzip
		    
		    log "   Compressed   "+str(compressedfile.Length)+" bytes"
		    
		    DeCompressFile compressedfile,decompressedfile,chunk, bzip
		    
		    log "   Decompressed "+str(decompressedfile.Length)+" bytes"
		    
		    if uncompressedfile.Length<>decompressedfile.Length then
		      log "  Error! files do not match in length."
		      break
		    end if
		    
		    if CompareFiles(uncompressedfile, decompressedfile)<>0 then
		      log "  Error! Strings do not match in content."
		      break
		    end if
		    
		    uncompressedfile.Delete
		      compressedfile.Delete
		    decompressedfile.Delete
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestFunction(bzip as Boolean = false)
		  
		  for i as integer=1 to 10
		    dim len as integer=rnd*len(data)+1
		    dim input as string = leftb(data,len)
		    
		    log "Test Compress function"
		    log "   Uncompressed "+str(lenb(input))+" bytes"
		    
		    dim compressed as string
		    
		    if bzip then
		      compressed = CompressBZip2MBS(input,9)
		    else
		      compressed = CompressZLibMBS(input,9)
		    end if
		    
		    log "   Compressed   "+str(lenb(compressed))+" bytes"
		    
		    dim Decompressed as string
		    
		    if bzip then
		      Decompressed = DecompressBZip2MBS(compressed, len+1000)
		    else
		      Decompressed = DecompressZLibMBS(compressed, len+1000)
		    end if
		    
		    log "   Decompressed "+str(lenb(decompressed))+" bytes"
		    
		    if lenb(input)<>lenb(Decompressed) then
		      log "  Error! Strings do not match in length."
		      break
		    end if
		    
		    if StrCompBytesMBS(Decompressed,input)<>0 then
		      log "  Error! Strings do not match in content."
		      break
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private data As string
	#tag EndProperty

	#tag Property, Flags = &h0
		errorMessage As string
	#tag EndProperty

	#tag Property, Flags = &h0
		logs() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Progress1 As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Progress2 As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Progress1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Progress2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="errorMessage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
