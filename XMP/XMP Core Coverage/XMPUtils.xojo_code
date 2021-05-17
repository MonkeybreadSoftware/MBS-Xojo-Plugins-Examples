#tag Module
Protected Module XMPUtils
	#tag Method, Flags = &h0
		Function bool(b as boolean) As string
		  if b then
		    Return "true"
		  else
		    Return "false"
		  end if
		End Function
	#tag EndMethod


	#tag Constant, Name = kXMPUtil_AllowCommas, Type = Integer, Dynamic = False, Default = \"&h10000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMPUtil_DoAllProperties, Type = Integer, Dynamic = False, Default = \"&h0001", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMPUtil_ReplaceOldValues, Type = Integer, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_ArrayLastItem, Type = Integer, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_ExactPacketLength, Type = Integer, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_FalseStr, Type = String, Dynamic = False, Default = \"False", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IncludeThumbnailPad, Type = Integer, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_InsertAfterItem, Type = Integer, Dynamic = False, Default = \"&h8000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_InsertBeforeItem, Type = Integer, Dynamic = False, Default = \"&h00004000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterIncludeAliases, Type = Integer, Dynamic = False, Default = \"&h8000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterJustChildren, Type = Integer, Dynamic = False, Default = \"&h100", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterJustLeafName, Type = Integer, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterJustLeafNodes, Type = Integer, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterOmitQualifiers, Type = Integer, Dynamic = False, Default = \"&h1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterSkipSiblings, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_IterSkipSubtree, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NoOptions, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NS_DC, Type = String, Dynamic = False, Default = \"http://purl.org/dc/elements/1.1/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NS_EXIF, Type = String, Dynamic = False, Default = \"http://ns.adobe.com/exif/1.0/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NS_PDF, Type = String, Dynamic = False, Default = \"http://ns.adobe.com/pdf/1.3/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NS_XML, Type = String, Dynamic = False, Default = \"http://www.w3.org/XML/1998/namespace", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NS_XMP, Type = String, Dynamic = False, Default = \"http://ns.adobe.com/xap/1.0/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_NS_XMP_MM, Type = String, Dynamic = False, Default = \"http://ns.adobe.com/xap/1.0/mm/", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_OmitPacketWrapper, Type = Integer, Dynamic = False, Default = \"&h10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_ParseMoreBuffers, Type = Integer, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_PropArrayIsAlternate, Type = Integer, Dynamic = False, Default = \"&h800", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_PropArrayIsAltText, Type = Integer, Dynamic = False, Default = \"&h1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_PropArrayIsOrdered, Type = Integer, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_PropHasAliases, Type = Integer, Dynamic = False, Default = \"&h00020000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_PropValueIsArray, Type = Integer, Dynamic = False, Default = \"&h200", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_PropValueIsURI, Type = Integer, Dynamic = False, Default = \"&h2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_ReadOnlyPacket, Type = Integer, Dynamic = False, Default = \"&h20", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_RequireXMPMeta, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_SchemaNode, Type = Integer, Dynamic = False, Default = \"&h80000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_StrictAliasing, Type = Integer, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_TrueStr, Type = String, Dynamic = False, Default = \"True", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_UseCompactFormat, Type = Integer, Dynamic = False, Default = \"&h40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_UseNullTermination, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kXMP_WriteAliasComments, Type = Integer, Dynamic = False, Default = \"&h400", Scope = Public
	#tag EndConstant


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
			InitialValue="2147483648"
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
