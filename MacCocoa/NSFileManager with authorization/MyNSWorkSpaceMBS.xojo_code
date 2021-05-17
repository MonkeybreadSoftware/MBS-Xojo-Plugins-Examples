#tag Class
Protected Class MyNSWorkSpaceMBS
Inherits NSWorkSpaceMBS
	#tag Event
		Sub requestAuthorizationCompleted(type as Integer, authorization as NSWorkspaceAuthorizationMBS, error as NSErrorMBS, tag as variant)
		  
		  If error <> Nil Then
		    MsgBox error.LocalizedDescription
		  End If
		  
		  If authorization <> Nil Then
		    Dim fm As NSFileManagerMBS = NSFileManagerMBS.fileManagerWithAuthorization(authorization)
		    
		    MsgBox "got file manager with authorization"+EndOfLine+Str(fm.Handle)
		    
		    // now do something non evil!
		    
		    Select Case type
		    Case NSWorkspaceAuthorizationTypeCreateSymbolicLink
		      // e.g. create symbolic link to our file
		      
		      Dim source As FolderItem = SpecialFolder.Desktop.Child("test.txt")
		      Dim b As BinaryStream = BinaryStream.Create(source, True)
		      b.Write "Hello World"
		      
		      // now move to some place you may normally not be allowed to move it
		      Dim linkfile As FolderItem = GetFolderItem("/usr/local/test.txt", folderitem.PathTypeNative)
		      
		      Dim result As Boolean
		      
		      error = Nil
		      result = fm.createSymbolicLink(linkfile, source, error)
		      
		      If result Then
		        Call NSWorkspaceMBS.selectFile(linkfile)
		        MsgBox "Success"
		      Else
		        MsgBox error.LocalizedDescription
		      End If
		      
		      
		    Case NSWorkspaceAuthorizationTypeSetAttributes
		      // e.g. make file for root
		      Dim source As FolderItem = SpecialFolder.Desktop.Child("test.txt")
		      Dim b As BinaryStream = BinaryStream.Create(source, True)
		      b.Write "Hello World"
		      
		      
		      Dim dic As New Dictionary
		      dic.Value(fm.NSFileOwnerAccountID) = 0
		      dic.Value(fm.NSFileGroupOwnerAccountID) = 0
		      dic.Value(fm.NSFilePosixPermissions) = &o755
		      
		      Dim result As Boolean
		      
		      error = Nil
		      result = fm.setAttributes(dic, source, error)
		      
		      If result Then
		        MsgBox "OK"
		      Else
		        MsgBox error.LocalizedDescription
		      End If
		      
		      
		    case NSWorkspaceAuthorizationTypeReplaceFile
		      // e.g. move a file to a location
		      Dim source As FolderItem = SpecialFolder.Desktop.Child("test.txt")
		      Dim b As BinaryStream = BinaryStream.Create(source, True)
		      b.Write "Hello World"
		      
		      // now move to some place you may normally not be allowed to move it
		      Dim dest As FolderItem = volume(0).Child("dest.txt")
		      
		      Dim result As Boolean
		      Dim output As FolderItem
		      error = Nil
		      result = fm.replaceItem(dest, source, "", 0, output, error)
		      
		      If result Then
		        MsgBox output.NativePath
		      Else
		        MsgBox error.LocalizedDescription
		      End If
		      
		      
		    End Select
		    
		    
		  End If
		  
		End Sub
	#tag EndEvent


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
	#tag EndViewBehavior
End Class
#tag EndClass
