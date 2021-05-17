#tag Window
Begin Window MainWindow
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
   MenuBar         =   405717866
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Threaded Encryption and Hashes"
   Visible         =   True
   Width           =   600
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Select Input file"
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   148
   End
   Begin Listbox list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "40%,20%,40%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   332
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Method	Seconds	Result"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   48
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton RunThreadedButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run Threaded"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   279
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
   Begin PushButton RunWithoutThreads
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Run without Threads"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   419
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   161
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin ProgressWheel ProgressWheel1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   251
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      Visible         =   False
      Width           =   16
   End
   Begin Label Label1
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Running things in parallel on different CPUs can speed up things a lot."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  for each f as FolderItem in filesToDelete 
		    f.Delete
		  next
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(paramArray s as string)
		  // add new array of string to array of variants
		  
		  if app.CurrentThread = nil then
		    // main thread
		    list.AddRow s
		  else
		    // add later with timer
		    ForList.Append s
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckNextThread()
		  // launch more threads
		  
		  for each t as myThread in threads
		    if not t.Started then
		      t.Started = true
		      t.run
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FormatTicks(t as integer) As string
		  Return Format(t / 60.0, "0.0")+"s"
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isDone() As Boolean
		  if UBound(threads) = -1 then
		    Return true
		  end if
		  
		  
		  for each t as myThread in threads
		    if not t.started then
		      Return false
		    end if
		    
		    if t.state = t.Running then
		      Return false
		    end if
		  next
		  
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Prepare()
		  LaunchTicks = ticks
		  Running = true
		  ProgressWheel1.Visible = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Runthreaded(t as ThreadFunc)
		  dim thread as new myThread(T)
		  
		  if UBound(threads) < 4 then
		    thread.Started = true
		    thread.run
		  end if
		  
		  threads.Append thread
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCipherAES()
		  
		  dim t as integer = ticks
		  
		  dim d as CipherMBS = CipherMBS.aes_256_cfb128
		  dim outfile as FolderItem = GetTemporaryFolderItem
		  filesToDelete.append outfile
		  
		  dim CKey as MemoryBlock = "1234567812345678"
		  dim CIV as MemoryBlock
		  
		  call d.EncryptInit Ckey, CIV
		  
		  
		  if d.ProcessFile(file, outfile) then
		    
		    t = ticks - t
		    
		    Add "Cipher AES 256 CFB 128 encrypt", FormatTicks(t)
		    
		  else
		    Add "Cipher AES 256 CFB 128 encrypt", "", "Failed."
		    Return
		  end if
		  
		  
		  t = ticks
		  d = CipherMBS.aes_256_cfb128
		  dim defile as FolderItem = GetTemporaryFolderItem
		  filesToDelete.append defile
		  
		  call d.DecryptInit Ckey, CIV
		  
		  
		  if d.ProcessFile(outfile, defile) then
		    
		    t = ticks - t
		    
		    Add "Cipher AES 256 CFB 128 decrypt", FormatTicks(t)
		    
		  else
		    Add "Cipher AES 256 CFB 128 decrypt", "", "Failed."
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestCipherBlowfish()
		  
		  dim t as integer = ticks
		  
		  dim d as CipherMBS = CipherMBS.bf_cfb64
		  dim outfile as FolderItem = GetTemporaryFolderItem
		  filesToDelete.append outfile
		  
		  dim CKey as MemoryBlock = "1234567812345678"
		  dim CIV as MemoryBlock
		  
		  call d.EncryptInit Ckey, CIV
		  
		  
		  if d.ProcessFile(file, outfile) then
		    
		    t = ticks - t
		    
		    Add "Cipher Blowfish encrypt", FormatTicks(t)
		    
		  else
		    Add "Cipher Blowfish encrypt", "", "Failed."
		    Return
		  end if
		  
		  
		  t = ticks
		  d = CipherMBS.bf_cfb64
		  dim defile as FolderItem = GetTemporaryFolderItem
		  filesToDelete.append defile
		  
		  call d.DecryptInit Ckey, CIV
		  
		  
		  if d.ProcessFile(outfile, defile) then
		    
		    t = ticks - t
		    
		    Add "Cipher Blowfish decrypt", FormatTicks(t)
		    
		  else
		    Add "Cipher Blowfish decrypt", "", "Failed."
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestDigestMD5()
		  
		  dim t as integer = ticks
		  
		  dim d as DigestMBS = DigestMBS.MD5
		  
		  if d.Process(file) then
		    
		    dim h as string = d.FinalText
		    t = ticks - t
		    
		    Add "Digest MD5", FormatTicks(t), h
		    
		  else
		    Add "Digest MD5", "", "Failed."
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestDigestSHA512()
		  
		  dim t as integer = ticks
		  
		  dim d as DigestMBS = DigestMBS.SHA512
		  
		  if d.Process(file) then
		    
		    dim h as string = d.FinalText
		    t = ticks - t
		    
		    Add "Digest SHA512", FormatTicks(t), h
		    
		  else
		    Add "Digest SHA512", "", "Failed."
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestMD5()
		  dim h as string 
		  dim t as integer = ticks
		  
		  h = MD5DigestMBS.HashFile(file, true)
		  
		  t = ticks - t
		  
		  Add "MD5 HashFile", FormatTicks(t), h
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestSHA1()
		  dim h as string 
		  dim t as integer = ticks
		  
		  h = SHA1MBS.HashFile(file, true)
		  
		  t = ticks - t
		  
		  Add "SHA1 HashFile", FormatTicks(t), h
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestSHA256()
		  dim h as string 
		  dim t as integer = ticks
		  
		  h = SHA256MBS.HashFile(file, true)
		  
		  t = ticks - t
		  
		  Add "SHA256 HashFile", FormatTicks(t), h
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestSHA512()
		  dim h as string 
		  dim t as integer = ticks
		  
		  h = SHA512MBS.HashFile(file, true)
		  
		  t = ticks - t
		  
		  Add "SHA512 HashFile", FormatTicks(t), h
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		file As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		filesToDelete() As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			array of variants which will contain string arrays
			
		#tag EndNote
		ForList() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		LaunchTicks As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Running As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		threads() As myThread
	#tag EndProperty


#tag EndWindowCode

#tag Events BevelButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem("")
		  
		  if f = nil then Return
		  
		  file = f
		  
		  RunThreadedButton.Enabled = true
		  RunWithoutThreads.Enabled = true
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events list
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  dim c as new Clipboard
		  
		  c.SetText me.Cell(row, column)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events RunThreadedButton
	#tag Event
		Sub Action()
		  prepare
		  
		  // run each on a new thread
		  Runthreaded AddressOf TestCipherAES
		  Runthreaded AddressOf TestCipherBlowfish
		  Runthreaded AddressOf TestDigestMD5
		  Runthreaded AddressOf TestDigestSHA512
		  Runthreaded AddressOf TestMD5
		  Runthreaded AddressOf TestSHA1
		  Runthreaded AddressOf TestSHA256
		  Runthreaded AddressOf TestSHA512
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RunWithoutThreads
	#tag Event
		Sub Action()
		  Prepare
		  
		  
		  TestCipherAES
		  TestCipherBlowfish
		  
		  TestDigestMD5
		  TestDigestSHA512
		  TestMD5
		  TestSHA1
		  TestSHA256
		  TestSHA512
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  while ForList.Ubound>=0
		    dim v as Variant = ForList(0)
		    ForList.Remove 0
		    
		    // get array back from variant
		    dim s() as string = v
		    list.AddRow s
		    
		  wend
		  
		  
		  
		  if running and isDone then
		    dim t as integer = ticks - LaunchTicks
		    list.AddRow "All done", FormatTicks(t), ""
		    
		    running = false
		    ProgressWheel1.Visible = false
		    RunThreadedButton.Enabled = true
		    RunWithoutThreads.Enabled = true
		    
		    redim Threads(-1)
		  end if
		  
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
	#tag ViewProperty
		Name="Running"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LaunchTicks"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
