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
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   94722716
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Picture Benchmark"
   Visible         =   True
   Width           =   600
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Item	Plugin	Built-In"
      Italic          =   False
      Left            =   20
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
      TabIndex        =   0
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
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  CheckSmallJPEGCompression
		  CheckSmallJPEGDecompression
		  
		  CheckSmallPNGCompression
		  CheckSmallPNGDecompression
		  
		  CheckMiddleJPEGCompression
		  CheckMiddleJPEGDecompression
		  
		  CheckMiddlePNGCompression
		  CheckMiddlePNGDecompression
		  
		  CheckBigJPEGCompression
		  CheckBigJPEGDecompression
		  
		  CheckBigPNGCompression
		  CheckBigPNGDecompression
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckBigJPEGCompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture = logoMBS(2000)
		  
		  listbox1.AddRow "JPEG compression big"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 10
		    data = pic.GetData(pic.FormatJPEG, pic.QualityHigh)
		  next
		  
		  t = microseconds - t
		  Report 2, t/10.0
		  
		  t = microseconds
		  for i as integer = 1 to 10
		    data = PictureToJPEGStringMBS(pic, 80)
		  next
		  
		  t = microseconds - t
		  Report 1, t/10.0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckBigJPEGDecompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture
		  
		  listbox1.AddRow "JPEG decompression big"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 10
		    pic = Picture.FromData(data)
		  next
		  
		  t = microseconds - t
		  Report 2, t/10.0
		  
		  t = microseconds
		  for i as integer = 1 to 10
		    pic = JPEGStringToPictureMBS(data)
		  next
		  
		  t = microseconds - t
		  Report 1, t/10.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckBigPNGCompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture = logoMBS(2000)
		  
		  listbox1.AddRow "PNG compression big"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 10
		    data = pic.GetData(pic.FormatPNG, pic.QualityHigh)
		  next
		  
		  t = microseconds - t
		  Report 2, t/10.0
		  
		  t = microseconds
		  for i as integer = 1 to 10
		    data = PictureToPNGStringMBS(pic)
		  next
		  
		  t = microseconds - t
		  Report 1, t/10.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckBigPNGDecompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture
		  
		  listbox1.AddRow "PNG decompression big"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 10
		    pic = Picture.FromData(data)
		  next
		  
		  t = microseconds - t
		  Report 2, t/10.0
		  
		  t = microseconds
		  for i as integer = 1 to 10
		    pic = PNGStringToPictureMBS(data)
		  next
		  
		  t = microseconds - t
		  Report 1, t/10.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckMiddleJPEGCompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture = logoMBS(500)
		  
		  listbox1.AddRow "JPEG compression middle"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 20
		    data = pic.GetData(pic.FormatJPEG, pic.QualityHigh)
		  next
		  
		  t = microseconds - t
		  Report 2, t/20.0
		  
		  t = microseconds
		  for i as integer = 1 to 20
		    data = PictureToJPEGStringMBS(pic, 80)
		  next
		  
		  t = microseconds - t
		  Report 1, t/20.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckMiddleJPEGDecompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture
		  
		  listbox1.AddRow "JPEG decompression middle"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 20
		    pic = Picture.FromData(data)
		  next
		  
		  t = microseconds - t
		  Report 2, t/20.0
		  
		  t = microseconds
		  for i as integer = 1 to 20
		    pic = JPEGStringToPictureMBS(data)
		  next
		  
		  t = microseconds - t
		  Report 1, t/20.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckMiddlePNGCompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture = logoMBS(500)
		  
		  listbox1.AddRow "PNG compression middle"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 20
		    data = pic.GetData(pic.FormatPNG, pic.QualityHigh)
		  next
		  
		  t = microseconds - t
		  Report 2, t/20.0
		  
		  t = microseconds
		  for i as integer = 1 to 20
		    data = PictureToPNGStringMBS(pic)
		  next
		  
		  t = microseconds - t
		  Report 1, t/20.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckMiddlePNGDecompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture
		  
		  listbox1.AddRow "PNG decompression middle"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 20
		    pic = Picture.FromData(data)
		  next
		  
		  t = microseconds - t
		  Report 2, t/20.0
		  
		  t = microseconds
		  for i as integer = 1 to 20
		    pic = PNGStringToPictureMBS(data)
		  next
		  
		  t = microseconds - t
		  Report 1, t/20.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckSmallJPEGCompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture = logoMBS(50)
		  
		  listbox1.AddRow "JPEG compression small"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 30
		    data = pic.GetData(pic.FormatJPEG, pic.QualityHigh)
		  next
		  
		  t = microseconds - t
		  Report 2, t/30.0
		  
		  t = microseconds
		  for i as integer = 1 to 30
		    data = PictureToJPEGStringMBS(pic, 80)
		  next
		  
		  t = microseconds - t
		  Report 1, t/30.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckSmallJPEGDecompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture
		  
		  listbox1.AddRow "JPEG decompression small"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 30
		    pic = Picture.FromData(data)
		  next
		  
		  t = microseconds - t
		  Report 2, t/30.0
		  
		  t = microseconds
		  for i as integer = 1 to 30
		    pic = JPEGStringToPictureMBS(data)
		  next
		  
		  t = microseconds - t
		  Report 1, t/30.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckSmallPNGCompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture = logoMBS(50)
		  
		  listbox1.AddRow "PNG compression small"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 30
		    data = pic.GetData(pic.FormatPNG, pic.QualityHigh)
		  next
		  
		  t = microseconds - t
		  Report 2, t/30.0
		  
		  t = microseconds
		  for i as integer = 1 to 30
		    data = PictureToPNGStringMBS(pic)
		  next
		  
		  t = microseconds - t
		  Report 1, t/30.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckSmallPNGDecompression()
		  #pragma BackgroundTasks false
		  
		  dim pic as Picture
		  
		  listbox1.AddRow "PNG decompression small"
		  
		  dim t as double = microseconds
		  for i as integer = 1 to 30
		    pic = Picture.FromData(data)
		  next
		  
		  t = microseconds - t
		  Report 2, t/30.0
		  
		  t = microseconds
		  for i as integer = 1 to 30
		    pic = PNGStringToPictureMBS(data)
		  next
		  
		  t = microseconds - t
		  Report 1, t/30.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Report(n as integer, d as Double)
		  Listbox1.cell(Listbox1.LastIndex, n) = Format(d / 1000000, "0.000000")+" s"
		  
		  if n = 1 then
		    if d<x then
		      Listbox1.celltag(Listbox1.LastIndex, 1) = &cCCFFCC
		    else
		      Listbox1.celltag(Listbox1.LastIndex, 1) = &cFFCCFF
		    end if 
		  else
		    x = d
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		data As string
	#tag EndProperty

	#tag Property, Flags = &h0
		x As double
	#tag EndProperty


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub Open()
		  me.ColumnAlignment(1) = me.AlignRight
		  me.ColumnAlignment(2) = me.AlignRight
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row<me.ListCount and row <> me.ListIndex then
		    dim v as Variant = me.CellTag(row, column)
		    
		    if VarType(v) = v.TypeColor then
		      dim c as color = v
		      
		      g.ForeColor = c
		      g.FillRect 0,0,g.Width, g.Height
		      Return true
		      
		    end if
		  end if
		  
		End Function
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
	#tag ViewProperty
		Name="data"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="x"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
