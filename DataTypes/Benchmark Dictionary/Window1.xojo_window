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
   MenuBar         =   355598335
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Benchmark"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   False
      ColumnWidths    =   "30%"
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
      Height          =   387
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Test	Create	Fill 1st Time	Fill 2nd Time	Read Value	Read Lookup"
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
		  BuildKeyArray
		  
		  TestXojoDictionaryIntegerToInteger
		  TestRealDictionaryIntegerToInteger
		  TestPlugDictionaryIntegerToInteger
		  
		  
		  TestXojoDictionaryStringToString
		  TestRealDictionaryStringToString
		  TestPlugDictionaryStringToString true
		  TestPlugDictionaryStringToString false
		  
		  TestXojoDictionaryTextToText
		  TestRealDictionaryTextToText
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BuildKeyArray()
		  dim u as integer = kQueryCount * 2 + 2
		  for i as integer = 0 to u
		    keys.Append str(i)
		  next
		  
		  #if RBVersion >= 2014 then
		    
		    dim keyt() as text = self.keyt
		    
		    for i as integer = 0 to u
		      keyt.Append i.ToText
		    next
		    
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function strm(d as Double) As string
		  Return str(d / 1000.0, "0.000")+"ms"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestPlugDictionaryIntegerToInteger()
		  #Pragma DisableBackgroundTasks
		  
		  dim d as IntegerToIntegerHashMapMBS
		  
		  dim m1 as Double = Microseconds
		  
		  // create
		  for i as integer = 1 to kCreateCount
		    d = new IntegerToIntegerHashMapMBS
		  next
		  
		  dim m2 as Double = Microseconds
		  
		  // fill
		  for i as integer = 1 to kFillCount
		    d.Value(i) = i+1
		  next
		  
		  dim m3 as Double = Microseconds
		  
		  // fill a full one
		  for i as integer = 1 to kFillCount
		    d.Value(i+1) = i-1
		  next
		  
		  dim m4 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as integer = d.Value(i)
		  next
		  
		  dim m5 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as integer = d.lookup(i*2, 0) // half will fail
		  next
		  
		  dim m6 as Double = Microseconds
		  
		  
		  List.AddRow "MBS Dictionary Integer to Integer", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestPlugDictionaryStringToString(CaseSensitive as Boolean)
		  #Pragma DisableBackgroundTasks
		  
		  dim d as StringToStringHashMapMBS
		  
		  dim m1 as Double = Microseconds
		  
		  // create
		  for i as integer = 1 to kCreateCount
		    d = new StringToStringHashMapMBS(CaseSensitive)
		  next
		  
		  dim m2 as Double = Microseconds
		  
		  // fill
		  for i as integer = 1 to kFillCount
		    d.Value(keys(i)) = keys(i+1)
		  next
		  
		  dim m3 as Double = Microseconds
		  
		  // fill a full one
		  for i as integer = 1 to kFillCount
		    d.Value(keys(i+1)) = keys(i-1)
		  next
		  
		  dim m4 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as string = d.Value(keys(i))
		  next
		  
		  dim m5 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as string = d.lookup(keys(i*2), "Hello") // half will fail
		  next
		  
		  dim m6 as Double = Microseconds
		  
		  dim postfix as string
		  if CaseSensitive then
		    postfix = " Case Sensitive"
		  end if
		  
		  List.AddRow "MBS Dictionary String to String"+postfix, strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestRealDictionaryIntegerToInteger()
		  #Pragma DisableBackgroundTasks
		  
		  dim d as Dictionary
		  
		  dim m1 as Double = Microseconds
		  
		  // create
		  for i as integer = 1 to kCreateCount
		    d = new Dictionary
		  next
		  
		  dim m2 as Double = Microseconds
		  
		  // fill
		  for i as integer = 1 to kFillCount
		    d.Value(i) = i+1
		  next
		  
		  dim m3 as Double = Microseconds
		  
		  // fill a full one
		  for i as integer = 1 to kFillCount
		    d.Value(i+1) = i-1
		  next
		  
		  dim m4 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as integer = d.Value(i)
		  next
		  
		  dim m5 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as integer = d.lookup(i*2, 0) // half will fail
		  next
		  
		  dim m6 as Double = Microseconds
		  
		  
		  List.AddRow "Old Dictionary Integer to Integer", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestRealDictionaryStringToString()
		  #Pragma DisableBackgroundTasks
		  
		  dim d as Dictionary
		  
		  dim m1 as Double = Microseconds
		  
		  // create
		  for i as integer = 1 to kCreateCount
		    d = new Dictionary
		  next
		  
		  dim m2 as Double = Microseconds
		  
		  // fill
		  for i as integer = 1 to kFillCount
		    d.Value(keys(i)) = keys(i+1)
		  next
		  
		  dim m3 as Double = Microseconds
		  
		  // fill a full one
		  for i as integer = 1 to kFillCount
		    d.Value(keys(i+1)) = keys(i-1)
		  next
		  
		  dim m4 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as string = d.Value(keys(i))
		  next
		  
		  dim m5 as Double = Microseconds
		  
		  // query
		  for i as integer = 1 to kQueryCount
		    dim n as string = d.lookup(keys(i*2), "Hello") // half will fail
		  next
		  
		  dim m6 as Double = Microseconds
		  
		  
		  List.AddRow "Old Dictionary String to String", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestRealDictionaryTextToText()
		  #if RBVersion >= 2014 then
		    dim keyt() as text = self.keyt
		    
		    
		    #Pragma DisableBackgroundTasks
		    
		    dim d as Dictionary
		    
		    dim m1 as Double = Microseconds
		    
		    // create
		    for i as integer = 1 to kCreateCount
		      d = new Dictionary
		    next
		    
		    dim m2 as Double = Microseconds
		    
		    // fill
		    for i as integer = 1 to kFillCount
		      d.Value(keyt(i)) = keyt(i+1)
		    next
		    
		    dim m3 as Double = Microseconds
		    
		    // fill a full one
		    for i as integer = 1 to kFillCount
		      d.Value(keyt(i+1)) = keyt(i-1)
		    next
		    
		    dim m4 as Double = Microseconds
		    
		    // query
		    for i as integer = 1 to kQueryCount
		      dim n as text = d.Value(keyt(i))
		    next
		    
		    dim m5 as Double = Microseconds
		    
		    // query
		    dim DefaultText as text = "Hello"
		    for i as integer = 1 to kQueryCount
		      dim n as text = d.lookup(keyt(i*2), defaultText) // half will fail
		    next
		    
		    dim m6 as Double = Microseconds
		    
		    List.AddRow "Old Dictionary Text to Text", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestXojoDictionaryIntegerToInteger()
		  
		  #if RBVersion >= 2014 then
		    
		    #Pragma DisableBackgroundTasks
		    
		    dim d as xojo.core.Dictionary
		    
		    dim m1 as Double = Microseconds
		    
		    // create
		    for i as integer = 1 to kCreateCount
		      d = new xojo.core.Dictionary
		    next
		    
		    dim m2 as Double = Microseconds
		    
		    // fill
		    for i as integer = 1 to kFillCount
		      d.Value(i) = i+1
		    next
		    
		    dim m3 as Double = Microseconds
		    
		    // fill a full one
		    for i as integer = 1 to kFillCount
		      d.Value(i+1) = i-1
		    next
		    
		    dim m4 as Double = Microseconds
		    
		    // query
		    for i as integer = 1 to kQueryCount
		      dim n as integer = d.Value(i)
		    next
		    
		    dim m5 as Double = Microseconds
		    
		    
		    // query
		    for i as integer = 1 to kQueryCount
		      dim n as integer = d.lookup(i*2, 0) // half will fail
		    next
		    
		    dim m6 as Double = Microseconds
		    
		    
		    List.AddRow "New Dictionary Integer to Integer", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestXojoDictionaryStringToString()
		  #if RBVersion >= 2014 then
		    
		    #Pragma DisableBackgroundTasks
		    
		    dim d as xojo.Core.Dictionary
		    
		    dim m1 as Double = Microseconds
		    
		    // create
		    for i as integer = 1 to kCreateCount
		      d = new xojo.Core.Dictionary
		    next
		    
		    dim m2 as Double = Microseconds
		    
		    // fill
		    for i as integer = 1 to kFillCount
		      d.Value(keys(i)) = keys(i+1)
		    next
		    
		    dim m3 as Double = Microseconds
		    
		    // fill a full one
		    for i as integer = 1 to kFillCount
		      d.Value(keys(i+1)) = keys(i-1)
		    next
		    
		    dim m4 as Double = Microseconds
		    
		    // query
		    for i as integer = 1 to kQueryCount
		      dim n as string = d.Value(keys(i))
		    next
		    
		    dim m5 as Double = Microseconds
		    
		    // query
		    for i as integer = 1 to kQueryCount
		      dim n as string = d.lookup(keys(i*2), "Hello") // half will fail
		    next
		    
		    dim m6 as Double = Microseconds
		    
		    
		    List.AddRow "New Dictionary String to String", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestXojoDictionaryTextToText()
		  #if RBVersion >= 2014 then
		    dim keyt() as text = self.keyt
		    
		    #Pragma DisableBackgroundTasks
		    
		    dim d as xojo.Core.Dictionary
		    
		    dim m1 as Double = Microseconds
		    
		    // create
		    for i as integer = 1 to kCreateCount
		      d = new xojo.Core.Dictionary
		    next
		    
		    dim m2 as Double = Microseconds
		    
		    // fill
		    for i as integer = 1 to kFillCount
		      d.Value(keyt(i)) = keyt(i+1)
		    next
		    
		    dim m3 as Double = Microseconds
		    
		    // fill a full one
		    for i as integer = 1 to kFillCount
		      d.Value(keyt(i+1)) = keyt(i-1)
		    next
		    
		    dim m4 as Double = Microseconds
		    
		    // query
		    for i as integer = 1 to kQueryCount
		      dim n as text = d.Value(keyt(i))
		    next
		    
		    dim m5 as Double = Microseconds
		    
		    // query
		    dim DefaultText as text = "Hello"
		    for i as integer = 1 to kQueryCount
		      dim n as text = d.lookup(keyt(i*2), DefaultText) // half will fail
		    next
		    
		    dim m6 as Double = Microseconds
		    
		    
		    List.AddRow "New Dictionary Text to Text", strm(m2-m1), strm(m3-m2), strm(m4-m3), strm(m5-m4), strm(m6-m5)
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Keys() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		keyt As Variant
	#tag EndProperty


	#tag Constant, Name = kCreateCount, Type = Double, Dynamic = False, Default = \"10000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFillCount, Type = Double, Dynamic = False, Default = \"10000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kQueryCount, Type = Double, Dynamic = False, Default = \"10000", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events List
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  if column > 0 then
		    dim v1 as Double = val(me.Cell(row1, column))
		    dim v2 as Double = val(me.Cell(row2, column))
		    
		    result = v1-v2
		    Return true
		    
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
