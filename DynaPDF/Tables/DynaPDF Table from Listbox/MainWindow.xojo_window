#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   332690377
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "List"
   Visible         =   True
   Width           =   300
   Begin Listbox Listbox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "40,60%"
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
      Height          =   232
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "ID	Name	Price\r1	Apple	$ 1\r2	DVD	$ 10\r3	Car	$ 20000"
      Italic          =   False
      Left            =   20
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   260
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Try again with 1000 rows"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   258
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   195
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  run
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawListbox(pdf as dynapdfmbs, list as listbox, x as integer, y as integer, width as integer)
		  dim table as DynaPDFTableMBS
		  dim columnwidths(-1) as integer
		  dim rowNum as integer
		  dim PageWidth as integer = pdf.GetPageWidth-72-72 // width - left and right
		  
		  // scale down to page width if listbox on GUI is wider
		  dim Factor as Double = PageWidth / list.Width
		  
		  table = pdf.CreateTable(list.ListCount, list.ColumnCount, PageWidth, 8.0)
		  
		  call table.SetFont(AllRows, AllColumns, "Arial", pdf.kfsRegular, true, pdf.kcp1252)
		  
		  redim columnwidths(list.ColumnCount)
		  
		  dim cw(-1) as string = split(List.ColumnWidths,",")
		  dim remainingspace as integer = PageWidth
		  dim starcount as integer
		  
		  for each s as string in cw
		    s = s.trim
		    if s = "*" then
		      starcount = starcount + 1
		    elseif instr(s,"*")>0 then
		      starcount=starcount+val(s)
		    end if
		  next
		  
		  for i as integer=0 to UBound(Cw)
		    dim s as string = cw(i).trim
		    dim columnwidth as integer
		    
		    if instr(s,"%")>0 then
		      columnwidth=val(s)*(PageWidth)/100.0
		    elseif s = "*" then
		      columnwidth = remainingspace/starcount
		    elseif instr(s,"*")>0 then
		      columnwidth=val(s)*remainingspace/starcount
		    else
		      columnwidth=val(s)*Factor
		    end if
		    columnwidths(i)=columnwidth
		    remainingspace=remainingspace-columnwidth
		  next
		  
		  
		  dim font as string = list.TextFont
		  if font="System" then font="Times"
		  
		  dim size as integer = list.TextSize
		  if size <= 0 then size = 12
		  
		  call table.SetFont(AllRows, AllColumns, font, pdf.kfsRegular, true, pdf.kcp1252)
		  
		  rowNum = table.AddRow
		  for cx as integer=0 to list.ColumnCount-1
		    call table.SetColWidth(cx, columnwidths(cx), false)
		    
		    if columnwidths(cx) = 0 then
		      // ignore
		    elseif list.ColumnAlignment(cx)=list.AlignCenter then
		      call table.SetCellText(rowNum, cx, pdf.ktaCenter, table.kcoCenter, list.Heading(cx))
		    elseif list.ColumnAlignment(cx)=list.AlignRight then
		      call table.SetCellText(rowNum, cx, pdf.ktaRight, table.kcoCenter, list.Heading(cx))
		    else
		      call table.SetCellText(rowNum, cx, pdf.ktaLeft, table.kcoCenter, list.Heading(cx))
		    end if
		  next
		  
		  call table.SetFont(rowNum, AllColumns, font, pdf.kfsBold, true, pdf.kcp1252)
		  call table.SetFlags(rowNum, AllColumns, table.ktfHeaderRow)
		  call table.SetBorderWidth(rowNum, AllColumns, 0.5, 0.5, 0.5, 0.5)
		  
		  
		  for cy as integer=0 to list.ListCount-1
		    rowNum = table.AddRow
		    
		    for cx as integer=0 to list.ColumnCount-1
		      if columnwidths(cx) = 0 then
		        // ignore
		      elseif list.ColumnAlignment(cx)=list.AlignCenter then
		        call table.SetCellText(rowNum, cx, pdf.ktaCenter, table.kcoCenter, list.Cell(cy,cx) )
		      elseif list.ColumnAlignment(cx)=list.AlignRight then
		        call table.SetCellText(rowNum, cx, pdf.ktaRight, table.kcoCenter, list.Cell(cy,cx) )
		      else
		        call table.SetCellText(rowNum, cx, pdf.ktaLeft, table.kcoCenter, list.Cell(cy,cx) )
		      end if
		    next
		  next
		  
		  call table.SetCellPadding(AllRows, AllColumns, 0.0, 0.0, 2.0, 2.0)
		  call table.SetCellSpacing(AllRows, AllColumns, 0.0, 0.0, 0.0, 2.0)
		  
		  
		  dim PageHeight as Double = pdf.GetPageHeight - 72 - 72
		  
		  do
		    call table.DrawTable( 55.0, 72.0, PageHeight) 
		    
		    // draw footer
		    if table.HaveMore then
		      call pdf.EndPage
		      call pdf.Append
		      
		    else 
		      // done
		      exit
		    end if
		  loop
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim outfile as FolderItem = SpecialFolder.Desktop.Child("Table.pdf")
		  
		  call pdf.CreateNewPDF(nil) // the output file is created later
		  
		  call pdf.SetDocInfo pdf.kdiCreator, "Realbasic test application"
		  call pdf.SetDocInfo pdf.kdiTitle, "My first table output"
		  
		  call pdf.SetPageCoords pdf.kpcTopDown
		  call pdf.Append
		  
		  DrawListbox pdf, Listbox1, 50, 50, pdf.GetPageWidth-100
		  
		  call pdf.EndPage
		  
		  // no error?
		  if pdf.HaveOpenDoc then
		    if not pdf.OpenOutputFile(outfile) then
		      MsgBox "Can't write file to "+outfile.NativePath
		      quit
		    end if
		  end if
		  
		  call pdf.CloseFile
		  
		  outfile.Launch
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = AllColumns, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AllRows, Type = Double, Dynamic = False, Default = \"-1", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub Open()
		  me.ColumnAlignment(0)=me.AlignCenter
		  me.ColumnAlignment(2)=me.AlignRight
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BevelButton1
	#tag Event
		Sub Action()
		  for i as integer = 4 to 1000
		    
		    Listbox1.AddRow str(i), "Test line", "$5"
		    
		  next
		  
		  
		  
		  run
		  
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
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
#tag EndViewBehavior
