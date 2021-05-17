#tag Window
Begin Window frmMain
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   True
   HasFullScreenButton=   False
   Height          =   222
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   975498003
   MenuBarVisible  =   True
   MinHeight       =   150
   MinimizeButton  =   True
   MinWidth        =   300
   Placement       =   0
   Resizeable      =   True
   Title           =   "File Encryption with AES"
   Visible         =   True
   Width           =   300
   Begin BevelButton btnDecrypt
      AcceptFocus     =   False
      AutoDeactivate  =   False
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Dncrypt with AES CBC"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   180
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   260
   End
   Begin BevelButton btnRoundTrip
      AcceptFocus     =   False
      AutoDeactivate  =   False
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Round-Trip"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   104
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   260
   End
   Begin TextField txBlockSize
      AcceptTabs      =   False
      Alignment       =   3
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   171
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "160000"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   48
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   109
   End
   Begin Label lbBlockSize
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Block size in bytes:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   48
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   139
   End
   Begin Label lbFileName
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Filename on desktop:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   139
   End
   Begin TextField txFileName
      AcceptTabs      =   False
      Alignment       =   3
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   171
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "ht"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   68
   End
   Begin BevelButton btnEncrypt
      AcceptFocus     =   False
      AutoDeactivate  =   False
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Encrypt with AES CBC"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   146
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   260
   End
   Begin TextField txExtension
      AcceptTabs      =   False
      Alignment       =   3
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   True
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   245
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "zip"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   35
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DecryptAES(key as string, iv as string, SourceFile as FolderItem, DestFile as FolderItem, optional Blocksize as Integer = 160000) As Boolean
		  // decrypt file with AES and CBC
		  
		  BlockSize = BlockSize - (BlockSize mod 16)
		  
		  if BlockSize <=0  then
		    BlockSize = 16
		  end
		  
		  dim a as AESMBS = NewAES(key)
		  if a = nil then Return false
		  
		  dim bi as BinaryStream = sourcefile.OpenAsBinaryFile(false)
		  if bi = nil then Return false
		  
		  dim bo as BinaryStream = destfile.CreateBinaryFile("")
		  if bo = nil then Return false
		  
		  dim IVectorOffset as integer = 0
		  dim IVector as  MemoryBlock = iv
		  
		  dim newIV as new MemoryBlock(16)
		  
		  dim FileLength as int64 = SourceFile.Length
		  dim BytesToProcess as int64 = 0
		  dim aktPos as int64 = 0
		  dim aktBlockLength as int64
		  
		  dim data as string =""
		  
		  do
		    
		    aktPos = bi.Position
		    BytesToProcess = FileLength -  aktPos
		    
		    data = bi.Read(BlockSize)
		    
		    dim idata as MemoryBlock = data
		    
		    // pick last 16 bytes of encrypted data as initialization vector of next block
		    
		    newIV = idata.RightB(16)
		    
		    aktBlockLength = LenB(idata)
		    
		    if aktBlockLength > 0 then
		      
		      a.DecryptCBC(idata, lenb(data), IVector, nil, 0, 0)
		      
		      // assign initialization vector for next block
		      IVector = newIV
		      
		      if BytesToProcess <= BlockSize then
		        
		        // Last block
		        
		        // check padding byte
		        dim wegDamit as integer = asc(idata.RightB(1))
		        
		        // copy bytes without padding
		        
		        if BytesToProcess - wegDamit > 0 then
		          
		          dim RestData as string = idata.LeftB(BytesToProcess - wegDamit)
		          bo.Write RestData
		          
		        end if
		        
		      else
		        
		        // write decrypted bytes
		        bo.Write idata
		      end if
		      
		    end if
		    
		  loop until aktBlockLength = 0
		  
		  bo.Close
		  bi.Close
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DecryptFile()
		  dim key as string = "1234567890123456ABCDEFGHIJKLMNOP"
		  dim iv as string = "6543210987654321"
		  
		  dim Filename as string = txFileName.Text
		  dim Extension as string =  "." + txExtension.Text
		  
		  dim sourceFile as FolderItem = SpecialFolder.Desktop.Child(Filename +".aes")
		  dim decryptedFile as FolderItem = SpecialFolder.Desktop.Child(Filename +"_decrypted" + Extension)
		  
		  if sourceFile.Exists = false then
		    MsgBox "File not found: " + sourceFile.Name
		    return
		  end if
		  
		  if DecryptAES(key, iv, sourceFile, decryptedFile) then
		    MsgBox "Fertig !"
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncryptAES(key as string, iv as string, sourcefile as FolderItem, destfile as FolderItem, optional BlockSize as integer = 160000) As Boolean
		  // encrypt file with AES and CBC
		  
		  BlockSize = BlockSize - (BlockSize mod 16)
		  
		  if BlockSize <=0  then
		    BlockSize = 16
		  end
		  
		  dim a as AESMBS = NewAES(key)
		  if a = nil then Return false
		  
		  dim bi as BinaryStream = sourcefile.OpenAsBinaryFile(false)
		  if bi = nil then Return false
		  
		  dim bo as BinaryStream = destfile.CreateBinaryFile("")
		  if bo = nil then Return false
		  
		  dim IVectorOffset as integer = 0
		  dim IVector as  MemoryBlock = iv
		  
		  dim newIV as new MemoryBlock(16)
		  
		  dim FileLength as int64 = SourceFile.Length
		  dim BytesToProcess as int64 = 0
		  dim aktPos as int64 = 0
		  dim aktBlockLength as int64
		  
		  dim data as string =""
		  
		  do
		    
		    aktPos = bi.Position
		    BytesToProcess = FileLength -  aktPos
		    
		    data = bi.Read(BlockSize)
		    
		    dim idata as MemoryBlock = data
		    dim PaddingValue as integer = 16 - (BytesToProcess Mod 16)
		    
		    aktBlockLength = LenB(idata)
		    
		    if aktBlockLength > 0 then
		      
		      if BytesToProcess <= BlockSize then
		        
		        // add padding for last block
		        dim RestData as new MemoryBlock(BytesToProcess + PaddingValue)
		        RestData = idata.LeftB(BytesToProcess) + new MemoryBlock(PaddingValue)
		        
		        for i as integer = BytesToProcess to BytesToProcess + PaddingValue -1
		          RestData.byte(i) = PaddingValue
		        next i
		        
		        a.EncryptCBC(RestData, BytesToProcess + PaddingValue, IVector, nil, 0, 0)
		        bo.Write RestData
		        
		      else
		        
		        a.EncryptCBC(idata, lenb(data), IVector, nil, 0, 0)
		        
		        bo.Write idata
		        
		        // Take last bytes as initialization vector of next block
		        IVector = idata.RightB(16)
		        
		      end if
		      
		    end if
		    
		  loop until aktBlockLength = 0
		  
		  bo.Close
		  bi.Close
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EncryptFile()
		  dim key as string = "1234567890123456ABCDEFGHIJKLMNOP"
		  dim iv as string = "6543210987654321"
		  
		  dim Filename as string = txFileName.Text
		  dim Extension as string = "." + txExtension.Text
		  
		  dim sourceFile as FolderItem = SpecialFolder.Desktop.Child(Filename+Extension)
		  dim encryptedFile as FolderItem = SpecialFolder.Desktop.Child(Filename+".aes")
		  
		  if sourceFile.Exists = false then
		    MsgBox "File not found: " + Filename + extension
		    return
		  end if
		  
		  if EncryptAES(key, iv, sourceFile, encryptedFile) then
		    MsgBox "Fertig!"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewAES(key as string) As AESMBS
		  dim a as new AESMBS
		  
		  // all keys should be UTF-8
		  key = ConvertEncoding(key, encodings.ascii)
		  
		  //dim bits as integer = 0
		  dim l as integer = lenb(key)
		  
		  // pad key to required length for 16, 24 or 32 bit key
		  
		  if l>32 then
		    key = leftb(key,32)
		  elseif l>24 then
		    while lenb(key)<32
		      key = key + " "
		    wend
		  elseif l>16 then
		    while lenb(key)<24
		      key = key + " "
		    wend
		  else
		    while lenb(key)<16
		      key = key + " "
		    wend
		  end if
		  
		  if a.SetKey(key) then
		    Return a
		  end if
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events btnDecrypt
	#tag Event
		Sub Action()
		  DecryptFile
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRoundTrip
	#tag Event
		Sub Action()
		  EncryptFile
		  DecryptFile
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnEncrypt
	#tag Event
		Sub Action()
		  EncryptFile
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
