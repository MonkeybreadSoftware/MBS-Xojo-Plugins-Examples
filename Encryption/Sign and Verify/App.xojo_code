#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  const NID_sha1 = 64
		  
		  dim test_pem         as string = ReadFile("test.pem")
		  dim test_pub         as string = ReadFile("test.pub")
		  dim data             as string = ReadFile("Create Keys.rtf") // some data file
		  dim signature        as string
		  
		  // create signature
		  
		  Signature = OpenSSLMBS.SignData(data, test_pem)
		  if Signature = "" then
		    // failed
		    break 
		  end if
		  
		  // verify with private key
		  dim r1 as Boolean = OpenSSLMBS.VerifyData(data, signature, test_pem) 
		  
		  // verify with public key
		  dim r2 as Boolean = OpenSSLMBS.VerifyData(data, signature, test_pub) 
		  
		  dim signatureFile as string = ReadFile("signature.sha1") 
		  
		  // verify with private key
		  dim r3 as Boolean = OpenSSLMBS.VerifyData(data, signatureFile, test_pem)
		  
		  // verify with public key
		  dim r4 as Boolean = OpenSSLMBS.VerifyData(data, signatureFile, test_pub)
		  
		  
		  if r1 and r2 and r3 and r4 then
		    MsgBox "All OK"
		  end if
		  
		  break
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ReadFile(filename as string) As string
		  dim f as FolderItem = FindFile(filename)
		  dim b as BinaryStream = BinaryStream.Open(f)
		  
		  Return b.Read(B.Length)
		  
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
