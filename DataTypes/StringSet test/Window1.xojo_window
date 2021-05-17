#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   520
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
   Title           =   "StringSet"
   Visible         =   True
   Width           =   889
   Begin ListBox list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   6
      ColumnsResizable=   False
      ColumnWidths    =   "40%"
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
      Height          =   486
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Task	Dictionary	OrderedSet (ci)	HashSet (ci)	OrderedSet (cs)	HashSet (cs)"
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
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   849
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'Dim d as New MessageDialog  //declare the MessageDialog object
		  'Dim b as MessageDialogButton //for handling the result
		  'd.icon=MessageDialog.GraphicCaution   //display warning icon
		  'd.ActionButton.Caption="Run"
		  'd.CancelButton.Visible= True     //show the Cancel button
		  'd.Message="Do you want to start this benchmark?"
		  'd.Explanation="It can take 10 minutes to complete."
		  '
		  'b=d.ShowModal     //display the dialog
		  'Select Case b //determine which button was pressed.
		  'Case d.ActionButton
		  '//user pressed Save
		  'Case d.CancelButton
		  '//user pressed Cancel
		  'Return
		  'End select
		  
		  testString
		  testVariant
		  testInteger
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub testInteger()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim set as new IntegerOrderedSetMBS
		  dim hashset as new IntegerHashSetMBS
		  dim i as integer
		  dim keys(max) as integer
		  dim s as Integer
		  dim k as integer
		  dim tset,tdic,thashset as integer
		  
		  me.title="Working on Integers"
		  me.show
		  
		  list.AddRow ""
		  list.addrow "keys are integer"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    keys(i)=i
		  next
		  
		  keys.Shuffle
		  
		  // fill
		  
		  tset=ticks
		  for i=0 to max
		    set.insert(keys(i))
		  next
		  tset=ticks-tset
		  
		  thashset=ticks
		  for i=0 to max
		    hashset.insert(keys(i))
		  next
		  thashset=ticks-thashset
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=True
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tset/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashset/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tset=ticks
		  for i=0 to max
		    call set.lookup(keys(i))
		  next
		  tset=ticks-tset
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashset=ticks
		  for i=0 to max
		    call hashset.lookup(keys(i))
		  next
		  thashset=ticks-thashset
		  
		  list.addrow "using haskey/lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tset/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashset/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tset=ticks
		  for i=0 to max
		    k=set.Key(i)
		  next
		  tset=ticks-tset
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashset=ticks
		  for i=0 to max
		    k=hashset.Key(i)
		  next
		  thashset=ticks-thashset
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tset/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashset/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim temp(-1) as string
		  dim tempv(-1) as Variant
		  dim tempi(-1) as integer
		  
		  tset=ticks
		  for i=0 to maxx
		    tempi=set.Keys
		  next
		  tset=ticks-tset
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashset=ticks
		  for i=0 to maxx
		    tempi=hashset.Keys
		  next
		  thashset=ticks-thashset
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tset/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashset/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashset.BinCount: "+str(hashset.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testString()
		  const max=100000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim seti as new StringOrderedSetMBS(false) // case insensitive
		  dim sets as new StringOrderedSetMBS(true)  // case sensitive
		  dim hashseti as new StringHashSetMBS(false)// case insensitive
		  dim hashsets as new StringHashSetMBS(true) // case sensitive
		  dim i as integer
		  dim keys(max) as string
		  dim s as string
		  dim tsets,tseti,tdic,thashsets,thashseti as integer
		  
		  me.title="Working on Strings"
		  me.show
		  
		  list.addrow "keys are strings"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    keys(i)=s
		  next
		  
		  keys.Shuffle
		  
		  // fill
		  
		  tsets=ticks
		  for i=0 to max
		    sets.insert(keys(i))
		  next
		  tsets=ticks-tsets
		  
		  thashsets=ticks
		  for i=0 to max
		    hashsets.insert(keys(i))
		  next
		  thashsets=ticks-thashsets
		  
		  tseti=ticks
		  for i=0 to max
		    seti.insert(keys(i))
		  next
		  tseti=ticks-tseti
		  
		  thashseti=ticks
		  for i=0 to max
		    hashseti.insert(keys(i))
		  next
		  thashseti=ticks-thashseti
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=nil
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  tseti=ticks
		  for i=0 to max
		    call seti.lookup(keys(i))
		  next
		  tseti=ticks-tseti
		  
		  thashseti=ticks
		  for i=0 to max
		    call hashseti.lookup(keys(i))
		  next
		  thashseti=ticks-thashseti
		  
		  tsets=ticks
		  for i=0 to max
		    call sets.lookup(keys(i))
		  next
		  tsets=ticks-tsets
		  
		  thashsets=ticks
		  for i=0 to max
		    call hashsets.lookup(keys(i))
		  next
		  thashsets=ticks-thashsets
		  
		  list.addrow "using haskey/lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  tsets=ticks
		  for i=0 to max
		    s=sets.Key(i)
		  next
		  tsets=ticks-tsets
		  
		  thashseti=ticks
		  for i=0 to max
		    s=hashseti.Key(i)
		  next
		  thashseti=ticks-thashseti
		  
		  tseti=ticks
		  for i=0 to max
		    s=seti.Key(i)
		  next
		  tseti=ticks-tseti
		  
		  thashsets=ticks
		  for i=0 to max
		    s=hashsets.Key(i)
		  next
		  thashsets=ticks-thashsets
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim temp(-1) as string
		  dim tempv(-1) as Variant
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  tsets=ticks
		  for i=0 to maxx
		    temp=sets.Keys
		  next
		  tsets=ticks-tsets
		  
		  thashsets=ticks
		  for i=0 to maxx
		    temp=hashsets.Keys
		  next
		  thashsets=ticks-thashsets
		  
		  tseti=ticks
		  for i=0 to maxx
		    temp=seti.Keys
		  next
		  tseti=ticks-tseti
		  
		  thashseti=ticks
		  for i=0 to maxx
		    temp=hashseti.Keys
		  next
		  thashseti=ticks-thashseti
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  
		  System.DebugLog "hashsets.BinCount: "+str(hashsets.BinCount)
		  System.DebugLog "hashseti.BinCount: "+str(hashseti.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testVariant()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim sets as new VariantOrderedSetMBS(true)
		  dim seti as new VariantOrderedSetMBS(False)
		  dim hashsets as new VariantHashSetMBS(true)
		  dim hashseti as new VariantHashSetMBS(False)
		  dim i as integer
		  dim keys(max) as Variant
		  dim s as Variant
		  dim tsets,tseti, tdic, thashsets, thashseti as integer
		  
		  me.title="Working on Variant"
		  me.show
		  list.AddRow ""
		  list.addrow "keys are variant"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    keys(i)=i
		  next
		  
		  keys.Shuffle
		  
		  // fill
		  
		  tseti=ticks
		  for i=0 to max
		    seti.insert(keys(i))
		  next
		  tseti=ticks-tseti
		  
		  thashsets=ticks
		  for i=0 to max
		    hashsets.insert(keys(i))
		  next
		  thashsets=ticks-thashsets
		  
		  tsets=ticks
		  for i=0 to max
		    sets.insert(keys(i))
		  next
		  tsets=ticks-tsets
		  
		  thashseti=ticks
		  for i=0 to max
		    hashseti.insert(keys(i))
		  next
		  thashseti=ticks-thashseti
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=True
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  // haskey/lookup
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  tseti=ticks
		  for i=0 to max
		    call seti.lookup(keys(i))
		  next
		  tseti=ticks-tseti
		  
		  thashseti=ticks
		  for i=0 to max
		    call hashseti.lookup(keys(i))
		  next
		  thashseti=ticks-thashseti
		  
		  tsets=ticks
		  for i=0 to max
		    call sets.lookup(keys(i))
		  next
		  tsets=ticks-tsets
		  
		  thashsets=ticks
		  for i=0 to max
		    call hashsets.lookup(keys(i))
		  next
		  thashsets=ticks-thashsets
		  
		  list.addrow "using haskey/lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  tsets=ticks
		  for i=0 to max
		    s=sets.Key(i)
		  next
		  tsets=ticks-tsets
		  
		  thashsets=ticks
		  for i=0 to max
		    s=hashsets.Key(i)
		  next
		  thashsets=ticks-thashsets
		  
		  tseti=ticks
		  for i=0 to max
		    s=seti.Key(i)
		  next
		  tseti=ticks-tseti
		  
		  thashseti=ticks
		  for i=0 to max
		    s=hashseti.Key(i)
		  next
		  thashseti=ticks-thashseti
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim temps(-1) as string
		  dim tempv(-1) as variant
		  
		  tseti=ticks
		  for i=0 to maxx
		    tempv=seti.Keys
		  next
		  tseti=ticks-tseti
		  
		  tsets=ticks
		  for i=0 to maxx
		    tempv=sets.Keys
		  next
		  tsets=ticks-tsets
		  
		  thashsets=ticks
		  for i=0 to maxx
		    tempv=hashsets.Keys
		  next
		  thashsets=ticks-thashsets
		  
		  thashseti=ticks
		  for i=0 to maxx
		    tempv=hashseti.Keys
		  next
		  thashseti=ticks-thashseti
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashseti/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,4)=format(tsets/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,5)=format(thashsets/60.0,"0.0")+"s"
		  
		  
		  System.DebugLog "hashsets.BinCount: "+str(hashsets.BinCount)
		  System.DebugLog "hashseti.BinCount: "+str(hashseti.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod


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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
		InitialValue="False"
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
