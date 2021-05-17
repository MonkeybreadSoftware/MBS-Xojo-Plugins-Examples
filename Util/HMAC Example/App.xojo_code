#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Test_HMAC_MD5    "", "", "74e6f7298a9c2d168935f58c001bad88"
		  Test_HMAC_SHA1   "", "", "fbdb1d1b18aa6c08324b7d64b71fb76370690e1d"
		  Test_HMAC_SHA256 "", "", "b613679a0814d9ec772f95d778c35fc5ff1697c493715653c6c712144292c5ad"
		  
		  Test_HMAC_MD5    "key", "The quick brown fox jumps over the lazy dog", "80070713463e7749b90c2dc24911e275"
		  Test_HMAC_SHA1   "key", "The quick brown fox jumps over the lazy dog", "de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9"
		  Test_HMAC_SHA256 "key", "The quick brown fox jumps over the lazy dog", "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8"
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CalcSHA1MBS(data as string) As string
		  dim s as new SHA1MBS // in Encryption Plugin
		  
		  s.Add data
		  
		  Return s.Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcSHA256MBS(data as string) As string
		  dim s as new SHA256MBS
		  
		  s.Add data
		  
		  Return s.Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HMAC_MD5(key as string, message as string) As string
		  const blocksize = 64
		  
		  message = DefineEncoding(message, nil) // remove encoding
		  
		  if lenb(key) > blocksize then
		    key = MD5MBS(key) // in Encryption plugin
		  end if
		  
		  while lenb(key) < blocksize 
		    key = key + chrb(0)
		  wend
		  
		  dim okey as string
		  dim ikey as string
		  for i as integer = 1 to blocksize
		    okey = okey + chrb(&h5C)
		  next
		  for i as integer = 1 to blocksize
		    ikey = ikey + chrb(&h36)
		  next
		  
		  ikey = StringXORMBS(ikey, key)
		  okey = StringXORMBS(okey, key)
		  
		  Return MD5MBS( okey + MD5MBS(ikey + message))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HMAC_SHA1(key as string, message as string) As string
		  const blocksize = 64
		  
		  message = DefineEncoding(message, nil) // remove encoding
		  
		  if lenb(key) > blocksize then
		    key = CalcSHA1MBS(key)
		  end if
		  
		  while lenb(key) < blocksize 
		    key = key + chrb(0)
		  wend
		  
		  dim okey as string
		  dim ikey as string
		  for i as integer = 1 to blocksize
		    okey = okey + chrb(&h5C)
		  next
		  for i as integer = 1 to blocksize
		    ikey = ikey + chrb(&h36)
		  next
		  
		  ikey = StringXORMBS(ikey, key)
		  okey = StringXORMBS(okey, key)
		  
		  Return CalcSHA1MBS( okey + CalcSHA1MBS(ikey + message))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HMAC_SHA256(key as string, message as string) As string
		  const blocksize = 64
		  
		  message = DefineEncoding(message, nil) // remove encoding
		  
		  if lenb(key) > blocksize then
		    key = CalcSHA256MBS(key)
		  end if
		  
		  while lenb(key) < blocksize 
		    key = key + chrb(0)
		  wend
		  
		  dim okey as string
		  dim ikey as string
		  for i as integer = 1 to blocksize
		    okey = okey + chrb(&h5C)
		  next
		  for i as integer = 1 to blocksize
		    ikey = ikey + chrb(&h36)
		  next
		  
		  ikey = StringXORMBS(ikey, key)
		  okey = StringXORMBS(okey, key)
		  
		  Return CalcSHA256MBS( okey + CalcSHA256MBS(ikey + message))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub log(s as string)
		  MainWindow.List.AddRow s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_HMAC_MD5(key as string, message as string, ExpectedResult as string)
		  dim m as string = HMAC_MD5(key, message)
		  
		  dim h as string = EncodeHex(m)
		  
		  if h = ExpectedResult then
		    log CurrentMethodName+" OK"
		  else
		    log CurrentMethodName+" Failed: "+h+" ≠ "+ExpectedResult
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_HMAC_SHA1(key as string, message as string, ExpectedResult as string)
		  dim m as string = HMAC_SHA1(key, message)
		  
		  dim h as string = EncodeHex(m)
		  
		  if h = ExpectedResult then
		    log CurrentMethodName+" OK"
		  else
		    log CurrentMethodName+" Failed: "+h+" ≠ "+ExpectedResult
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test_HMAC_SHA256(key as string, message as string, ExpectedResult as string)
		  dim m as string = HMAC_SHA256(key, message)
		  
		  dim h as string = EncodeHex(m)
		  
		  if h = ExpectedResult then
		    log CurrentMethodName+" OK"
		  else
		    log CurrentMethodName+" Failed: "+h+" ≠ "+ExpectedResult
		  end if
		  
		End Sub
	#tag EndMethod


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
