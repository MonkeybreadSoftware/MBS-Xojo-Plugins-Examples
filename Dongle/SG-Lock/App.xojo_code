#tag Class
Protected Class App
Inherits ConsoleApplication
	#tag Event
		Function Run(args() as String) As Integer
		  LoadDLL
		  
		  '****************************************************************************
		  ' SG-Lock Test app based on old REALbasic sample, but now using MBS Xojo Dongle Plugin
		  '
		  '*****************************************************************************
		  
		  ' Note: The SG-Lock API is used through the SG-Lock library "SGLW32.dll". The array data 
		  ' exchange between library and Realbasic exe-file is done by MemoryBlocks as raw memory 
		  ' data objects
		  
		  
		  
		  '*****************************************************************************
		  ' Beginning of SGL-API Declarations
		  '*****************************************************************************
		  
		  '****************************************************************************
		  ' Basic functions
		  
		  '*******************************************************************************
		  
		  dim SGLockMemSize as Integer
		  dim Rand as new Random
		  
		  
		  ' demo authentcode - insert here your personel authentcode !
		  dim AuthentCode(11) As UInt32
		  AuthentCode(0) = &HF574D17B
		  AuthentCode(1) = &HA94628EE
		  AuthentCode(2) = &HF2857A8F
		  AuthentCode(3) = &H69346B4A
		  AuthentCode(4) = &H4136E8F2
		  AuthentCode(5) = &H89ADC688
		  AuthentCode(6) = &H80C2C1D4
		  AuthentCode(7) = &HA8C6327C
		  AuthentCode(8) = &H1A72699A
		  AuthentCode(9) = &H574B7CA0
		  AuthentCode(10) = &H1E8D3E98
		  AuthentCode(11) = &HD7DEFDC5
		  
		  ' demo key no. 0  stored in SG-Lock
		  dim Key as new MemoryBlock(16)
		  Key.UInt32Value(0*4) = &HD94B6C2B
		  Key.UInt32Value(1*4) = &H17E88CEF
		  Key.UInt32Value(2*4) = &HDADBCF1D
		  Key.UInt32Value(3*4) = &H202161A2
		  
		  
		  ' first of all we have to do the SG-Lock library authentication
		  SGLockMBS.Authenticate( AuthentCode )
		  if SGLockMBS.Lasterror = SGLockMBS.kErrorSuccess then
		    Print "SglAuthent successful"
		  else
		    Print "SglAuthent error: "   +  (str(SGLockMBS.Lasterror))
		    exit
		  end if
		  
		  
		  ' let's go to the SG-Lock hardware ...
		  ' Set product ID to standard value
		  dim ProductId  as UInt32 = 1
		  
		  ' search SG-Lock 
		  call SGLockMBS.SearchLock( ProductId )
		  if SGLockMBS.Lasterror = SGLockMBS.kErrorSuccess then
		    Print "SglSearchLock successful"
		  elseif SGLockMBS.Lasterror = SGLockMBS.kErrorDongleNotFound then
		    Print "Dongle not found."
		    return 1
		  else
		    Print "SglSearchLock error: "   +  (str(SGLockMBS.Lasterror))
		    return 2
		  end if
		  
		  ' read serial number of SG-Lock
		  dim serialNumber as Uint32 = SGLockMBS.ReadSerialNumber( ProductId  )
		  if SGLockMBS.Lasterror = SGLockMBS.kErrorSuccess then
		    Print "SglReadSerialNumber successful"
		    Print "  Serial number: " + str(serialNumber)
		  else
		    Print "SglReadSerialNumber error: "   +  (str(SGLockMBS.Lasterror))
		  end if
		  
		  
		  ' read some type inforamtion from attached SG-Lock like version
		  ' and type information, memory size etc.
		  dim ConfigData as memoryblock = SGLockMBS.ReadConfig(ProductId)
		  if SGLockMBS.Lasterror = SGLockMBS.kErrorSuccess then
		    Print "SglReadConfig successful"
		    for i as integer = 0 to 7
		      'Print str(MbData.UInt32Value(i*4))
		    next 
		  else
		    Print "SglReadConfig error: "   +  (str(SGLockMBS.Lasterror))
		  end if
		  
		  ' set memory size for next function
		  SGLockMemSize = ConfigData.UInt32Value(5*4)
		  
		  ' read whole memory of attached SG-Lock
		  dim ReadData as MemoryBlock = SGLockMBS.ReadData( ProductId, 0, SGLockMemSize )
		  if SGLockMBS.Lasterror = SGLockMBS.kErrorSuccess then
		    Print "SglReadData successful"
		    Print "   Data: "
		    
		    for i as integer = 0 to 15
		      Print str(i*4) + ": " + _
		      str(ReadData.UInt32Value((i*4+0)*4)) + " " + _
		      str(ReadData.UInt32Value((i*4+1)*4)) + " " + _
		      str(ReadData.UInt32Value((i*4+2)*4)) + " " + _
		      str(ReadData.UInt32Value((i*4+3)*4))
		    next
		  else
		    Print "SglReadData error: "   +  (str(SGLockMBS.Lasterror))
		  end if
		  
		  ' write some data
		  'for i=0 to SgLockMemSize-1
		  'MbData.UInt32Value(i*4)= MbData.UInt32Value(i*4) +1
		  'next
		  
		  'RetCode= SglWriteData( ProductId, 0, SGLockMemSize, MbData )
		  'if RetCode = SGLockMBS.kErrorSuccess then
		  'Print "SglWriteData successful"
		  'else
		  'Print "SglWriteData error: "   +  (str(SGLockMBS.Lasterror))
		  'end if
		  
		  
		  ' let's perform a "challenge response authentication"
		  dim RandNum as new MemoryBlock(8)
		  RandNum.UInt32Value(0*4) =  Rand.InRange(0, &HFFFFFFFF)
		  RandNum.UInt32Value(1*4) =  Rand.InRange(0, &HFFFFFFFF)
		  
		  dim MbLockRandNum as new MemoryBlock(8)
		  MbLockRandNum.UInt32Value(0*4) = RandNum.UInt32Value(0*4)
		  MbLockRandNum.UInt32Value(1*4) = RandNum.UInt32Value(1*4)
		  
		  dim KeyNum as UInt32 = 0
		  dim EncryptedData as MemoryBlock = SGLockMBS.CryptLock( ProductId, KeyNum, SGLockMBS.kCryptModeEncrypt, MbLockRandNum)
		  if SGLockMBS.Lasterror = SGLockMBS.kErrorSuccess then
		    Print "SglCryptLock successful"
		  else
		    Print "SglCryptLock error: "   +  (str(SGLockMBS.Lasterror))
		  end if
		  
		  dim cipheredData as MemoryBlock = SGLockMBS.TeaEncipher(RandNum, Key)
		  
		  
		  If (EncryptedData.UInt32Value(0*4) = cipheredData.Uint32Value(0*4)) And _
		    (EncryptedData.UInt32Value(1*4) = cipheredData.Uint32Value(1*4)) Then
		    Print "Challenge Response Authentication passed!"
		  else
		    Print "Challenge Response Authentication failed!"
		  End If
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
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

	#tag Method, Flags = &h0
		Sub LoadDLL()
		  
		  #if TargetWin32 then
		    #if Target64Bit then
		      const DLLName = "SGLW64.dll"
		    #else
		      const DLLName = "SglW32.dll"
		    #endif
		  #elseif TargetLinux then
		    #if Target64Bit then
		      const DLLName = "libsgllnx64-2.29.02.so"
		    #elseif TargetARM then
		      const DLLName = "libsglarmhf32-2.30.0.0.so"
		    #else
		      const DLLName = "libsgllnx-2.29.0.1.so"
		    #endif
		  #elseif TargetMacOS then
		    const DLLName = "libsglmac-2.29.0.0.dylib"
		  #else
		    ?
		  #endif
		  
		  dim file as FolderItem
		  
		  file = FindFile(DLLName)
		  
		  if file <> nil and file.Exists then
		    // ok
		    
		  else
		    dim folder as FolderItem = FindFile("SG-Lock DLLs")
		    file = folder.Child(DLLName)
		    
		  end if
		  
		  
		  if SGLockMBS.LoadLibraryFile(file) then
		    MsgBox "OK"
		  else
		    MsgBox "Failed to load: "+SGLockMBS.LibraryError
		  end if
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
