#tag Window
Begin Window WindowPictureWriter
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   578
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1047365513
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "PictureWriter Test: Click to make darker!"
   Visible         =   True
   Width           =   552
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Darker"
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   512
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   512
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Statistics"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
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
      Width           =   96
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  Create
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub Create()
		  dim p as PictureWriterMBS
		  dim m as MemoryBlock
		  dim r,g,b,rRow,gRow,bRow,h1,w1,x,y,bpp,RowBytes as integer
		  
		  // Create a new picture writer
		  p=NewPictureWriterMBS(512,512)
		  if p=nil then
		    MsgBox "Failed to create PictureWriterMBS object!"
		    Return
		  end if
		  
		  // Get data in memory. This Memoryblock has a size property of 0!
		  
		  h1=p.Height-1
		  w1=p.Width-1
		  
		  RowBytes = p.RowBytes
		  bpp = p.BytesPerPixel
		  rRow = p.RedOffset
		  gRow = p.GreenOffset
		  bRow = p.BlueOffset
		  // in each row the red, blue and green channels have different offsets.
		  // but offsets are platform dependend
		  
		  for y=0 to h1
		    m = p.Data(y)
		    
		    r=rRow
		    g=gRow
		    b=bRow
		    
		    for x=0 to w1
		      
		      m.UInt8Value(r)=x\2
		      m.UInt8Value(g)=y\2
		      m.UInt8Value(b)=x*y\2
		      
		      r=r+bpp
		      g=g+bpp
		      b=b+bpp
		    next
		    
		  next
		  
		  // Use Render to make a picture object
		  Canvas1.Backdrop=p.Render
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Darker()
		  dim p as PictureEditorMBS
		  dim m as MemoryBlock
		  dim RowBytes,r,g,b,rRow,gRow,bRow,h1,w1,x,y,bpp as integer
		  dim rv,bv,gv as integer
		  
		  p=NewPictureEditorMBS(Canvas1.Backdrop)
		  if p=nil then
		    MsgBox "Failed to create PictureEditorMBS object!"
		    Return
		  end if
		  
		  // Get data in memory. This Memoryblock has a size property of 0!
		  
		  h1=p.Height-1
		  w1=p.Width-1
		  
		  RowBytes = p.RowBytes
		  bpp = p.BytesPerPixel
		  rRow = p.RedOffset
		  gRow = p.GreenOffset
		  bRow = p.BlueOffset
		  // in each row the red, blue and green channels have different offsets.
		  // but offsets are platform dependend
		  
		  for y = 0 to h1
		    m = p.Data(y)
		    
		    r = rRow
		    g = gRow
		    b = bRow
		    
		    for x=0 to w1
		      
		      rv = m.UInt8Value(r)
		      gv = m.UInt8Value(g)
		      bv = m.UInt8Value(b)
		      
		      rv = rv - 8
		      gv = gv - 8
		      bv = bv - 8
		      
		      if rv < 0 then
		        rv = 0
		      end if
		      
		      if gv < 0 then
		        gv = 0
		      end if
		      
		      if bv < 0 then
		        bv =0
		      end if
		      
		      m.UInt8Value(r) = rv
		      m.UInt8Value(g) = gv
		      m.UInt8Value(b) = bv
		      
		      r = r + bpp
		      g = g + bpp
		      b = b + bpp
		    next
		    
		  next
		  
		  p = nil
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Stats()
		  dim p as PictureReaderMBS
		  dim m as MemoryBlock
		  dim r,g,b,rRow,gRow,bRow,h1,w1,x,y,bpp as integer
		  dim rs,gs,bs,rv,bv,gv as integer
		  
		  p=NewPictureReaderMBS(Canvas1.Backdrop)
		  if p=nil then
		    MsgBox "Failed to create PictureReaderMBS object!"
		    Return
		  end if
		  
		  // Get data in memory. This Memoryblock has a size property of 0!
		  m=p.Data
		  
		  h1=p.Height-1
		  w1=p.Width-1
		  
		  bpp=p.BytesPerPixel
		  rRow=p.RedOffset
		  gRow=p.GreenOffset
		  bRow=p.BlueOffset
		  // in each row the red, blue and green channels have different offsets.
		  // but offsets are platform dependend
		  
		  for y=0 to h1
		    r=rRow
		    g=gRow
		    b=bRow
		    
		    for x=0 to w1
		      
		      rv=m.UInt8Value(r)
		      gv=m.UInt8Value(g)
		      bv=m.UInt8Value(b)
		      
		      rs=rs+rv
		      gs=gs+gv
		      bs=bs+bv
		      
		      r=r+bpp
		      g=g+bpp
		      b=b+bpp
		    next
		    
		    // rowbytes is not always with*bpp so use rowbytes property
		    rRow=rRow+p.RowBytes
		    gRow=gRow+p.RowBytes
		    bRow=bRow+p.RowBytes
		  next
		  
		  p = nil
		  MsgBox "Total pixel values: "+EndOfLine+"Red: "+Format(rs,"0")+EndOfLine+"Green: "+Format(gs,"0")+EndOfLine+"Blue: "+Format(bs,"0")
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  Darker
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Stats
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
