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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1216024423
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   ""
   Visible         =   True
   Width           =   517
   Begin TextArea output
      AcceptTabs      =   False
      Alignment       =   0
      AllowSpellChecking=   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   False
      Format          =   ""
      Height          =   311
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -1
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
      Password        =   "False"
      ReadOnly        =   True
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   False
      Styled          =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "Courier"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   75
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   504
   End
   Begin Label available
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "You can map portions of huge files in memory to read inside."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   367
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin PushButton OpenButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open file"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   409
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
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   88
   End
   Begin Label info
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
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
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   12.0
      Top             =   47
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   367
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin ScrollBar Scroll
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   False
      Height          =   311
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   502
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   1
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   75
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin Label cursor
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   15
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -1
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
      Text            =   ""
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "Geneva"
      TextSize        =   9.0
      Top             =   386
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   504
      Window          =   "0"
      _mWindow        =   "0"
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Hex"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   409
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      State           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function clear(s as string) As string
		  // remove control characters
		  
		  dim m1,m2 as MemoryBlock
		  dim l,i,c,n,ch as integer
		  
		  l=lenb(s)
		  m1=NewMemoryBlock(l)
		  m1.StringValue(0,l)=s
		  
		  m2=NewMemoryBlock(l*2)
		  
		  c=l-1
		  n=0
		  for i=0 to c
		    ch=m1.Byte(i)
		    
		    if ch<32 or ch>127 then // limit to visible ASCII
		      ch=32
		    end if
		    m2.Byte(n)=ch
		    
		    n=n+1
		    
		    if i mod 100=99 then
		      m2.Byte(n)=13
		      n=n+1
		    end if
		  next
		  
		  Return m2.StringValue(0,n)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadat(pos as integer)
		  dim s as string
		  
		  System.DebugLog "Position: "+str(pos)
		  'get bytes
		  
		  dim offset as Int64 = pos * pagesize // position in bytes
		  dim size as integer = pagesize     // how much to take
		  
		  dim v as FileMappingViewMBS = f.MapView(offset, size)
		  if v<>Nil then
		    
		    dim d as int64 = filesize-Offset
		    
		    if d<size then // on the end limi the reading to the bytes in the file to avoid crash.
		      size = d
		    end if
		    
		    s=v.Memory.StringValue(0,size)
		    
		    'show bytes
		    if CheckBox1.Value then
		      // hex
		      output.text=HexstringMBS(s, 2, 16, "", chr(13), " ", " ")
		    else
		      // normal
		      output.text=clear(s)
		    end if
		    
		    'show position
		    cursor.text="Showing "+format(lenb(s),"0")+" Bytes from position "+format(pos*pagesize,"0")+"."
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub openfile()
		  dim file as folderItem
		  
		  const maxscrollbar=32767
		  'maximum value for scrollbar.maximum!
		  
		  file=getopenFolderItem("special/any")
		  
		  if file<>nil then
		    f=new FilemappingMBS(file, false)
		    
		    if f.Lasterror = 0 then
		      Title=file.DisplayName
		      info.text=format(file.Length,"0")+" Bytes mapped"
		    else
		      info.text="Error while opening the file. "+str(f.LastError)+" "+f.LasterrorString
		      f=nil
		      Return
		    end if
		    
		    if not f.OpenFileMapping then
		      MsgBox "Failed to open file mapping."
		      f = nil
		      Return
		    end if
		    
		    'pagesize is how many bytes we show per page.
		    '
		    filesize = file.Length
		    pagesize=4096
		    if file.length/pagesize>maxscrollbar then
		      'too big for scrollbar
		      
		      pagesize=4096*ceil(file.length/4096/maxscrollbar)
		      
		      'How often do me need to add 4096 bytes to get it into a scrollbar?
		    end if
		    
		    scroll.value=0
		    scroll.lineStep=1
		    scroll.pageStep=1
		    scroll.maximum=floor(file.length/pagesize)
		    
		    output.enabled=true
		    scroll.enabled=true
		    
		    'load first page
		    loadat 0
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		f As filemappingMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		filesize As int64
	#tag EndProperty

	#tag Property, Flags = &h0
		pagesize As integer
	#tag EndProperty


#tag EndWindowCode

#tag Events OpenButton
	#tag Event
		Sub Action()
		  openfile
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Scroll
	#tag Event
		Sub ValueChanged()
		  loadat me.value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox1
	#tag Event
		Sub Action()
		  loadat scroll.value
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
		Name="pagesize"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="filesize"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="int64"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
