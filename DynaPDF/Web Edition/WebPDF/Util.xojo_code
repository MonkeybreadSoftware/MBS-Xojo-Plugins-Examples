#tag Module
Protected Module Util
	#tag Method, Flags = &h0
		Function FindFolder(name as string) As FolderItem
		  dim f as FolderItem = app.ExecutableFile.parent
		  
		  while f<>nil
		    
		    dim d as FolderItem = f.Child(name)
		    if d<>nil and d.Exists then
		      Return d
		    end if
		    
		    f = f.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetObjectClassNameMBS(o as Object) As string
		  dim t as Introspection.TypeInfo = Introspection.GetType(o)
		  Return t.FullName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPDFPageCount(file as FolderItem) As integer
		  dim result as integer = -1
		  
		  dim d as new MyDynaPDFMBS
		  
		  if d.CreateNewPDF(nil) then
		    if d.SetImportFlags(d.kifImportAsPage) then
		      if d.OpenImportFile(file, 0, "")=0 then
		        result = d.GetInPageCount
		        
		        call d.CloseImportFile
		      end if
		    end if
		    call d.CloseFile
		  end if
		  
		  Return result
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteFile(file as FolderItem, data as string) As Boolean
		  #pragma DisableBackgroundTasks
		  
		  dim b as BinaryStream = BinaryStream.Create(file, false)
		  
		  if b<>Nil then
		    b.Write data
		    b.Close
		    Return true
		  end if
		  
		  
		  Exception io as IOException
		    
		    Return false
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WriteUniqueFile(folder as FolderItem, data as string, name as string) As FolderItem
		  #pragma DisableBackgroundTasks
		  
		  // simple case
		  dim file as FolderItem = folder.Child(name)
		  
		  if file.Exists = false then
		    if WriteFile(file,data) then
		      Return file
		    end if
		  end if
		  
		  // now try a few other variants
		  name = ReplaceAll(name, ".pdf", "")
		  
		  for n as integer = 1 to 99
		    dim newname as string = name+" "+str(n)+".pdf"
		    
		    file = folder.Child(newname)
		    
		    if file.Exists = false then
		      if WriteFile(file,data) then
		        Return file
		      end if
		    end if
		  next
		  
		  // names all taken, try counting:
		  
		  for n as integer = 1 to 99
		    dim newname as string = str(n)+".pdf"
		    
		    file = folder.Child(newname)
		    
		    if file.Exists = false then
		      if WriteFile(file,data) then
		        Return file
		      end if
		    end if
		  next
		  
		  // give up
		  Return nil
		  
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
End Module
#tag EndModule
