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
   Height          =   624
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1101391382
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Test UniKey"
   Visible         =   True
   Width           =   608
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Test one time"
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   584
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   122
   End
   Begin ListBox ListBox1
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasBorder       =   True
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   558
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      ScrollBarHorizontal=   False
      ScrollBarVertical=   True
      ScrollPosition  =   "0"
      ScrollPositionX =   "0"
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   568
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Test 100 times"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   367
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   584
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   122
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
      Left            =   501
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   584
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   87
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
      Left            =   268
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MultiLine       =   False
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   584
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   87
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub run100Tests()
		  dim i as integer
		  
		  for i=1 to 100
		    StaticText1.text=str(i)+" of 100"
		    
		    test
		  next
		  
		  PushButton1.Enabled=true
		  PushButton2.Enabled=true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub test()
		  ListBox1.DeleteAllRows
		  
		  'Sample for UniKey API
		  Const UNIKEY_FIND = 1                            ' Find UniKey
		  Const UNIKEY_FIND_NEXT = 2                       ' Find next UniKey
		  Const UNIKEY_LOGON = 3                           ' Open UniKey
		  Const UNIKEY_LOGOFF = 4                          ' Close UniKey
		  Const UNIKEY_READ_MEMORY = 5                     ' Read UniKey
		  Const UNIKEY_WRITE_MEMORY = 6                    ' Write UniKey
		  Const UNIKEY_RANDOM = 7                          ' Generate Random Number
		  Const UNIKEY_SEED = 8                            ' Generate Seed Code
		  Const UNIKEY_WRITE_SOFTID = 9                    ' Write Software ID
		  Const UNIKEY_READ_SOFTID = 10                    ' Read Software ID
		  Const UNIKEY_SET_MODULE = 11                     ' Set license module
		  Const UNIKEY_CHECK_MODULE = 12                   ' Check license module
		  Const UNIKEY_WRITE_ARITHMETIC = 13               ' Write Arithmetic
		  Const UNIKEY_CALCULATE1 = 14                     ' Calculate 1
		  Const UNIKEY_CALCULATE2 = 15                     ' Calculate 2
		  Const UNIKEY_CALCULATE3 = 16                     ' Calculate 3
		  Const UNIKEY_MODULE_DECRASE = 17                 ' Decrease license module Unit
		  Const UNIKEY_SET_NEW_PASSWORD = 18               ' Set New Password via a New Seed
		  Const UNIKEY_GENERATE_KEY = 19                   ' Generate a New Key in specific Key Store
		  Const UNIKEY_ENCRYPT = 20                        ' Encrypt the u.buffer with a Specific Key
		  Const UNIKEY_DECRYPT = 21                        ' Decrypt the u.buffer with a Specific Key
		  Const UNIKEY_MD5 = 22                            ' Make an MD5 Digest for a Certain Content
		  Const UNIKEY_READ_UPDATETAG = 23                 ' Read UpdateTag from a Specific Key
		  Const UNIKEY_WRITE_UPDATETAG = 24                ' Write UpdateTag to a Specific Key
		  
		  'Error Code
		  Const SUCCESS = 0                                        'Success
		  Const ERROR_NO_UNIKEY = 3                                'No UniKey dongle
		  Const ERROR_INVALID_PASSWORD = 4                         'Found UniKey dongle, but Basic passwords are incorrect
		  Const ERROR_INVALID_PASSWORD_OR_ID = 5                   'Wrong password or UniKey HID
		  Const ERROR_SET_ID = 6                                   'Set UniKey ID wrong
		  Const ERROR_INVALID_ADDR_OR_SIZE = 7                     'Read/Write address or length is wrong
		  Const ERROR_UNKNOWN_COMMAND = 8                          'No such command
		  Const ERROR_NOTBELEVEL3 = 9                              'Internal Error
		  Const ERROR_READ = 10                                    'Read Error
		  Const ERROR_WRITE = 11                                   'Write Error
		  Const ERROR_RANDOM = 12                                  'Random number Error
		  Const ERROR_SEED = 13                                    'Seed code Error
		  Const ERROR_CALCULATE = 14                               'Calculate Error
		  Const ERROR_NO_OPEN = 15                                 'No open dongle before operating dongle
		  Const ERROR_OPEN_OVERFLOW = 16                           'Too many open dongles (>16)
		  Const ERROR_NOMORE = 17                                  'No more dongle
		  Const ERROR_NEED_FIND = 18                               'No Find before FindNext
		  Const ERROR_MODULE_DECRASE = 19                          'MODULE_DECRASE Error
		  Const ERROR_AR_BAD_COMMAND = 20                          'Arithmetic instruction Error
		  Const ERROR_AR_UNKNOWN_OPCODE = 21                       'Arithmetic operator Error
		  Const ERROR_AR_WRON_GBEGIN = 22                          'Const number can't use on first arithmetic instruction
		  Const ERROR_AR_WRONG_END = 23                            'Const number can't use on last arithmetic instruction
		  Const ERROR_AR_VALUE_OVERFLOW = 24                       'Const number > 63
		  Const ERROR_TOO_MUCH_THREAD = 25                         'Too many (>100) threads in the single process open the dongle
		  Const ERROR_INVALID_KEY = 26                             'The key in the key storage is wrong
		  Const ERROR_VERIFY_ADV_PASSWORD = 27                     'Advanced passwords (password3 and passowrd4) not verified
		  Const ERROR_INVALID_KEY_STORE = 28                       'Wrong key storage number
		  Const EER_GENERATE_NEW_PASSWORD = 29                     'Generate new password Error
		  Const ERROR_READ_UPDATETAG = 30                          'Read UpdateTag Error
		  Const ERROR_WRITE_UPDATETAG = 31                         'Write UpdateTag Error
		  Const ERROR_RECEIVE_NULL                 =       256     'Receive null
		  Const ERROR_UNKNOWN_SYSTEM               =       258     'Unknown operating system
		  Const ERROR_UNKNOWN                      =       65535   'Unknown Error
		  
		  'Declare Function UniKey Lib "UniKey.DLL" (ByVal fun As Integer, ByRef handle As Integer, ByRef u.lp1 As Integer, ByRef u.lp2 As Integer, ByRef p1 As Integer, ByRef p2 As Integer, ByRef p3 As Integer, ByRef p4 As Integer, ByVal u.buffer As Ptr) As Integer
		  
		  'Declare Function UniKey Lib "UniKey.dll" () as integer
		  ', ByVal handle As Integer, ByRef u.lp1 As Integer, ByRef u.lp2 AsInteger, ByRef p1 As Integer, ByRef p2 As Integer, ByRef p3 As Integer, ByRef p4 As Integer, ByVal u.buffer As String
		  
		  count=count+1
		  listbox1.addrow("UniKey Xojo Sample")
		  
		  Dim i, j, retcode As Integer
		  Dim cAlg as String
		  dim u as new UnikeyMBS
		  
		  u.p1 = 1234       'passwords
		  u.p2 = 1234
		  u.p3 = 1234
		  u.p4 = 1234
		  
		  
		  
		  'find dongle
		  u.buffer= NewMemoryBlock(4096) // clear buffer
		  retcode = u.Unikey(UniKey_FIND)
		  If (retcode <> 0) Then
		    ListBox1.addrow ("Error Code:" + str( retcode))
		    errors=errors+1
		  else 
		    ' return the hardware ID (HID)
		    ListBox1.addrow ("Find dongle:" + str( u.lp1))
		  end if
		  
		  'open dongle
		  retcode = u.Unikey(UNIKEY_LOGON)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow("Logon dongle:" + str(u.lp1))
		  end if
		  
		  
		  u.p1 = 3
		  u.p2 = 5
		  u.buffer.CString(0) = "Hello"
		  'write memory
		  retcode = u.Unikey(UNIKEY_WRITE_MEMORY)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Write: " + u.buffer.Cstring(0))
		  end if
		  
		  'read dongle memory
		  u.p1 = 3
		  u.p2 = 5
		  u.buffer= NewMemoryBlock(4096) // clear buffer
		  retcode = u.Unikey(UNIKEY_READ_MEMORY)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Read: " + u.buffer.Cstring(0))
		  end if
		  
		  
		  
		  'random generation function
		  retcode = u.Unikey(UNIKEY_RANDOM)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		    Exit
		  End If
		  ListBox1.addrow ( "Random:" + str(u.p1))
		  
		  
		  'seed function, you can use either str or dec
		  u.lp2 = &H12345678
		  retcode = u.Unikey(UNIKEY_SEED)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Seed: " + str(u.p1) + " " + str(u.p2) + " " + str(u.p3) + " " + str(u.p4))
		  end if
		  
		  
		  'write SoftID
		  u.lp1 = 88888888
		  retcode = u.Unikey(UNIKEY_WRITE_SOFTID)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Write User ID: " + str(u.lp1))
		  end if
		  
		  
		  'read SoftID
		  u.lp1 = 0
		  retcode = u.Unikey(UNIKEY_READ_SOFTID)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Read User ID: " +str(u.lp1))
		  end if
		  
		  'set license module
		  u.p1 = 7
		  u.p2 = 2121
		  u.p3 = 0
		  retcode = u.Unikey(UNIKEY_SET_MODULE)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Set MODULE 7: Pass = " + str(u.p2) + "  Decrease Not Allow")
		  end if
		  
		  
		  'check license module
		  u.p1 = 7
		  retcode = u.Unikey(UNIKEY_CHECK_MODULE)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Check MODULE 7: ")
		    If (u.p2 = 1) Then
		      ListBox1.addrow (  "Valid ")
		    Else
		      ListBox1.addrow ( "Invalid")
		    End If
		    If (u.p3 = 1) Then
		      ListBox1.addrow (  "Allow Decrease")
		    Else
		      ListBox1.addrow ( "Not Allow Decrease")
		    End If
		  end if
		  
		  'write user-defined algorithm
		  u.p1 = 0
		  u.buffer=NewMemoryBlock(4096) // clear buffer
		  u.buffer.CString(0)="H=H^H, A=A*23, F=B*17, A=A+F, A=A+G, A=A<C, A=A^D, B=B^B, C=C^C, D=D^D"
		  
		  
		  retcode = u.Unikey(UNIKEY_WRITE_ARITHMETIC)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		    Exit
		  End If
		  ListBox1.addrow ( "Write Arithmetic 1")
		  
		  
		  'calculation 1
		  u.lp1 = 0
		  u.lp2 = 7
		  u.p1 = 5
		  u.p2 = 3
		  u.p3 = 1
		  u.p4 =65535
		  retcode = u.Unikey(UNIKEY_CALCULATE1)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Calculate Input: p1=5, p2=3, p3=1, p4=65535")
		    
		    ListBox1.addrow ( "Result = ((5*23 + 3*17 + &2121) < 1) ^ FFFF = BC71")
		    
		    ListBox1.addrow ( "Calculate Output: p1=" + str(u.p1) + "  p2=" + str(u.p2) + "  p3= " + str(u.p3) + "  p4 =" + str(u.p4))
		  end if
		  
		  
		  'write user-defined algorithm
		  u.p1 = 10
		  u.buffer=NewMemoryBlock(4096) // clear buffer
		  u.buffer.CString(0) = "A=A+B, A=A+C, A=A+D, A=A+E, A=A+F, A=A+G, A=A+H"
		  'u.buffer.byte(51)=0
		  retcode = u.Unikey(UNIKEY_WRITE_ARITHMETIC)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Write Arithmetic 2")
		  end if
		  
		  
		  'calculation2
		  u.lp1 = 10
		  u.lp2 = 1234
		  u.p1 = 1
		  u.p2 = 2
		  u.p3 = 3
		  u.p4 = 4
		  retcode = u.Unikey(UNIKEY_CALCULATE2)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Calculate Output: p1=" + str(u.p1) + "  p2=" + str(u.p2) + "  p3=" + str(u.p3) + "  p4=" + str(u.p4))
		  end if
		  
		  
		  'Set License Module Decrease
		  u.p1 = 9
		  u.p2 = 5
		  u.p3 = 1
		  retcode = u.Unikey(UNIKEY_SET_MODULE)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  End If
		  
		  'write user-defined algorithm
		  u.p1 = 17
		  u.buffer=NewMemoryBlock(4096) // clear buffer
		  u.buffer.CString(0) = "A=E|E, B=F|F, C=G|G, D=H|H"
		  'u.buffer.byte(30)=0
		  retcode = u.Unikey(UNIKEY_WRITE_ARITHMETIC)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Write Arithmetic 3")
		  end if
		  
		  
		  'Calculation3
		  u.lp1 = 17
		  u.lp2 = 6
		  u.p1 = 1
		  u.p2 = 2
		  u.p3 = 3
		  u.p4 = 4
		  retcode = u.Unikey(UNIKEY_CALCULATE3)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Show Module from 6: p1=" + str(u.p1) + "  p2=" + str(u.p2) + "  p3=" + str(u.p3) + "  p4=" + str(u.p4))
		  end if
		  
		  
		  'Decrease License Module
		  u.p1 = 9
		  retcode = u.Unikey(UNIKEY_MODULE_DECRASE)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		    Exit
		  End If
		  ListBox1.addrow ( "Decrease module 9")
		  
		  
		  ' Calculation3
		  u.lp1 = 17
		  u.lp2 = 6
		  u.p1 = 1
		  u.p2 = 2
		  u.p3 = 3
		  u.p4 = 4
		  retcode = u.Unikey(UNIKEY_CALCULATE3)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "Show Module from 6: p1=" + str(u.p1) + "  p2=" + str(u.p2) + "  p3=" + str(u.p3) + "  p4=" + str(u.p4))
		  end if
		  
		  
		  
		  ' generate new password
		  ' if you really want to change password, please de-comment these codes
		  '  u.lp1=1234;
		  '  retcode=u.Unikey(UNIKEY_SET_NEW_PASSWORD,handle)
		  '  if (retcode<>0) Then
		  '          ListBox1.addrow ( "Error Code:" +str( retcode))
		  '  else
		  '          ListBox1.addrow ("Generate new passwords, seed:" + u.lp1 + " p1:" + p1 + " p2:" + p2 + " p3:" + p3 + " p4:" + p4
		  '  end if
		  
		  
		  ' generate key
		  u.lp1=1
		  retcode=u.Unikey(UNIKEY_GENERATE_KEY)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "generate key %d successed, key :" + str(u.lp1))
		  end if
		  
		  ' encrypt
		  u.buffer=NewMemoryBlock(4096) // clear buffer
		  u.buffer.CString(0)="abcdefghijklmnop"
		  u.lp1=16
		  u.lp2=1
		  retcode=u.Unikey(UNIKEY_ENCRYPT)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "encrypt successed, result: " + u.buffer.Cstring(0))
		  end if
		  
		  
		  ' decrypt
		  u.lp1=16
		  u.lp2=1
		  retcode=u.Unikey(UNIKEY_DECRYPT)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "decrypt successed, result: " + u.buffer.Cstring(0))
		  end if
		  
		  ' write UpdateTag
		  u.lp1=1234
		  retcode=u.Unikey(UNIKEY_WRITE_UPDATETAG)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ( "write UpdateTag:  " + str(u.lp1))
		  end if
		  
		  
		  ' read UpdateTag
		  u.lp1=0
		  retcode=u.Unikey(UNIKEY_READ_UPDATETAG)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addrow ("read UpdateTag:  " + str(u.lp1 ))
		  end if
		  
		  ' MD5
		  u.buffer=NewMemoryBlock(4096) // clear buffer
		  u.buffer.CString(0)="abcdefghijklmnop                                  "
		  u.lp1=16
		  u.lp2=0
		  retcode=u.Unikey(UNIKEY_MD5)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		    Exit
		  End If
		  ListBox1.addrow ( "MD5 successed, result: "+u.buffer.Cstring(0))
		  
		  ' close dongle
		  retcode = u.Unikey(UNIKEY_LOGOFF)
		  If (retcode <> 0) Then
		    ListBox1.addrow ( "Error Code:" +str( retcode))
		  else
		    ListBox1.addRow("Logoff dongle")
		  end if
		  
		  StaticText2.text=str(errors)+" of "+str(count)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		count As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		errors As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		w As workthread
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  PushButton1.Enabled=false
		  PushButton2.Enabled=false
		  
		  test
		  
		  PushButton1.Enabled=true
		  PushButton2.Enabled=true
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  PushButton1.Enabled=false
		  PushButton2.Enabled=false
		  
		  w=new WorkThread
		  w.run
		  
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
	#tag ViewProperty
		Name="errors"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="count"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
