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
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim pdf as new MyDynapdfMBS
		  
		  pdf.SetLicenseKey "Starter" // For this example you can use a Starter, Lite, Pro or Enterprise License
		  
		  dim outfile as FolderItem = SpecialFolder.Desktop.Child("TablePDF single page.pdf")
		  
		  call pdf.CreateNewPDF(nil) // the output file is created later
		  
		  call pdf.SetDocInfo pdf.kdiCreator, "Xojo test application"
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
		  
		  redim columnwidths(list.ColumnCount)
		  
		  call pdf.SetFillColor &hBBBBBB
		  call pdf.SetStrokeColor 0
		  call pdf.Rectangle x,y,width-1, 21, pdf.kfmFill
		  call pdf.Rectangle x,y,width-1,height,pdf.kfmStroke
		   
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
		  
		  call pdf.SetColors 0
		  
		  for i as integer=1 to list.ListCount
		    call pdf.Moveto x,y+21*i
		    call pdf.LineTo x+width-1,y+21*i
		  next
		  
		  dim ex as integer=x+columnwidths(0)
		  for i as integer=1 to list.ColumnCount-1
		    call pdf.MoveTo ex,y
		    call pdf.LineTo ex,y+height
		    ex=ex+columnwidths(i)+1
		  next
		  
		  call pdf.StrokePath
		  
		  dim font as string = list.TextFont
		  if font="System" then font="Times"
		  
		  dim size as integer = list.TextSize
		  if size=0 then size=12
		  
		  call pdf.SetFont font,pdf.kfsNone, size, true, pdf.kcp1252
		  
		  for cy as integer=0 to list.ListCount-1
		    ex=x+1
		    for cx as integer=0 to list.ColumnCount-1
		      if list.ColumnAlignment(cx)=list.AlignCenter then
		        call pdf.SetTextRect ex,y+23+cy*21,columnwidths(cx),21
		        call pdf.WriteFText pdf.ktaCenter, list.Cell(cy,cx)
		      elseif list.ColumnAlignment(cx)=list.AlignRight then
		        call pdf.SetTextRect ex, y+23+cy*21, columnwidths(cx)-3,21
		        call pdf.WriteFText pdf.ktaRight, list.Cell(cy,cx)
		      else
		        call pdf.SetTextRect ex+3,y+23+cy*21, columnwidths(cx),21
		        call pdf.WriteFText pdf.ktaLeft, list.Cell(cy,cx)
		      end if
		      ex=ex+columnwidths(cx)+1
		    next
		  next
		  
		  call pdf.setfont font, pdf.kfsBold, size, true, pdf.kcp1252
		  
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
