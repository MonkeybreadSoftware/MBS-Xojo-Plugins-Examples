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
   Height          =   339
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1154362456
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "IO Warrior Windows"
   Visible         =   True
   Width           =   300
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   234
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   260
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "KITT"
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
      Top             =   260
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label StaticText1
      Active          =   ""
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   47
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
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "This is a sample project shows how to use the MacHIDMBS class with the IOWarrior40 USB Device to show flashing LEDs."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      Top             =   292
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   260
      Window          =   "0"
      _mWindow        =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  if not TargetWin32 then
		    MsgBox "Please use only with Windows!"
		    quit
		  end if
		  
		  OpenUSBDevice
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function FindDevice() As WinHIDMBS
		  dim h as WinHIDMBS
		  dim p as string
		  
		  h=new WinHIDMBS
		  
		  if h.FindFirstDevice then
		    ProductID=h.ProductID
		    if ProductID=&h1500 and h.VendorID=&h7C0 then
		      Return h
		    end if
		    
		    while h.FindNextDevice
		      ProductID=h.ProductID
		      if ProductID=&h1500 and h.VendorID=&h7C0 then
		        Return h
		      end if
		      
		    wend
		    
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenUSBDevice()
		  dim i as integer
		  
		  listbox1.AddRow "OpenUSBDevice"
		  
		  h=FindDevice
		  
		  if h=nil then
		    MsgBox "No IOWarrior 40 device found."
		    quit
		    Return 
		  end if
		  
		  listbox1.AddRow h.Product
		  
		  if not h.Connect then
		    MsgBox "Failed to connect to "+h.Product+" Device."+EndOfLine+EndOfLine+"Error: "+str(h.Lasterror)
		    h=nil
		    quit
		    Return 
		  end if
		  
		  listbox1.AddRow "OpenUSBDevice done"
		  
		  timer1.mode=2
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(n as integer)
		  dim m as MemoryBlock
		  dim e as integer
		  
		  const IOW_PIPE_IO_PINS=0
		  
		  const IOWKIT40_IO_REPORT_SIZE=5
		  const IOWKIT24_IO_REPORT_SIZE=3
		  const IOWKIT56_IO_REPORT_SIZE=8
		  
		  const IOWKIT_PRODUCT_ID_IOW40=&h1500
		  const IOWKIT_PRODUCT_ID_IOW24=&h1501
		  const IOWKIT_PRODUCT_ID_IOW56=&h1503
		  
		  Select case ProductID
		  case IOWKIT_PRODUCT_ID_IOW40
		    m=NewMemoryBlock(IOWKIT40_IO_REPORT_SIZE)
		    m.Byte(4)=n
		    
		  case IOWKIT_PRODUCT_ID_IOW24
		    m=NewMemoryBlock(IOWKIT24_IO_REPORT_SIZE)
		    m.Byte(1)=n
		    
		  case IOWKIT_PRODUCT_ID_IOW56
		    m=NewMemoryBlock(IOWKIT56_IO_REPORT_SIZE)
		    m.Byte(7)=n
		    
		  else
		    // unknown product?
		    Return
		  end Select
		  
		  m.Byte(0)=IOW_PIPE_IO_PINS
		  
		  e=h.SendMessageMemory(m,0,m.size)
		  
		  System.DebugLog "SendMessageMemory: "+str(e)+" "+str(h.Lasterror)
		  
		  Exception
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected counter As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected h As WinHIDMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected last As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ProductID As integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  dim n as integer
		  dim v as integer
		  
		  if CheckBox1.Value then
		    if counter>=16 then
		      counter=0
		    end if
		    
		    if counter>=8 then
		      
		      n=255-pow(2,15-counter)
		      
		    else
		      
		      n=255-pow(2,counter)
		      
		    end if
		    
		    send n
		    
		    counter=counter+1
		    
		  else
		    send counter
		    
		    counter=counter+1
		    if counter=256 then
		      counter=0
		    end if
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
#tag EndViewBehavior
