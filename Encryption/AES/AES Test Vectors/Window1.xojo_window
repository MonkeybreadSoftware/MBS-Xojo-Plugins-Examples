#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1787708177
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // AES ECB 128-bit encryption mode
		  dim key as string = "2b7e151628aed2a6abf7158809cf4f3c"
		  
		  TestECB 128, key, "6bc1bee22e409f96e93d7e117393172a", "3ad77bb40d7a3660a89ecaf32466ef97"
		  TestECB 128, key, "ae2d8a571e03ac9c9eb76fac45af8e51", "f5d3d58503b9699de785895a96fdbaaf"
		  TestECB 128, key, "30c81c46a35ce411e5fbc1191a0a52ef", "43b1cd7f598ece23881b00e3ed030688"
		  TestECB 128, key, "f69f2445df4f9b17ad2b417be66c3710", "7b0c785e27e8ad3f8223207104725dd4"
		  
		  
		  // AES ECB 192-bit encryption mode
		  
		  key = "8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b"
		  
		  TestECB 192, key, "6bc1bee22e409f96e93d7e117393172a", "bd334f1d6e45f25ff712a214571fa5cc"
		  TestECB 192, key, "ae2d8a571e03ac9c9eb76fac45af8e51", "974104846d0ad3ad7734ecb3ecee4eef"
		  TestECB 192, key, "30c81c46a35ce411e5fbc1191a0a52ef", "ef7afd2270e2e60adce0ba2face6444e"
		  TestECB 192, key, "f69f2445df4f9b17ad2b417be66c3710", "9a4b41ba738d6c72fb16691603c18e0e"
		  
		  
		  // AES ECB 256-bit encryption mode
		  
		  key = "603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4"
		  
		  TestECB 256, key, "6bc1bee22e409f96e93d7e117393172a", "f3eed1bdb5d2a03c064b5a7e3db181f8"
		  TestECB 256, key, "ae2d8a571e03ac9c9eb76fac45af8e51", "591ccb10d410ed26dc5ba74a31362870"
		  TestECB 256, key, "30c81c46a35ce411e5fbc1191a0a52ef", "b6ed21b99ca6f4f9f153e7b1beafed1d"
		  TestECB 256, key, "f69f2445df4f9b17ad2b417be66c3710", "23304b7a39f9f3ff067d8d8f9e24ecc7"
		  
		  
		  // AES CFB128 128-bit encryption mode
		  
		  key = "2b7e151628aed2a6abf7158809cf4f3c"
		  
		  TestCFB128 128, key, "000102030405060708090a0b0c0d0e0f", "6bc1bee22e409f96e93d7e117393172a", "3b3fd92eb72dad20333449f8e83cfb4a"
		  TestCFB128 128, key, "3B3FD92EB72DAD20333449F8E83CFB4A", "ae2d8a571e03ac9c9eb76fac45af8e51", "c8a64537a0b3a93fcde3cdad9f1ce58b"
		  TestCFB128 128, key, "C8A64537A0B3A93FCDE3CDAD9F1CE58B", "30c81c46a35ce411e5fbc1191a0a52ef", "26751f67a3cbb140b1808cf187a4f4df"
		  TestCFB128 128, key, "26751F67A3CBB140B1808CF187A4F4DF", "f69f2445df4f9b17ad2b417be66c3710", "c04b05357c5d1c0eeac4c66f9ff7f2e6"
		  
		  // AES CFB128 192-bit encryption mode
		  
		  key = "8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b"
		  
		  TestCFB128 192, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "cdc80d6fddf18cab34c25909c99a4174"
		  TestCFB128 192, key, "CDC80D6FDDF18CAB34C25909C99A4174", "ae2d8a571e03ac9c9eb76fac45af8e51", "67ce7f7f81173621961a2b70171d3d7a"
		  TestCFB128 192, key, "67CE7F7F81173621961A2B70171D3D7A", "30c81c46a35ce411e5fbc1191a0a52ef", "2e1e8a1dd59b88b1c8e60fed1efac4c9"
		  TestCFB128 192, key, "2E1E8A1DD59B88B1C8E60FED1EFAC4C9", "f69f2445df4f9b17ad2b417be66c3710", "c05f9f9ca9834fa042ae8fba584b09ff"
		  
		  // AES CFB128 256-bit encryption mode
		  
		  key = "603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4"
		  
		  
		  TestCFB128 256, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "DC7E84BFDA79164B7ECD8486985D3860"
		  TestCFB128 256, key, "DC7E84BFDA79164B7ECD8486985D3860", "ae2d8a571e03ac9c9eb76fac45af8e51", "39ffed143b28b1c832113c6331e5407b"
		  TestCFB128 256, key, "39FFED143B28B1C832113C6331E5407B", "30c81c46a35ce411e5fbc1191a0a52ef", "df10132415e54b92a13ed0a8267ae2f9"
		  TestCFB128 256, key, "DF10132415E54B92A13ED0A8267AE2F9", "f69f2445df4f9b17ad2b417be66c3710", "75a385741ab9cef82031623d55b1e471"
		  
		  
		  // AES OFB 128-bit encryption mode
		  
		  key = "2b7e151628aed2a6abf7158809cf4f3c"
		  
		  TestOFB 128, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "3b3fd92eb72dad20333449f8e83cfb4a"
		  TestOFB 128, key, "50FE67CC996D32B6DA0937E99BAFEC60", "ae2d8a571e03ac9c9eb76fac45af8e51", "7789508d16918f03f53c52dac54ed825"
		  TestOFB 128, key, "D9A4DADA0892239F6B8B3D7680E15674", "30c81c46a35ce411e5fbc1191a0a52ef", "9740051e9c5fecf64344f7a82260edcc"
		  TestOFB 128, key, "A78819583F0308E7A6BF36B1386ABF23", "f69f2445df4f9b17ad2b417be66c3710", "304c6528f659c77866a510d9c1d6ae5e"
		  
		  // AES OFB 192-bit encryption mode
		  
		  key = "8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b"
		  
		  TestOFB 192, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "cdc80d6fddf18cab34c25909c99a4174"
		  TestOFB 192, key, "A609B38DF3B1133DDDFF2718BA09565E", "ae2d8a571e03ac9c9eb76fac45af8e51", "fcc28b8d4c63837c09e81700c1100401"
		  TestOFB 192, key, "52EF01DA52602FE0975F78AC84BF8A50", "30c81c46a35ce411e5fbc1191a0a52ef", "8d9a9aeac0f6596f559c6d4daf59a5f2"
		  TestOFB 192, key, "BD5286AC63AABD7EB067AC54B553F71D", "f69f2445df4f9b17ad2b417be66c3710", "6d9f200857ca6c3e9cac524bd9acc92a"
		  
		  // AES OFB 256-bit encryption mode
		  
		  key = "603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4"
		  
		  TestOFB 256, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "dc7e84bfda79164b7ecd8486985d3860"
		  TestOFB 256, key, "B7BF3A5DF43989DD97F0FA97EBCE2F4A", "ae2d8a571e03ac9c9eb76fac45af8e51", "4febdc6740d20b3ac88f6ad82a4fb08d"
		  TestOFB 256, key, "E1C656305ED1A7A6563805746FE03EDC", "30c81c46a35ce411e5fbc1191a0a52ef", "71ab47a086e86eedf39d1c5bba97c408"
		  TestOFB 256, key, "41635BE625B48AFC1666DD42A09D96E7", "f69f2445df4f9b17ad2b417be66c3710", "0126141d67f37be8538f5a8be740e484"
		  
		  
		  
		  // AES CBC 128-bit encryption mode
		  
		  key = "2b7e151628aed2a6abf7158809cf4f3c"
		  
		  TestCBC 128, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "7649abac8119b246cee98e9b12e9197d"
		  TestCBC 128, key, "7649ABAC8119B246CEE98E9B12E9197D", "ae2d8a571e03ac9c9eb76fac45af8e51", "5086cb9b507219ee95db113a917678b2"
		  TestCBC 128, key, "5086CB9B507219EE95DB113A917678B2", "30c81c46a35ce411e5fbc1191a0a52ef", "73bed6b8e3c1743b7116e69e22229516"
		  TestCBC 128, key, "73BED6B8E3C1743B7116E69E22229516", "f69f2445df4f9b17ad2b417be66c3710", "3ff1caa1681fac09120eca307586e1a7"
		  
		  // AES CBC 192-bit encryption mode
		  
		  key = "8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b"
		  
		  
		  TestCBC 192, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "4f021db243bc633d7178183a9fa071e8"
		  TestCBC 192, key, "4F021DB243BC633D7178183A9FA071E8", "ae2d8a571e03ac9c9eb76fac45af8e51", "b4d9ada9ad7dedf4e5e738763f69145a"
		  TestCBC 192, key, "B4D9ADA9AD7DEDF4E5E738763F69145A", "30c81c46a35ce411e5fbc1191a0a52ef", "571b242012fb7ae07fa9baac3df102e0"
		  TestCBC 192, key, "571B242012FB7AE07FA9BAAC3DF102E0", "f69f2445df4f9b17ad2b417be66c3710", "08b0e27988598881d920a9e64f5615cd"
		  
		  // AES CBC 256-bit encryption mode
		  
		  key = "603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4"
		  
		  
		  TestCBC 256, key, "000102030405060708090A0B0C0D0E0F", "6bc1bee22e409f96e93d7e117393172a", "f58c4c04d6e5f1ba779eabfb5f7bfbd6"
		  TestCBC 256, key, "F58C4C04D6E5F1BA779EABFB5F7BFBD6", "ae2d8a571e03ac9c9eb76fac45af8e51", "9cfc4e967edb808d679f777bc6702c7d"
		  TestCBC 256, key, "9CFC4E967EDB808D679F777BC6702C7D", "30c81c46a35ce411e5fbc1191a0a52ef", "39f23369a9d9bacfa530e26304231461"
		  TestCBC 256, key, "39F23369A9D9BACFA530E26304231461", "f69f2445df4f9b17ad2b417be66c3710", "b2eb05e2c39be9fcda6c19078c6a9d1b"
		  
		  
		  
		  MsgBox "OK, if no breakpoint."
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub TestCBC(keylen as integer, key as string, InitializationVector as string, plainText as string, cipherText as string)
		  dim a as new AESMBS
		  
		  dim k as string = DecodeHex(key)
		  dim p as string = DecodeHex(plainText)
		  dim i as string = DecodeHex(InitializationVector)
		  
		  if a.SetKey(k, keylen) then
		    dim pm as MemoryBlock = p
		    a.EncryptCBC(pm, pm.size, i)
		    dim d as string = EncodeHex(pm)
		    
		    if d = cipherText then
		      // ok
		      
		      a.DecryptCBC(pm, pm.size, i)
		      
		      dim e as string = EncodeHex(pm)
		      
		      if e = plainText then
		        // ok
		      else
		        break
		      end if
		      
		    else
		      break
		    end if
		    
		  else
		    break
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCFB128(keylen as integer, key as string, InitializationVector as string, TestVector as string, CipherText as string)
		  dim a as new AESMBS
		  
		  dim k as string = DecodeHex(key)
		  dim p as string = DecodeHex(TestVector)
		  dim i as string = DecodeHex(InitializationVector)
		  
		  if a.SetKey(k, keylen) then
		    dim pm as MemoryBlock = p
		    dim offset as integer
		    a.EncryptCFB128(pm, pm.size, offset, i)
		    dim d as string = EncodeHex(pm)
		    
		    if d = cipherText then
		      // ok
		      
		      if a.SetKey(k, keylen) then
		        a.DecryptCFB128(pm, pm.size, offset, i)
		        
		        dim e as string = EncodeHex(pm)
		        
		        if e = TestVector then
		          // ok
		        else
		          break
		        end if
		      else
		        break
		      end if
		    else
		      break
		    end if
		    
		  else
		    break
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestECB(keylen as integer, key as string, plainText as string, cipherText as string)
		  dim a as new AESMBS
		  
		  dim k as string = DecodeHex(key)
		  dim p as string = DecodeHex(plainText)
		  
		  if a.SetKey(k, keylen) then
		    dim pm as MemoryBlock = p
		    a.EncryptECB(pm)
		    dim d as string = EncodeHex(pm)
		    
		    if d = cipherText then
		      // ok
		      
		      a.DecryptECB(pm)
		      
		      dim e as string = EncodeHex(pm)
		      
		      if e = plainText then
		        // ok
		      else
		        break
		      end if
		      
		    else
		      break
		    end if
		    
		  else
		    break
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestOFB(keylen as integer, key as string, InitializationVector as string, TestVector as string, CipherText as string)
		  dim a as new AESMBS
		  
		  dim k as string = DecodeHex(key)
		  dim p as string = DecodeHex(TestVector)
		  dim i as string = DecodeHex(InitializationVector)
		  
		  if a.SetKey(k, keylen) then
		    dim pm as MemoryBlock = p
		    dim offset as integer
		    a.EncryptOFB(pm, pm.size, offset, i)
		    dim d as string = EncodeHex(pm)
		    
		    if d = cipherText then
		      // ok
		      
		      a.EncryptOFB(pm, pm.size, offset, i)
		      
		      dim e as string = EncodeHex(pm)
		      
		      if e = TestVector then
		        // ok
		      else
		        break
		      end if
		      
		    else
		      break
		    end if
		    
		  else
		    break
		  end if
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
