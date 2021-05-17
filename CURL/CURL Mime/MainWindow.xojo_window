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
   Height          =   440
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   615252443
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CURL Mime Test"
   Visible         =   True
   Width           =   740
   Begin PushButton TestButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Test"
      Default         =   False
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
      Width           =   80
   End
   Begin TextArea Output
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
      Height          =   374
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
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
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "Courier"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   700
   End
   Begin TCPSocket TCPSocket1
      Address         =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Port            =   2000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Thread Thread1
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   "0"
      StackSize       =   0
      TabPanelIndex   =   "0"
      ThreadID        =   0
      ThreadState     =   ""
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  TCPSocket1.port = 2000
		  TCPSocket1.Listen
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c As MyCURLSMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events TestButton
	#tag Event
		Sub Action()
		  me.Enabled = false
		  
		  c = new MyCURLSMBS
		  
		  Thread1.run
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TCPSocket1
	#tag Event
		Sub DataAvailable()
		  dim r as string = me.ReadAll(encodings.UTF8)
		  
		  // first chunk
		  if left(r,4) = "POST" then
		    me.Write "HTTP/1.1 100 Continue"+EndOfLine.Windows+EndOfLine.Windows
		  else
		    // getting chunks
		    me.Write "HTTP/1.1 200 OK"+EndOfLine.Windows+"Content-Length: 0"+EndOfLine.Windows+EndOfLine.Windows
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Thread1
	#tag Event
		Sub Run()
		  
		  // add mime with data in string
		  dim p as CURLSMimePartMBS = c.AddMimePart
		  
		  p.name = "Text"
		  p.FileName = "test.txt"
		  p.MimeType = "text/plain"
		  p.DataString = "Hello World"
		  
		  // add mime with data in MemoryBlock
		  p = c.AddMimePart
		  dim pic as Picture = LogoMBS(200)
		  dim jpeg as MemoryBlock = pic.GetData(pic.FormatJPEG)
		  
		  p.name = "Image"
		  p.FileName = "test.jpg"
		  p.Encoding = "base64"
		  // p.MimeType = "image/jpeg" // set by file name
		  p.DataMemory = jpeg
		  
		  // add mime with data in file
		  p = c.AddMimePart
		  dim file as FolderItem = SpecialFolder.Desktop.Child("test.jpg")
		  pic.Save(file, pic.SaveAsJPEG)
		  
		  p.name = "File"
		  p.File = file
		  p.Encoding = "base64"
		  p.FileName = file.Name
		  p.MimeType = "image/jpeg" // set by file name
		  
		  
		  // add mime with data in string for html
		  p = c.AddMimePart
		  
		  p.Encoding = "quoted-printable"
		  p.name = "Message"
		  p.FileName = "test.html"
		  p.MimeType = "text/html"
		  dim lines() as string
		  
		  lines.Append "<html>"
		  lines.Append "<head>"
		  lines.Append "<title>Test</title>"
		  lines.Append "</head>"
		  lines.Append "<body>"
		  lines.Append "<p>Hello World</p>"
		  lines.Append "</body>"
		  lines.Append "</html>"
		  
		  p.DataString = join(lines, EndOfLine) 
		  
		  
		  
		  // finish
		  c.FinishMime
		  // now you can send...
		  
		  c.OptionURL = "http://127.0.0.1/"
		  c.OptionPort = 2000
		  c.YieldTime = true
		  c.OptionConnectionTimeout = 10
		  c.OptionVerbose = true
		  c.CollectDebugData = true
		  c.CollectOutputData = true
		  c.CollectHeaderData = true
		  c.OptionForbitReuse = true
		  c.OptionFreshConnect = true
		  c.OptionHTTPVersion = c.kHTTP_VERSION_1_1
		  
		  
		  dim e as integer = c.PerformMT
		  
		  
		  timer1.Mode = timer.ModeSingle
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  if c <> nil then
		    
		    if c.Outputs.Ubound = -1 then
		      // failed, so show debug data
		      output.Text = ReplaceLineEndings(c.DebugData, EndOfLine)
		    else
		      // show form data
		      output.Text = ReplaceLineEndings(join(c.Outputs, ""), EndOfLine)
		    end if
		    
		    c = nil
		  end if
		  
		  
		  TCPSocket1.Listen
		  TestButton.Enabled = true
		  
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
