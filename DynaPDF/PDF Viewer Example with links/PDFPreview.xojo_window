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
   Height          =   650
   ImplicitInstance=   False
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
   Width           =   752
   Begin Canvas Out
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   "False"
      Height          =   538
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   199
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   60
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   False
      Width           =   544
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save PDF..."
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   638
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
      Top             =   610
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
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   532
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
      Top             =   610
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin PushButton MyCloseButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Close"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   426
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
      Top             =   610
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
      Height          =   538
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   10
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
      Top             =   60
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   167
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
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
   Begin PushButton RotateButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Rotate"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   320
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   610
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin PushButton ZoomButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Zoom"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   214
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   610
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin ProgressWheel Wheel
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   764
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   201
      Transparent     =   True
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select case asc(key)
		  case 30
		    MovePrev
		    Return true
		  case 31
		    MoveNext
		    Return true
		  end Select
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  list.DefaultRowHeight = StepSize
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  move 0,0
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  move 0,0
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
			close
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub CheckFileFormat()
		  
		  if PDFData <> "" then
		    
		    if leftb(PDFData,3) = "PNG" then
		      isBild = true
		      Return
		    end if
		    
		    if leftb(PDFData,4) = "%PDF" then
		      isPDF = true
		      Return
		    end if
		    
		    Return
		  end if
		  
		  
		  dim b as BinaryStream = BinaryStream.Open(PDFFile)
		  dim s as string = b.Read(4)
		  
		  if leftb(s,3) = "PNG" then
		    isBild = true
		    Return
		  end if
		  
		  if leftb(s,4) = "%PDF" then
		    isPDF = true
		    Return
		  end if
		  
		  Exception io as IOException
		    
		    // no file to read?
		    
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HideWheel()
		  wheel.visible = false
		  
		  out.Visible = true
		  UpdateTimer.Enabled = true
		  list.Visible = out.Left > 0
		  MyCloseButton.Enabled = true
		  PrintButton.Enabled = true
		  RotateButton.Enabled = true
		  SaveButton.Enabled = true
		  ZoomButton.Enabled = true
		  
		  
		  
		  if out.MouseX >= 0 and out.MouseX <= out.Width then
		    if out.MouseY >= 0 and out.MouseY <= out.Height then
		      
		      me.MouseCursor = System.Cursors.MagnifyLarger
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub move(deltax as integer, deltay as integer)
		  DrawOffsetX = DrawOffsetX + deltax
		  DrawOffsetY = DrawOffsetY + deltay
		  
		  if DrawOffsetX>0 then
		    DrawOffsetX = 0
		  end if
		  
		  if DrawOffsetY>0 then
		    DrawOffsetY = 0
		  end if
		  
		  if pic <> nil then
		    dim w as integer = out.Width  - pic.Width
		    dim h as integer = out.Height - pic.Height
		    
		    if DrawOffsetX < w then
		      DrawOffsetX = w
		    end if
		    
		    if DrawOffsetY < h then
		      DrawOffsetY = h
		    end if
		  end if
		  
		  out.Invalidate(False)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveNext()
		  if list.ListIndex < 0 then
		    list.ListIndex = 0
		  else
		    
		    dim SelectedPageIndex as integer = list.RowTag(list.ListIndex)
		    dim SuchePageIndex as integer = SelectedPageIndex + 1
		    
		    for i as integer = list.ListIndex+1 to List.ListCount-1
		      dim pageIndex as integer = List.RowTag(i)
		      
		      if pageIndex = SuchePageIndex then
		        List.ListIndex = i
		        exit
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MovePrev()
		  if list.ListIndex < 0 then
		    list.ListIndex = 0
		  else
		    
		    dim SelectedPageIndex as integer = list.RowTag(list.ListIndex)
		    dim SuchePageIndex as integer = SelectedPageIndex - 1
		    
		    
		    for i as integer = list.ListIndex-1 downto 0
		      dim pageIndex as integer = List.RowTag(i)
		      
		      if pageIndex = SuchePageIndex then
		        List.ListIndex = i
		        exit
		      end if
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintMac(ShowDialog as Boolean)
		  
		  #if TargetMacOS then
		    
		    // Print PDF on Mac
		    
		    dim p as CGPDFDocumentMBS = CGPDFDocumentMBS.CreateWithData(PDFData)
		    
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
		Shared Function ReadFile(file as FolderItem) As string
		  dim b as BinaryStream = BinaryStream.Open(file)
		  
		  Return b.Read(B.Length)
		  
		  Exception io as IOException
		    Break
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RenderPage(n as integer)
		  dim pdf as MyDynaPDFMBS = MainThreadPDF
		  
		  if pdf<>Nil then
		    dim page as DynaPDFPageMBS = pdf.GetPage(n)
		    dim mr as DynaPDFRectMBS = page.BBox(page.kpbMediaBox)
		    dim cr as DynaPDFRectMBS = page.BBox(page.kpbCropBox)
		    if cr<>Nil then
		      mr = cr
		    end if
		    
		    dim w as integer = mr.Width
		    dim h as integer = abs(mr.Bottom-mr.top)
		    
		    w = W * 2
		    h = h * 2
		    
		    pic = pdf.RenderPagePicture(n, w, h, pdf.kpsFitBest)
		    
		  else
		    pic = nil
		  end if
		  
		  zoomed = false
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RenderPageWithLinks(n as Integer)
		  // this is modified version of RenderPage.
		  // we use a DynaPDFRasterizerMBS for more options and draw for all web links a rectangle and the URL in red.
		  
		  dim pdf as MyDynaPDFMBS = MainThreadPDF
		  
		  dim page as DynaPDFPageMBS = pdf.GetPage(n)
		  dim mr as DynaPDFRectMBS = page.BBox(page.kpbMediaBox)
		  dim cr as DynaPDFRectMBS = page.BBox(page.kpbCropBox)
		  if cr<>Nil then
		    mr = cr
		  end if
		  
		  dim w as integer = mr.Width
		  dim h as integer = abs(mr.Bottom-mr.top)
		  
		  w = W * 2
		  h = h * 2
		  
		  
		  
		  dim t as integer = 0
		  
		  dim o as new DynaPDFRasterImageMBS
		  o.InitWhite = true
		  // Rotation
		  
		  o.DefScale = o.kpsFitBest
		  o.Flags = o.krfDefault
		  
		  
		  dim r as new DynaPDFRasterizerMBS(pdf, w, h)
		  
		  //dim p as DynaPDFPageMBS = pdf.GetPage(page)
		  dim p as DynaPDFPageMBS = pdf.GetPage(n)
		  
		  if r.RenderPage(p, o) then
		    pic = r.Pic
		    dim PageSpace as DynapdfMatrixMBS = o.PageSpace
		    
		    // now show rectangles around links
		    
		    if pdf <> NIL and pic<>Nil then
		      dim g as Graphics = pic.Graphics
		      
		      dim u as integer = pdf.GetAnnotCount-1
		      dim links, rechts, oben, unten as Double
		      
		      'msgbox "RenderPageWithLinks :     In if pdf <> NIL and pic <> NIL construct    +    pdf.GetAnnotCount-1 = " + str(u) + "      and page number n = " + str(n)
		      
		      
		      for i as integer = 0 to u
		        
		        'msgbox "RenderPageWithLinks : i = " + str(i)
		        
		        dim b as DynaPDFAnnotationExMBS = pdf.GetAnnotEx(i)
		        //if b.PageNum<>page then Continue
		        if b.PageNum<>n then Continue
		        
		        dim bbox as DynaPDFRectMBS = b.BBox
		        
		        if b.Type = pdf.katWebLink then
		          links = bbox.Left
		          rechts = bbox.Right
		          oben = bbox.Top
		          unten = bbox.Bottom
		          PageSpace.Transform(links, oben)
		          PageSpace.Transform(rechts, unten)
		          dim URL as string = b.DestFile
		          
		          dim ww as integer = rechts-links
		          dim hh as integer = unten-oben
		          if ww<0 then
		            links = links + ww
		            ww = -ww
		          end if
		          if hh<0 then
		            oben = oben + hh
		            hh = -hh
		          end if
		          
		          g.ForeColor = &cFF0000
		          g.DrawRect links, oben, ww, hh
		          g.DrawString URL, links, oben
		          
		          t = t + 1
		        end if
		        
		      next
		    end
		    
		    
		  else
		    // failed
		    break
		    pic = nil
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RenderPreview() As Boolean
		  CheckFileFormat
		  
		  if list = nil then Return false // Fenster schon zu
		  
		  if isPDF then
		    
		    
		    dim pdf as new MyDynaPDFMBS
		    
		    // load CharacterMaps if you want to correctly process asian fonts
		    'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		    
		    MainThreadPDF = pdf
		    
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
		    
		    call pdf.SetImportFlags(pdf.kifImportAsPage + pdf.kifImportAll) // important! Import as page makes the rendering faster.
		    e = pdf.ImportPDFFile(1,1.0,1.0)
		    if e < 0 then
		      Return false
		    end if
		    
		    dim c as integer = pdf.GetPageCount
		    RenderPageWithLinks 1
		    if c = 1 then
		      if list= nil then Return false // Fenster schon zu
		      list.Visible = false
		      out.left = 0
		      out.Width = self.Width
		      
		    else
		      Thread1.run
		    end if
		    
		    
		    Return true
		    
		  else
		    
		    pic = Picture.Open(PDFFile)
		    
		    if pic <> nil then
		      Return true
		    end if
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(file as FolderItem)
		  
		  self.PDFData = ReadFile(file)
		  self.PDFFile = file
		  if self.RenderPreview then
		    self.show
		    self.HideWheel
		  else
		    self.close
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(PDFData as string)
		  self.PDFData = PDFData
		  if RenderPreview then
		    self.HideWheel
		    self.show
		  else
		    self.close
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RunShared(file as FolderItem)
		  dim p as new PDFPreview
		  
		  p.run file
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RunShared(PDFData as string)
		  dim p as new PDFPreview
		  p.run PDFData
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DrawOffsetX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		DrawOffsetY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		isBild As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isMoving As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isPDF As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		LastClick As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MainThreadPDF As MyDynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		mx As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		my As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NewPages() As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pages() As picture
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

	#tag Property, Flags = &h0
		zoomed As Boolean
	#tag EndProperty


	#tag Constant, Name = StepSize, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events Out
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  if pic = nil then
		    g.clearRect 0, 0, g.width, g.height
		    
		    
		  elseif zoomed then
		    g.DrawPicture Pic, DrawOffsetX, DrawOffsetY, pic.Width, pic.Height, 0, 0, pic.Width, pic.Height
		    
		    
		  else
		    g.clearRect 0, 0, g.width, g.height
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
		    
		    g.DrawPicture Pic, x, y, w, h, 0, 0, Pic.Width, Pic.Height
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  if zoomed then
		    
		    move -deltax, -deltay
		    
		  else
		    
		    static time as integer
		    
		    if abs(ticks-time)>30 then
		      time = ticks // nur alle 0,5 Sekunden
		      
		      if deltay > 0 then
		        MoveNext
		        
		      elseif deltay< 0  then
		        MovePrev
		      end if
		    end if
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  me.MouseCursor = System.Cursors.MagnifySmaller
		  
		  
		  isMoving = false
		  
		  if abs(ticks-LastClick) < 30 then // 0,5 sekunden
		    
		    zoomed = false
		    me.Invalidate(false)
		    me.MouseCursor = System.Cursors.MagnifyLarger
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  if isMoving then
		    dim xx as integer = x-mx
		    dim yy as integer = y-my
		    
		    move xx, yy
		    
		    mx = x
		    my = Y
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if zoomed then
		    
		    
		    me.MouseCursor = System.Cursors.HandClosed
		    
		    mx = x
		    my = y
		    
		    LastClick = ticks
		    isMoving = true
		    
		  else
		    zoomed = true
		    isMoving = false
		    DrawOffsetX = 0
		    DrawOffsetY = 0
		    
		    dim faktor as Double = min( me.Height / Pic.Height, me.Width / Pic.Width)
		    
		    if faktor>1 then
		      faktor = 1
		    end if
		    
		    dim mx as integer = x
		    dim my as integer = y
		    
		    // Calculate new size
		    dim pw as integer = Pic.Width * faktor
		    dim ph as integer = Pic.Height * faktor
		    
		    dim px as integer = (me.Width  - pw)/2
		    dim py as integer = (me.height - ph)/2
		    
		    x = x - px
		    y = y - py
		    
		    x = x / faktor
		    y = y / faktor
		    
		    x =  mx - x
		    y =  my - y
		    
		    move x, y
		    
		    
		    me.Invalidate(False)
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.MouseCursor = System.Cursors.StandardPointer
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  if zoomed then
		    'me.MouseCursor = System.Cursors.HandOpen
		    me.MouseCursor = System.Cursors.MagnifySmaller
		  else
		    me.MouseCursor = System.Cursors.MagnifyLarger
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select case asc(key)
		  case 30
		    MovePrev
		    Return true
		  case 31
		    MoveNext
		    Return true
		  end Select
		  
		End Function
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
		    
		  #elseif TargetWin32 then
		    
		    
		    dim r as new RegistryItem("HKEY_CLASSES_ROOT\Software\Adobe\Acrobat\Exe")
		    dim s as string = r.DefaultValue
		    
		    if len(s)=0 then
		      Break
		      MsgBox "Failed to find Acrobat Reader."
		    else
		      static sh as shell
		      
		      sh = new shell
		      sh.Mode=2
		      
		      
		      sh.Execute s+" /p "+PDFFile.ShellPath
		      'sh.Execute s+" /h /p "+f.ShellPath
		      
		    end if
		    
		  #else
		    Break
		  #endif
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MyCloseButton
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
		      
		      //RenderPage v+1
		      RenderPageWithLinks v+1
		      DrawOffsetX = 0
		      DrawOffsetY = 0
		      
		      out.Invalidate(False)
		    end if
		    
		    
		    // fix redrawing issues
		    for i as integer = 0 to me.ListCount-1
		      me.InvalidateCell(i,0)
		    next
		    
		    
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select case asc(key)
		  case 30
		    MovePrev
		    Return true
		  case 31
		    MoveNext
		    Return true
		  end Select
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Thread1
	#tag Event
		Sub Run()
		  // render page previews
		  
		  dim pdf as new MyDynaPDFMBS
		  
		  if not pdf.CreateNewPDF(nil) then // create pdf in memory
		    Return
		  end if
		  
		  dim e as integer
		  if PDFFile = nil then
		    e = pdf.OpenImportBuffer(PDFData) // load from memory
		  else
		    e = pdf.OpenImportFile(PDFFile) // load from file
		  end if
		  
		  if e<>0 then // failed
		    Return
		  end if
		  
		  call pdf.SetImportFlags(pdf.kifImportAsPage) // important! Import as page makes the rendering faster.
		  e = pdf.ImportPDFFile(1,1.0,1.0)
		  if e < 0 then
		    Return
		  end if
		  
		  
		  
		  dim c as integer = pdf.GetPageCount
		  
		  for i as integer = 1 to c
		    me.Sleep(10)
		    
		    if list= nil then Return // Fenster schon zu
		    
		    dim page as DynaPDFPageMBS = pdf.GetPage(i)
		    
		    dim w as integer = 148
		    dim h as integer = 198
		    
		    
		    dim pic as Picture = pdf.RenderPagePicture(i, w, h, pdf.kpsFitBest)
		    
		    newpages.Append pic
		    
		  next
		  
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
#tag Events RotateButton
	#tag Event
		Sub Action()
		  pic = pic.Rotate270MBS
		  
		  move 0, 0
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ZoomButton
	#tag Event
		Sub Action()
		  zoomed = not zoomed
		  
		  out.Invalidate(False)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Wheel
	#tag Event
		Sub Open()
		  me.Left = (Width -me.Width )/2
		  me.top  = (Height-me.Height)/2
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
		Name="DrawOffsetX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DrawOffsetY"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isBild"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isMoving"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isPDF"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LastClick"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mx"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="my"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
	#tag ViewProperty
		Name="zoomed"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
