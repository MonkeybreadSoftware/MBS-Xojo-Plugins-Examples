#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim f1 as FolderItem = FindFile("test.pem")
		  dim b1 as BinaryStream = BinaryStream.Open(f1)
		  dim PrivKey as string = B1.Read(b1.Length)
		  
		  dim f2 as FolderItem = FindFile("test.pub")
		  dim b2 as BinaryStream = BinaryStream.Open(f2)
		  dim PubKey as string = B2.Read(b2.Length)
		  
		  dim UnencryptedData as string = "Hello World. This is just a test."
		  
		  // encrypt with private key, decrypt with public key
		  dim EncryptedData as string = OpenSSLMBS.RSAPrivateEncrypt(UnencryptedData, PrivKey)
		  dim decryptedData as string = OpenSSLMBS.RSAPublicDecrypt(EncryptedData, PubKey)
		  
		  // encrypt with public key, decrypt with private key
		  dim EncryptedData2 as string = OpenSSLMBS.RSAPublicEncrypt(UnencryptedData, PubKey)
		  dim decryptedData2 as string = OpenSSLMBS.RSAPrivateDecrypt(EncryptedData2, PrivKey)
		  
		  Break // check in debugger
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders
		  
		  dim parent as FolderItem = GetFolderItem("")
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
