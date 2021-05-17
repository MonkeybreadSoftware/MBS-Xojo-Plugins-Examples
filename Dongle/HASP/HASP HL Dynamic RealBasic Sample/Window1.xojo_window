#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   True
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   437
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   320
   MinimizeButton  =   True
   MinWidth        =   720
   Placement       =   0
   Resizeable      =   True
   Title           =   "Sample"
   Visible         =   True
   Width           =   986
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "API Demo"
      Enabled         =   True
      Height          =   221
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
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   314
      Begin GroupBox GroupBox2
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Access Mode"
         Enabled         =   True
         Height          =   137
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   36
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   267
         Begin RadioButton LocalOnly
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Local Only"
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   "0"
            TabIndex        =   0
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   74
            Transparent     =   True
            Underline       =   False
            Value           =   True
            Visible         =   True
            Width           =   134
         End
         Begin RadioButton NetOnly
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Net Only"
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   "0"
            TabIndex        =   1
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   106
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   89
         End
         Begin CheckBox process
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "per Process Licensing"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   False
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   False
            Left            =   142
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   "0"
            State           =   0
            TabIndex        =   2
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   106
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   155
         End
         Begin RadioButton Both
            AutoDeactivate  =   True
            Bold            =   False
            Caption         =   "Both"
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "GroupBox2"
            Italic          =   False
            Left            =   52
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   False
            LockTop         =   False
            Scope           =   "0"
            TabIndex        =   3
            TabPanelIndex   =   0
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0.0
            TextUnit        =   0
            Top             =   138
            Transparent     =   True
            Underline       =   False
            Value           =   False
            Visible         =   True
            Width           =   134
         End
      End
      Begin PushButton RunTests
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Run Demo"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   52
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   192
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   235
      End
   End
   Begin GroupBox GroupBox3
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Remote Update System"
      Enabled         =   True
      Height          =   124
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
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   247
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   314
      Begin PushButton c2v
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Generate Status Information (C2V)..."
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   False
         Left            =   52
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   285
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   260
      End
      Begin PushButton v2c
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Update HASP (V2C)..."
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   False
         Left            =   52
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   "0"
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   325
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   260
      End
   End
   Begin GroupBox GroupBox4
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Demo History"
      Enabled         =   True
      Height          =   403
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   346
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
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
      Width           =   620
      Begin PushButton ClearHist
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   0
         Cancel          =   False
         Caption         =   "Clear History"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox4"
         Italic          =   False
         Left            =   565
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   "0"
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   382
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   235
      End
      Begin TextArea history
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   False
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   326
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "GroupBox4"
         Italic          =   False
         Left            =   362
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   "0"
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   44
         Transparent     =   True
         Underline       =   False
         UnicodeMode     =   0
         UseFocusRing    =   True
         Visible         =   True
         Width           =   588
      End
   End
   Begin PushButton closeit
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   52
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   381
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   235
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  //
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function blobtostr(blob as MemoryBlock) As String
		  ' This helper function only converts a memory block to a string, replacing ASCII control characters to "."
		  dim c,i,s,z as Integer
		  dim result as String
		  dim buf as MemoryBlock
		  
		  if blob<>nil then
		    s=blob.Size
		    
		    buf=NewMemoryBlock(s)
		    buf.StringValue(0,s)=blob.StringValue(0,s)
		    
		    c=blob.Size -1
		    for i = 0 to c
		      z=blob.Byte(i)
		      if z < 32 or z > 127 then
		        buf.Byte(i)=46 // asc(".")
		      end
		    next
		    
		    result=buf.StringValue(0,s)
		    
		    Return DefineEncoding(result,encodings.ASCII)
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub message()
		  'This function adds an empty line to the history field
		  message "", 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub message(str As String)
		  ' This function only adds a message line to the history field with standrd indentation
		  message str, 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub message(str As String, indent as Integer)
		  ' This function only adds a text line to the history field with indentation
		  dim i As Integer
		  dim in_str, tabstr as String
		  
		  tabstr = "   " // convert tabs to 3 spaces - only works for leading tabs
		  
		  for i = 1 to indent
		    in_str = in_str + tabstr
		  next
		  
		  str = ReplaceLineEndings( str, EndOfLine + in_str )
		  str = ReplaceAll( str, Encodings.ASCII.chr(9), tabstr )
		  
		  history.SelText = in_str + str + EndOfLine
		  history.SelStart = Len(history.Text)
		  history.Refresh
		  
		  App.DoEvents
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub putblobhex(blob As MemoryBlock)
		  ' This function only adds the contents of a MemoryBlock in Hex-Format into the history field
		  dim i as Integer
		  dim str as String
		  
		  if blob<>nil then
		    for i = 1 to blob.Size
		      if blob.Byte( i-1 ) < 16 then
		        str = str + ("&H0" + hex( blob.Byte(i-1)) + " ")
		      else
		        str = str + ("&H" + hex( blob.Byte(i-1)) + " ")
		      End
		      if i mod 8 = 0 Then
		        str = str + EndOfLine
		      end
		      ' snip the output, if the MemoryBlock is larger than 64 Bytes
		      if i >= 64 then
		        str = str + "[snipped]"
		        Exit
		      end
		    next
		    message str, 2
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub putresult(hasp as HaspHLDMBS)
		  ' This function displays the result of a hasp call in human readable format in the history field
		  message "Result: " + GetHASPErrorMesage(hasp.Lasterror)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub rundemo(featureid As  Integer)
		  ' This method runs the actual tests on the given program number
		  dim blob, smblob as MemoryBlock  // container for file contents
		  dim cblob as MemoryBlock // container for data for en-/decryption
		  dim i as Integer  // used in for loops
		  dim size, fileid as Integer // storage for file size and file id
		  dim answer as String // storage for the answer of hasp_get_sessioninfo calls
		  dim rtcdate as new date
		  dim testdate As new Date // actual date and temporary date
		  dim hasp As HaspHLDMBS // Instance of the RB HASP object, wrapping the RB Plugin
		  dim feature as Integer // storage for the complete feature id
		  dim featurestr as String // string for readable output
		  dim rtcdatemem as MemoryBlock
		  dim day,year,month,hour,minute,second as integer
		  
		  const HASP_PROGNUM_FEATURETYPE=&hffff0000
		  const HASP_PROGNUM_OPT_NO_REMOTE=&h00004000
		  const HASP_PROGNUM_OPT_NO_LOCAL=&h00008000
		  const HASP_PROGNUM_OPT_CLASSIC=&h00001000
		  const HASP_PROGNUM_OPT_PROCESS=&h00002000
		  
		  ' Set up the featureId, consisting of Program number and the login flags
		  feature = Bitwise.BitOr( featureid, HASP_PROGNUM_FEATURETYPE )
		  if localonly.value then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_NO_REMOTE )
		  elseif netonly.value Then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_NO_LOCAL )
		  end
		  if process.value Then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_PROCESS )
		  end
		  
		  if featureid = 0 then
		    featurestr = "Default Feature (ProgNumDefaultFeature)"
		  else
		    featurestr = "Feature: Programm Number &H"+ hex( feature )
		  end
		  
		  message "Login Demo with " + featurestr
		  hasp=new HaspHLDMBS(feature,vendor_code_DEMOMA)
		  putresult hasp
		  
		  if hasp.Lasterror <> HASP_STATUS_OK then return
		  
		  message
		  message "Logout Demo"
		  hasp.Close
		  putresult hasp
		  
		  message
		  message "Login/Logout Demo with " + featurestr
		  message "Login"
		  hasp=new HaspHLDMBS(feature,vendor_code_DEMOMA)
		  putresult hasp
		  
		  message "Logout"
		  hasp.Close
		  putresult hasp
		  
		  message
		  message "Login Demo with " + featurestr
		  hasp=new HaspHLDMBS(feature,vendor_code_DEMOMA)
		  putresult hasp
		  
		  message
		  message "Get Session Information Demo"
		  
		  message "Retrieving Key Information"
		  answer = hasp.GetSessionInfo( HASP_KEYINFO )
		  putresult hasp
		  if hasp.Lasterror = HASP_STATUS_OK then
		    message "Key Information:"
		    message answer
		  end
		  
		  message
		  message "Retrieving Session Information"
		  answer = hasp.GetSessionInfo( HASP_SESSIONINFO )
		  putresult hasp
		  if hasp.Lasterror = HASP_STATUS_OK then
		    message "Session Information:"
		    message answer
		  end
		  
		  message
		  message "Retrieving Update Information"
		  answer = hasp.GetSessionInfo( HASP_UPDATEINFO )
		  putresult hasp
		  if hasp.Lasterror = HASP_STATUS_OK then
		    message "Update Information:"
		    message answer
		  end
		  message
		  
		  message
		  message "Read/Write Demo"
		  fileid = HASP_FILEID_MAIN
		  message "Reading contents of file: " + str( fileid )
		  
		  message "Retrieving the size of the file"
		  size = hasp.GetSize( fileid )
		  putresult hasp
		  if hasp.Lasterror = HASP_STATUS_OK then  // ONLY IF FILE IS SUPPORTED
		    message "Size of the file is: " + Format(size,"0")+" bytes"
		    
		    message "Reading Data"
		    
		    blob = hasp.ReadMemory( fileid, 0, size )
		    putresult hasp
		    if hasp.Lasterror = HASP_STATUS_OK then
		      putblobhex blob
		    end
		    
		    message "Read first eight byte"
		    // set up a new MemoryBlock for testing the write function
		    smblob = hasp.ReadMemory( fileid, 0, 8 )
		    putresult hasp
		    putblobhex smblob
		    message "Writing to File"
		    
		    for i = 0 to 7 // overwrite with new data
		      smblob.Byte( i ) = i + 8
		    next
		    
		    hasp.WriteMemory( fileid, 0, smblob,0,smblob.Size )
		    putresult hasp
		    if hasp.Lasterror = HASP_STATUS_OK then
		      message "Data written"
		      message "Dumping Data:"
		      putblobhex smblob
		    end
		    
		    message "Reading written Data"
		    smblob = hasp.ReadMemory( fileid, 0, 8 )
		    putresult hasp
		    if hasp.Lasterror = HASP_STATUS_OK then
		      message "Dumping Data:"
		      putblobhex smblob
		    end
		    
		    message
		    smblob = nil // free smblob
		    // new smblob for one integer value
		    message "GetFileSize/FilePos Demo"
		    message "Setting file position to last int and reading value"
		    smblob = hasp.ReadMemory( fileid, size-4, 4 )
		    putresult hasp
		    if hasp.Lasterror = HASP_STATUS_OK then
		      message "Reading Data &H" + hex( smblob.Long(0))
		    end
		    
		    message "Writing to file: &H" + hex( smblob.Long(0) )
		    smblob.Long(0) = &H7FFF
		    hasp.WriteMemory( fileid, size-4, smblob,0,smblob.Size )
		    putresult hasp
		    message "Reading written data"
		    smblob = hasp.ReadMemory( fileid, size-4, 4 )
		    putresult hasp
		    message "Data read: &H" + hex( smblob.Long(0))
		    
		    // restore original data
		    message "Restore original Data"
		    hasp.WriteMemory( fileid, 0, blob ,0, blob.Size )
		    putresult hasp
		    
		    smblob = nil
		    blob = nil
		  end // end of ONLY IF FILE IS SUPPORTED
		  
		  message
		  message "Encrypt/Decrypt Demo"
		  cblob = NewMemoryBlock( 16 )
		  cblob.StringValue(0,16) = "HASP HL is great"
		  putblobhex cblob
		  
		  message "Encrypting: '" + blobtostr( cblob ) + "'"
		  hasp.EncryptMemory( cblob,0,cblob.size )
		  putresult hasp
		  putblobhex cblob
		  if hasp.Lasterror = HASP_STATUS_OK then
		    message "Encrypted string: '" + blobtostr( cblob ) + "'"
		    message
		    message "Decrypting: '" + blobtostr( cblob ) + "'"
		    hasp.DecryptMemory( cblob,0,cblob.size )
		    putresult hasp
		    if hasp.Lasterror = HASP_STATUS_OK then
		      message "Decrypted string: '" + blobtostr( cblob ) + "'"
		    end
		  end
		  
		  message
		  message "Legacy Encrypt/Decrypt Demo"
		  cblob = nil
		  cblob = NewMemoryBlock( 14 )
		  cblob.StringValue(0,14) = "This is legacy"
		  
		  message "Encrypting: '" + blobtostr( cblob ) + "'"
		  hasp.LegacyEncryptMemory( cblob,0,cblob.size )
		  putresult hasp
		  if hasp.Lasterror = HASP_STATUS_OK then
		    message "Encrypted string: '" + blobtostr( cblob ) + "'"
		    message
		    message "Decrypting: '" + blobtostr( cblob ) + "'"
		    hasp.LegacyDecryptMemory( cblob,0,cblob.size )
		    putresult hasp
		    if hasp.Lasterror = HASP_STATUS_OK then
		      message "Decrypted string: '" + blobtostr( cblob ) + "'"
		    end
		  end
		  
		  rtcdatemem = hasp.GetRTC
		  putresult hasp
		  
		  if hasp.Lasterror = HASP_STATUS_OK then // only run this test, if key has a rtc
		    hasp.HaspTimeToDateTime rtcdatemem,day,month,year,hour,minute,second
		    
		    rtcdate=new date
		    rtcdate.Year=year
		    rtcdate.Month=Month
		    rtcdate.day=day
		    rtcdate.Second=Second
		    rtcdate.minute=minute
		    rtcdate.hour=hour
		    
		    // when a date object is instanciated, it contains current time and date
		    message "actual date = " + testdate.LongDate + " time (GMT): " + testdate.LongTime, 1
		    message "keys date = " + rtcdate.LongDate + " time (GMT): " + rtcdate.LongTime, 1
		  end
		  
		  message
		  message "Logout Demo"
		  hasp.close // logout
		  putresult hasp
		  hasp = nil
		  
		  App.MouseCursor = nil
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events LocalOnly
	#tag Event
		Sub Action()
		  process.Enabled = false
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NetOnly
	#tag Event
		Sub Action()
		  process.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Both
	#tag Event
		Sub Action()
		  process.Enabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RunTests
	#tag Event
		Sub Action()
		  dim now as new Date
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  message "____________________________________________________________",0
		  message "API Demo started (" + now.LongDate + " " + now.LongTime + ")", 0
		  message
		  
		  rundemo( 0 )
		  message
		  rundemo( 1 ) // Programmnumber 1 to 8 are handled differently on HASP HL Time
		  message
		  message "API Demo completed", 0
		  
		  App.MouseCursor = nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events c2v
	#tag Event
		Sub Action()
		  dim newc2v as String
		  dim path as FolderItem
		  dim fp as TextOutputStream
		  dim feature As Integer
		  dim hasp as HaspHLDMBS
		  dim now as new Date
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  message "____________________________________________________________",0
		  message "Generation of Status Information (" + now.LongDate + " " + now.LongTime + ")", 0
		  message
		  message "Retrieving Update Information"
		  
		  feature = HASP_PROGNUM_FEATURETYPE // login to default feature
		  if localonly.value then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_NO_REMOTE )
		  elseif netonly.value Then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_NO_LOCAL )
		  end
		  if process.value Then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_PROCESS )
		  end
		  
		  message "Login Default Feature"
		  hasp = new HaspHLDMBS( feature, vendor_code_DEMOMA )
		  putresult hasp
		  
		  message "Retrieving Session Information"
		  newc2v = hasp.GetSessionInfo( HASP_UPDATEINFO )
		  putresult hasp
		  if hasp.Lasterror = HASP_STATUS_OK then
		    message newc2v
		    message
		    message "Prompt for Filename"
		    path = GetSaveFolderItem( "csv", "hasp_demo.c2v" )
		    if path <> nil then
		      message "Save Uodate iInformation to file '" + path.NativePath + "'"
		      fp = path.CreateTextFile
		      fp.Write( ConvertEncoding( newc2v, Encodings.UTF8 ))
		      fp.Close
		    end
		  end
		  
		  message "Logout Default Feature"
		  hasp.close
		  putresult hasp
		  
		  message
		  message "Generation of Status Information completed"
		  App.MouseCursor = nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events v2c
	#tag Event
		Sub Action()
		  dim newv2c, answer as String
		  dim path as FolderItem
		  dim fp as TextInputStream
		  dim feature as integer
		  dim hasp As HaspHLDMBS
		  
		  App.MouseCursor = System.Cursors.Wait
		  
		  dim now as new Date
		  message "____________________________________________________________",0
		  message "HASP HL Update started (" + now.LongDate + " " + now.LongTime + ")", 0
		  message
		  
		  message "Prompt for Filename"
		  path = GetOpenFolderItem( "v2c" )
		  if path = nil or hasp = nil then
		    App.MouseCursor = nil
		    return
		  end
		  
		  message "Read Update Info from File '" + path.NativePath + "'"
		  fp = path.OpenAsTextFile
		  newv2c = fp.ReadAll(Encodings.UTF8)
		  fp.Close
		  
		  message "Update Information:"
		  message newv2c
		  
		  feature = HASP_PROGNUM_FEATURETYPE // login to default feature
		  if localonly.value then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_NO_REMOTE )
		  elseif netonly.value Then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_NO_LOCAL )
		  end
		  if process.value Then
		    feature = Bitwise.BitOr( feature, HASP_PROGNUM_OPT_PROCESS )
		  end
		  
		  message "Login Default Feature"
		  hasp = new HaspHLDMBS( feature,vendor_code_DEMOMA )
		  putresult hasp
		  
		  answer = hasp.update( newv2c )
		  putresult hasp
		  message "Akcknoledge Information:"
		  message answer
		  
		  message "Logout Default Feature"
		  hasp.close
		  putresult hasp
		  
		  message
		  message "HASP HL Update completed", 0
		  
		  App.MouseCursor = nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClearHist
	#tag Event
		Sub Action()
		  history.Text = ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events closeit
	#tag Event
		Sub Action()
		  quit
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
