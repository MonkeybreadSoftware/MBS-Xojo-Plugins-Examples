#tag Window
Begin Window PDFPreview
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   924
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   294
   MinimizeButton  =   True
   MinWidth        =   346
   Placement       =   0
   Resizeable      =   True
   Title           =   "Vorschau"
   Visible         =   True
   Width           =   710
   Begin Canvas Out
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   872
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   176
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   534
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save PDF..."
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   596
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   884
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin PushButton PrintButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print PDF..."
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   490
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   884
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin PushButton CloseButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   384
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   884
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   926
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
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   4
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
      Width           =   177
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Thread Thread1
      DebugIdentifier =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Priority        =   5
      Scope           =   "0"
      StackSize       =   0
      TabPanelIndex   =   "0"
      ThreadID        =   0
      ThreadState     =   ""
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  list.DefaultRowHeight = StepSize
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub PrintMac(ShowDialog as Boolean)
		  #if TargetMacOS then
		    
		    
		    // Print PDF on Mac
		    
		    // requires MacOSXCG plugin
		    dim p as CGPDFDocumentMBS
		    
		    if PDFFile <> nil then
		      p = CGPDFDocumentMBS.CreateWithFile(PDFFile)
		    else
		      p = CGPDFDocumentMBS.CreateWithData(PDFData)
		    end if
		    
		    if p=nil then
		      MsgBox "Failed to read the PDF."
		      Return
		    end if
		    
		    dim g as Graphics
		    
		    if ShowDialog then
		      g = OpenPrinterDialog
		    else
		      g = OpenPrinter
		    end if
		    
		    if g<>Nil then
		      dim c as integer=p.PageCount
		      for i as integer=1 to c
		        g.DrawCGPDFDocumentMBS p, p.CropBox(i), i
		        
		        if i<c then
		          g.NextPage
		        end if
		        
		      next
		    end if
		    
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RenderPage(n as integer)
		  
		  dim page as DynaPDFPageMBS = pdf.GetPage(n)
		  dim mr as DynaPDFRectMBS = page.BBox(page.kpbMediaBox)
		  
		  dim w as integer = mr.Width
		  dim h as integer = abs(mr.Bottom-mr.top)
		  
		  
		  pic = pdf.RenderPagePicture(n, w, h, pdf.kpsFitBest)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPreview() As Boolean
		  pdf = new MyDynaPDFMBS
		  
		  if not pdf.CreateNewPDF(nil) then // create pdf in memory
		    Return false
		  end if
		  
		  dim e as integer 
		  if PDFFile = nil then
		    e = pdf.OpenImportBuffer(PDFData) // load from memory
		  else
		    e = pdf.OpenImportFile(PDFFile) // load from file
		  end if
		  
		  if e<>0 then // failed
		    Return false
		  end if
		  
		  call pdf.SetImportFlags(pdf.kifImportAsPage) // important! Import as page makes the rendering faster.
		  e = pdf.ImportPDFFile(1,1.0,1.0)
		  if e < 0 then 
		    Return false
		  end if
		  
		  RenderPage 1
		  
		  
		  
		  Thread1.run
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Run(file as FolderItem)
		  dim p as new PDFPreview
		  
		  p.PDFFile = file
		  if p.RenderPreview then
		    p.show
		  else
		    p.close
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub Run(PDFData as string)
		  dim p as new PDFPreview
		  
		  p.PDFData = PDFData
		  if p.RenderPreview then
		    p.show
		  else
		    p.close
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		NewPages() As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pages() As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As MyDynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PDFData As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PDFFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Pic As Picture
	#tag EndProperty


	#tag Constant, Name = StepSize, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Out
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Calculate scale factor
		  
		  dim faktor as Double = min( g.Height / Pic.Height, g.Width / Pic.Width)
		  
		  if faktor>1 then
		    faktor = 1
		  end if
		  
		  // Calculate new size
		  dim w as integer = Pic.Width * faktor
		  dim h as integer = Pic.Height * faktor
		  
		  dim x as integer = (g.Width  - w)/2
		  dim y as integer = (g.height - h)/2
		  
		  g.clearRect 0, 0, g.width, g.height
		  g.DrawPicture Pic, x, y, w, h, 0, 0, Pic.Width, Pic.Height
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetSaveFolderItem(FileTypes1.Pdf, "output.pdf")
		  
		  if f = nil then Return
		  
		  dim b as BinaryStream = BinaryStream.Create(f, true)
		  
		  b.Write PDFData
		  b.Close
		  
		  
		  Exception io as IOException
		    
		    MsgBox "Failed to write file."
		    
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrintButton
	#tag Event
		Sub Action()
		  #if TargetMachO then
		    
		    PrintMac true
		    
		  #else
		    MsgBox "Only for Mac in this demo."
		  #endif
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CloseButton
	#tag Event
		Sub Action()
		  close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events List
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if row < me.ListCount then
		    dim LineV as Variant = me.CellTag(row,0)
		    dim PageIndex as integer = me.RowTag(row)
		    
		    // selected?
		    
		    if me.ListIndex >= 0 then
		      dim SelectedPageIndex as integer = me.RowTag(me.ListIndex)
		      
		      if SelectedPageIndex = PageIndex then
		        g.ForeColor = HighlightColor
		        g.FillRect 0, 0, g.Width, g.Height
		      else
		        g.ForeColor = &cFFFFFF
		        g.FillRect 0, 0, g.Width, g.Height
		      end if
		    end if
		    
		    // draw page
		    if linev<>Nil then
		      dim p as Picture = pages(PageIndex)
		      if p<>Nil then
		        dim w as integer = p.Width
		        dim xx as integer = (g.Width -w)/2
		        
		        g.DrawPicture p, xx, 0, w, StepSize, 0, LineV.IntegerValue, w, StepSize
		        
		      end if
		    end if
		    
		    
		    
		    Return true
		  end if
		  
		  
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.ListIndex >= 0 then
		    dim v as Variant = me.RowTag(me.ListIndex)
		    
		    if v <> nil then
		      
		      RenderPage v+1
		      out.Invalidate
		    end if
		    
		    '#if RBVersion < 2013 then
		    
		    // fix redrawing issues
		    for i as integer = 0 to me.ListCount-1
		      me.InvalidateCell(i,0)
		    next
		    
		    '#else
		    'me.Invalidate
		    '#endif
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  while UBound(NewPages)>=0 
		    dim p as Picture = NewPages(0)
		    NewPages.Remove 0
		    pages.Append p
		    
		    dim v as Variant = UBound(pages)
		    List.AddRow ""
		    List.RowTag(List.LastIndex) = v
		    
		    dim h as integer = p.Height-1
		    for i as integer = 0 to h step StepSize
		      List.AddRow ""
		      List.RowTag(List.LastIndex) = v
		      List.CellTag(List.LastIndex,0) = i
		    next
		    
		    List.AddRow ""
		    List.RowTag(List.LastIndex) = v
		  wend
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Thread1
	#tag Event
		Sub Run()
		  // render page previews
		  
		  dim c as integer = pdf.GetPageCount
		  
		  for i as integer = 1 to c
		    
		    me.Sleep(10)
		    
		    dim page as DynaPDFPageMBS = pdf.GetPage(i)
		    dim mr as DynaPDFRectMBS = page.BBox(page.kpbMediaBox)
		    
		    dim w as integer = 148
		    dim h as integer = 198
		    
		    
		    dim pic as Picture = pdf.RenderPagePicture(i, w, h, pdf.kpsFitBest)
		    
		    newpages.Append pic
		    
		  next
		  
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
		Name="PDFData"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
