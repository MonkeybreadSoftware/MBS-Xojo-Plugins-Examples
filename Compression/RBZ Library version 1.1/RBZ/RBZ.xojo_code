#tag Module
Protected Module RBZ
	#tag Method, Flags = &h0
		Function createAsZipArchive(extends archive as folderItem) As ZipArchive
		  if archive.Exists then archive.Delete
		  return new ZipArchive(archive)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function openAsZipArchive(extends archive as folderItem) As ZipArchive
		  return new ZipArchive(archive)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub unzip(extends archive as folderitem, destination as folderitem)
		  dim z as new ZipArchive(archive)
		  z.expand destination
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub unzip(extends archive as folderitem, destination as folderitem, options as expansionOptions)
		  dim z as new ZipArchive(archive)
		  z.expand destination, options
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub zip(extends source as folderitem, archive as folderitem, comment as string = "")
		  dim z as new ZipArchive(archive)
		  z.addChild source, comment
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub zip(extends source as folderitem, archive as folderitem, comment as string = "", options as compressionOptions)
		  dim z as new ZipArchive(archive)
		  z.addChild source, comment, options
		End Sub
	#tag EndMethod


	#tag Constant, Name = FilesystemAcornRISCOS, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemAlternateMVS, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemAmiga, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemAtari, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemBeOS, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemCP_M, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemFAT, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemHPFS, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemMacintosh, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemMVS, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemNTFS, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemOSX, Type = Double, Dynamic = False, Default = \"19", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemOS_400, Type = Double, Dynamic = False, Default = \"18", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemTandem, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemUnix, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemVFAT, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemVM, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemVMS, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemVSE, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FilesystemZSystem, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"1.1", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CompressionOptions, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		method as CompressionMethod
		  deflateLevel as DeflateLevel
		deflateWindow as uint16
	#tag EndStructure

	#tag Structure, Name = ExpansionOptions, Flags = &h0, Attributes = \"StructureAlignment \x3D 1"
		ignoreChecksum as boolean
		  replaceFiles as boolean
		ignoreErrors as boolean
	#tag EndStructure


	#tag Enum, Name = CompressionMethod, Flags = &h0
		none
		  deflate
		unsupported
	#tag EndEnum

	#tag Enum, Name = DeflateLevel, Flags = &h0
		maximum
		  normal
		  fast
		fastest
	#tag EndEnum


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
