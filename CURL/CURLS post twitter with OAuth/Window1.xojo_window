#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   584
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1043562705
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "CURL post form with OAuth"
   Visible         =   True
   Width           =   604
   Begin Label PathText
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
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Picture Path"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   139
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   389
   End
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   123
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   441
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   564
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField URL
      AcceptTabs      =   False
      Alignment       =   0
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   71
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "http://api.twitpic.com/2/upload.json"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   218
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   512
   End
   Begin Label StaticText2
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
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "URL:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   219
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Send"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   446
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   301
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
   Begin TextField Result
      AcceptTabs      =   False
      Alignment       =   0
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
      Height          =   84
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   19
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Result is shown here."
      TextColor       =   &c00000000
      TextFont        =   "Courier"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   345
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   444
   End
   Begin Label StaticText4
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
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Message"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin TextArea message
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   81
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   150
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Just a test"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   434
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select Picture"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   139
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   164
   End
   Begin TextField TwitPic_API_KEY
      AcceptTabs      =   False
      Alignment       =   0
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
      Left            =   139
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   True
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
      Text            =   "360ed78e2678a7241be7268709df78c2"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   266
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   295
   End
   Begin Label StaticText3
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
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "TwitPic_API_KEY"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   269
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin PushButton PushButton5
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   484
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu apiver
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "http://api.twitpic.com/1/uploadAndPost.json\rhttp://api.twitpic.com/2/upload.json"
      Italic          =   False
      Left            =   186
      ListIndex       =   1
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   183
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   271
   End
   Begin Label StaticText5
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
      Left            =   293
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Save oauth settings..."
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   16
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   179
   End
   Begin Label StaticText6
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
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "twitpic api v1 or v2"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   187
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   155
   End
   Begin Label StaticText7
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   19
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Step 3: "
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label StaticText8
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   18
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This is the key of MiconoTwitTest. Please use this key only by the trial run of this project. "
      TextAlign       =   0
      TextColor       =   &c80000000
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   248
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   565
   End
   Begin PushButton PushButton6
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Regist your appli"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   446
      LockBottom      =   False
      LockedInPosition=   True
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   11.0
      TextUnit        =   0
      Top             =   266
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub DoUploadV1(f As FolderItem, m As String)
		  dim e as integer
		  dim d as UploadCURL
		  
		  const CURLFORM_NOTHING = 0
		  const CURLFORM_COPYNAME = 1
		  const CURLFORM_PTRNAME = 2
		  const CURLFORM_NAMELENGTH = 3
		  const CURLFORM_COPYCONTENTS = 4
		  const CURLFORM_PTRCONTENTS = 5
		  const CURLFORM_CONTENTSLENGTH = 6
		  const CURLFORM_FILECONTENT = 7
		  const CURLFORM_ARRAY = 8
		  const CURLFORM_FILE = 10
		  const CURLFORM_BUFFER = 11
		  const CURLFORM_BUFFERPTR = 12
		  const CURLFORM_BUFFERLENGTH = 13
		  const CURLFORM_CONTENTTYPE = 14
		  const CURLFORM_CONTENTHEADER = 15
		  const CURLFORM_FILENAME = 16
		  
		  d=new UploadCURL
		  d.OptionURL=url.text
		  d.OptionVerbose=True
		  
		  // add a section named filMyFile
		  // with a file named file.name
		  // and binary content in buf
		  d.FormAdd(CURLFORM_COPYNAME, "consumer_token", CURLFORM_COPYCONTENTS, gConsumer_Key)
		  d.FormAdd(CURLFORM_COPYNAME, "consumer_secret", CURLFORM_COPYCONTENTS, gConsumer_Secret)
		  d.FormAdd(CURLFORM_COPYNAME, "oauth_token", CURLFORM_COPYCONTENTS, gOAuth_Access_Token)
		  d.FormAdd(CURLFORM_COPYNAME, "oauth_secret", CURLFORM_COPYCONTENTS, gOAuth_Access_Token_Secret)
		  if m<>"" then d.FormAdd(CURLFORM_COPYNAME, "message", CURLFORM_COPYCONTENTS, m)
		  d.FormAdd(CURLFORM_COPYNAME, "key", CURLFORM_COPYCONTENTS, gTwitPic_Api_Key)
		  d.FormAdd(CURLFORM_COPYNAME, "media", CURLFORM_FILE, f.UnixpathMBS)
		  d.FormFinish
		  
		  if gHttpProxyUse then//Proxy
		    d.OptionProxy=gHttpProxyAdress
		    d.OptionProxyPort=gHttpProxyPort
		  end if
		  
		  dim header(-1) as string
		  //header.Append "Content-Type: text/xml"
		  header.Append "application/x-www-form-urlencoded"
		  header.Append ""
		  d.SetOptionHTTPHeader header
		  
		  e=d.Perform
		  
		  ListBox1.AddRow "Result: "+str(e)
		  ListBox1.AddRow d.GetInfoContentType
		  
		  dim r as string = d.result
		  
		  Result.text=r
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoUploadV1Shell(f As FolderItem, m As String)
		  Dim s As String
		  
		  s="curl"
		  if gHttpProxyUse then//Proxy
		    s=s+" -x "+gHttpProxyAdress+":"+Str(gHttpProxyPort)
		  end if
		  s=s+" -v"
		  
		  // -F "consumer_token=vTQYfsgNmyA0fDXkVtuRw"
		  s=s+" -F ""consumer_token="+gConsumer_Key+""""
		  s=s+" -F ""consumer_secret="+gConsumer_Secret+""""
		  s=s+" -F ""oauth_token="+gOAuth_Access_Token+""""
		  s=s+" -F ""oauth_secret="+gOAuth_Access_Token_Secret+""""
		  if m<>"" then s=s+" -F ""message="+m+""""//EncodeURLComponent(Message.text)
		  s=s+" -F ""key="+gTwitPic_Api_Key+""""
		  s=s+" -F ""media=@"+f.UnixpathMBS+""""
		  s=s+" "+url.Text
		  
		  Dim cb As New Clipboard
		  cb.Text=s
		  cb.Close
		  
		  Dim e As New Shell
		  e.Execute(s)
		  
		  'ListBox1.AddRow "Result: "+str(e)
		  'ListBox1.AddRow d.GetInfoContentType
		  
		  dim r as string = e.Result
		  Result.text=r
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoUploadV2(f As FolderItem, m As String)
		  dim e as integer
		  dim d as UploadCURL
		  dim h(0) as string
		  
		  Dim str1,str2,str3 As String
		  
		  Dim CONSUMER_KEY As String=gConsumer_Key
		  Dim CONSUMER_SECRET As String= gConsumer_Secret
		  Dim ACCESS_TOKEN As String=gOAuth_Access_Token
		  Dim ACCESS_TOKEN_SECRET As String=gOAuth_Access_Token_Secret
		  Dim NONCE As String=RandomString(32)
		  Dim TIMESTAMP As String=MakeTimeStamp
		  
		  str1="https://api.twitter.com/1/account/verify_credentials.json"
		  str1=EncodeURLComponent(str1)
		  str1="GET"+"&"+str1+"&"
		  
		  str2=str2+"oauth_consumer_key="+CONSUMER_KEY
		  str2=str2+"&oauth_nonce="+NONCE
		  str2=str2+"&oauth_signature_method=HMAC-SHA1"
		  str2=str2+"&oauth_timestamp="+TIMESTAMP
		  str2=str2+"&oauth_token="+ACCESS_TOKEN
		  str2=str2+"&oauth_version=1.0"
		  
		  str3=CONSUMER_SECRET+"&"+ACCESS_TOKEN_SECRET
		  Dim signature_base_string As String = str1+EncodeURLComponent(str2)
		  Dim sha1class As New SHA1MBS
		  Dim hmacsha1 As String= sha1class.HMAC(str3,signature_base_string)
		  Dim signature_string As String = EncodeBase64(hmacsha1)
		  signature_string = EncodeURLComponent(signature_string)
		  
		  h.Append "X-Verify-Credentials-Authorization: OAuth realm=""http://api.twitter.com/"", "+_
		  "oauth_consumer_key="""+CONSUMER_KEY+""", "+_
		  "oauth_signature_method=""HMAC-SHA1"", "+_
		  "oauth_token="""+ACCESS_TOKEN+""", "+_
		  "oauth_timestamp="""+TIMESTAMP+""", "+_
		  "oauth_nonce="""+NONCE+""", "+_
		  "oauth_version=""1.0"", "+_
		  "oauth_signature="""+signature_string+""""
		  h.Append "X-Auth-Service-Provider: https://api.twitter.com/1/account/verify_credentials.json"
		  
		  const CURLFORM_NOTHING = 0
		  const CURLFORM_COPYNAME = 1
		  const CURLFORM_PTRNAME = 2
		  const CURLFORM_NAMELENGTH = 3
		  const CURLFORM_COPYCONTENTS = 4
		  const CURLFORM_PTRCONTENTS = 5
		  const CURLFORM_CONTENTSLENGTH = 6
		  const CURLFORM_FILECONTENT = 7
		  const CURLFORM_ARRAY = 8
		  const CURLFORM_FILE = 10
		  const CURLFORM_BUFFER = 11
		  const CURLFORM_BUFFERPTR = 12
		  const CURLFORM_BUFFERLENGTH = 13
		  const CURLFORM_CONTENTTYPE = 14
		  const CURLFORM_CONTENTHEADER = 15
		  const CURLFORM_FILENAME = 16
		  
		  d=new UploadCURL
		  d.OptionURL=url.text
		  d.OptionVerbose=True
		  d.SetOptionHTTPHeader h
		  
		  // add a section named filMyFile
		  // with a file named file.name
		  // and binary content in buf
		  d.FormAdd(CURLFORM_COPYNAME, "key", CURLFORM_COPYCONTENTS, gTwitPic_Api_Key)
		  d.FormAdd(CURLFORM_COPYNAME, "media", CURLFORM_FILE, f.UnixpathMBS)
		  if m<>"" then d.FormAdd(CURLFORM_COPYNAME, "message", CURLFORM_COPYCONTENTS, m)
		  d.FormFinish
		  
		  'dim b as BinaryStream
		  'b=mFile.OpenAsBinaryFile(false)
		  'd.data=b.Read(b.Length)
		  'd.OptionUpload=true
		  'd.OptionInFileSize=b.Length
		  
		  if gHttpProxyUse then//Proxy
		    d.OptionProxy=gHttpProxyAdress
		    d.OptionProxyPort=gHttpProxyPort
		  end if
		  
		  e=d.Perform
		  
		  ListBox1.AddRow "Result: "+str(e)
		  ListBox1.AddRow d.GetInfoContentType
		  
		  dim r as string = d.result
		  
		  Result.text=r
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoUploadV2Shell(f As FolderItem, m As String)
		  Dim str1,str2,str3 As String
		  
		  Dim CONSUMER_KEY As String=gConsumer_Key
		  Dim CONSUMER_SECRET As String= gConsumer_Secret
		  Dim ACCESS_TOKEN As String=gOAuth_Access_Token
		  Dim ACCESS_TOKEN_SECRET As String=gOAuth_Access_Token_Secret
		  Dim nonce As String=RandomString(32)
		  Dim timestamp As String=MakeTimeStamp
		  
		  str1="https://api.twitter.com/1/account/verify_credentials.json"
		  str1=EncodeURLComponent(str1)
		  str1="GET"+"&"+str1+"&"
		  
		  str2=str2+"oauth_consumer_key="+CONSUMER_KEY
		  str2=str2+"&oauth_nonce="+NONCE
		  str2=str2+"&oauth_signature_method=HMAC-SHA1"
		  str2=str2+"&oauth_timestamp="+TIMESTAMP
		  str2=str2+"&oauth_token="+ACCESS_TOKEN
		  str2=str2+"&oauth_version=1.0"
		  
		  str3=CONSUMER_SECRET+"&"+ACCESS_TOKEN_SECRET
		  Dim signature_base_string As String = str1+EncodeURLComponent(str2)
		  Dim sha1class As New SHA1MBS
		  Dim hmacsha1 As String= sha1class.HMAC(str3,signature_base_string)
		  Dim signature_string As String = EncodeBase64(hmacsha1)
		  signature_string = EncodeURLComponent(signature_string)
		  
		  Dim s As String
		  
		  s="curl"
		  if gHttpProxyUse then//Proxy
		    s=s+" -x "+gHttpProxyAdress+":"+Str(gHttpProxyPort)
		  end if
		  s=s+" -v"
		  
		  s=s+" -H 'X-Auth-Service-Provider: https://api.twitter.com/1/account/verify_credentials.json'"
		  s=s+" -H 'X-Verify-Credentials-Authorization: OAuth realm=""http://api.twitter.com/"", "+_
		  "oauth_consumer_key="""+gConsumer_Key+""", "+_
		  "oauth_signature_method=""HMAC-SHA1"", "+_  
		  "oauth_token="""+gOAuth_Access_Token+""", "+_
		  "oauth_timestamp="""+timestamp+""", "+_
		  "oauth_nonce="""+nonce+""", "+_  
		  "oauth_version=""1.0"", "+_
		  "oauth_signature="""+signature_string+"""'"
		  
		  // -F "consumer_token=vTQYfsgNmyA0fDXkVtuRw"
		  if m<>"" then s=s+" -F ""message="+m+""""
		  s=s+" -F ""key="+gTwitPic_Api_Key+""""
		  s=s+" -F ""media=@"+f.UnixpathMBS+""""
		  s=s+" "+url.Text
		  
		  Dim cb As New Clipboard
		  cb.Text=s
		  cb.Close
		  
		  Dim e As New Shell
		  e.Execute(s)
		  
		  'ListBox1.AddRow "Result: "+str(e)
		  'ListBox1.AddRow d.GetInfoContentType
		  
		  dim r as string = e.Result
		  Result.text=r
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		mFile As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton2
	#tag Event
		Sub Action()
		  if gOAuth_Access_Token_Secret="" then
		    Beep
		    Window2.Show
		    return
		  end if
		  
		  DoTweet(Message.text,mFile)
		  Message.text=""
		  PathText.text=""
		  mFile=Nil
		  return
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  mFile=GetOpenFolderItem("all")
		  if mFile=Nil then
		    PathText.Text=""
		    mFile=Nil
		    return
		  end if
		  if mFile.name.right(4) = ".jpg" then
		    PathText.Text=mFile.UnixpathMBS
		  else
		    PathText.Text=""
		    mFile=Nil
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TwitPic_API_KEY
	#tag Event
		Sub Open()
		  gTwitPic_Api_Key=me.Text
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  gTwitPic_Api_Key=Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  Dim f As FolderItem=FindFile("oauthdata.txt")
		  Dim ts As TextOutputStream=TextOutputStream.Create(f)
		  
		  if gHttpProxyUse then
		    ts.WriteLine "1"
		  else
		    ts.WriteLine "0"
		  end if
		  ts.WriteLine gHttpProxyAdress
		  ts.WriteLine Str(gHttpProxyPort)
		  
		  ts.WriteLine gConsumer_Key
		  ts.WriteLine gConsumer_Secret
		  
		  ts.WriteLine gScreen_Name
		  ts.WriteLine gOAuth_Verifier
		  ts.WriteLine gOAuth_Access_Token
		  ts.WriteLine gOAuth_Access_Token_Secret
		  
		  ts.WriteLine gTwitPic_Api_Key
		  
		  ts.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events apiver
	#tag Event
		Sub Change()
		  url.Text=Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton6
	#tag Event
		Sub Action()
		  ShowURL "http://dev.twitpic.com"
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
