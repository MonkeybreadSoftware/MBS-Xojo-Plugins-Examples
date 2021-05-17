#tag Window
Begin Window Fenster1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   320
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1149157264
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   False
   Title           =   "MiniMax Demo"
   Visible         =   True
   Width           =   700
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "quit"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   611
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   282
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Canvas scr
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   256
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   256
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "start"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   530
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   282
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin ListBox res_list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   "60%"
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
      Height          =   256
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   288
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   392
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton min_btn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "min"
      Default         =   False
      Enabled         =   False
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   282
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton max_btn
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "max"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   207
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   ""
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   282
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  intern = New Picture(256,256,32)
		  intern.graphics.drawpicture test,0,0
		  red=rgb(255,0,0)
		  grn=rgb(0,255,0)
		  blu=rgb(0,0,255)
		  blk=rgb(0,0,0)
		  wht=rgb(255,255,255)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub addpoint(s as string, x as integer, y as integer)
		  dim c as color
		  
		  c=Intern.RGBSurface.Pixel(x,y)
		  
		  res_list.addrow s+" x "+str(x)
		  res_list.cell(res_list.LastIndex,1)=str(c.red)
		  res_list.cell(res_list.LastIndex,2)=str(c.green)
		  res_list.cell(res_list.LastIndex,3)=str(c.blue)
		  res_list.addrow s+" y "+str(y)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub draw_mark(pic as picture, x as integer, y as integer, col as color)
		  
		  
		  pic.graphics.penwidth=1
		  pic.graphics.penheight=1
		  
		  
		  pic.graphics.forecolor=blk
		  pic.graphics.drawOval x-5,y-5,11,11
		  
		  pic.graphics.forecolor=wht
		  pic.graphics.drawOval x-4,y-4,9,9
		  
		  
		  pic.graphics.forecolor=col
		  pic.graphics.drawline x-5,y,x-1,y
		  pic.graphics.drawline x+1,y,x+5,y
		  pic.graphics.drawline x,y-5,x,y-1
		  pic.graphics.drawline x,y+5,x,y+1
		  
		  
		  
		  
		  show_image
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub find_minimax(pic as picture, byref res() as integer)
		  
		  
		  dim f as PictureMinMaxMBS
		  
		  f=new PictureMinMaxMBS
		  
		  if f.FindAll(pic) then
		    res(0)=f.redmaxx
		    res(1)=f.redmaxy
		    res(2)=f.greenmaxx
		    res(3)=f.greenmaxy
		    res(4)=f.bluemaxx
		    res(5)=f.bluemaxy
		    
		    res(6)=f.summaxx
		    res(7)=f.summaxy
		    
		    res(8)=f.redminx
		    res(9)=f.redminy
		    res(10)=f.greenminx
		    res(11)=f.greenminy
		    res(12)=f.blueminx
		    res(13)=f.blueminy
		    
		    res(14)=f.summinx
		    res(15)=f.summiny
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub show_image()
		  scr.Invalidate
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected blk As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected blu As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected grn As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected intern As picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected red As color
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected result(15) As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected wht As color
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  quit
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events scr
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if intern <> nil then
		    g.drawpicture intern,0,0
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  dim t as integer
		  
		  t=ticks
		  find_minimax(intern,result)
		  t=ticks-t
		  
		  res_list.deleteAllRows
		  
		  res_list.AddRow "ticks "+str(t)
		  
		  addpoint "red max",result(0),result(1)
		  addpoint "grn max",result(2),result(3)
		  addpoint "blu max",result(4),result(5)
		  addpoint "sum max",result(6),result(7)
		  addpoint "red min",result(8),result(9)
		  addpoint "grn min",result(10),result(11)
		  addpoint "blu min",result(12),result(13)
		  addpoint "sum min",result(14),result(15)
		  
		  min_btn.enabled=true
		  max_btn.enabled=true
		  
		  me.Enabled=false
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events min_btn
	#tag Event
		Sub Action()
		  intern.graphics.drawpicture test,0,0
		  draw_mark intern, result(0),result(1),red
		  draw_mark intern, result(2),result(3),grn
		  draw_mark intern, result(4),result(5),blu
		  draw_mark intern, result(6),result(7),blk
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events max_btn
	#tag Event
		Sub Action()
		  intern.graphics.drawpicture test,0,0
		  draw_mark intern, result(8),result(9),red
		  draw_mark intern, result(10),result(11),grn
		  draw_mark intern, result(12),result(13),blu
		  draw_mark intern, result(14),result(15),blk
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
