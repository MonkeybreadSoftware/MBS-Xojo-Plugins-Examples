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
   Height          =   534
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1075558024
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   942
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
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   500
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   532
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
      TextFont        =   "Courier"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   390
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   500
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim pic as Picture = LogoMBS(500)
		  dim mask as Picture = new Picture(500,500,32)
		  
		  mask.Graphics.ForeColor = &cFFFFFF
		  mask.Graphics.FillRect 0,0,mask.Width,mask.Height
		  mask.Graphics.ForeColor = &c000000
		  mask.Graphics.FillOval 0,0,mask.Width,mask.Height
		  
		  dim m as MemoryBlock
		  
		  Check1(pic, "RGB16")
		  Check1(pic, "ARGB16")
		  Check1(pic, "RGB16_565")
		  Check1(pic, "ARGB32")
		  Check1(pic, "RGB32")
		  Check1(pic, "RGB24")
		  Check1(pic, "MASK8")
		  
		  Check2(pic, mask, "RGB16")
		  Check2(pic, mask, "ARGB16")
		  Check2(pic, mask, "RGB16_565")
		  Check2(pic, mask, "ARGB32")
		  Check2(pic, mask, "RGB32")
		  Check2(pic, mask, "RGB24")
		  Check2(pic, mask, "MASK8")
		  
		  
		  
		  
		  
		  
		  // done
		  pic.mask.Graphics.DrawPicture mask,0,0
		  canvas1.Backdrop = pic
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Check(m1 as MemoryBlock, m2 as MemoryBlock)
		  
		  if m1<>nil and m2<>nil then
		    if m1.Size = m2.size then
		      List.AddRow "Size equal"
		      
		      if m1.BytesEqualMBS(0, m1.Size, m2, 0) then
		        List.AddRow "Bytes equal"
		      else
		        List.AddFail "Bytes not equal"
		        
		        dim c as integer = m1.Size-1-32
		        for i as integer = 0 to c
		          if m1.Int8Value(i)<>m2.Int8Value(i) then
		            List.AddFail "Position: "+str(i)
		            List.AddFail EncodingToHexMBS(m1.StringValue(i,32))
		            List.AddFail EncodingToHexMBS(m2.StringValue(i,32))
		            exit
		          end if
		        next
		        
		      end if
		    else
		      List.AddFail "Size not equal"
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Check1(pic as Picture, mode as string)
		  #pragma DisableBackgroundTasks
		  
		  dim d as Double
		  dim m1,m2 as MemoryBlock
		  
		  d = Microseconds
		  for i as integer = 1 to 10
		    m1 = GetMBfromPicture(pic, mode)
		  next
		  d = Microseconds-d
		  if m1 = nil then
		    List.AddFail "GetMBfromPicture(pic, "+mode+") Failed"
		  else
		    List.AddRow "GetMBfromPicture(pic, "+mode+") = "+Format(d/10.0/1000000.0,"0.0000")
		  end if
		  
		  d = Microseconds
		  for i as integer = 1 to 10
		    m2 = GetMBfromPictureMBS(pic, mode)
		  next
		  d = Microseconds-d
		  if m2 = nil then
		    List.AddFail "GetMBfromPictureMBS(pic, "+mode+") Failed"
		  else
		    List.AddRow "GetMBfromPictureMBS(pic, "+mode+") = "+Format(d/10.0/1000000.0,"0.0000")
		  end if
		  
		  Check m1,m2
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Check2(pic as Picture, mask as picture, mode as string)
		  #pragma DisableBackgroundTasks
		  
		  dim d as Double
		  dim m1,m2 as MemoryBlock
		  
		  d = Microseconds
		  for i as integer = 1 to 10
		    m1 = GetMBfromPicture(pic, mask, mode)
		  next
		  d = Microseconds-d
		  if m1 = nil then
		    List.AddFail "GetMBfromPicture(pic, mask, "+mode+") Failed"
		  else
		    List.AddRow "GetMBfromPicture(pic, mask, "+mode+") = "+Format(d/10.0/1000000.0,"0.0000")
		  end if
		  
		  d = Microseconds
		  for i as integer = 1 to 10
		    m2 = GetMBfromPictureMBS(pic, mask, mode)
		  next
		  d = Microseconds-d
		  if m2 = nil then
		    List.AddFail "GetMBfromPictureMBS(pic, mask, "+mode+") Failed"
		  else
		    List.AddRow "GetMBfromPictureMBS(pic, mask, "+mode+") = "+Format(d/10.0/1000000.0,"0.0000")
		  end if
		  
		  Check m1,m2
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  // Color lines which have a color
		  
		  if row<me.ListCount then
		    dim v as Variant = me.RowTag(row)
		    
		    if v.Type = Variant.TypeColor then
		      dim c as color = v
		      
		      g.ForeColor = c
		      g.FillRect 0,0,g.Width,g.Height
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
#tag EndViewBehavior
