#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const WindowBits = 15
		  const memLevel = 8
		  const password = "Hello"
		  
		  dim z as ZipMBS
		  dim f as FolderItem
		  dim d as date
		  dim b as BinaryStream
		  dim info as ZipFileInfoMBS
		  
		  f=SpecialFolder.Desktop.Child("test.zip")
		  
		  z=new ZipMBS(f,0)
		  
		  f=FindFile("ZLib Readme and License.txt")
		  b=f.OpenAsBinaryFile(false)
		  
		  d=f.ModificationDate
		  info=new ZipFileInfoMBS
		  
		  'info.Day=d.day
		  'info.Month=d.Month-1
		  'info.Year=d.Year
		  'info.Minute=d.Minute
		  'info.hour=d.hour
		  'info.Second=d.Second
		  info.SetDate d
		  
		  info.ExternalFileAttributes=0
		  info.InternalFileAttributes=0
		  info.DosDate=0
		  
		  dim data as string = b.Read(b.Length)
		  dim crc as integer = CRC32StringMBS(0, data)
		  
		  z.CreateFile("zip.rbp", info, "", "", "", z.MethodDeflated, z.CompressionBestCompression, false, false, WindowBits, memLevel, z.StrategyDefault, password, crc)
		  z.Write data
		  z.CloseFile
		  
		  
		  z.Close("global comment")
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
