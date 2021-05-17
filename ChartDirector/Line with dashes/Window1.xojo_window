#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   700
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   1200
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   False
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   467
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Year	Month	Threads	Emails\r2001	07	2	9\r2001	08	18	60\r2001	09	710	2296\r2001	10	753	2725\r2001	11	647	2243\r2001	12	529	1917\r2002	01	737	2774\r2002	02	625	2299\r2002	03	668	2537\r2002	04	631	2556\r2002	05	652	2548\r2002	06	603	2549\r2002	07	700	3152\r2002	08	704	3026\r2002	09	791	3606\r2002	10	967	4588\r2002	11	762	3657\r2002	12	616	2712\r2003	01	687	3084\r2003	02	695	2928\r2003	03	887	4267\r2003	04	857	3664\r2003	05	919	4043\r2003	06	833	3998\r2003	07	867	3807\r2003	08	762	3311\r2003	09	720	3650\r2003	10	733	3545\r2003	11	613	2717\r2003	12	465	1985\r2004	01	603	3032\r2004	02	682	3481\r2004	03	1046	5748\r2004	04	886	4282\r2004	05	867	4251\r2004	06	911	4868\r2004	07	857	4681\r2004	10	637	2975\r2004	11	586	2796\r2004	12	571	2750\r2005	01	610	3078\r2005	02	603	3005\r2005	03	705	3584\r2005	04	642	3364\r2005	05	622	3640\r2005	06	886	4596\r2005	07	687	3673\r2005	08	893	4751\r2005	09	806	3986\r2005	10	656	3057\r2005	11	561	2717\r2005	12	523	2874\r2006	01	278	1491\r2006	02	552	3155\r2006	03	494	2421\r2006	04	461	2208\r2006	05	371	1575\r2006	06	339	1468\r2006	07	395	1610\r2006	08	319	1499\r2006	09	263	1320\r2006	10	398	1916\r2006	11	270	1065\r2006	12	285	1406\r2007	01	415	2228\r2007	02	423	2577\r2007	03	308	1618\r2007	04	354	2002\r2007	05	382	2425\r2007	06	294	2049\r2007	07	263	1557\r2007	08	225	1407\r2007	09	307	2162\r2007	10	290	1661\r2007	11	330	2011\r2007	12	224	1567\r2008	01	259	1569\r2008	02	221	1463"
      Italic          =   False
      Left            =   429
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -17
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   359
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // exact data out of listbox
		  // your data may come from database...
		  
		  dim u as integer = Listbox1.ListCount-1
		  for i as integer = 0 to u
		    labels.Append listbox1.Cell(i,0)+"-"+Listbox1.Cell(i,1)
		    Threads.Append val(listbox1.Cell(i,2))
		    emails.Append val(listbox1.Cell(i,3))
		  next
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // draw chart with window size
		  
		  dim c as new CDXYChartMBS(Width, Height)
		  
		  call c.setPlotArea 30,20, Width-50, Height-50
		  
		  // create dashed color with color and pattern
		  dim c1 as integer = c.dashLineColor(&cFF0000, &h00000505)
		  dim c2 as integer = c.dashLineColor(&c0000FF, &h05050303)
		  
		  // make line layers with those colors
		  dim l1 as CDLineLayerMBS = c.addLineLayer(emails, c1)
		  dim l2 as CDLineLayerMBS = c.addLineLayer(threads, c2)
		  
		  
		  
		  call c.xAxis.setLabelS labels
		  
		  c.xAxis.setLabelStep 5
		  
		  CurrentChart = c.makeChartPicture
		  
		  g.DrawPicture CurrentChart, 0, 0
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		CurrentChart As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		emails(-1) As double
	#tag EndProperty

	#tag Property, Flags = &h0
		labels(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		threads(-1) As Double
	#tag EndProperty


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
	#tag ViewProperty
		Name="CurrentChart"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
