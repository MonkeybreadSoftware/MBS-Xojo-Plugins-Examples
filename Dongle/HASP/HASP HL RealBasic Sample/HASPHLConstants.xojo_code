#tag Module
Protected Module HASPHLConstants
	#tag Method, Flags = &h0
		Function GetHASPErrorMesage(errnum as integer) As string
		  dim msg as String
		  
		  select case errnum
		  case 0
		    msg = "Success  (HASP_STATUS_OK)"
		  case 1   // HASP_MEM_RANGE
		    msg = "Invalid memory address (HASP_MEM_RANGE)"
		  case 2   // HASP_INV_PROGNUM_OPT
		    msg = "Unknown/invalid feature id option (HASP_INV_PROGNUM_OPT)"
		  case 3   // HASP_INSUF_MEM
		    msg = "Memory allocation failed (HASP_INSUF_MEM)"
		  case 4   // HASP_TMOF
		    msg = "Too many open features (HASP_TMOF)"
		  case 5   // HASP_ACCESS_DENIED
		    msg = "Feature access denied (HASP_ACCESS_DENIED)"
		  case 6   // HASP_INCOMPAT_FEATURE
		    msg = "Incompatible feature (HASP_INCOMPAT_FEATURE)"
		  case 7   // HASP_CONTAINER_NOT_FOUND
		    msg = "License Container not found (HASP_CONTAINER_NOT_FOUND)"
		  case 8   // HASP_TOO_SHORT
		    msg = "En-/decryption length too short (HASP_TOO_SHORT)"
		  case 9   // HASP_INV_HND
		    msg = "Invalid handle (HASP_INV_HND)"
		  case 10  // HASP_INV_FILEID
		    msg = "Invalid file id / memory descriptor (HASP_INV_FILEID)"
		  case 11  // HASP_OLD_DRIVER
		    msg = "Driver or support daemon version too old (HASP_OLD_DRIVER)"
		  case 12  // HASP_NO_TIME
		    msg = "Real time support not available (HASP_NO_TIME)"
		  case 13  // HASP_SYS_ERR
		    msg = "Generic error from host system call (HASP_SYS_ERR)"
		  case 14  // HASP_NO_DRIVER
		    msg = "Hardware key driver not found (HASP_NO_DRIVER)"
		  case 15  // HASP_INV_FORMAT
		    msg = "Unrecognized info format (HASP_INV_FORMAT)"
		  case 16  // HASP_REQ_NOT_SUPP
		    msg = "Request not supported (HASP_REQ_NOT_SUPP)"
		  case 17  // HASP_INV_UPDATE_OBJ
		    msg = "Invalid update object (HASP_INV_UPDATE_OBJ)"
		  case 18  // HASP_KEYID_NOT_FOUND
		    msg = "Key with requested id was not found (HASP_KEYID_NOT_FOUND)"
		  case 19  // HASP_INV_UPDATE_DATA
		    msg = "Update data consistency check failed (HASP_INV_UPDATE_DATA)"
		  case 20  // HASP_INV_UPDATE_NOTSUPP
		    msg = "Update not supported by this key (HASP_INV_UPDATE_NOTSUPP)"
		  case 21  // HASP_INV_UPDATE_CNTR
		    msg = "Update counter mismatch (HASP_INV_UPDATE_CNTR)"
		  case 22  // HASP_INV_VCODE
		    msg = "Invalid vendor code (HASP_INV_VCODE)"
		  case 23  // HASP_ENC_NOT_SUPP
		    msg = "Requested encryption algorithm not supported (HASP_ENC_NOT_SUPP)"
		  case 24  // HASP_INV_TIME
		    msg = "Invalid date / time (HASP_INV_TIME)"
		  case 25  // HASP_NO_BATTERY_POWER
		    msg = "Clock has no power (HASP_NO_BATTERY_POWER)"
		  case 26  // HASP_NO_ACK_SPACE
		    msg = "Update requested ack., but no area to return it (HASP_NO_ACK_SPACE)"
		  case 27  // HASP_TS_DETECTED
		    msg = "Terminal services (remote terminal) detected (HASP_TS_DETECTED)"
		  case 28  // HASP_FEATURE_TYPE_NOT_IMPL
		    msg = "Feature type not implemented (HASP_FEATURE_TYPE_NOT_IMPL)"
		  case 29  // HASP_UNKNOWN_ALG
		    msg = "Unknown algorithm (HASP_UNKNOWN_ALG)"
		  case 30  // HASP_INV_SIG
		    msg = "Signature check failed (HASP_INV_SIG)"
		  case 31  // HASP_FEATURE_NOT_FOUND
		    msg = "Feature not found (HASP_FEATURE_NOT_FOUND)"
		  case 600 // HASP_NO_EXTBLOCK
		    msg = "No classic memory extension block available (HASP_NO_EXTBLOCK)"
		  case 698 // HASP_NOT_IMPL
		    msg = "Capability isn't available (HASP_NOT_IMPL)"
		  case 699 // HASP_INT_ERR
		    msg = "Internal API error (HASP_INT_ERR)"
		  else     // any other error number
		    msg = "HASP Error: " + str( errnum )
		  end select
		  
		  return msg
		End Function
	#tag EndMethod


	#tag Constant, Name = HASP_FILEID_LICENSE, Type = Integer, Dynamic = False, Default = \"&HFFF2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_FILEID_MAIN, Type = Integer, Dynamic = False, Default = \"&HFFF0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_FILEID_TIME, Type = Integer, Dynamic = False, Default = \"&HFFF1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_KEYINFO, Type = String, Dynamic = False, Default = \"<haspformat format\x3D\"keyinfo\"/>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_PROGNUM_FEATURETYPE, Type = Integer, Dynamic = False, Default = \"&HFFFF0000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_PROGNUM_OPT_CLASSIC, Type = Integer, Dynamic = False, Default = \"&H00001000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_PROGNUM_OPT_NO_LOCAL, Type = Integer, Dynamic = False, Default = \"&H00008000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_PROGNUM_OPT_NO_REMOTE, Type = Integer, Dynamic = False, Default = \"&H00004000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_PROGNUM_OPT_PROCESS, Type = Integer, Dynamic = False, Default = \"&H00002000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_PROGNUM_OPT_TS, Type = Integer, Dynamic = False, Default = \"&H00000800", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_SESSIONINFO, Type = String, Dynamic = False, Default = \"<haspformat format\x3D\"sessioninfo\"/>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_STATUS_OK, Type = Integer, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = HASP_UPDATEINFO, Type = String, Dynamic = False, Default = \"<haspformat format\x3D\"updateinfo\"/>", Scope = Public
	#tag EndConstant

	#tag Constant, Name = vendor_code_DEMOMA, Type = String, Dynamic = False, Default = \"p0AosKZcgvIqHRZwMAK6MqljLvA8fjsYK92+Z4QMib0WKbM/3ljp/RAHjtNwN4wfy1W8oFXWujbbnEppgxd0vulb/ZTuqIvG5hiAuyjLoDYl49KmvXGoXL1yWEwFBIDoVYEbMy1x1Q9k0XxcRioqIGKs8Q/xX8ZqjvQlQyZi2p27biH4GxKvZew2ctfKKxEK87gHBxEC3Pz40bqUnPUEl5KnjfXwTX674ZG0d8HVNnccAOqdblCHHQN6P5LdRpTOQI6B1W4+cLWOv30i1rsjCv8yWfiqV7k909pVuE8s2YMHGBb14jKOjE4lm1FBQ2j8yr7S/jLFBBy1wbDSpThnwT06uzjGgXRhANPVji7lUYdNNebK/v5daWpZGN/e1x0H5QhnSOiclsxNRKAS9f4fVv3iLNHYZHi41W5S87teNkEDG/jkMQchv/Ub/VJTgW03neH44ZzbaAs2Ox+44ZkxdKtDXQM/e0g2qpafrtfPyu07XaEWifw+IBDq2hCoiyB02OZcHVZXAyPO5sk/5pFXr0J2rNT5tf09rqHuemgZnSbEO1XkhrKTo/XS3i9Jw9ST/UgbpSaO5aeiCsWeQ8X5RJ3CIWVDTKC1G2dpadJftEMR2rFS6N9ixxP/1R7pdT1df79/H/dPTVvzuy76dcpxj0UP7/mF/X6GO8OqUOxKG8DoEPGMiZxHHm3ZgLib6uljbQ2ewZYKFp69QSVVMAHumT+wCgWPKg\x3D\x3D", Scope = Public
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
