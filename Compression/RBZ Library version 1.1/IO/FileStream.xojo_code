#tag Class
Protected Class FileStream
Implements StreamReader,   StreamWriter,  Readable,  Writeable
	#tag Method, Flags = &h0
		Sub constructor(b as binaryStream)
		  stream = b
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(file as folderItem, type as filetype = nil)
		  if not file.Exists then
		    if type = nil then
		      stream = file.CreateBinaryFile("")
		    else
		      stream = file.CreateBinaryFile(type)
		    end
		  else
		    stream = file.OpenAsBinaryFile(true)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(file as folderItem, type as filetype = nil, littleEndian as boolean)
		  constructor (file, type)
		  stream.LittleEndian = littleEndian
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function eof() As boolean
		  // Part of the StreamReader interface.
		  // Part of the Readable interface.
		  
		  return stream.EOF
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub flush()
		  // Part of the StreamWriter interface.
		  
		  stream.Flush
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getLength() As uint64
		  return stream.Length
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getPosition() As uint64
		  // Part of the StreamReader interface.
		  // Part of the StreamWriter interface.
		  
		  return stream.Position
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getString() As String
		  // Part of the StringProvider interface.
		  
		  dim pos as uint64 = stream.Position
		  stream.Position = 0
		  dim text as string = stream.Read(stream.Length)
		  stream.Position = pos
		  return text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  // Part of the Readable interface.
		  
		  return stream.read(count,encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readAll(encoding as textEncoding = nil) As string
		  return readString(stream.Length-stream.Position,encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readCString(encoding as TextEncoding = nil) As String
		  // Part of the StreamReader interface.
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadError() As Boolean
		  // Part of the Readable interface.
		  
		  return stream.ReadError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt16() As int16
		  // Part of the StreamReader interface.
		  
		  return stream.ReadInt16
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt32() As int32
		  // Part of the StreamReader interface.
		  
		  return stream.ReadInt32
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt64() As int64
		  // Part of the StreamReader interface.
		  
		  return stream.ReadInt64
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readInt8() As int8
		  // Part of the StreamReader interface.
		  
		  return stream.ReadInt8
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readPString(encoding as TextEncoding = nil) As String
		  // Part of the StreamReader interface.
		  
		  dim len as uint8 = readUInt8
		  return readString(len,encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readString(bytes as uint64, encoding as TextEncoding = nil) As String
		  // Part of the StreamReader interface.
		  
		  return stream.Read(bytes,encoding)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt16() As Uint16
		  // Part of the StreamReader interface.
		  
		  return stream.ReadUInt16
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt32() As Uint32
		  // Part of the StreamReader interface.
		  
		  return stream.ReadUInt32
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt64() As Uint64
		  // Part of the StreamReader interface.
		  
		  return stream.ReadUInt64
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function readUInt8() As Uint8
		  // Part of the StreamReader interface.
		  
		  return stream.ReadUInt8
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rewind(bytes as Uint64)
		  stream.Position = stream.Position - bytes
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setPosition(pos as uInt64)
		  stream.Position = pos
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setString(Str As String)
		  // Part of the StringInterface interface.
		  
		  stream.Position = 0
		  stream.Write str
		  stream.Length = stream.Position
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub skip(bytes as uint64)
		  // Part of the StreamReader interface.
		  // Part of the StreamWriter interface.
		  
		  stream.Position = stream.Position + bytes
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub truncate()
		  //truncate the file to the current position
		  stream.Length = stream.Position
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(text As String)
		  // Part of the Writeable interface.
		  
		  stream.Write(text)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeCString(text as string)
		  // Part of the StreamWriter interface.
		  
		  stream.Write(text)
		  stream.WriteUInt8 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteError() As Boolean
		  // Part of the Writeable interface.
		  
		  return stream.WriteError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt16(value as int16)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteInt16 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt32(value as int32)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteInt32 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt64(value as Int64)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteInt64 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeInt8(value as int8)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteInt8 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writePString(text as string)
		  // Part of the StreamWriter interface.
		  
		  dim ln as UInt8 = min(text.lenb,255)
		  stream.WriteInt8 ln
		  stream.Write text.LeftB(ln)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeString(text as string)
		  // Part of the StreamWriter interface.
		  
		  stream.Write text
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt16(value as Uint16)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteUInt16 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt32(value as Uint32)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteUInt32 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt64(value as Uint64)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteUInt64 value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub writeUInt8(value as Uint8)
		  // Part of the StreamWriter interface.
		  
		  stream.WriteUInt8 value
		End Sub
	#tag EndMethod


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
	#tag EndViewBehavior
End Class
#tag EndClass
