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
   MenuBar         =   1647283937
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "DynaPDF Makros"
   Visible         =   True
   Width           =   600
   Begin Listbox list
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
      Height          =   366
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
		  dim x as integer
		  
		  // R 0 to 255, B 0 to 255, G 0 to 255
		  
		  dim rgb as integer = DynapdfMBS.RGB(5,6,7)
		  List.AddRow "RGB(5,6,7): "+hex(rgb)
		  
		  x = DynapdfMBS.RofRGB(rgb)
		  if x <> 5 then
		    list.addrow "RofRGB failed: 5 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.GofRGB(rgb)
		  if x <> 6 then
		    list.addrow "GofRGB failed: 6 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.BofRGB(rgb)
		  if x <> 7 then
		    list.addrow "BofRGB failed: 7 <> "+str(x)
		  end if
		  
		  // L 0 to 100, a -128 to 127, b -128 to 127
		  
		  dim lab as integer = DynapdfMBS.LAB(1,2,3)
		  List.AddRow "LAB(1,2,3): "+hex(lab)
		  
		  x = DynapdfMBS.LOfLAB(lab)
		  if x <> 1 then
		    list.addrow "RofRGB failed: 1 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.AOfLAB(lab)
		  if x <> 2 then
		    list.addrow "GofRGB failed: 2 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.BOfLAB(lab)
		  if x <> 3 then
		    list.addrow "BofRGB failed: 3 <> "+str(x)
		  end if
		  
		  lab = DynapdfMBS.LAB(50,0,-90) /// blue
		  List.AddRow "LAB(50,0,-90): "+hex(lab)
		  
		  x = DynapdfMBS.LOfLAB(lab)
		  if x <> 50 then
		    list.addrow "LOfLAB failed: 50 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.AOfLAB(lab)
		  if x <> 0 then
		    list.addrow "AOfLAB failed: 0 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.BOfLAB(lab)
		  if x <> -90 then
		    list.addrow "BOfLAB failed: -90 <> "+str(x)
		  end if
		  
		  
		  lab = DynapdfMBS.LAB(50,-127,0) /// green
		  List.AddRow "LAB(50,-127,0): "+hex(lab)
		  
		  x = DynapdfMBS.LOfLAB(lab)
		  if x <> 50 then
		    list.addrow "LOfLAB failed: 50 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.AOfLAB(lab)
		  if x <> -127 then
		    list.addrow "AOfLAB failed: -127 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.BOfLAB(lab)
		  if x <> 0 then
		    list.addrow "BOfLAB failed: 0 <> "+str(x)
		  end if
		  
		  lab = DynapdfMBS.LAB(100,100,100)
		  List.AddRow "LAB(100,100,100): "+hex(lab)
		  
		  x = DynapdfMBS.LOfLAB(lab)
		  if x <> 100 then
		    list.addrow "LOfLAB failed: 100 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.AOfLAB(lab)
		  if x <> 100 then
		    list.addrow "AOfLAB failed: 100 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.BOfLAB(lab)
		  if x <> 100 then
		    list.addrow "BOfLAB failed: 100 <> "+str(x)
		  end if
		  
		  lab = DynapdfMBS.LAB(100,-100,-100)
		  List.AddRow "LAB(100,-100,-100): "+hex(lab)
		  
		  x = DynapdfMBS.LOfLAB(lab)
		  if x <> 100 then
		    list.addrow "LOfLAB failed: 100 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.AOfLAB(lab)
		  if x <> -100 then
		    list.addrow "AOfLAB failed: -100 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.BOfLAB(lab)
		  if x <> -100 then
		    list.addrow "BOfLAB failed: -100 <> "+str(x)
		  end if
		  
		  
		  // C 0 to 255, M 0 to 255, Y 0 to 255, K 0 to 255
		  
		  dim cmyk as UInt32 = DynapdfMBS.CMYK(1,2,3,4)
		  List.AddRow "CMYK(1,2,3,4): "+hex(cmyk)
		  
		  x = DynapdfMBS.CofCMYK(cmyk)
		  if x <> 1 then
		    list.addrow "CofCMYK failed: 1 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.MofCMYK(cmyk)
		  if x <> 2 then
		    list.addrow "MofCMYK failed: 2 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.YofCMYK(cmyk)
		  if x <> 3 then
		    list.addrow "YofCMYK failed: 3 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.KofCMYK(cmyk)
		  if x <> 4 then
		    list.addrow "KofCMYK failed: 4 <> "+str(x)
		  end if
		  
		  
		  
		  cmyk = DynapdfMBS.CMYK(200,220,240,255)
		  List.AddRow "CMYK(200,220,240,255): "+hex(cmyk)
		  
		  x = DynapdfMBS.CofCMYK(cmyk)
		  if x <> 200 then
		    list.addrow "CofCMYK failed: 200 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.MofCMYK(cmyk)
		  if x <> 220 then
		    list.addrow "MofCMYK failed: 220 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.YofCMYK(cmyk)
		  if x <> 240 then
		    list.addrow "YofCMYK failed: 240 <> "+str(x)
		  end if
		  
		  x = DynapdfMBS.KofCMYK(cmyk)
		  if x <> 255 then
		    list.addrow "KofCMYK failed: 255 <> "+str(x)
		  end if
		  
		  
		  list.addrow "Done"
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


#tag EndWindowCode

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
