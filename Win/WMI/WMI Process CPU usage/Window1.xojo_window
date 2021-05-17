#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   345016319
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Task Monitor"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
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
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "ID	Name	Private Memory	Virtual Memory	CPU Percent"
      Italic          =   False
      Left            =   -1
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
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  w=new WindowsWMIMBS
		  
		  if w.ConnectServer("root\cimv2") then
		    'MsgBox "Connected"
		  else
		    MsgBox "ConnectServer: fail"+EndOfLine+"Lasterror: "+str(w.Lasterror)
		  end if
		  
		  
		  list.ColumnAlignment(kColumnPMemory) = List.AlignRight
		  list.ColumnAlignment(kColumnVMemory) = List.AlignRight
		  list.ColumnAlignment(kColumnTime) = List.AlignRight
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function formatMemory(n as int64) As string
		  if n < 2* 1024 then
		    Return str(n)
		  elseif n < 2 * 1024 * 1024 then
		    return str(n \ 1024)+" KB"
		  else
		    return str(n \ 1024 \ 1024)+" MB"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowForID(ID as integer, name as string) As integer
		  dim u as integer = List.ListCount-1
		  for i as integer = 0 to u
		    if list.RowTag(i) = ID and list.cell(i, kColumnName) = name then
		      Return i
		    end if
		  next
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  
		  if w.query("WQL", "SELECT IDProcess, Name, VirtualBytes, PrivateBytes, PercentProcessorTime FROM Win32_PerfRawData_PerfProc_Process") then
		    
		    dim stats() as Stats
		    dim TotalPercentProcessorTime as Int64
		    
		    while w.NextItem
		      dim s as new stats
		      s.name = w.getProperty("Name")
		      s.ID = w.GetPropertyInteger("IDProcess")
		      s.VirtualBytes = w.GetPropertyInt64("VirtualBytes")
		      s.PrivateBytes = w.GetPropertyInt64("PrivateBytes")
		      s.PercentProcessorTime = w.GetPropertyInt64("PercentProcessorTime")
		      
		      stats.Append s
		      if s.Name = "_total" then
		        TotalPercentProcessorTime = s.PercentProcessorTime
		      end if
		    wend
		    
		    dim deltaTotalPercentProcessorTime as int64 = LastTotalPercentProcessorTime - TotalPercentProcessorTime
		    
		    for each s as stats in stats
		      dim row as integer = RowForID(s.ID, s.name)
		      if row = -1 then
		        
		        list.AddRow str(s.ID), "", "", "", ""
		        row = list.LastIndex
		        list.RowTag(row) = s.ID
		        list.CellTag(row, kColumnTime) = s.PercentProcessorTime
		        
		      else
		        
		        dim p as int64 = list.CellTag(row, kColumnTime) 
		        dim d as int64 = s.PercentProcessorTime-p
		        
		        list.cell(row, kColumnTime) = format(d / DeltaTotalPercentProcessorTime,"0.0%")
		        list.CellTag(row, kColumnTime) = s.PercentProcessorTime
		        
		      end if
		      
		      list.Cell(row, kColumnName) = s.name
		      list.cell(row, kColumnPMemory) = formatMemory(s.PrivateBytes)
		      list.cell(row, kColumnVMemory) = formatMemory(s.VirtualBytes)
		      
		    next
		    
		    LastTotalPercentProcessorTime = TotalPercentProcessorTime
		  else
		    MsgBox "query: fail"+EndOfLine+"Lasterror: "+str(w.Lasterror)
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		LastTotalPercentProcessorTime As INt64
	#tag EndProperty

	#tag Property, Flags = &h0
		w As WindowsWMIMBS
	#tag EndProperty


	#tag Constant, Name = kColumnName, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnPMemory, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnTime, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kColumnVMemory, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  update
		  
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
	#tag ViewProperty
		Name="LastTotalPercentProcessorTime"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="INt64"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
