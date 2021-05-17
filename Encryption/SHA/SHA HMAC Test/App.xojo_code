#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // sample values from http://en.wikipedia.org/wiki/Hash-based_message_authentication_code
		  
		  HMAC_MD5    "", "", "74e6f7298a9c2d168935f58c001bad88"
		  HMAC_SHA1   "", "", "fbdb1d1b18aa6c08324b7d64b71fb76370690e1d"
		  HMAC_SHA256 "", "", "b613679a0814d9ec772f95d778c35fc5ff1697c493715653c6c712144292c5ad"
		  
		  HMAC_MD5    "key", "The quick brown fox jumps over the lazy dog", "80070713463e7749b90c2dc24911e275"
		  HMAC_SHA1   "key", "The quick brown fox jumps over the lazy dog", "de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9"
		  HMAC_SHA256 "key", "The quick brown fox jumps over the lazy dog", "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8"
		  
		  
		  // own tests
		  
		  HMAC_MD5    "The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog", "The quick brown fox jumps over the lazy dog", "4B1F513D7576BF8A726D5CB4116514D4"
		  HMAC_SHA1   "The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog", "The quick brown fox jumps over the lazy dog", "98DC81AD6F689F055823E76F0656CF437F225C16"
		  HMAC_SHA256 "The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog", "The quick brown fox jumps over the lazy dog", "B1095F2C6E2083772BDDF6177F26D07AB07D980A589B2002BF5BB1C7E8F16D3E"
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub HMAC_MD5(key as string, text as string, RightResult as string)
		  
		  dim r as string = EncodeHex(MD5DigestMBS.HMAC(key, text))
		  
		  if RightResult = r then
		    log "MD5DigestMBS.HMAC", "ok"
		  else
		    log "MD5DigestMBS.HMAC", "failed"
		  end if
		  
		  
		  
		  
		  if TargetMachO then 
		    // CommonCrypto is only available on Mac and works not with an empty key
		    
		    dim h as new CCHMacMBS(CCHMacMBS.kCCHmacAlgMD5, key)
		    h.Update text
		    dim r2 as string = EncodeHex(h.Finalize)
		    
		    if RightResult = r2 then
		      log "CCHMacMBS MD5", "ok"
		    else
		      log "CCHMacMBS MD5", "failed"
		    end if
		    
		    
		    dim r3 as string = EncodeHex(CCHMacMBS.Hmac(CCHMacMBS.kCCHmacAlgMD5, key, text))
		    
		    if RightResult = r3 then
		      log "CCHMacMBS MD5", "ok"
		    else
		      log "CCHMacMBS MD5", "failed"
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMAC_SHA1(key as string, text as string, RightResult as string)
		  
		  dim r as string = EncodeHex(SHA1MBS.HMAC(key, text))
		  
		  if RightResult = r then
		    log "SHA1MBS.HMAC", "ok"
		  else
		    log "SHA1MBS.HMAC", "failed"
		  end if
		  
		  
		  
		  
		  if TargetMachO then
		    
		    dim h as new CCHMacMBS(CCHMacMBS.kCCHmacAlgSHA1, key)
		    h.Update text
		    dim r2 as string = EncodeHex(h.Finalize)
		    
		    if RightResult = r2 then
		      log "CCHMacMBS SHA1", "ok"
		    else
		      log "CCHMacMBS SHA1", "failed"
		    end if
		    
		    
		    dim r3 as string = EncodeHex(CCHMacMBS.Hmac(CCHMacMBS.kCCHmacAlgSHA1, key, text))
		    
		    if RightResult = r3 then
		      log "CCHMacMBS SHA1", "ok"
		    else
		      log "CCHMacMBS SHA1", "failed"
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMAC_SHA256(key as string, text as string, RightResult as string)
		  
		  dim r as string = EncodeHex(SHA256MBS.HMAC(key, text))
		  
		  if RightResult = r then
		    log "SHA256MBS.HMAC", "ok"
		  else
		    log "SHA256MBS.HMAC", "failed"
		  end if
		  
		  
		  
		  if TargetMachO then
		    
		    dim h as new CCHMacMBS(CCHMacMBS.kCCHmacAlgSHA256, key)
		    h.Update text
		    dim r2 as string = EncodeHex(h.Finalize)
		    
		    if RightResult = r2 then
		      log "CCHMacMBS SHA256", "ok"
		    else
		      log "CCHMacMBS SHA256", "failed"
		    end if
		    
		    
		    dim r3 as string = EncodeHex(CCHMacMBS.Hmac(CCHMacMBS.kCCHmacAlgSHA256, key, text))
		    
		    if RightResult = r3 then
		      log "CCHMacMBS SHA256", "ok"
		    else
		      log "CCHMacMBS SHA256", "failed"
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Log(s as string, t as string)
		  MainWindow.List.AddRow s,t
		  
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
