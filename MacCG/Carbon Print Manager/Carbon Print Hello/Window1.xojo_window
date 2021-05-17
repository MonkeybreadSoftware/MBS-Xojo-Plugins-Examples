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
   Height          =   398
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1177415861
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Carbon Print Manager"
   Visible         =   True
   Width           =   652
   Begin PushButton NormalTestButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Normal Test"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   109
   End
   Begin PushButton SilentTestButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Silent Test"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   141
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   109
   End
   Begin PushButton TestPreviewButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Test Preview"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   262
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   109
   End
   Begin PushButton TestFaxButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Test Fax"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   383
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   109
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Available printers:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   149
   End
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
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
      Height          =   300
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   149
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   181
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Resolution list of current printer:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   243
   End
   Begin ListBox ListBox2
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
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
      Height          =   300
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   181
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
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   243
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PrintPDFButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print PDF to PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   504
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   134
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim ps as CPMPrintSessionMBS
		  dim pc as CPMPrinterMBS
		  dim ar() as string
		  dim i,index,c as integer
		  dim r as CPMResolutionMBS
		  
		  ListBox1.DeleteAllRows
		  ListBox2.DeleteAllRows
		  
		  ps=NewCPMPrintSessionMBS
		  if ps<>nil then
		    ps.CreatePrinterList(ar,index,pc)
		    
		    for each s as string in ar
		      ListBox1.AddRow s
		      if i=index then
		        ListBox1.CellBold(index,0)=true
		      end if
		    next
		  end if
		  
		  if pc<>nil then
		    c=pc.ResolutionCount
		    for i=1 to c
		      r=pc.IndexedPrinterResolution(i)
		      if r<>nil then
		        ListBox2.AddRow str(r.Horizontal)+" x "+str(r.Vertical)
		      end if
		    next
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Draw(pf as CPMPageFormatMBS, ps as CPMPrintSessionMBS, pt as CPMPrintSettingsMBS, dialog as boolean)
		  dim g as CGContextMBS
		  dim r as CPMRectMBS
		  dim cr as CGRectMBS
		  dim i as integer
		  
		  r=pf.AdjustedPageSize
		  if dialog then
		    ps.BeginDocument(pt,pf)
		  else
		    ps.BeginDocumentNoDialog(pt,pf)
		  end if
		  
		  
		  pt.LastPage=2
		  for i=1 to 2
		    if dialog then
		      ps.BeginPage(pf,nil)
		    else
		      ps.BeginPageNoDialog(pf,nil)
		    end if
		    
		    g=ps.PageContext
		    if ps.LastError<>0 then
		      MsgBox "PageContext lasterror: "+str(ps.LastError)
		    end if
		    
		    if g<>Nil then
		      
		      cr=CGMakeRectMBS(0,0,r.width,r.height)
		      g.SetGrayFillColor 0.5,0.5
		      g.SetGrayStrokeColor 0.5,0.5
		      g.FillRect cr
		      cr=CGMakeRectMBS(100,100,200,200)
		      g.SetRGBFillColor 1,0,0,0.5
		      cr.Left=20
		      cr.Top=10
		      cr.Width=150
		      cr.Height=200
		      g.FillRect cr
		      g.SetRGBFillColor 0,1,0,0.5
		      cr.Left=120
		      cr.Top=10
		      cr.Width=150
		      cr.Height=200
		      g.FillRect cr
		      
		      g.SetRGBFillColor 0.0, 0.7, 0.9, 1.0 
		      g.SelectFont "Helvetica", 36.0, 1
		      g.ShowTextAtPoint "Hello World on page "+str(i),20,r.height/2
		      
		      g=nil
		    else
		      MsgBox "g is nil!?"
		    end if
		    
		    if dialog then
		      ps.EndPage
		    else
		      ps.EndPageNoDialog
		    end if
		  next
		  
		  if dialog then
		    ps.EndDocument
		  else
		    ps.EndDocumentNoDialog
		  end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events NormalTestButton
	#tag Event
		Sub Action()
		  dim pf as CPMPageFormatMBS
		  dim ps as CPMPrintSessionMBS
		  dim pt as CPMPrintSettingsMBS
		  
		  ps=NewCPMPrintSessionMBS
		  if ps<>Nil then
		    pf=NewCPMPageFormatMBS
		    pt=NewCPMPrintSettingsMBS
		    
		    ps.DefaultPageFormat pf
		    ps.DefaultPrintSettings pt
		    
		    if ps.PageSetupDialog(pf) then
		      if ps.PrintDialog(pt,pf) then
		        draw pf,ps,pt,true
		      end if
		    end if
		    
		  else
		    MsgBox "We need Mac OS X 10.2!"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SilentTestButton
	#tag Event
		Sub Action()
		  dim pf as CPMPageFormatMBS
		  dim ps as CPMPrintSessionMBS
		  dim pt as CPMPrintSettingsMBS
		  
		  ps=NewCPMPrintSessionMBS
		  if ps<>Nil then
		    pf=NewCPMPageFormatMBS
		    pt=NewCPMPrintSettingsMBS
		    
		    ps.DefaultPageFormat pf
		    ps.DefaultPrintSettings pt
		    
		    draw pf,ps,pt,false
		    
		  else
		    MsgBox "We need Mac OS X 10.2!"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestPreviewButton
	#tag Event
		Sub Action()
		  dim pf as CPMPageFormatMBS
		  dim ps as CPMPrintSessionMBS
		  dim pt as CPMPrintSettingsMBS
		  dim f as FolderItem
		  
		  ps=NewCPMPrintSessionMBS
		  if ps<>Nil then
		    pf=NewCPMPageFormatMBS
		    pt=NewCPMPrintSettingsMBS
		    
		    ps.DefaultPageFormat pf
		    ps.DefaultPrintSettings pt
		    
		    f=SpecialFolder.Desktop.Child("Preview.pdf")
		    ps.SetDestination pt,2,"application/pdf",f.URLPath
		    if ps.LastError=0 then
		      draw pf,ps,pt,false
		      f.Launch
		    else
		      MsgBox "no preview? "+str(ps.LastError)
		    end if
		    
		  else
		    MsgBox "We need Mac OS X 10.2!"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestFaxButton
	#tag Event
		Sub Action()
		  dim pf as CPMPageFormatMBS
		  dim ps as CPMPrintSessionMBS
		  dim pt as CPMPrintSettingsMBS
		  
		  ps=NewCPMPrintSessionMBS
		  if ps<>Nil then
		    pf=NewCPMPageFormatMBS
		    pt=NewCPMPrintSettingsMBS
		    
		    ps.DefaultPageFormat pf
		    ps.DefaultPrintSettings pt
		    
		    ps.SetDestination pt,3,"com.apple.documentformat.default", ""
		    
		    if ps.LastError=0 then
		      draw pf,ps,pt,true
		    else
		      MsgBox "no fax? "+str(ps.LastError)
		    end if
		  else
		    MsgBox "We need Mac OS X 10.2!"
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrintPDFButton
	#tag Event
		Sub Action()
		  dim f as FolderItem
		  dim pdf as CGPDFDocumentMBS
		  dim pf as CPMPageFormatMBS
		  dim ps as CPMPrintSessionMBS
		  dim pt as CPMPrintSettingsMBS
		  dim pr as CPMRectMBS
		  dim cr as CGRectMBS
		  dim g as CGContextMBS
		  
		  f=GetOpenFolderItem("Application/pdf")
		  
		  if f<>nil then
		    pdf=f.OpenAsCGPDFDocumentMBS
		    if pdf<>nil then
		      
		      ps=NewCPMPrintSessionMBS
		      if ps<>Nil then
		        pf=NewCPMPageFormatMBS
		        pt=NewCPMPrintSettingsMBS
		        
		        ps.DefaultPageFormat pf
		        ps.DefaultPrintSettings pt
		        
		        f=SpecialFolder.Desktop.Child("print to pdf output.pdf")
		        ps.SetDestination pt,2,"application/pdf", f.URLPath
		        
		        ps.BeginDocumentNoDialog pt,pf
		        
		        pr=pf.AdjustedPageSize
		        
		        cr=CGMakeRectMBS(pr.left,pr.top,pr.Width,pr.Height)
		        
		        ps.BeginPageNoDialog pf,pr
		        g=ps.PageContext
		        
		        g.DrawCGPDFDocument pdf,cr,1
		        g.SelectFont "Helvetica",18,1
		        g.SetRGBFillColor 0,0,0,1
		        g.ShowTextAtPoint "The first page of the pdf file.",20,20
		        g.FillPath
		        g=nil
		        
		        ps.EndPageNoDialog
		        ps.EndDocumentNoDialog
		        
		        f.Launch
		      else
		        MsgBox "We need Mac OS X 10.2!"
		      end if
		      
		    else
		      MsgBox "Can't open PDF file named """+f.name+"""."
		    end if
		  end if
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
#tag EndViewBehavior
