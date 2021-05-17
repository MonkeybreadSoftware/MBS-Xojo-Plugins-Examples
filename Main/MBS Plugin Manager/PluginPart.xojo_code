#tag Class
Protected Class PluginPart
	#tag Method, Flags = &h0
		Sub Move(oldname as string, newname as string, filename as string)
		  dim e,d as FolderItem
		  dim f as FolderItem
		  dim g as FolderItem
		  dim b as BinaryStream
		  dim s as string
		  
		  if filename<>"" then
		    e=buildresources.TrueChild(oldname)
		    d=buildresources.TrueChild(newname)
		    
		    e.CreateAsFolder
		    d.CreateAsFolder
		    
		    f=e.TrueChild(fileName)
		    g=d.TrueChild(fileName)
		    
		    b=f.OpenAsBinaryFile(false)
		    s=B.Read(b.Length)
		    b.Close
		    
		    f.Delete
		    
		    b=g.CreateBinaryFile("text")
		    b.Write s
		    b.Close
		    
		    'MsgBox f.NativePath+" to "+g.NativePath
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(state as boolean)
		  
		  if buildresources<>nil then
		    if state then
		      // enable
		      
		      Move "Linux X86 Disabled", "Linux X86", LinuxName
		      Move "Windows Disabled", "Windows", WindowsName
		      Move "Mac Cocoa Disabled", "Mac Cocoa", MacCocoaName
		      Move "Mac Carbon Disabled", "Mac Carbon Mach-O Universal", MacCarbonMachOName
		      
		    else
		      // disable
		      
		      Move "Linux X86","Linux X86 Disabled", LinuxName
		      Move "Windows","Windows Disabled", WindowsName
		      Move "Mac Cocoa","Mac Cocoa Disabled", MacCocoaName
		      Move "Mac Carbon Mach-O Universal","Mac Carbon Disabled", MacCarbonMachOName
		      
		    end if
		    
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		buildresources As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		file As folderitem
	#tag EndProperty

	#tag Property, Flags = &h0
		ID As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LinuxName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MacCarbonMachOName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MacCocoaName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		StateBefore As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsName As string
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
		#tag ViewProperty
			Name="ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StateBefore"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LinuxName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WindowsName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacCarbonMachOName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MacCocoaName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
