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
   Height          =   474
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
   Width           =   588
   Begin ListBox list
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
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
      Height          =   440
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Task	Dictionary	OrderedMap	HashMap"
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
      Width           =   548
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim d as New MessageDialog  //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  d.icon=MessageDialog.GraphicCaution   //display warning icon
		  d.ActionButton.Caption="Run"
		  d.CancelButton.Visible= True     //show the Cancel button
		  d.Message="Do you want to start this benchmark?"
		  d.Explanation="It can take 10 minutes to complete."
		  
		  b=d.ShowModal     //display the dialog
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    //user pressed Save
		  Case d.CancelButton
		    //user pressed Cancel
		    Return
		  End select
		  
		  testStringToString
		  testStringToVariant
		  testVariantToVariant
		  testVariantToVariant2
		  testIntegerToString
		  testIntegerToVariant
		  testIntegerToInteger
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub testIntegerToInteger()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new IntegerToIntegerOrderedMapMBS
		  dim hashmap as new IntegerToIntegerHashMapMBS
		  dim i as integer
		  dim values(max) as Integer
		  dim keys(max) as integer
		  dim s as Integer
		  dim k as integer
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on IntegerToInteger"
		  me.show
		  
		  list.AddRow ""
		  list.addrow "values are integer"
		  list.addrow "keys are integer"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    values(i)=i
		    keys(i)=i
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),-1)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),-1)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),-1)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		    s=map.Value(k)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    k=dic.Key(i)
		    s=dic.Value(k)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		    s=hashmap.Value(k)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    k=dic.Key(i)
		    s=dic.Value(k)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim tempv(-1) as Variant
		  dim tempi(-1) as integer
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempi=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempi=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempi=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempi=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testIntegerToString()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new IntegerToStringOrderedMapMBS
		  dim hashmap as new IntegerToStringHashMapMBS
		  dim i as integer
		  dim values(max) as string
		  dim keys(max) as integer
		  dim s as string
		  dim k as integer
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on IntegerToString"
		  me.show
		  
		  list.AddRow ""
		  list.addrow "values are strings"
		  list.addrow "keys are integer"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    values(i)=s
		    keys(i)=i
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),"default")
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),"default")
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),"default")
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		    s=map.Value(k)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    k=dic.Key(i)
		    s=dic.Value(k)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		    s=hashmap.Value(k)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    k=dic.Key(i)
		    s=dic.Value(k)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim temp(-1) as string
		  dim tempv(-1) as Variant
		  dim tempi(-1) as integer
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempi=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempi=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    temp=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    temp=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testIntegerToVariant()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new IntegerToVariantOrderedMapMBS
		  dim hashmap as new IntegerToVariantHashMapMBS
		  dim i as integer
		  dim values(max) as string
		  dim keys(max) as integer
		  dim s as string
		  dim k as integer
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on IntegerToVariant"
		  me.show
		  
		  list.AddRow ""
		  list.addrow "values are variant"
		  list.addrow "keys are integer"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    values(i)=s
		    keys(i)=i
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),"default")
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),"default")
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),"default")
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		    s=map.Value(k)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    k=dic.Key(i)
		    s=dic.Value(k)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		    s=hashmap.Value(k)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    k=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    k=dic.Key(i)
		    s=dic.Value(k)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    k=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim tempv(-1) as Variant
		  dim tempi(-1) as integer
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempi=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempi=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempv=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempv=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testStringToString()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new StringToStringOrderedMapMBS
		  dim hashmap as new StringToStringHashMapMBS
		  dim i as integer
		  dim values(max) as string
		  dim keys(max) as string
		  dim s as string
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on StringToString"
		  me.show
		  
		  list.addrow "values are strings"
		  list.addrow "keys are strings"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    values(i)=s
		    keys(i)=s
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),"default")
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),"default")
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),"default")
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.Value(s)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.Value(s)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim temp(-1) as string
		  dim tempv(-1) as Variant
		  
		  tmap=ticks
		  for i=0 to maxx
		    temp=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    temp=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    temp=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    temp=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testStringToVariant()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new StringToVariantOrderedMapMBS
		  dim hashmap as new StringToVariantHashMapMBS
		  dim i as integer
		  dim values(max) as string
		  dim keys(max) as string
		  dim s as string
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on StringToVariant"
		  me.show
		  
		  list.AddRow ""
		  list.addrow "values are variants"
		  list.addrow "keys are strings"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    values(i)=s
		    keys(i)=s
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),"default")
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),"default")
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),"default")
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.Value(s)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.Value(s)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim temps(-1) as string
		  dim tempv(-1) as variant
		  
		  tmap=ticks
		  for i=0 to maxx
		    temps=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    temps=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempv=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempv=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testVariantToVariant()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new VariantToVariantOrderedMapMBS // very slow because of variant comparison
		  dim hashmap as new VariantToVariantHashMapMBS
		  dim i as integer
		  dim values(max) as string
		  dim keys(max) as string
		  dim s as string
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on VariantToVariant"
		  me.show
		  list.AddRow ""
		  list.addrow "values are variants"
		  list.addrow "keys are variants with strings"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    values(i)=s
		    keys(i)=s
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),"default")
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),"default")
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),"default")
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.Value(s)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.Value(s)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim tempv(-1) as variant
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempv=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempv=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempv=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempv=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
		  me.title="Finished."
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub testVariantToVariant2()
		  const max=1000000
		  
		  #pragma DisableBackgroundTasks
		  #pragma DisableAutoWaitCursor
		  
		  dim dic as new Dictionary
		  dim map as new VariantToVariantOrderedMapMBS // very slow because of variant comparison
		  dim hashmap as new VariantToVariantHashMapMBS
		  dim i as integer
		  dim values(max) as string
		  dim keys(max) as Variant
		  dim s as Variant
		  dim tmap,tdic,thashmap as integer
		  
		  me.title="Working on VariantToVariant with integers"
		  me.show
		  list.AddRow ""
		  list.addrow "values are variants"
		  list.addrow "keys are variants with integers"
		  List.AddRow "max="+str(max)
		  
		  // prepare test data
		  for i=0 to max
		    s=str(i)
		    values(i)=s
		    keys(i)=i
		  next
		  
		  values.Shuffle
		  keys.Shuffle
		  
		  // fill
		  
		  tmap=ticks
		  for i=0 to max
		    map.value(keys(i))=values(i)
		  next
		  tmap=ticks-tmap
		  
		  thashmap=ticks
		  for i=0 to max
		    hashmap.value(keys(i))=values(i)
		  next
		  thashmap=ticks-thashmap
		  
		  tdic=ticks
		  for i=0 to max
		    dic.value(keys(i))=values(i)
		  next
		  tdic=ticks-tdic
		  
		  list.addrow "add values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // getvalue
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.value(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.value(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.value(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // haskey
		  
		  tmap=ticks
		  for i=0 to max
		    call map.haskey(keys(i))
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.haskey(keys(i))
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.haskey(keys(i))
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using haskey"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // lookup
		  
		  tmap=ticks
		  for i=0 to max
		    call map.lookup(keys(i),"default")
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    call dic.lookup(keys(i),"default")
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    call hashmap.lookup(keys(i),"default")
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "using lookup"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get keys and values
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.Value(s)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.Value(s)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get values at index
		  
		  tmap=ticks
		  for i=0 to max
		    s=map.Key(i)
		    s=map.ValueAtIndex(i)
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to max
		    s=dic.Key(i)
		    s=dic.Value(s)
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to max
		    s=hashmap.Key(i)
		    s=hashmap.ValueAtIndex(i)
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get values at index"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all keys
		  
		  const maxx=100
		  
		  dim tempv(-1) as variant
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempv=map.Keys
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.Keys
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempv=hashmap.Keys
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all keys"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  // get all values
		  
		  tmap=ticks
		  for i=0 to maxx
		    tempv=map.values
		  next
		  tmap=ticks-tmap
		  
		  tdic=ticks
		  for i=0 to maxx
		    tempv=dic.values
		  next
		  tdic=ticks-tdic
		  
		  thashmap=ticks
		  for i=0 to maxx
		    tempv=hashmap.values
		  next
		  thashmap=ticks-thashmap
		  
		  list.addrow "get all values"
		  list.cell(list.lastIndex,1)=format(tdic/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,2)=format(tmap/60.0,"0.0")+"s"
		  list.cell(list.lastIndex,3)=format(thashmap/60.0,"0.0")+"s"
		  
		  System.DebugLog "hashmap.BinCount: "+str(hashmap.BinCount)
		  
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
