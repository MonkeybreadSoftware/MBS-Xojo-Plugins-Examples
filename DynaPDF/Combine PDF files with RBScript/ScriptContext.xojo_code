#tag Class
Protected Class ScriptContext
	#tag Method, Flags = &h0
		Function Child(path as string, name as string) As string
		  dim f as FolderItem = GetFolderItem(path, FolderItem.PathTypeShell)
		  dim g as FolderItem = f.Child(name)
		  
		  Return g.ShellPath
		  
		  Exception u as UnsupportedFormatException
		    // invalid path?
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloseFile() As Boolean
		  return pdf.CloseFile
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloseImportFile() As Boolean
		  Return pdf.CloseImportFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(p as MyDynaPDFMBS)
		  pdf = p
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DesktopPath() As string
		  Return SpecialFolder.Desktop.ShellPath
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPageCount() As integer
		  Return pdf.GetPageCount
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ImportPDFFile(DestPageNumber as Integer) As integer
		  return pdf.ImportPDFFile(DestPageNumber)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Launch(path as string)
		  dim f as FolderItem = GetFolderItem(path, FolderItem.PathTypeShell)
		  
		  f.launch
		  
		  Exception u as UnsupportedFormatException
		    // invalid path?
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenImportFile(path as string) As integer
		  dim f as FolderItem = GetFolderItem(path, FolderItem.PathTypeShell)
		  
		  Return pdf.OpenImportFile(F)
		  
		  Exception u as UnsupportedFormatException
		    Return -1 // invalid path?
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartNewPDF(path as string) As Boolean
		  dim f as FolderItem = GetFolderItem(path, FolderItem.PathTypeShell)
		  
		  return pdf.CreateNewPDF(f)
		  
		  Exception u as UnsupportedFormatException
		    Return false // invalid path?
		    
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private pdf As MyDynaPDFMBS
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
