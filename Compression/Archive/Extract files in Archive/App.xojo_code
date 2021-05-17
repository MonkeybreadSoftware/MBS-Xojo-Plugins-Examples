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
		  
		  if not a.OpenFile(f) then
		    Break // path invalid?
		  end if
		  
		  dim e as ArchiveEntryMBS = a.NextHeader
		  while e <> nil
		    
		    dim pathname as string = E.PathName
		    dim filetype as integer = e.FileType
		    dim file as FolderItem = ParsePath(f.parent, pathname)
		    
		    
		    Select case filetype
		    case e.kFileTypeRegular
		      
		      // write file
		      dim b as BinaryStream = BinaryStream.Create(file, true)
		      
		      do
		        dim data as string = a.ReadDataString(1024*1024)
		        if a.lasterror <> 0 then
		          break // error
		          exit
		        end if
		        
		        if data.lenb = 0 then
		          exit // finished
		        else
		          b.Write(data)
		        end if
		      loop
		      
		    case e.kFileTypeDirectory
		      // create directory
		      file.CreateAsFolder
		      
		    else
		      break
		    end Select
		    
		    e = a.NextHeader
		  wend
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ParsePath(baseFolder as folderitem, s as string) As FolderItem
		  // strip / from beginning or ending
		  
		  if left(s,1) = "/" then 
		    s = mid(s,2)
		  end if
		  
		  if right(s,1) = "/" then 
		    s = left(s,s.len-1)
		  end if
		  
		  dim parts() as string = split(s, "/")
		  dim f as FolderItem = baseFolder
		  
		  dim u as integer = parts.Ubound
		  For i As Integer = 0 To u
		    Dim FolderName As String = parts(i)
		    
		    #if TargetWindows then
		      FolderName = Trim(FolderName) // no spaces on end or beginning of file name for Windows
		    #EndIf
		    
		    f = f.Child(FolderName)
		    
		    If i < u Then
		      // create folders as needed for path components.
		      f.CreateAsFolder
		    end if
		  Next
		  
		  
		  Return f
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
