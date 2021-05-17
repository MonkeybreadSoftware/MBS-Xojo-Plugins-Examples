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
   MenuBar         =   99359564
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "TIFF picture Info"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Open..."
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
      Width           =   80
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   334
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
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Picture"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
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
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub load(f as FolderItem)
		  dim x as integer
		  dim s as string
		  
		  list.DeleteAllRows
		  
		  t=new myTiffPictureMBS
		  
		  if t.Open(f) then
		    
		    List.AddRow "File: "+f.DisplayName
		    
		    
		    List.AddRow "BitsPerSample: "+str(t.BitsPerSample)
		    List.AddRow "BytesPerRow: "+str(t.BytesPerRow)
		    
		    x=t.Compression
		    
		    select case x
		    case 1
		      s="dump mode"
		    case 2
		      s="CCITT modified Huffman RLE"
		    case 3
		      s="CCITT Group 3 fax encoding"
		    case 4
		      s="CCITT Group 4 fax encoding"
		    case 5
		      s="Lempel-Ziv & Welch"
		    case 6
		      s="!6.0 JPEG"
		    case 7
		      s="%JPEG DCT compression"
		    case 8
		      s="Deflate compression, as recognized by Adobe"
		    case 32766
		      s="NeXT 2-bit RLE"
		    case 32771
		      s="#1 w/ word alignment"
		    case 32773
		      s="Macintosh RLE"
		    case 32809
		      s="ThunderScan RLE"
		    case 32895
		      s="IT8 CT w/padding"
		    case 32896
		      s="IT8 Linework RLE"
		    case 32897
		      s="IT8 Monochrome picture"
		    case 32898
		      s="IT8 Binary line art"
		    case 32908
		      s="Pixar companded 10bit LZW"
		    case 32909
		      s="Pixar companded 11bit ZIP"
		    case 32946
		      s="Deflate compression"
		    case 32947
		      s="Kodak DCS encoding"
		    case 34661
		      s="ISO JBIG"
		    case 34676
		      s="SGI Log Luminance RLE"
		    case 34677
		      s="SGI Log 24-bit packed"
		    else
		      s=""
		    end Select
		    
		    List.AddRow "Compression: "+str(x)+" "+s
		    List.AddRow "Copyright: "+(t.Copyright)
		    List.AddRow "DateTime: "+(t.DateTime)
		    List.AddRow "DocumentName: "+(t.DocumentName)
		    
		    dim m as MemoryBlock = t.ExtraSamples
		    if m<>Nil then
		      List.AddRow "ExtraSamples: "+str(m.size/2)
		      
		      for i as integer = 0 to m.size-1 step 2
		        x = m.Int16Value(i)
		        Select case x
		        case 0
		          s="unspecified data"
		        case 1
		          s="associated alpha data"
		        case 2
		          s="unassociated alpha data"
		        else
		          s=""
		        end Select
		        
		        List.AddRow "ExtraSample "+str(i+1)+": "+str(x)+" "+s
		      next
		    end if
		    
		    x=t.FillOrder
		    Select case x
		    case 1
		      s="Most significant bit to Least significant bit"
		    case 2
		      s="Least significant bit to Most significant bit"
		    else
		      s=""
		    end Select
		    
		    List.AddRow "FillOrder: "+str(x)+" "+s
		    List.AddRow "Height: "+str(t.Height)
		    List.AddRow "HorizontalPosition : "+str(t.HorizontalPosition )
		    List.AddRow "HorizontalResolution: "+str(t.HorizontalResolution)
		    List.AddRow "HostComputer: "+(t.HostComputer)
		    List.AddRow "ImageDescription: "+(t.ImageDescription)
		    List.AddRow "Make: "+(t.Make)
		    List.AddRow "Model: "+(t.Model)
		    
		    x=t.Orientation
		    select case x
		    case 1 //* row 0 top, col 0 lhs */
		      s="top left"
		    case 2 //* row 0 top, col 0 rhs */
		      s="top right"
		    case 3 //* row 0 bottom, col 0 rhs */
		      s="bottom right"
		    case 4 //* row 0 bottom, col 0 lhs */
		      s="bottom left"
		    case 5 //* row 0 lhs, col 0 top */
		      s="top left"
		    case 6 //* row 0 rhs, col 0 top */
		      s="top right"
		    case 7 //* row 0 rhs, col 0 bottom */
		      s="bottom right"
		    case 8 //* row 0 lhs, col 0 bottom */
		      s="bottom left"
		    else
		      s=""
		    end Select
		    
		    List.AddRow "Orientation: "+str(x)+" "+s
		    List.AddRow "PageName: "+(t.PageName)
		    
		    x=t.Photometric
		    Select case x
		    case 0
		      s="WhiteIsZero"
		    case 1
		      s="BlackIsZero"
		    case 2
		      s="RGB"
		    case 3
		      s="Palette color"
		    case 4
		      s="Transparency mask"
		    case 5
		      s="Separation"
		    case 6
		      s="YCBCR"
		    case 8
		      s="1976 CIE L*a*b*"
		    case 9
		      s="ICC L*a*b* [Adobe TIFF Technote 4]"
		    case 10
		      s="ITU L*a*b*"
		    case 32844
		      s="CIE Log2(L)"
		    case 32845
		      s="CIE Log2(L) (u',v')"
		    else
		      s=""
		    end Select
		    
		    List.AddRow "Photometric: "+str(x)+" "+s
		    List.AddRow "PlanarConfig: "+str(t.PlanarConfig)
		    
		    x=t.ResolutionUnit
		    Select case x
		    case 1
		      s="unknown"
		    case 2
		      s="inch"
		    case 3
		      s="metric"
		    else
		      s=""
		    end Select
		    List.AddRow "ResolutionUnit: "+str(x)+" "+s
		    List.AddRow "RowsPerStrip: "+str(t.RowsPerStrip)
		    
		    x=t.SampleFormat
		    Select case x
		    case 1
		      s="unsigned integer data"
		    case 2
		      s="signed integer data"
		    case 3
		      s="IEEE floating point data"
		    case 4
		      s="untyped data"
		    case 5
		      s="complex signed int"
		    case 6
		      s="complex ieee floating"
		    else
		      s=""
		    end Select
		    List.AddRow "SampleFormat: "+str(x)+" "+s
		    
		    
		    List.AddRow "SamplesPerPixel: "+str(t.SamplesPerPixel)
		    List.AddRow "Software: "+(t.Software)
		    List.AddRow "VerticalPosition: "+str(t.VerticalPosition)
		    List.AddRow "VerticalResolution: "+str(t.VerticalResolution)
		    List.AddRow "Width: "+str(t.Width)
		    
		  else
		    MsgBox "Failed to open tiff file."
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		t As TiffPictureMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem
		  
		  f=GetOpenFolderItem(MyFileTypes.ImageTiff)
		  
		  if f<>Nil then
		    load f
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  if t.ReadRGB then
		    
		    dim p as Picture
		    
		    p=t.CombinePictureWithMask
		    
		    if p=nil then
		      MsgBox "Failed to get a picture."
		    else
		      dim w as new PictureWindow
		      
		      w.Backdrop=p
		      w.Show
		    end if
		    
		  else
		    MsgBox "Failed to read this picture."
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
