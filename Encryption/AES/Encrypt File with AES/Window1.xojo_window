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
   MenuBar         =   608953875
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
		  dim key as string = "Hello World"
		  
		  dim sourceFile as FolderItem = SpecialFolder.Desktop.Child("test.tiff")
		  dim encryptedFile as FolderItem = SpecialFolder.Desktop.Child("test.encrypted")
		  dim decryptedFile as FolderItem = SpecialFolder.Desktop.Child("test2.tiff")
		  
		  if sourceFile.Exists = false then
		    MsgBox "Please change file name in project for source file or add test.tiff to your desktop."
		    break
		  end if
		  
		  if EncryptAES(key, sourceFile, encryptedFile) then
		    if DecryptAES(key, encryptedFile, decryptedFile) then
		      MsgBox "OK"
		      decryptedFile.Launch
		    else
		      MsgBox "Failed to decrypt."
		    end if
		  else
		    MsgBox "Failed to encrypt."
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function DecryptAES(key as string, sourcefile as FolderItem, destfile as FolderItem) As Boolean
		  // decrypt file with AES and CFB
		  
		  dim a as AESMBS = NewAES(key)
		  if a = nil then Return false
		  
		  dim bi as BinaryStream = sourcefile.OpenAsBinaryFile(false)
		  if bi = nil then Return false
		  
		  dim bo as BinaryStream = destfile.CreateBinaryFile("")
		  if bo = nil then Return false
		  
		  dim IVectorOffset as integer = 0
		  dim IVector as new MemoryBlock(16)
		  
		  dim data as string = bi.Read(1000000)
		  while lenb(data)>0
		    
		    dim idata as MemoryBlock = data
		    a.DecryptCFB128(idata, lenb(data), IVectorOffset, IVector, nil, 0, 0)
		    
		    bo.Write idata
		    
		    data = bi.Read(1000000)
		  wend
		  
		  
		  bo.Close
		  bi.Close
		  
		  Return true
		  
		  // exception handler for newer Real Studio version
		  'Exception io as ioexception
		  
		  if bo<>nil then
		    destfile.Delete
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EncryptAES(key as string, sourcefile as FolderItem, destfile as FolderItem) As Boolean
		  // encrypt file with AES and CFB
		  
		  dim a as AESMBS = NewAES(key)
		  if a = nil then Return false
		  
		  dim bi as BinaryStream = sourcefile.OpenAsBinaryFile(false)
		  if bi = nil then Return false
		  
		  dim bo as BinaryStream = destfile.CreateBinaryFile("")
		  if bo = nil then Return false
		  
		  dim IVectorOffset as integer = 0
		  dim IVector as new MemoryBlock(16)
		  
		  dim data as string = bi.Read(1000000)
		  while lenb(data)>0
		    
		    dim idata as MemoryBlock = data
		    a.EncryptCFB128(idata, lenb(data), IVectorOffset, IVector, nil, 0, 0)
		    
		    bo.Write idata
		    
		    data = bi.Read(1000000)
		  wend
		  
		  
		  bo.Close
		  bi.Close
		  
		  Return true
		  
		  // exception handler for newer Real Studio version
		  'Exception io as ioexception
		  
		  if bo<>nil then
		    destfile.Delete
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewAES(key as string) As AESMBS
		  dim a as new AESMBS
		  
		  // all keys should be UTF-8
		  key = ConvertEncoding(key, encodings.UTF8)
		  
		  dim bits as integer = 0
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
