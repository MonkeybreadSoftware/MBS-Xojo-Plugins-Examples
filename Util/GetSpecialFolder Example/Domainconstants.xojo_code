#tag Module
Protected Module Domainconstants
	#tag Constant, Name = kClassicDomain, Type = Integer, Dynamic = False, Default = \"-32762", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLocalDomain, Type = Integer, Dynamic = False, Default = \"-32765", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kNetworkDomain, Type = Integer, Dynamic = False, Default = \"-32764", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOnAppropriateDisk, Type = Integer, Dynamic = False, Default = \"-32767", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kOnSystemDisk, Type = Integer, Dynamic = False, Default = \"-32768", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kSystemDomain, Type = Integer, Dynamic = False, Default = \"-32766", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUserDomain, Type = Integer, Dynamic = False, Default = \"-32763", Scope = Public
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
