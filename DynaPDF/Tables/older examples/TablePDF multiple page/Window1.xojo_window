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
   Title           =   "Untitled"
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
      Height          =   266
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "ID	Name	Price"
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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim pdf as new MyDynaPDFMBS
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  FillList
		  
		  dim outfile as FolderItem = SpecialFolder.Desktop.Child("TablePDF multiple page.pdf")
		  
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
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawListbox(pdf as dynapdfmbs, list as listbox, x as integer, y as integer, width as integer)
		  dim columnwidths(-1) as integer
		  dim height as integer = list.ListCount*21+22
		  dim rowsperpage as integer= (pdf.GetPageHeight-y)/21-5 // 5 rows on bottom
		  
		  redim columnwidths(list.ColumnCount)
		  
		  dim cw(-1) as string = split(List.ColumnWidths,",")
		  dim remainingspace as integer = width-List.ColumnCount-1
		  dim starcount as integer
		  
		  for each s as string in cw
		    if instr(s,"*")>0 then
		      starcount=starcount+val(s)
		    end if
		  next
		  
		  for i as integer=0 to UBound(Cw)
		    dim s as string = cw(i)
		    dim columnwidth as integer
		    
		    if instr(s,"%")>0 then
		      columnwidth=val(s)*(width-2.0)/100.0
		    elseif instr(s,"*")>0 then
		      columnwidth=val(s)*remainingspace/starcount
		    else
		      columnwidth=val(s)
		    end if
		    columnwidths(i)=columnwidth
		    remainingspace=remainingspace-columnwidth
		  next
		  
		  dim rowcount as integer
		  dim rowstodraw as integer
		  dim currentrow as integer=0
		  
		  dim font as string = list.TextFont
		  if font="System" then font="Times"
		  
		  dim size as integer = list.TextSize
		  if size=0 then size=12
		  
		  while currentrow<list.ListCount-1
		    
		    rowcount=list.ListCount-currentrow-1
		    if rowcount>rowsperpage then
		      rowcount=rowsperpage
		    end if
		    
		    DrawListboxFrame pdf, x, y, width, rowcount, list.ColumnCount, columnwidths
		    
		    call pdf.setfont font, pdf.kfsBold, size, true, pdf.kcp1252
		    
		    dim ex as integer
		    
		    ex=x+1
		    for cx as integer=0 to list.ColumnCount-1
		      if list.ColumnAlignment(cx)=list.AlignCenter then
		        call pdf.SetTextRect ex,y+2,columnwidths(cx),21
		        call pdf.WriteFText pdf.ktaCenter, list.Heading(cx)
		      elseif list.ColumnAlignment(cx)=list.AlignRight then
		        call pdf.SetTextRect ex,y+2,columnwidths(cx)-3,21
		        call pdf.WriteFText pdf.ktaRight, list.Heading(cx)
		      else
		        call pdf.SetTextRect ex+3,y+2,columnwidths(cx),21
		        call pdf.WriteFText pdf.ktaLeft, list.Heading(cx)
		      end if
		      
		      ex=ex+columnwidths(cx)+1
		    next
		    
		    call pdf.SetFont font,pdf.kfsNone, size, true, pdf.kcp1252
		    
		    for cy as integer=0 to rowcount-1
		      currentrow=currentrow+1
		      ex=x+1
		      for cx as integer=0 to list.ColumnCount-1
		        if list.ColumnAlignment(cx)=list.AlignCenter then
		          call pdf.SetTextRect ex,y+23+cy*21,columnwidths(cx),21
		          call pdf.WriteFText pdf.ktaCenter, list.Cell(currentrow,cx)
		        elseif list.ColumnAlignment(cx)=list.AlignRight then
		          call pdf.SetTextRect ex, y+23+cy*21, columnwidths(cx)-3,21
		          call pdf.WriteFText pdf.ktaRight, list.Cell(currentrow,cx)
		        else
		          call pdf.SetTextRect ex+3,y+23+cy*21, columnwidths(cx),21
		          call pdf.WriteFText pdf.ktaLeft, list.Cell(currentrow,cx)
		        end if
		        ex=ex+columnwidths(cx)+1
		      next
		    next
		    
		    if currentrow<list.ListCount-1 then
		      call pdf.endpage
		      call pdf.Append
		    end if
		    
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawListboxFrame(pdf as dynapdfmbs, x as integer, y as integer, width as integer, rowcount as integer, columncount as integer, columnwidths() as integer)
		  dim height as integer = 22+21*rowcount
		  
		  call pdf.SetFillColor &hBBBBBB
		  call pdf.SetStrokeColor 0
		  call pdf.Rectangle x,y,width-1, 21, pdf.kfmFill
		  call pdf.Rectangle x,y,width-1,height,pdf.kfmStroke
		  
		  call pdf.SetColors 0
		  
		  for i as integer=1 to rowcount
		    call pdf.Moveto x,y+21*i
		    call pdf.LineTo x+width-1,y+21*i
		  next
		  
		  dim ex as integer=x+columnwidths(0)
		  for i as integer=1 to columncount-1
		    call pdf.MoveTo ex,y
		    call pdf.LineTo ex,y+height
		    ex=ex+columnwidths(i)+1
		  next
		  
		  call pdf.StrokePath
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillList()
		  
		  dim i as integer
		  dim a,b,c as string
		  
		  for i=1 to 100
		    
		    a=str(i)
		    b="Item"
		    c="$ "+Format(rnd*100000,"0")
		    
		    listbox1.AddRow a
		    listbox1.Cell(listbox1.LastIndex,1)=b
		    listbox1.Cell(listbox1.LastIndex,2)=c
		    
		  next
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events Listbox1
	#tag Event
		Sub Open()
		  
		  me.ColumnAlignment(0)=me.AlignCenter
		  me.ColumnAlignment(2)=me.AlignRight
		  
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
