#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  dim a as new AESMBS
		  
		  // see http://www.chilkatsoft.com/p/php_aes.asp
		  
		  dim key256 as string = "12345678901234561234567890123456"
		  dim key128 as string = "1234567890123456"
		  
		  // Here's our 128-bit IV which is used for both 256-bit and 128-bit keys.
		  dim iv as MemoryBlock = "1234567890123456"
		  
		  print "iv: "+EncodingToHexMBS(iv)
		  print "key256: "+EncodingToHexMBS(key256)
		  print "key128: "+EncodingToHexMBS(key128)
		  
		  // This is the plain-text to be encrypted:
		  dim cleartext as string = "The quick brown fox jumped over the lazy dog"
		  
		  // The mcrypt_generic_init function initializes the cipher by specifying both
		  // the key and the IV.  The length of the key determines whether we're doing
		  // 128-bit, 192-bit, or 256-bit encryption.
		  
		  call a.SetKey key256, 256
		  
		  // PHP pads with NULL bytes if $cleartext is not a multiple of the block size..
		  while lenb(cleartext) mod 16 <> 0 
		    cleartext = cleartext + chrb(0)
		  wend
		  
		  dim idata as MemoryBlock = cleartext
		  dim odata as new MemoryBlock(idata.Size)
		  dim cipherText as string
		  
		  a.EncryptCBC idata, idata.Size, iv, odata, 0, 0
		  cipherText = odata
		  
		  // Display the result in hex.
		  print "256-bit encrypted result: "+EncodingToHexMBS(cipherText)
		  
		  // Now let's do 128-bit encryption:
		  call a.SetKey key128, 128
		  
		  // PHP pads with NULL bytes if $cleartext is not a multiple of the block size..
		  idata = cleartext
		  odata = new MemoryBlock(idata.Size)
		  iv = "1234567890123456"
		  
		  a.EncryptCBC idata, idata.Size, iv, odata, 0, 0
		  cipherText = odata
		  
		  // Display the result in hex.
		  print "128-bit encrypted result: "+EncodingToHexMBS(cipherText)
		  
		  
		  // -------
		  // Results in PHP
		  // -------
		  // You may use these as test vectors for testing your AES implementations...
		  //
		  // ------------------------
		  // 256-bit key, CBC mode
		  // ------------------------
		  // IV = '1234567890123456'
		  //  (hex: 31323334353637383930313233343536)
		  // Key = '12345678901234561234567890123456'
		  //  (hex: 3132333435363738393031323334353631323334353637383930313233343536)
		  // PlainText:
		  //  'The quick brown fox jumped over the lazy dog'
		  // CipherText(hex):
		  //  2fddc3abec692e1572d9b7d629172a05caf230bc7c8fd2d26ccfd65f9c54526984f7cb1c4326ef058cd7bee3967299e3
		  
		  //
		  // ------------------------
		  // 128-bit key, CBC mode
		  // ------------------------
		  // IV = '1234567890123456'
		  //  (hex: 31323334353637383930313233343536)
		  // Key = '1234567890123456'
		  //  (hex: 31323334353637383930313233343536)
		  // PlainText:
		  //  'The quick brown fox jumped over the lazy dog'
		  // CipherText(hex):
		  //  f78176ae8dfe84578529208d30f446bbb29a64dc388b5c0b63140a4f316b3f341fe7d3b1a3cc5113c81ef8dd714a1c99
		  
		  'Plugin result in Real Studio:
		  '
		  'iv: 31323334353637383930313233343536
		  'key256: 3132333435363738393031323334353631323334353637383930313233343536
		  'key128: 31323334353637383930313233343536
		  '256-bit encrypted result: 2FDDC3ABEC692E1572D9B7D629172A05CAF230BC7C8FD2D26CCFD65F9C54526984F7CB1C4326EF058CD7BEE3967299E3
		  '128-bit encrypted result: F78176AE8DFE84578529208D30F446BBB29A64DC388B5C0B63140A4F316B3F341FE7D3B1A3CC5113C81EF8DD714A1C99
		  
		End Function
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
