#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   17833983
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "NSURLSession Test"
   Visible         =   True
   Width           =   600
   Begin PushButton DownloadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Download"
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
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   104
   End
   Begin Listbox List
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
      Height          =   328
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
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton UploadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Upload"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   136
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   104
   End
   Begin PushButton StreamButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Stream"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   252
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   104
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  // optional cancel all tasks
		  
		  session.invalidateAndCancel
		  session.list = Nil
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim configuration As New NSURLSessionConfigurationMBS
		  
		  // configure...
		  configuration.allowsCellularAccess = True
		  
		  
		  session = New NSURLSession(configuration)
		  session.list = list
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub log(s as string)
		  list.AddRow s
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StreamDataRead(stream as NSURLSessionStreamTaskMBS, data as MemoryBlock, atEOF as Boolean, error as NSErrorMBS, tag as variant)
		  Log CurrentMethodName
		  
		  If error <> Nil Then
		    Log "Error: "+error.LocalizedDescription
		    Return
		  End If
		  
		  // collect data
		  If data <> Nil Then
		    Dim d As String = data
		    StreamData = StreamData + d
		  End If
		  
		  
		  If atEOF Then
		    // done? so let's look for HTTP header and content
		    
		    Dim divider As String = EndOfLine.Windows+EndOfLine.Windows // between HTTP header and content
		    Dim pos As Integer = InStr(streamdata, divider)
		    
		    If pos > 0 Then
		      Dim PicData As String = MidB(StreamData, pos+LenB(divider))
		      Dim p As Picture = Picture.FromData(PicData)
		      If p <> Nil Then
		        Dim w As New picWindow
		        w.Backdrop = p
		      Else
		        Break
		        MsgBox "not a picture?"
		      End If
		      
		      stream.closeRead
		    Else
		      Break
		    End If
		    
		  Else
		    
		    // ask for more data
		    stream.readData 1024, 1024*1024, 60, AddressOf streamDataRead
		    
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StreamDataWritten(stream as NSURLSessionStreamTaskMBS, error as NSErrorMBS, tag as variant)
		  Log CurrentMethodName
		  If error <> Nil Then
		    Log "Error: "+error.LocalizedDescription
		  Else
		    
		    Log "Request sent."
		    
		    // let's read some data from result
		    stream.readData 1024, 1024*1024, 60, AddressOf streamDataRead
		    
		    // close write channel as we don't need it anymore
		    stream.closeWrite
		    
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		session As NSURLSession
	#tag EndProperty

	#tag Property, Flags = &h0
		StreamData As string
	#tag EndProperty

	#tag Property, Flags = &h0
		task As NSURLSessionTaskMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events DownloadButton
	#tag Event
		Sub Action()
		  Dim URL As String = "https://www.monkeybreadsoftware.de/images/MBSLogo.jpg"
		  
		  Dim d As NSURLSessionDownloadTaskMBS = session.downloadTaskWithURL(URL)
		  
		  // start it!
		  d.resume
		  
		  task = d
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UploadButton
	#tag Event
		Sub Action()
		  Dim URL As String = "https://www.monkeybreadsoftware.com/filemaker/echo.cgi"
		  
		  // build a post request
		  
		  Dim headers As New Dictionary
		  headers.Value("Test") = "Another header"
		  
		  Dim r As New NSMutableURLRequestMBS(url)
		  r.setHTTPMethod "POST"
		  r.setAllHTTPHeaderFields headers
		  
		  Dim data As MemoryBlock = "Hello World"
		  
		  Dim d As NSURLSessionUploadTaskMBS = session.uploadTaskWithRequest(r, data)
		  
		  // start it!
		  d.resume
		  
		  task = d
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StreamButton
	#tag Event
		Sub Action()
		  // we do a HTTP request manually
		  
		  
		  Dim d As NSURLSessionStreamTaskMBS = session.streamTaskWithHostName("www.monkeybreadsoftware.de", 80)
		  
		  
		  // start it!
		  d.resume
		  
		  
		  Dim lines() As String
		  lines.Append "GET /images/MBSLogo.jpg HTTP/1.0"
		  lines.Append "User-Agent: Test Example"
		  lines.Append "Host: www.monkeybreadsoftware.de"
		  lines.Append ""
		  lines.Append ""
		  
		  Dim data As String = Join(lines, EndOfLine.Windows)
		  
		  d.writeData data, 60, AddressOf streamDataWritten
		  
		  task = d
		  
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="StreamData"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior