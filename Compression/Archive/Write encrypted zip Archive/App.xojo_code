#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim a as new ArchiveWriterMBS
		  
		  a.SetFormatZip
		  a.ZipSetCompressionDeflate
		  
		  // older one
		  'a.SetOptions "zip:encryption=zipcrypt"  
		  
		  // AES 256bit is better!
		  a.SetOptions "zip:encryption=aes256"  
		  
		  if a.Lasterror <> 0 then
		    dim e as string = "Error: "+str(a.Lasterror)+": "+a.ErrorString
		    Break
		    print e
		  end if
		  
		  a.SetPassphrase "hello"
		  
		  if a.Lasterror <> 0 then
		    dim e as string = "Error: "+str(a.Lasterror)+": "+a.ErrorString
		    Break
		    print e
		  end if
		  
		  
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.zip")
		  if not a.CreateFile(f) then
		    break // failed
		    
		    dim e as string = "Error: "+str(a.Lasterror)+": "+a.ErrorString
		    Break
		    print e
		    
		  else
		    
		    dim data as string = "Hello World test file. Hello World again."
		    
		    dim e as new ArchiveEntryMBS
		    e.PathName = "Hello World.txt"
		    e.Size = lenb(data)
		    e.Permissions = &o0644
		    e.FileType = e.kFileTypeRegular
		    
		    a.WriteHeader e
		    
		    if a.Lasterror <> 0 then
		      dim e as string = "Error: "+str(a.Lasterror)+": "+a.ErrorString
		      Break
		      print e
		    end if
		    
		    call a.WriteData data
		    
		    if a.Lasterror <> 0 then
		      dim e as string = "Error: "+str(a.Lasterror)+": "+a.ErrorString
		      Break
		      print e
		    end if
		    
		    a.FinishEntry
		    
		    if a.Lasterror <> 0 then
		      dim e as string = "Error: "+str(a.Lasterror)+": "+a.ErrorString
		      Break
		      print e
		    end if
		    
		    a.Close
		  end if
		  
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
