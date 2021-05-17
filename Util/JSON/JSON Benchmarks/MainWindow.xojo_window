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
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1394143231
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "JSON Benchmark"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "70%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   400
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "What	Time"
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
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
		  #Pragma DisableBackgroundTasks true
		  
		  Dim m1 As Double = Microseconds
		  Dim j1 As String = BuildJSON_MBS1
		  Dim m2 As Double = Microseconds
		  Dim j2 As String = BuildJSON_MBS2
		  Dim m3 As Double = Microseconds
		  Dim j3 As String = BuildJSON_Xojo1
		  Dim m4 As Double = Microseconds
		  Dim j4 As String = BuildJSON_Xojo2
		  Dim m5 As Double = Microseconds
		  
		  #If XojoVersion > 2020.0
		    Dim j5 As String = BuildJSON_Xojo3
		    Dim m6 As Double = Microseconds
		    Dim d5 As Double = m6-m5
		  #EndIf
		  
		  Dim d1 As Double = m2-m1
		  Dim d2 As Double = m3-m2
		  Dim d3 As Double = m4-m3
		  Dim d4 As Double = m5-m4
		  
		  
		  List.AddRow "JSONMBS.Convert", Format(d1 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = d1
		  List.AddRow "JSONMBS objects", Format(d2 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = d2
		  List.AddRow "JSONItem objects", Format(d3 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = d3
		  List.AddRow "Xojo.Data.GenerateJSON", Format(d4 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = d4
		  #If XojoVersion > 2020.0
		    List.AddRow "GenerateJSON", Format(d5 / 1000.0, "0.0")+"ms"
		    List.CellTag(List.LastIndex,1) = d5
		  #EndIf
		  
		  
		  
		  
		  Dim n1 As Double = Microseconds
		  ParseJSON_MBS1 j1
		  Dim n2 As Double = Microseconds
		  ParseJSON_MBS2 j2
		  Dim n3 As Double = Microseconds
		  ParseJSON_Xojo1 j3
		  Dim n4 As Double = Microseconds
		  ParseJSON_Xojo2 j4
		  Dim n5 As Double = Microseconds
		  #If XojoVersion > 2020.0
		    ParseJSON_Xojo3 j5
		    Dim n6 As Double = Microseconds
		  #EndIf
		  
		  Dim e1 As Double = n2-n1
		  Dim e2 As Double = n3-n2
		  Dim e3 As Double = n4-n3
		  Dim e4 As Double = n5-n4
		  #If XojoVersion > 2020.0
		    Dim e5 As Double = n6-n5
		  #EndIf
		  
		  List.AddRow "JSONMBS.Convert", Format(e1 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = e1
		  List.AddRow "JSONMBS objects", Format(e2 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = e2
		  List.AddRow "JSONItem objects", Format(e3 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = e3
		  List.AddRow "Xojo.Data.ParseJSON", Format(e4 / 1000.0, "0.0")+"ms"
		  List.CellTag(List.LastIndex,1) = e4
		  #If XojoVersion > 2020.0
		    List.AddRow "ParseJSON", Format(e5 / 1000.0, "0.0")+"ms"
		    List.CellTag(List.LastIndex,1) = e5
		  #EndIf
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BuildJSON_MBS1() As String
		  #Pragma DisableBackgroundTasks True
		  
		  Dim j() As Variant
		  
		  
		  For i As Integer = 1 To kCount
		    Dim c As New Dictionary
		    
		    c.Value("Key1") = "Hello World"
		    c.Value("Key2") = True
		    c.Value("Key3") = 123
		    c.Value("Key4") = 456.789
		    c.Value("Key5") = "6a12a4d5-e9e6-4568-afcc-34c70b24a668"
		    c.Value("Key6") = Nil
		    
		    j.Append c
		    
		  Next
		  
		  
		  Dim json As JSONMBS = JSONMBS.Convert(j)
		  Return json.toString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildJSON_MBS2() As String
		  #Pragma DisableBackgroundTasks True
		  
		  Dim j As JSONMBS = JSONMBS.NewArrayNode
		  
		  
		  For i As Integer = 1 To kCount
		    Dim c As JSONMBS = JSONMBS.NewObjectNode
		    
		    c.AddItemToObject "Key1", JSONMBS.NewStringNode("Hello World")
		    c.AddItemToObject "Key2", JSONMBS.NewBoolNode(True)
		    c.AddItemToObject "Key3", JSONMBS.NewInt64Node(123)
		    c.AddItemToObject "Key4", JSONMBS.NewNumberNode(456.789)
		    c.AddItemToObject "Key5", JSONMBS.NewStringNode("6a12a4d5-e9e6-4568-afcc-34c70b24a668")
		    c.AddItemToObject "Key6", JSONMBS.NewNullNode
		    
		    j.AddItemToArray c
		  Next
		  
		  
		  Return j.ToString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildJSON_Xojo1() As String
		  #Pragma DisableBackgroundTasks True
		  
		  Dim j As New JSONItem
		  
		  
		  For i As Integer = 1 To kCount
		    Dim c As New JSONItem
		    
		    c.Value("Key1") = "Hello World"
		    c.Value("Key2") = True
		    c.Value("Key3") = 123
		    c.Value("Key4") = 456.789
		    c.Value("Key5") = "6a12a4d5-e9e6-4568-afcc-34c70b24a668"
		    c.Value("Key6") = Nil
		    
		    j.Append c
		    
		  Next
		  
		  
		  Return j.ToString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildJSON_Xojo2() As String
		  #Pragma DisableBackgroundTasks True
		  
		  Dim j() As Variant
		  
		  
		  For i As Integer = 1 To kCount
		    Dim c As New Xojo.Core.Dictionary
		    
		    c.Value("Key1") = "Hello World"
		    c.Value("Key2") = True
		    c.Value("Key3") = 123
		    c.Value("Key4") = 456.789
		    c.Value("Key5") = "6a12a4d5-e9e6-4568-afcc-34c70b24a668"
		    c.Value("Key6") = Nil
		    
		    j.Append c
		    
		  Next
		  
		  
		  Return Xojo.Data.GenerateJSON(j)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildJSON_Xojo3() As String
		  #Pragma DisableBackgroundTasks True
		  
		  #If XojoVersion > 2020.0
		    
		    Dim j() As Variant
		    
		    
		    For i As Integer = 1 To kCount
		      Dim c As New Dictionary
		      
		      c.Value("Key1") = "Hello World"
		      c.Value("Key2") = True
		      c.Value("Key3") = 123
		      c.Value("Key4") = 456.789
		      c.Value("Key5") = "6a12a4d5-e9e6-4568-afcc-34c70b24a668"
		      c.Value("Key6") = Nil
		      
		      j.Append c
		      
		    Next
		    
		    
		    Return GenerateJSON(j, True)
		    
		  #EndIf
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseJSON_MBS1(json as string)
		  #Pragma DisableBackgroundTasks True
		  
		  Dim jj As New JSONMBS(json)
		  
		  Dim j() As Variant = jj.Convert
		  
		  If j.Ubound <> kCount-1 Then
		    Break
		  End If
		  
		  Dim found As Integer = 0
		  
		  For each c as Dictionary in j
		    
		    Dim s As String  = c.Value("Key1") 
		    Dim b As Boolean = c.Value("Key2") 
		    Dim n As Integer = c.Value("Key3") 
		    Dim d As Double  = c.Value("Key4")
		    Dim u As String  = c.Value("Key5") 
		    Dim v As Variant = c.Value("Key6") 
		    
		    found = found + 1
		    
		  Next
		  
		  If found <> kcount Then
		    Break
		  End If
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseJSON_MBS2(json as string)
		  #Pragma DisableBackgroundTasks True
		  
		  Dim jj As New JSONMBS(json)
		  
		  If jj.ArraySize <> kCount Then
		    Break
		  End If
		  
		  Dim found As Integer = 0
		  
		  Dim items() As JSONMBS = jj.ArrayItems
		  For Each c As JSONMBS In items
		    
		    Dim s As String  = c.Child("Key1").ValueString
		    Dim b As Boolean = c.Child("Key2").ValueBoolean
		    Dim n As Integer = c.Child("Key3").ValueInteger
		    Dim d As Double  = c.Child("Key4").ValueDouble
		    Dim u As String  = c.Child("Key5").ValueString
		    Dim v As Variant =(c.Child("Key6").type = JSONMBS.kTypeNull) // isNull
		    
		    found = found + 1
		    
		  Next
		  
		  If found <> kcount Then
		    Break
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseJSON_Xojo1(json as string)
		  #Pragma DisableBackgroundTasks True
		  
		  Dim jj As New JSONItem(json)
		  
		  
		  If jj.Count <> kCount Then
		    Break
		  End If
		  
		  Dim found As Integer = 0
		  
		  for i as integer = 0 to kCount-1
		    
		    Dim c As JSONItem = jj.Child(i)
		    
		    Dim s As String  = c.Value("Key1") 
		    Dim b As Boolean = c.Value("Key2") 
		    Dim n As Integer = c.Value("Key3") 
		    Dim d As Double  = c.Value("Key4")
		    Dim u As String  = c.Value("Key5") 
		    Dim v As Variant = c.Value("Key6") 
		    
		    found = found + 1
		    
		  Next
		  
		  If found <> kcount Then
		    Break
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseJSON_Xojo2(json as string)
		  #Pragma DisableBackgroundTasks True
		  
		  Dim jj As Auto = xojo.data.ParseJSON(json.ToText)
		  
		  dim a() as auto = jj
		  
		  If a.Ubound <> kCount-1 Then
		    Break
		  End If
		  
		  Dim found As Integer = 0
		  
		  For Each c As Xojo.Core.Dictionary In a
		    
		    Dim s As String  = c.Value("Key1") 
		    Dim b As Boolean = c.Value("Key2") 
		    Dim n As Integer = c.Value("Key3") 
		    Dim d As Double  = c.Value("Key4")
		    Dim u As String  = c.Value("Key5") 
		    Dim v As auto    = c.Value("Key6") 
		    
		    found = found + 1
		    
		  Next
		  
		  If found <> kcount Then
		    Break
		  End If
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseJSON_Xojo3(json as string)
		  #Pragma DisableBackgroundTasks True
		  
		  #If XojoVersion > 2020
		    
		    Dim jj As Variant = ParseJSON(json)
		    
		    Dim a() As Variant = jj
		    
		    If a.Ubound <> kCount-1 Then
		      Break
		    End If
		    
		    Dim found As Integer = 0
		    
		    For Each c As Dictionary In a
		      
		      Dim s As String  = c.Value("Key1") 
		      Dim b As Boolean = c.Value("Key2") 
		      Dim n As Integer = c.Value("Key3") 
		      Dim d As Double  = c.Value("Key4")
		      Dim u As String  = c.Value("Key5") 
		      Dim v As auto    = c.Value("Key6") 
		      
		      found = found + 1
		      
		    Next
		    
		    If found <> kcount Then
		      Break
		    End If
		    
		  #EndIf
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Prepare()
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kCount, Type = Double, Dynamic = False, Default = \"10000", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Open()
		  List.ColumnAlignment(1) = List.AlignRight
		End Sub
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column = 1 Then
		    Dim v1 As Double = Me.CellTag(row1, column)
		    Dim v2 As Double = Me.CellTag(row1, column)
		    
		    If v1 > v2 Then
		      result = 1
		    Elseif v1 = v2 Then
		      result = 0
		    Else
		      result = -1
		    End If
		    
		    Return True
		  End If
		  
		  
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
		Visible=true
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
#tag EndViewBehavior
