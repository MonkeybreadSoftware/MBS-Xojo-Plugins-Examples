#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "zlib compression"
   Visible         =   True
   Width           =   300
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      Height          =   12
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   100
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   46
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   260
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Compress using function"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   143
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin ProgressBar ProgressBar2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      Height          =   12
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   100
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   102
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   260
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Compress progress:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Decompress progress:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   70
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Compress using class"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   175
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Decompress using function"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   207
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Decompress using class"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   239
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  compare
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub compare()
		  'dim f as FolderItem
		  'dim bi,bo as BinaryStream
		  'dim li,lo as Int64
		  '
		  'f=SpecialFolder.Desktop.Child("ServiceDemo2.sit.zlib")
		  'bi=f.OpenAsBinaryFile(false)
		  '
		  'f=SpecialFolder.Desktop.Child("ServiceDemo3.sit.zlib")
		  'bo=f.OpenAsBinaryFile(false)
		  '
		  'while not bi.eof and not bo.eof
		  'li=bi.ReadInt64
		  'lo=bo.ReadInt64
		  '
		  'if li<>lo then
		  'bi.Position=bi.Position-8
		  'bo.Position=bo.Position-8
		  '
		  'DebugMessageMBS str(bi.Position)+" "+hex(li)+" "+hex(lo)+" "+bi.Read(8)+" "+bo.Read(8)
		  'end if
		  'if bi.Position>1000 then
		  'exit
		  'end if
		  'wend
		  '
		  'DebugMessageMBS "fertig"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Compress_class()
		  // Compress using the ZipCompressMBS class
		  
		  dim z as Bzip2compressMBS
		  dim o,i as String
		  dim fo,fi as FolderItem
		  dim bo,bi as BinaryStream
		  
		  z=new Bzip2compressMBS
		  
		  fi=GetOpenFolderItem("special/any")
		  if fi=nil then
		    Return
		  end if
		  
		  fo=GetSaveFolderItem("application/x-compress",fi.name+".bz2")
		  if fo=nil then
		    Return
		  end if
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    MsgBox "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("application/x-compress")
		  if bo=nil then
		    MsgBox "Can't open destination file."
		    Return
		  end if
		  
		  bo.LittleEndian=false
		  bo.WriteInt64 bi.Length
		  
		  z.InitZip(9)
		  
		  ProgressBar1.Maximum=bi.Length/1024
		  
		  do
		    
		    if z.InputAvail=0 and not bi.eof then
		      if z.SetInput(bi.Read(30000)) then
		        ProgressBar1.Value=bi.Position/1024
		        ProgressBar1.Refresh
		        UpdateNow
		      else
		        MsgBox "SetInput failed!"
		        Return
		      end if
		    end if
		    
		    z.ProcessZip
		    
		    o=z.GetOutput
		    
		    if o<>"" then
		      bo.Write o
		    end if
		    
		  loop until (z.InputAvail=0 and bi.eof) or UserCancelled
		  
		  z.EndZip
		  
		  o=z.GetOutput
		  if o<>"" then
		    bo.Write o
		  end if
		  
		  bi.Close
		  bo.Close
		  
		  MsgBox "Compression finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Compress_func()
		  // Compress using the Compress function
		  
		  dim o,i,q as String
		  dim fo,fi as FolderItem
		  dim bo,bi as BinaryStream
		  dim l as integer
		  
		  fi=GetOpenFolderItem("special/any")
		  if fi=nil then
		    Return
		  end if
		  
		  fo=GetSaveFolderItem("application/x-compress",fi.name+".bz2")
		  if fo=nil then
		    Return
		  end if
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    MsgBox "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("application/x-compress")
		  if bo=nil then
		    MsgBox "Can't open destination file."
		    Return
		  end if
		  
		  l=bi.Length
		  q=bi.Read(l)
		  
		  o=CompressBZip2MBS(q,9)
		  
		  bo.LittleEndian=false
		  bo.WriteInt64 l
		  bo.Write o
		  
		  bi.Close
		  bo.Close
		  
		  MsgBox "Compression finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub crc()
		  dim b as BinaryStream
		  dim f as FolderItem
		  dim i,j as integer
		  dim s as String
		  dim o as String
		  
		  f=SpecialFolder.Desktop.Child("TTsZipPackage.sit")
		  b=f.OpenAsBinaryFile(false)
		  
		  s=b.Read(b.Length)
		  
		  b.Close
		  
		  o=CompressZLibMBS(s,9)
		  
		  j=CRC_32OfStrMBS(o)
		  i=CRC_32OfStrMBS(s)
		  
		  System.DebugLog "len "+str(lenb(S))
		  System.DebugLog "crc "+hex(i)
		  System.DebugLog "len "+str(lenb(o))
		  System.DebugLog "crc "+hex(j)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub decompress_class()
		  // Decompress using the ZipCompressMBS class
		  
		  dim z as Bzip2DecompressMBS
		  dim o,i as String
		  dim fo,fi as FolderItem
		  dim bo,bi as BinaryStream
		  dim s as String
		  dim l as integer
		  
		  z=new Bzip2DecompressMBS
		  
		  fi=GetOpenFolderItem("application/x-compress")
		  if fi=nil then
		    Return
		  end if
		  
		  s=fi.Name
		  s=Replaceall(s,".bz2","")
		  
		  fo=GetSaveFolderItem("special/any",s)
		  if fo=nil then
		    Return
		  end if
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    MsgBox "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("special/any")
		  if bo=nil then
		    MsgBox "Can't open destination file."
		    Return
		  end if
		  
		  bi.LittleEndian=false
		  
		  l=bi.ReadInt64
		  
		  z.InitZip
		  
		  ProgressBar2.Maximum=bi.Length/1024
		  
		  do
		    
		    if z.InputAvail=0 and not bi.eof then
		      if z.SetInput(bi.Read(30000)) then
		        ProgressBar2.Value=bi.Position/1024
		        ProgressBar2.Refresh
		        UpdateNow
		      else
		        MsgBox "SetInput failed!"
		        Return
		      end if
		    end if
		    
		    z.ProcessZip
		    
		    o=z.getOutput
		    
		    if o<>"" then
		      bo.Write o
		    end if
		    
		  loop until (z.OutputSize=0 and z.InputAvail=0 and bi.eof) or UserCancelled
		  
		  z.EndZip
		  
		  o=z.getOutput
		  if o<>"" then
		    bo.Write o
		  end if
		  
		  bi.Close
		  bo.Close
		  
		  MsgBox "Decompression finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub decompress_func()
		  // Decompress using the Uncompress function
		  
		  dim o,i as String
		  dim fo,fi,fc as FolderItem
		  dim bo,bi as BinaryStream
		  dim ulen as integer
		  dim s as String
		  dim l as integer
		  
		  fi=GetOpenFolderItem("application/x-compress")
		  if fi=nil then
		    Return
		  end if
		  
		  s=fi.Name
		  s=Replaceall(s,".bz2","")
		  
		  fo=GetSaveFolderItem("special/any",s)
		  if fo=nil then
		    Return
		  end if
		  
		  bi=fi.OpenAsBinaryFile(false)
		  if bi=nil then
		    MsgBox "Can't open source file."
		    Return
		  end if
		  
		  bo=fo.CreateBinaryFile("special/any")
		  if bo=nil then
		    MsgBox "Can't open destination file."
		    Return
		  end if
		  
		  bi.LittleEndian=false
		  
		  ulen=bi.ReadInt64
		  o=bi.Read(bi.Length-4)
		  
		  o=DecompressBZip2MBS(o,ulen)
		  
		  if o="" then
		    MsgBox "Decompression failed."
		    Return
		  end if
		  
		  if len(o)<>ulen then
		    MsgBox "Warning: Decompressed data is too short."
		  end if
		  
		  bo.Write o
		  
		  bi.Close
		  bo.Close
		  
		  MsgBox "Decompression finished."
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Compress_func
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Compress_class
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  decompress_func
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  decompress_class
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
