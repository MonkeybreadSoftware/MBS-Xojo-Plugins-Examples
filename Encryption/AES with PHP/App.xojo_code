#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim keyPlainText as string = "Hello"
		  dim ivPlainText as string = "test"
		  dim dataPlaintext as string = "Just a test message. äöü"
		  
		  dim algorithm as string = "aes-256-cbc"
		  
		  
		  // make sure we use UTF-8
		  
		  
		  keyPlainText = keyPlainText.DefineEncoding(encodings.UTF8)
		  ivPlainText = ivPlainText.DefineEncoding(encodings.UTF8)
		  dataPlaintext = dataPlaintext.DefineEncoding(encodings.UTF8)
		  
		  
		  // init
		  
		  dim c as CipherMBS = CipherMBS.CipherByName(algorithm)
		  dim ivLength as integer = c.IVLength
		  
		  dim keyHash as string = SHA256MBS.Hash(keyPlainText)
		  dim ivHash as string = SHA256MBS.Hash(ivPlainText)
		  dim IV as string = leftb(ivHash, ivLength)
		  
		  // encrypt
		  
		  call c.EncryptInit keyHash, IV
		  dim EncryptedData as string = c.ProcessString(dataPlaintext) + c.FinalizeAsString
		  
		  dim database64 as string = EncodeBase64(EncryptedData, 0)
		  
		  MsgBox "Key: "+EncodeHex(keyHash)+EndOfLine+_
		  "IV: "+EncodeHex(IV)+EndOfLine+_
		  "Data: "+database64
		  
		  // decrypt
		  
		  call c.DecryptInit keyHash, IV
		  dim DecryptedData as string = c.ProcessString(EncryptedData) + c.FinalizeAsString
		  
		  DecryptedData = DefineEncoding(DecryptedData, encodings.UTF8)
		  
		  MsgBox DecryptedData
		  
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
