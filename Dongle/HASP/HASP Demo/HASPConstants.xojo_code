#tag Module
Protected Module HASPConstants
	#tag Method, Flags = &h0
		Function remove0(s as string) As string
		  dim i,c as integer
		  dim ch,t as string
		  
		  c=len(s)
		  for i=1 to c
		    ch=mid(s,i,1)
		    if asc(ch)>0 then
		      t=t+ch
		    end if
		  next
		  return t
		End Function
	#tag EndMethod


	#tag Constant, Name = HASPAPI_VERSION, Type = Integer, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LOCALHASP_DECODEDATA, Type = Integer, Dynamic = False, Default = \"61", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LOCALHASP_ENCODEDATA, Type = Integer, Dynamic = False, Default = \"60", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LOCALHASP_HASPSTATUS, Type = Integer, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LOCALHASP_ISHASP, Type = Integer, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MEMOHASP_HASPID, Type = Integer, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MEMOHASP_READBLOCK, Type = Integer, Dynamic = False, Default = \"50", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MEMOHASP_READMEMO, Type = Integer, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MEMOHASP_WRITEBLOCK, Type = Integer, Dynamic = False, Default = \"51", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MEMOHASP_WRITEMEMO, Type = Integer, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_DECODEDATA, Type = Integer, Dynamic = False, Default = \"89", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_ENCODEDATA, Type = Integer, Dynamic = False, Default = \"88", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_HASPID, Type = Integer, Dynamic = False, Default = \"46", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_IDLETIME, Type = Integer, Dynamic = False, Default = \"48", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_LASTSTATUS, Type = Integer, Dynamic = False, Default = \"40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_LOGIN, Type = Integer, Dynamic = False, Default = \"42", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_LOGOUT, Type = Integer, Dynamic = False, Default = \"43", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_QUERYLICENCE, Type = Integer, Dynamic = False, Default = \"104", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_READBLOCK, Type = Integer, Dynamic = False, Default = \"52", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_READWORD, Type = Integer, Dynamic = False, Default = \"44", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_SETCONFIGFILENAME, Type = Integer, Dynamic = False, Default = \"85", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_SETSERVERBYNAME, Type = Integer, Dynamic = False, Default = \"96", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_WRITEBLOCK, Type = Integer, Dynamic = False, Default = \"53", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NETHASP_WRITEWORD, Type = Integer, Dynamic = False, Default = \"45", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_GETDATE, Type = Integer, Dynamic = False, Default = \"73", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_GETHASPID, Type = Integer, Dynamic = False, Default = \"78", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_GETTIME, Type = Integer, Dynamic = False, Default = \"71", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_READBLOCK, Type = Integer, Dynamic = False, Default = \"77", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_READBYTE, Type = Integer, Dynamic = False, Default = \"75", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_SETDATE, Type = Integer, Dynamic = False, Default = \"72", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_SETTIME, Type = Integer, Dynamic = False, Default = \"70", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_WRITEBLOCK, Type = Integer, Dynamic = False, Default = \"76", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TIMEHASP_WRITEBYTE, Type = Integer, Dynamic = False, Default = \"74", Scope = Public
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
