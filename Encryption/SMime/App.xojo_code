#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Sign
		  Encrypt
		  Decrypt
		  Verify
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Decrypt()
		  dim c as X509MBS = X509MBS.Open(ReadFile(GetFolderItem("signer.pem")))
		  dim k as PKeyMBS = PKeyMBS.Open(ReadFile(GetFolderItem("signer.pem")))
		  dim i as string = ReadFile(GetFolderItem("smencr.txt"))
		  
		  dim d as string = OpenSSLMBS.SMimePKCS7Decrypt(i, c, k)
		  
		  WriteFile d, GetFolderItem("encrout.txt")
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Encrypt()
		  dim c as X509MBS = X509MBS.Open(ReadFile(GetFolderItem("signer.pem")))
		  dim i as string = ReadFile(GetFolderItem("encr.txt"))
		  
		  dim d as string = OpenSSLMBS.SMimePKCS7Encrypt(i, c)
		  
		  WriteFile d, GetFolderItem("smencr.txt")
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadFile(f as FolderItem) As string
		  dim b as BinaryStream = BinaryStream.Open(f)
		  dim s as string = b.Read(b.Length)
		  return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sign()
		  dim c as X509MBS = X509MBS.Open(ReadFile(GetFolderItem("signer.pem")))
		  dim k as PKeyMBS = PKeyMBS.Open(ReadFile(GetFolderItem("signer.pem")))
		  dim i as string = ReadFile(GetFolderItem("sign.txt"))
		  
		  dim d as string = OpenSSLMBS.SMimePKCS7Sign(i, c, k)
		  
		  WriteFile d, GetFolderItem("smout.txt")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Verify()
		  dim c as X509MBS = X509MBS.Open(ReadFile(GetFolderItem("cacert.pem")))
		  dim i as string = ReadFile(GetFolderItem("smout.txt"))
		  
		  dim d as string = OpenSSLMBS.SMimePKCS7Verify(i, c)
		  
		  WriteFile d, GetFolderItem("smver.txt")
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteFile(d as string, f as FolderItem)
		  dim b as BinaryStream = BinaryStream.Create(f, true)
		  b.Write d
		  
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
