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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   738334719
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Large Number Test"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  #Pragma DisableBackgroundTasks True
		  
		  If True Then
		    Dim l1 As New LargeNumberMBS(162435634567)
		    Dim l2 As New LargeNumberMBS(1543654634567)
		    Dim l3 As LargeNumberMBS
		    
		    Dim m1 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      l3 = l1 + l2
		    Next
		    
		    Dim m2 As Double = Microseconds
		    List.AddRow "LargeNumberMBS adds", Str( (m2-m1) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim l1 As New LargeNumberMBS(546345634564531)
		    Dim l2 As New LargeNumberMBS(563456345617)
		    Dim l3 As LargeNumberMBS
		    
		    Dim m1 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      l3 = l1 - l2
		    Next
		    
		    Dim m2 As Double = Microseconds
		    List.AddRow "LargeNumberMBS subs", Str( (m2-m1) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim l1 As New LargeNumberMBS(3456345634563456)
		    Dim l2 As New LargeNumberMBS(1546345637)
		    Dim l3 As LargeNumberMBS
		    
		    Dim m1 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      l3 = l1 * l2
		    Next
		    
		    Dim m2 As Double = Microseconds
		    List.AddRow "LargeNumberMBS muls", Str( (m2-m1) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim l1 As New LargeNumberMBS(12346754567567890)
		    Dim l2 As New LargeNumberMBS(178456845687)
		    Dim l3 As LargeNumberMBS
		    
		    Dim m1 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      l3 = l1 / l2
		    Next
		    
		    Dim m2 As Double = Microseconds
		    List.AddRow "LargeNumberMBS divs", Str( (m2-m1) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim b1 As New BigNumberMBS(4567456745671)
		    Dim b2 As New BigNumberMBS(1657456745677)
		    Dim b3 As BigNumberMBS
		    
		    Dim m3 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      b3 = b1 + b2
		    Next
		    
		    Dim m4 As Double = Microseconds
		    List.AddRow "BigNumberMBS adds", Str( (m4-m3) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim b1 As New BigNumberMBS(4567456745671)
		    Dim b2 As New BigNumberMBS(1657456745677)
		    Dim b3 As BigNumberMBS
		    
		    Dim m3 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      b3 = b1 - b2
		    Next
		    
		    Dim m4 As Double = Microseconds
		    List.AddRow "BigNumberMBS subs", Str( (m4-m3) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim b1 As New BigNumberMBS(4567456745671)
		    Dim b2 As New BigNumberMBS(1657456745677)
		    Dim b3 As BigNumberMBS
		    
		    Dim m3 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      b3 = b1 * b2
		    Next
		    
		    Dim m4 As Double = Microseconds
		    List.AddRow "BigNumberMBS muls", Str( (m4-m3) / 10000, "0.00")
		  End If
		  
		  If True Then
		    Dim b1 As New BigNumberMBS(4567456745671)
		    Dim b2 As New BigNumberMBS(1657456745677)
		    Dim b3 As BigNumberMBS
		    
		    Dim m3 As Double = Microseconds
		    
		    For i As Integer = 1 To 10000
		      b3 = b1 / b2
		    Next
		    
		    Dim m4 As Double = Microseconds
		    List.AddRow "BigNumberMBS divs", Str( (m4-m3) / 10000, "0.00")
		  End If
		  
		  
		  
		  
		  
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
