#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1880309759
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  TestCBC
		  TestECB
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DecryptECB(key as string, input as string) As string
		  dim k as string = DecodeHex(key)
		  dim i as string = DecodeHex(input)
		  
		  
		  dim e as string = TwofishMBS.DecryptECB(k, i)
		  
		  
		  dim r as string = EncodeHex(e)
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncryptECB(key as string, input as string) As string
		  dim k as string = DecodeHex(key)
		  dim i as string = DecodeHex(input)
		  
		  #if DebugBuild then
		    dim ilen as integer = i.Len
		    dim klen as integer = k.len
		  #endif
		  
		  dim e as string = TwofishMBS.EncryptECB(k, i)
		  
		  #if DebugBuild then
		    dim elen as integer = e.Len
		  #endif
		  
		  dim r as string = EncodeHex(e)
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCBC()
		  dim ss as string = "00000000000000000000000000000000"
		  dim s as string = DecodeHex(ss)
		  
		  dim e as string = TwofishMBS.EncryptCBC(s, s, s)
		  dim d as string = TwofishMBS.DecryptCBC(s, e, s)
		  
		  dim es as string = EncodeHex(e)
		  dim ds as string = EncodeHex(d)
		  
		  if ds <> ss then
		    Break
		    MsgBox "CBC failed"
		    Return
		  end if
		  
		  
		  testCBC "8GSgXLqVr5fuRSAAGC2I6oI3CCeAR7vW", "Hello cruel World!", "0000000000000000", "e6QqlT2ewFnHQYazxRKdBZzGb0xJAOL9C1n6V+81fKKfgQqtY3pZa1pxaEUr7rid"
		  testCBC "8GSgXLqVr5fuRSAAGC2I6oI3CCeAR7vW", "Hello cruel World!", "0000000000000001", "pSm5oC+FP5MWAwHq/xPn14dAPyUAbKJUzEqGs5ZhsYflVrdsQHHTsbPd3Ojo8QdU"
		  testCBC "8GSgXLqVr5fuRSAAGC2I6oI3CCeAR7vW", "Hello cruel World!", "1000000000000000", "KjmHjeqq8RM5Ogpa+6xT7vLwbvJcgPgH+uTQ7lGcAo3FZnOj/z6j5KBbFC51NjLg"
		  testCBC "G8SgXLqVr5fuRSAAGC2I6oI3CCeAR7vW", "Hello cruel World!", "0000000000000000", "BzB/zSxNBWfbVgg2VBQP1SpbM7NWfBYBuS62JRAQQPXtlDbqSwfRlBcs4/+7Y99z"
		  testCBC "G8SgXLqVr5fuRSAAGC2I6oI3CCeAR7vW", "Hello cruel World!", "0000000000000001", "PYuIRks1LUBrAaDvqnaqGm0x78VthKQRW6bYLTS0X82Minj9s8ro8SxlaeW7uCRM"
		  testCBC "G8SgXLqVr5fuRSAAGC2I6oI3CCeAR7vW", "Hello cruel World!", "1000000000000000", "X9BsmQDsO2GOdj7f6du3/fxNo5Tdwh+5NxNs3076ttmkQLxHPEdvSItlMnIY3DkN"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub testCBC(Key as string, Input as String, IV as String, EncryptedBase64 as string)
		  dim prefix as string = "0000000000000000" // salt
		  
		  // add padding to 16 byte block sizes
		  dim ModResult as integer = 16 - input.len mod 16
		  
		  dim Padded as string = prefix + input
		  if ModResult = 0 then
		    ModResult = 16
		  end if
		  
		  for i as integer = 1 to ModResult
		    padded = padded + chrb(ModResult)
		  next
		  
		  // encrypt
		  dim Encrypted as String = TwofishMBS.EncryptCBC(key, padded,    IV)
		  
		  // decrypt
		  dim Decrypted as string = TwofishMBS.DecryptCBC(key, Encrypted, IV)
		  
		  // remove zeros
		  Decrypted = ReplaceAllb(Decrypted, chr(0), "")
		  
		  dim n as integer = asc(Rightb(Decrypted,1))
		  // remove passing
		  Decrypted = Decrypted.leftb(Decrypted.lenb-n)
		  // remove salt prefix
		  Decrypted = midb(Decrypted, lenb(prefix)+1)
		  // set encodings
		  Decrypted = DefineEncoding(Decrypted, encodings.UTF8)
		  
		  // match?
		  dim Base64 as string = EncodeBase64(Encrypted)
		  
		  if Base64 <> EncryptedBase64 then
		    break
		  elseif Decrypted = input then
		    // ok
		  else
		    Break
		    MsgBox "CBC failed"
		    Return
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestECB()
		  // test vectors from website:
		  // https://www.schneier.com/code/ecb_ival.txt
		  
		  dim key, soll, input, encrypted, decrypted, lastInput, lastKey as string
		  
		  key   = "00000000000000000000000000000000"
		  input = "00000000000000000000000000000000"
		  soll  = "9F589F5CF6122C32B6BFEC2F2AE8C35A"
		  
		  encrypted = EncryptECB(key, input)
		  decrypted = DecryptECB(key, encrypted)
		  
		  if encrypted = soll and decrypted = input then
		    // ok
		  else
		    break
		    MsgBox "ECB failed"
		    Return
		  end if
		  
		  key   = "0123456789ABCDEFFEDCBA98765432100011223344556677"
		  input = "00000000000000000000000000000000"
		  soll  = "CFD1D2E5A9BE9CDF501F13B892BD2248"
		  
		  encrypted = EncryptECB(key, input)
		  decrypted = DecryptECB(key, encrypted)
		  
		  if encrypted = soll and decrypted = input then
		    // ok
		  else
		    break
		    MsgBox "ECB failed"
		    Return
		  end if
		  
		  
		  key   = "0123456789ABCDEFFEDCBA987654321000112233445566778899AABBCCDDEEFF"
		  input = "00000000000000000000000000000000"
		  soll  = "37527BE0052334B89F0CFCCAE87CFA20"
		  
		  encrypted = EncryptECB(key, input)
		  decrypted = DecryptECB(key, encrypted)
		  
		  if encrypted = soll and decrypted = input then
		    // ok
		  else
		    break
		    MsgBox "ECB failed"
		    Return
		  end if
		  
		  
		  
		  // test 49 rounds, 128 bits
		  key   = "00000000000000000000000000000000"
		  input = "00000000000000000000000000000000"
		  
		  for i as integer = 1 to 49
		    
		    lastInput = input
		    lastkey   = key
		    
		    encrypted = EncryptECB(key, input)
		    decrypted = DecryptECB(key, encrypted)
		    
		    if decrypted = input then
		      // ok
		    else
		      break // failed
		      MsgBox "ECB failed"
		      Return
		    end if
		    
		    key = lastInput
		    input = encrypted
		    
		  next
		  
		  if encrypted = "5D9D4EEFFA9151575524F115815A12E0" and lastkey = "BCA724A54533C6987E14AA827952F921" then
		    // ok
		  else
		    break
		    MsgBox "ECB failed"
		    Return
		  end if
		  
		  
		  
		  // test 49 rounds, 192 bits
		  key   = "000000000000000000000000000000000000000000000000"
		  input = "00000000000000000000000000000000"
		  
		  for i as integer = 1 to 49
		    
		    lastInput = input
		    lastkey   = key
		    
		    encrypted = EncryptECB(key, input)
		    decrypted = DecryptECB(key, encrypted)
		    
		    if decrypted = input then
		      // ok
		    else
		      break // failed
		      MsgBox "ECB failed"
		      Return
		    end if
		    
		    key = lastInput + left(key, 16)
		    input = encrypted
		    
		  next
		  
		  if encrypted = "E75449212BEEF9F4A390BD860A640941" and lastkey = "FB66522C332FCC4C042ABE32FA9E902FDEA4F3DA75EC7A8E" then
		    // ok
		  else
		    break
		    MsgBox "ECB failed"
		    Return
		  end if
		  
		  
		  
		  
		  // test 49 rounds, 256 bits
		  key   = "0000000000000000000000000000000000000000000000000000000000000000"
		  input = "00000000000000000000000000000000"
		  
		  for i as integer = 1 to 49
		    
		    lastInput = input
		    lastkey   = key
		    
		    encrypted = EncryptECB(key, input)
		    decrypted = DecryptECB(key, encrypted)
		    
		    if decrypted = input then
		      // ok
		    else
		      break // failed
		      MsgBox "ECB failed"
		      Return
		    end if
		    
		    key = lastInput + left(key, 32)
		    input = encrypted
		    
		  next
		  
		  if encrypted = "37FE26FF1CF66175F5DDF4C33B97A205" and lastkey = "248A7F3528B168ACFDD1386E3F51E30C2E2158BC3E5FC714C1EEECA0EA696D48" then
		    // ok
		  else
		    break
		    MsgBox "ECB failed"
		    Return
		  end if
		  
		  
		  // all okay
		  MsgBox "All okay, if you came here without errors."
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
