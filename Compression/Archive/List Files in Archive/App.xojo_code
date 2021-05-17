#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  
		  dim a as new ArchiveReaderMBS
		  a.SupportFilterAll
		  a.SupportFormatAll
		  
		  // open file 
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.zip")
		  
		  #if true then
		    
		    if not a.OpenFile(f) then
		      Break // path invalid?
		    end if
		    
		  #else
		    // or open from memory
		    dim b as BinaryStream = BinaryStream.Open(f)
		    dim s as string = b.Read(b.Length)
		    
		    if not a.OpenData(s) then
		      Break // problem?
		    end if
		    
		  #endif
		  
		  dim e as ArchiveEntryMBS = a.NextHeader
		  while e <> nil
		    
		    print e.PathName
		    
		    e = a.NextHeader
		  wend
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
