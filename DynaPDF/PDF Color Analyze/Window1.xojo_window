#tag Window
Begin Window Window1
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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1635414142
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "PDF Color Info"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "90%,*"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   2
      GridLinesVertical=   2
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   13
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load PDF"
      Default         =   False
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
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu Pop_Encoding
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "UTF8\rMacRoman\rWindowsANSI\rASCII"
      Italic          =   False
      Left            =   112
      ListIndex       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   359
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function Analyze(f As FolderItem) As Boolean
		  //
		  List.DeleteAllRows
		  List.ScrollPosition = 0
		  
		  //
		  if f = Nil or f.Exists = False then
		    //
		    GoTo myReturn_False
		  end if
		  
		  //
		  dim pdf As New MyDynapdfMBS
		  pdf.SetLicenseKey "Pro" // For this example you can use a Pro or Enterprise License
		  
		  if Not pdf.CreateNewPDF( Nil ) then
		    //
		    MsgBox( "ERROR: Out of Memory!" )
		    //
		    GoTo myReturn_False
		  end if
		  
		  //
		  if pdf.OpenImportFile( f, pdf.kptopen, "" ) <> 0 then
		    //
		    MsgBox( "ERROR: Wrong 'Type / PWD / etc'?" )
		    //
		    GoTo myReturn_False
		  end if
		  
		  call pdf.SetImportFlags(pdf.kifImportAsPage + pdf.kifImportAll)
		  call pdf.ImportPDFFile(1, 1, 1)
		  
		  //
		  for iCs As Integer = 0 to pdf.GetColorSpaceCount - 1
		    
		    //
		    dim cp As DynapdfColorSpaceMBS = pdf.GetColorSpaceObj( iCs)
		    if cp<>nil then
		      //
		      List.AddRow ""
		      List.AddRow "##### New Color: ("  +Str( iCs ) + ") ##########"
		      
		      //
		      List.AddRow "Type: " + Str( cp.Type ) + ": " + ColorSpaceType_Get_Name( cp.Type )
		      List.AddRow "   Colorants: " + Colorants_Get( cp )
		      List.AddRow "   Attributes: " + Attributes_Get( cp )
		      List.AddRow "   Alternate: " + Str( cp.AlternateType ) + ": " + ColorSpaceType_Get_Name( cp.AlternateType )
		      List.AddRow "   NumInComponents: " + Str( cp.NumInComponents )
		      List.AddRow "   NumOutComponents: " + Str( cp.NumOutComponents )
		      
		      // Is separation colorspace
		      if cp.Type = DynapdfMBS.kesSeparation then
		        //
		        dim c1( -1 ) As Double = Array( 1.00 )
		        dim c2 As Integer = pdf.ConvColor( c1, cp.Handle, DynapdfMBS.kesDeviceCMYK )
		        List.AddRow "   Color Value (CMYK): " + Str( c2 )
		        
		        // Show the colors
		        List.CellTag( List.LastIndex, 0 ) = CMYK_Color_Get_RbColor( c2 )
		        
		        // Add the color values
		        dim dColors( -1 ) As Double = CMYK_Color_Get_Values( c2 )
		        dim sColor( -1 ) As String
		        for iCount As Integer = 0 to UBound( dColors )
		          sColor.Append Str( dColors( iCount ) )
		        next
		        List.Cell( List.LastIndex, 0 ) = List.Cell( List.LastIndex, 0 ) + " - " + Join( sColor, ", " )
		        
		      end if
		      
		      // Has an alternate handle
		      dim cp2 As DynapdfColorSpaceMBS = cp.Alternate
		      if cp2<>Nil then
		        List.AddRow "      Type: " + Str( cp2.Type ) + ": " + ColorSpaceType_Get_Name( cp2.type )
		        List.AddRow "      Colorants: " + Colorants_Get( cp2 )
		        List.AddRow "      Attributes: " + Attributes_Get( cp2 )
		        List.AddRow "      Alternate: " + Str( cp2.AlternateType ) + ": " + ColorSpaceType_Get_Name( cp2.AlternateType )
		        List.AddRow "      NumInComponents: " + Str( cp2.NumInComponents )
		        List.AddRow "      NumOutComponents: " + Str( cp2.NumOutComponents )
		        
		      end if
		      
		    end if
		    
		  next // Next colorspace
		  
		  // Clean up
		  Call pdf.CloseImportFile
		  Call pdf.CloseFile
		  Call pdf.FreePDF
		  
		  //
		  Return( True )
		  
		  //
		  myReturn_False:
		  
		  //
		  Return( False )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Attributes_Get(cp As DynapdfColorSpaceMBS) As string
		  dim d As DynaPDFDeviceNAttributesMBS = cp.DeviceNAttributes
		  
		  if d <> Nil then
		    
		    //
		    dim ss( -1 ) As string
		    dim cc As integer = d.SeparationsCount - 1
		    
		    //
		    for ii As integer = 0 to cc
		      ss.Append d.Separations( ii ).Name
		    next
		    
		    //
		    dim tt( -1 ) As string
		    cc = d.ProcessColorantsCount - 1
		    
		    //
		    for ii As integer = 0 to cc
		      tt.Append d.ProcessColorants( ii )
		    next
		    
		    //
		    Return( "Separations: " + Join( ss,", " ) + ", ProcessColorants: " + Join( tt,", " ) )
		    
		  end if
		  
		  //
		  Return( "none" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CMYK_Color_Get_RbColor(i As Integer) As Color
		  //
		  dim dFakt As Double = 1 / 255
		  
		  //
		  dim c, m, y, k As Double
		  
		  //
		  c = dFakt * DynapdfMBS.CofCMYK( i )
		  m =dFakt * DynapdfMBS.MofCMYK( i )
		  y = dFakt * DynapdfMBS.YofCMYK( i )
		  k = dFakt * DynapdfMBS.KofCMYK( i )
		  
		  // add black 'dirty' 
		  c = Min( c + k, 1 )
		  m = Min( m + k, 1 )
		  Y = Min( y + k, 1 )
		  
		  //
		  Return( CMY( c, m, y ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CMYK_Color_Get_Values(i As Integer) As Double()
		  //
		  dim d( -1 ) As Double
		  
		  //
		  d.Append DynapdfMBS.CofCMYK( i )
		  d.Append DynapdfMBS.MofCMYK( i )
		  d.Append DynapdfMBS.YofCMYK( i )
		  d.Append DynapdfMBS.KofCMYK( i )
		  
		  //
		  Return( d )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Colorants_Clean(s As String) As String
		  //
		  dim sBack As String
		  
		  //
		  Select Case Pop_Encoding.ListIndex
		    
		  Case 0
		    sBack = DefineEncoding( s, Encodings.UTF8 )
		    
		  Case 1
		    sBack = DefineEncoding( s, Encodings.MacRoman )
		    
		  Case 2
		    sBack = DefineEncoding( s, Encodings.WindowsANSI )
		    
		  Case 3
		    sBack = DefineEncoding( s, Encodings.ASCII )
		    
		  End Select
		  
		  //
		  for i As Integer = 0 to 31
		    if InStr( sBack, Chr( i ) ) > 0 then
		      sBack = ReplaceAll( sBack, Chr( i ), "?" )
		    end if
		  next
		  
		  //
		  Return( sBack )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Colorants_Get(cp As DynapdfColorSpaceMBS) As string
		  //
		  dim c As Integer = cp.ColorantsCount - 1
		  
		  //
		  dim lines( -1 ) As string
		  
		  //
		  for i As Integer = 0 to c
		    lines.Append Colorants_Clean( cp.Colorants( i ) )
		  next
		  
		  //
		  Return( Join( lines,", " ) )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorSpaceType_Get_Name(kesN As integer) As string
		  //
		  dim s As string
		  
		  //
		  Select Case kesN
		    
		  Case DynaPDFMBS.kesDeviceRGB   // Device color space
		    s = "DeviceRGB"
		    
		  Case DynaPDFMBS.kesDeviceCMYK  // Device color space
		    s = "DeviceCMYK"
		    
		  Case DynaPDFMBS.kesDeviceGray  // Device color space
		    s = "DeviceGray"
		    
		  Case DynaPDFMBS.kesCalGray     // CIE-based color space
		    s = "CalGray"
		    
		  Case DynaPDFMBS.kesCalRGB      // CIE-based color space
		    s = "CalRGB"
		    
		  Case DynaPDFMBS.kesLab         // CIE-based color space
		    s = "Lab"
		    
		  Case DynaPDFMBS.kesICCBased    // ICC-based color space -> contains an ICC profile
		    s = "ICCBased "
		    
		  Case DynaPDFMBS.kesPattern     // Special color space
		    s = "Pattern"
		    
		  Case DynaPDFMBS.kesIndexed     // Special color space
		    s = "Indexed "
		    
		  Case DynaPDFMBS.kesSeparation  // Special color space
		    s = "Separation"
		    
		  Case DynaPDFMBS.kesDeviceN     // Special color space
		    s = "DeviceN"
		    
		  Case DynaPDFMBS.kesNChannel    // Special color space
		    s = "NChannel"
		    
		  else
		    s = "?"
		    
		  end Select
		  
		  //
		  Return( s )
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  //
		  if _
		    column <> 1 or _
		    row > me.ListCount - 1 or _
		    me.CellTag( row, 0 ) = Nil _
		    then
		    //
		    Return( False )
		  end if
		  
		  //
		  g.ForeColor = me.CellTag( row, 0 )
		  g.FillRect( 0, 0, g.Width, g.Height )
		  
		  //
		  Return( False )
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  //
		  dim f As FolderItem = GetOpenFolderItem( FileTypes1.PDF )
		  
		  //
		  if f = Nil or f.Exists = False then
		    //
		    Return
		  end if
		  
		  //
		  Call Analyze( f )
		  
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
