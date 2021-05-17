#tag Module
Protected Module EncryptionModule
	#tag Method, Flags = &h1
		Protected Function Decrypt(Key as String, Text as String) As string
		  // AES 256 plus good key generation
		  // returns Base64, so you can store in text field in database
		  
		  dim Input as String = DecodeBase64(text)
		  
		  if lenb(input) < 8 then
		    // no salt?
		    Return ""
		  end if
		  
		  key  = ConvertEncoding(key,  encodings.UTF8)
		  
		  
		  dim iKey as MemoryBlock = key
		  dim salt as MemoryBlock = leftb(input, 8)
		  
		  const RoundNumbers = 1000
		  
		  dim CKey as MemoryBlock
		  dim CIV as MemoryBlock
		  
		  
		  if CipherMBS.BytesToKey(CipherMBS.aes_256_cfb128, DigestMBS.SHA512, salt, key, RoundNumbers, CKey, CIV) then
		    
		    // last 64 bytes are hash
		    dim CheckHash as string = input.RightB(64)
		    
		    Input = Input.midb(9, lenb(input) - 64 - 8)
		    
		    dim c as CipherMBS = CipherMBS.aes_256_cfb128
		    call c.DecryptInit Ckey, CIV
		    
		    dim output as string = c.ProcessString(Input) + c.FinalizeAsString
		    dim outputHash as string = SHA512MBS.Hash(output)
		    
		    if StrCompBytesMBS(outputHash, CheckHash) = 0 then
		      // ok, bytes are same in hash
		      if encodings.UTF8.IsValidData(output) then
		        // ok
		        dim content as string = DefineEncoding(output, encodings.UTF8)
		        
		        Return content
		      else
		        // text encoding error? Maybe wrong key?
		        Break
		      end if
		    else
		      // hash doesn't work, so wrong key!
		      break
		    end if
		    
		  else
		    // failed to make key
		    break
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Encrypt(Key as String, Text as String) As string
		  // AES 256 plus good key generation
		  // returns Base64, so you can store in text field in database
		  
		  Text = ConvertEncoding(Text, encodings.UTF8)
		  key  = ConvertEncoding(key,  encodings.UTF8)
		  
		  // quick hash so we can later check if data is correct
		  dim Hash as string = SHA512MBS.Hash(text) 
		  
		  dim iKey as MemoryBlock = key
		  dim salt as MemoryBlock = RandomBytesStringMBS(8)
		  
		  const RoundNumbers = 1000
		  
		  dim CKey as MemoryBlock
		  dim CIV as MemoryBlock
		  
		  
		  if CipherMBS.BytesToKey(CipherMBS.aes_256_cfb128, DigestMBS.SHA512, salt, key, RoundNumbers, CKey, CIV) then
		    
		    dim c as CipherMBS = CipherMBS.aes_256_cfb128
		    call c.EncryptInit Ckey, CIV
		    
		    dim output as string = salt + c.ProcessString(Text) + c.FinalizeAsString + Hash
		    
		    Return EncodeBase64(output)
		    
		  else
		    // failed to make key
		    break
		  end if
		  
		  
		End Function
	#tag EndMethod


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
			InitialValue="-2147483648"
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
