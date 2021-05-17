#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim EC_Curve_ID as integer = 415 // NID_X9_62_prime256v1
		  
		  // on Server
		  dim dhs as new ECDHEMBS(EC_Curve_ID)
		  dim pks as string = dhs.PublicKey
		  
		  
		  // on Client
		  dim dhc as new ECDHEMBS(EC_Curve_ID)
		  dim pkc as string = dhc.PublicKey
		  
		  
		  // exchange public keys
		  
		  // on Server
		  dim ses as string = dhs.DeriveSecretKey(pkc)
		  
		  // on Client
		  dim sec as string = dhc.DeriveSecretKey(pks)
		  
		  
		  // show window for server
		  dim lines() as string
		  lines.Append dhs.ParamsInfo
		  lines.Append dhs.PrivateKeyInfo // private key from server
		  lines.Append dhs.PeerKeyInfo    // public key from client
		  lines.Append EncodeHex(ses)     // shared secret
		  
		  ServerWindow.TextArea1.text = ReplaceLineEndings(Join(lines, EndOfLine+EndOfLine), EndOfLine)
		  ServerWindow.show
		  
		  
		  // show window for client
		  redim lines(-1)
		  lines.Append dhc.ParamsInfo
		  lines.Append dhc.PrivateKeyInfo // private key from client
		  lines.Append dhc.PeerKeyInfo    // public key from server
		  lines.Append EncodeHex(sec)     // shared secret
		  
		  ClientWindow.TextArea1.text = ReplaceLineEndings(Join(lines, EndOfLine+EndOfLine), EndOfLine)
		  ClientWindow.show
		  ClientWindow.top  = ServerWindow.top
		  ClientWindow.Left = ServerWindow.Left + ServerWindow.width + 20
		  
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
