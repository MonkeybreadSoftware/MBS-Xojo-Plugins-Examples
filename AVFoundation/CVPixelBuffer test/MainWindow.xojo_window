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
   Height          =   622
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1878700031
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CVPixelBuffer test"
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas Canvas2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas Canvas3
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   200
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas Canvas4
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   200
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
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
      Height          =   222
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   400
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  MakePic1
		  MakePic2
		  MakePic3
		  MakePic4
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub MakePic1()
		  // 8bit gray
		  
		  list.AddRow CurrentMethodName
		  
		  Const Width = 600
		  Const Height = 400
		  
		  Dim BytesPerPixel As Integer = 1
		  Dim RowBytes As Integer = RoundUp32( BytesPerPixel * Width)
		  
		  Dim data As New MemoryBlock(RowBytes * Height)
		  
		  
		  Dim w As Integer = Width -1
		  Dim h As Integer = Height-1
		  Dim o As Integer 
		  For y As Integer = 0 To h
		    o = y * rowbytes
		    For x As Integer = 0 To w
		      
		      data.UInt8Value(o) = x + y
		      
		      o = o + BytesPerPixel
		    Next
		  Next
		  
		  
		  Dim dic As New Dictionary
		  
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGImageCompatibilityKey) = True
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGBitmapContextCompatibilityKey) = True
		  
		  
		  Dim c As New CVPixelBufferMBS(width, Height, CVPixelBufferMBS.kCVPixelFormatType_OneComponent8, data, RowBytes, dic)
		  
		  
		  
		  
		  
		  
		  Dim image As CIImageMBS = c.CIImage
		  If image <> Nil Then
		    pic1 = image.RenderPicture
		  Else
		    List.AddRow "CIImage is nil"
		  End If
		  
		  
		  Exception u As UnsupportedOperationException
		    list.AddRow u.message + " "+Str(u.errorNumber)
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakePic2()
		  // 24 bit RGB
		  
		  list.AddRow CurrentMethodName
		  
		  Const Width = 600
		  Const Height = 400
		  
		  Dim BytesPerPixel As Integer = 3
		  Dim RowBytes As Integer = RoundUp32( BytesPerPixel * Width)
		  
		  Dim data As New MemoryBlock(RowBytes * Height)
		  
		  
		  Dim w As Integer = Width -1
		  Dim h As Integer = Height-1
		  Dim o As Integer 
		  For y As Integer = 0 To h
		    o = y * rowbytes
		    For x As Integer = 0 To w
		      
		      data.UInt8Value(o+0) = x + y
		      data.UInt8Value(o+1) = x
		      data.UInt8Value(o+2) = y
		      
		      o = o + BytesPerPixel
		    Next
		  Next
		  
		  
		  Dim dic As New Dictionary
		  
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGImageCompatibilityKey) = True
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGBitmapContextCompatibilityKey) = True
		  
		  #Pragma BreakOnExceptions off
		  Dim c As New CVPixelBufferMBS(width, Height, CVPixelBufferMBS.kCVPixelFormatType_24RGB, data, RowBytes, dic)
		  
		  
		  
		  
		  
		  
		  Dim image As CIImageMBS = c.CIImage
		  If image <> Nil Then
		    pic2 = image.RenderPicture
		  Else
		    List.AddRow "CIImage is nil"
		  End If
		  
		  
		  Exception u As UnsupportedOperationException
		    list.AddRow u.message + " "+Str(u.errorNumber)
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakePic3()
		  // 32bit RGB
		  
		  list.AddRow CurrentMethodName
		  
		  Const Width = 600
		  Const Height = 400
		  
		  Dim BytesPerPixel As Integer = 4
		  Dim RowBytes As Integer = RoundUp32( BytesPerPixel * Width)
		  Dim data As New MemoryBlock(RowBytes * Height)
		  
		  
		  Dim w As Integer = Width -1
		  Dim h As Integer = Height-1
		  Dim o As Integer 
		  For y As Integer = 0 To h
		    o = y * rowbytes
		    For x As Integer = 0 To w
		      
		      data.UInt8Value(o+0) = 255
		      data.UInt8Value(o+1) = x + y
		      data.UInt8Value(o+2) = x
		      data.UInt8Value(o+3) = y
		      
		      o = o + BytesPerPixel
		    Next
		  Next
		  
		  
		  Dim dic As New Dictionary
		  
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGImageCompatibilityKey) = True
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGBitmapContextCompatibilityKey) = True
		  
		  #Pragma BreakOnExceptions off
		  Dim c As New CVPixelBufferMBS(width, Height, CVPixelBufferMBS.kCVPixelFormatType_32ARGB, data, RowBytes, dic)
		  
		  
		  
		  
		  
		  
		  Dim image As CIImageMBS = c.CIImage
		  If image <> Nil Then
		    pic3 = image.RenderPicture
		  Else
		    List.AddRow "CIImage is nil"
		  End If
		  
		  
		  Exception u As UnsupportedOperationException
		    list.AddRow u.message + " "+Str(u.errorNumber)
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MakePic4()
		  // VUY
		  
		  list.AddRow CurrentMethodName
		  
		  Const Width = 600
		  Const Height = 400
		  
		  Dim BytesPerPixel As Integer = 1
		  Dim RowBytes As Integer = RoundUp32( BytesPerPixel * Width)
		  Dim data As New MemoryBlock(RowBytes * Height)
		  
		  
		  Dim w As Integer = Width -1
		  Dim h As Integer = Height-1
		  Dim o As Integer 
		  For y As Integer = 0 To h
		    o = y * rowbytes
		    For x As Integer = 0 To w
		      
		      data.UInt8Value(o+0) = x + y
		      
		      o = o + BytesPerPixel
		    Next
		  Next
		  
		  
		  Dim dic As New Dictionary
		  
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGImageCompatibilityKey) = True
		  dic.Value(CVPixelBufferMBS.kCVPixelBufferCGBitmapContextCompatibilityKey) = True
		  
		  #Pragma BreakOnExceptions off
		  Dim c As New CVPixelBufferMBS(width, Height, CVPixelBufferMBS.kCVPixelFormatType_422YpCbCr8, data, RowBytes, dic)
		  
		  
		  
		  
		  
		  
		  Dim image As CIImageMBS = c.CIImage
		  If image <> Nil Then
		    pic4 = image.RenderPicture
		  Else
		    List.AddRow "CIImage is nil"
		  End If
		  
		  
		  Exception u As UnsupportedOperationException
		    list.AddRow u.message + " "+Str(u.errorNumber)
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RoundUp32(n as integer) As integer
		  
		  
		  Dim r As Integer = (n+31) \ 32
		  
		  Return r * 32
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		pic1 As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic2 As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic3 As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic4 As picture
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic1 <> Nil Then
		    g.DrawPicture pic1, 0, 0, g.Width, g.Height, 0, 0, pic1.Width, pic1.Height
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas2
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic2 <> Nil Then
		    g.DrawPicture pic2, 0, 0, g.Width, g.Height, 0, 0, pic2.Width, pic2.Height
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas3
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic3 <> Nil Then
		    g.DrawPicture pic3, 0, 0, g.Width, g.Height, 0, 0, pic3.Width, pic3.Height
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Canvas4
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic4 <> Nil Then
		    g.DrawPicture pic4, 0, 0, g.Width, g.Height, 0, 0, pic4.Width, pic4.Height
		  End If
		  
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
		Visible=false
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
		Name="pic1"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic2"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic3"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic4"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
