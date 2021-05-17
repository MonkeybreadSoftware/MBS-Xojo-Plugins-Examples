#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim a as new ArchiveWriterMBS
		  
		  a.SetFormatZip
		  a.ZipSetCompressionDeflate
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.zip")
		  if not a.CreateFile(f) then
		    break // failed
		    
		  else
		    
		    dim data as string = "Hello World test file. Hello World again."
		    
		    dim e as new ArchiveEntryMBS
		    e.PathName = "Hello World.txt"
		    e.Size = lenb(data)
		    e.Permissions = &o0644
		    e.FileType = e.kFileTypeRegular
		    
		    a.WriteHeader e
		    call a.WriteData data
		    
		    a.FinishEntry
		    
		    a.Close
		  end if
		  
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
