#tag Window
Begin Window PrintWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   456
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Print"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select PDF"
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
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
      Width           =   111
   End
   Begin Label InputPath
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
      Left            =   143
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   437
   End
   Begin PushButton PrintButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print with Xojo Graphics "
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
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
      Top             =   244
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin RadioButton RadioColor
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Color"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   127
   End
   Begin Label Label1
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Color options:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin RadioButton RadioGray
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Grayscale"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   110
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   127
   End
   Begin RadioButton RadioBW
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Black/White"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   142
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   127
   End
   Begin CheckBox CheckAuto
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Auto rotate and center"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   257
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   1
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   287
   End
   Begin Label Label2
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
      Left            =   257
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Other options:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin CheckBox CheckShrink
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Shrink to Print Area"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   257
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   1
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   110
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   287
   End
   Begin CheckBox CheckFirst
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Only first page"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   257
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   142
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   287
   End
   Begin ProgressBar bar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Maximum         =   100
      Scope           =   "0"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   244
      Transparent     =   True
      Value           =   0.0
      Visible         =   False
      Width           =   208
   End
   Begin Label Info
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
      Left            =   597
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   498
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   195
   End
   Begin Thread Thread1
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   "0"
      StackSize       =   0
      TabPanelIndex   =   "0"
      ThreadID        =   0
      ThreadState     =   ""
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   500
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin PushButton PrinterButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print To Printer Direct"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   308
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label Label3
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
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Printer:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   308
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   61
   End
   Begin TextField printerName
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   289
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Microsoft Print to PDF"
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   306
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   252
   End
   Begin Label Label4
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1. Let Xojo open printer"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   212
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin Label Label5
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "2. Let Plugin open printer without dialog"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   276
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   306
   End
   Begin Label Label6
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "3. Let Plugin open printer with dialog"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   340
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   306
   End
   Begin PushButton PrinterDialogButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print To Printer Dialog"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   372
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin PushButton SaveButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save Settings"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   216
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   372
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin PushButton LoadButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load Settings"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   349
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   372
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   121
   End
   Begin CheckBox CheckPrintPageAsIS
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Print Page as is"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   257
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   174
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   287
   End
   Begin PushButton PrinterPageDialogButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print 1st page to Printer Dialog"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   404
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   241
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // for testing, preload a PDF
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.pdf")
		  SetPDF f
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function PreparePDF(g as Graphics = nil) As Boolean
		  
		  
		  // start new PDF context
		  pdf = new MyDynapdfMBS
		  call pdf.CreateNewPDF nil
		  
		  // import PDF
		  dim n as integer = pdf.OpenImportFile(InputFile, 0, "")
		  if n < 0 then
		    Return false
		  end if
		  
		  // print
		  
		  
		  if CheckFirst.Value then
		    // import first page?
		    call pdf.ImportPDFPage(1)
		  else
		    // import all pages?
		    'call pdf.ImportPDFFile(1)
		    
		    // import selected pages in given number of copies
		    dim copies    as integer = 1
		    dim firstPage as integer = 1
		    dim numPages  as integer = pdf.GetInPageCount // pages in PDF
		    dim lastPage  as integer = numPages
		    
		    if g <> nil then
		      copies    = g.Copies
		      firstPage = g.FirstPage
		      lastPage  = g.LastPage
		      
		      System.DebugLog "g.FirstPage: "+str(g.FirstPage)
		      System.DebugLog "g.LastPage: "+str(g.LastPage)
		    end if
		    
		    if firstPage < 1 then
		      firstPage = 1
		    end if
		    
		    if lastPage > numPages then
		      lastPage = numPages
		    end if
		    
		    for c as integer = 1 to Copies
		      for i as integer = firstPage to lastPage
		        call pdf.ImportPDFPage(i)
		      next
		    next
		    
		  end if
		  
		  pdf.NumberOfPages = pdf.GetPageCount
		  System.DebugLog "NumberOfPages: "+str(pdf.NumberOfPages)
		  if pdf.NumberOfPages = 0 then
		    MsgBox "No pages?"
		    Return false
		  end if
		  
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintPageToPrinterWithDialog()
		  if not PreparePDF then Return
		  
		  // flags we need to pass for using Xojo's graphics class
		  dim flags as integer = 0
		  
		  // color or black/white?
		  if RadioBW.Value then
		    flags = BitwiseOr(flags, pdf.kpff1Bit)
		  elseif RadioColor.Value then
		    flags = BitwiseOr(flags, pdf.kpffColor)
		  end if
		  
		  // rotate if needed
		  if CheckAuto.Value then
		    flags = BitwiseOr(flags, pdf.kpffAutoRotateAndCenter)
		  end if
		  
		  // shrink if needed
		  if CheckShrink.Value then
		    flags = BitwiseOr(flags, pdf.kpffShrinkToPrintArea)
		  end if
		  
		  if CheckPrintPageAsIS.Value then
		    flags = BitwiseOr(flags, pdf.kpffPrintPageAsIs)
		  end if
		  
		  bar.Maximum = 1
		  bar.Value = 0
		  bar.Visible = true
		  
		  pdf.PrinterMargin = nil
		  pdf.PrinterFlags = flags
		  pdf.printing = true
		  pdf.PrintingDone = false
		  pdf.printerName = printerName.Text
		  
		  if PrintSettings <> "" then
		    if pdf.PrintSetDevMode(PrintSettings) then
		      // ok
		    else
		      MsgBox "Failed to load print settings."
		    end if
		  end if
		  
		  // print to named printer
		  dim e as boolean = pdf.PrintPDFPageWithDialog(1, "test", pdf.PrinterFlags, pdf.PrinterMargin, nil, self)
		  
		  
		  // query print settings
		  PrintSettings = pdf.PrintGetDevMode
		  // you can use WindowsDeviceModeMBS class to edit those settings
		  if PrintSettings <> "" then
		    SaveButton.Enabled = true
		  end if
		  
		  if e then
		    MsgBox "Printed."
		  end if
		  
		  // cleanup
		  pdf = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintToNamedPrinter()
		  if not PreparePDF then Return
		  
		  
		  // flags we need to pass for using Xojo's graphics class
		  dim flags as integer = 0
		  
		  // color or black/white?
		  if RadioBW.Value then
		    flags = BitwiseOr(flags, pdf.kpff1Bit)
		  elseif RadioColor.Value then
		    flags = BitwiseOr(flags, pdf.kpffColor)
		  end if
		  
		  // rotate if needed
		  if CheckAuto.Value then
		    flags = BitwiseOr(flags, pdf.kpffAutoRotateAndCenter)
		  end if
		  
		  // shrink if needed
		  if CheckShrink.Value then
		    flags = BitwiseOr(flags, pdf.kpffShrinkToPrintArea)
		  end if
		  
		  if CheckPrintPageAsIS.Value then
		    flags = BitwiseOr(flags, pdf.kpffPrintPageAsIs)
		  end if
		  
		  bar.Maximum = pdf.numberOfPages
		  bar.Value = 0
		  bar.Visible = true
		  
		  pdf.PrinterMargin = nil
		  pdf.PrinterFlags = flags
		  pdf.printing = true
		  pdf.PrintingDone = false
		  pdf.printerName = printerName.Text
		  
		  
		  Thread1.run
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintToPrinterWithDialog()
		  if not PreparePDF then Return
		  
		  // flags we need to pass for using Xojo's graphics class
		  dim flags as integer = 0
		  
		  // color or black/white?
		  if RadioBW.Value then
		    flags = BitwiseOr(flags, pdf.kpff1Bit)
		  elseif RadioColor.Value then
		    flags = BitwiseOr(flags, pdf.kpffColor)
		  end if
		  
		  // rotate if needed
		  if CheckAuto.Value then
		    flags = BitwiseOr(flags, pdf.kpffAutoRotateAndCenter)
		  end if
		  
		  // shrink if needed
		  if CheckShrink.Value then
		    flags = BitwiseOr(flags, pdf.kpffShrinkToPrintArea)
		  end if
		  
		  if CheckPrintPageAsIS.Value then
		    flags = BitwiseOr(flags, pdf.kpffPrintPageAsIs)
		  end if
		  
		  bar.Maximum = pdf.numberOfPages
		  bar.Value = 0
		  bar.Visible = true
		  
		  pdf.PrinterMargin = nil
		  pdf.PrinterFlags = flags
		  pdf.printing = true
		  pdf.PrintingDone = false
		  pdf.printerName = printerName.Text
		  
		  if PrintSettings <> "" then
		    if pdf.PrintSetDevMode(PrintSettings) then
		      // ok
		    else
		      MsgBox "Failed to load print settings."
		    end if
		  end if
		  
		  // print to named printer
		  dim e as boolean = pdf.PrintPDFFileWithDialog(nil, "test", pdf.PrinterFlags, pdf.PrinterMargin, nil, self)
		  
		  
		  // query print settings
		  PrintSettings = pdf.PrintGetDevMode
		  // you can use WindowsDeviceModeMBS class to edit those settings
		  if PrintSettings <> "" then
		    SaveButton.Enabled = true
		  end if
		  
		  if e then
		    MsgBox "Printed."
		  end if
		  
		  // cleanup
		  pdf = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrintWithXojoGraphics()
		  if RBVersion >= 2016.04 then
		    // Warning: Printing with Xojo Graphics doesn't work for Xojo 2016r4 and 2017r1
		    // due to bugs related to switch to DirectDraw. Feedback case 47467
		    break
		  end if
		  
		  if pdf.GetPageCount < 1 then
		    MsgBox "No PDF pages loaded?"
		    return
		  end if
		  
		  // print
		  
		  dim ps as new PrinterSetup
		  dim g as Graphics = OpenPrinterDialog(ps)
		  if g = nil then
		    Return
		  end if
		  
		  if not PreparePDF(g) then Return
		  
		  
		  
		  System.DebugLog "g.width: "+str(g.Width)
		  System.DebugLog "g.height: "+str(g.height)
		  
		  
		  dim h as integer = g.Handle(g.HandleTypeHDC)
		  if h = 0 then
		    MsgBox "no graphics handle?"
		    Return
		  end if
		  
		  dim r as new DynaPDFRectMBS
		  r.Left = 0 // Compensate margin from xojo?
		  r.top = 0
		  r.Bottom = 0
		  r.Right = 0
		  
		  // flags we need to pass for using Xojo's graphics class
		  dim flags as integer = Bitwise.BitOr(pdf.kpffNoEndDoc, pdf.kpffNoStartDoc, pdf.kpffNoStartPage)
		  
		  // color or black/white?
		  if RadioBW.Value then
		    flags = BitwiseOr(flags, pdf.kpff1Bit)
		  elseif RadioColor.Value then
		    flags = BitwiseOr(flags, pdf.kpffColor)
		  end if
		  
		  // rotate if needed
		  if CheckAuto.Value then
		    flags = BitwiseOr(flags, pdf.kpffAutoRotateAndCenter)
		  end if
		  
		  // shrink if needed
		  if CheckShrink.Value then
		    flags = BitwiseOr(flags, pdf.kpffShrinkToPrintArea)
		  end if
		  
		  if CheckPrintPageAsIS.Value then
		    flags = BitwiseOr(flags, pdf.kpffPrintPageAsIs)
		  end if
		  
		  bar.Maximum = pdf.numberOfPages
		  bar.Value = 0
		  bar.Visible = true
		  
		  pdf.PrinterMargin = r
		  pdf.PrinterHandle = h
		  pdf.PrinterFlags = flags
		  pdf.printing = true
		  pdf.PrintingDone = false
		  pdf.g = g
		  
		  Thread1.run
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPDF(f as FolderItem)
		  if f <> nil and f.Exists then
		    InputFile = f
		    
		    InputPath.Text = f.NativePath
		    
		    PrintButton.Enabled = true
		    PrinterButton.Enabled = true
		    PrinterDialogButton.Enabled = true
		    PrinterPageDialogButton.Enabled = true
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		InputFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		PDF As MyDynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PrintSettings As String
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  
		  SetPDF f
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrintButton
	#tag Event
		Sub Action()
		  PrintWithXojoGraphics
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Thread1
	#tag Event
		Sub Run()
		  if pdf <> nil then
		    timer1.mode = timer.ModeMultiple
		    
		    if pdf.printerName = "" then
		      
		      // print to graphics from xojo
		      
		      dim e as boolean = pdf.PrintPDFFile(nil, "test", pdf.PrinterHandle, pdf.PrinterFlags, pdf.PrinterMargin)
		      
		    else
		      // print to named printer
		      dim e as boolean = pdf.PrintPDFFile(nil, "test", pdf.printerName, pdf.PrinterFlags, pdf.PrinterMargin)
		      
		    end if
		    
		    // done
		    pdf.printing = False
		    call pdf.CloseFile
		    
		    pdf.PrintingDone = true
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  if pdf.PrintingDone then
		    
		    dim g as Graphics = pdf.g
		    
		    if g <> nil then
		      // draw something on last page
		      dim m as string = "Xojo printing done."
		      g.DrawString m, 50, 50
		      
		      
		      // cleanup
		      g = nil
		    end if
		    
		    // cleanup pdf
		    pdf = nil
		    
		    // done
		    
		    info.Visible = False
		    bar.Visible = false
		    me.mode = 0
		    
		    MsgBox "Printing done."
		    
		    Return
		  end if
		  
		  dim s as string = str(pdf.CurrentPage)+" of "+str(pdf.NumberOfPages)
		  
		  System.DebugLog s
		  
		  bar.Value = pdf.CurrentPage
		  info.Text = s
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrinterButton
	#tag Event
		Sub Action()
		  PrintToNamedPrinter
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrinterDialogButton
	#tag Event
		Sub Action()
		  PrintToPrinterWithDialog
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  if PrintSettings = "" then
		    // nothing to save
		    Return
		  end if
		  
		  dim f as FolderItem = GetSaveFolderItem(FileTypes.Pref, "settings.pref")
		  
		  if f = nil then Return
		  
		  dim b as BinaryStream = BinaryStream.Create(f, true)
		  b.Write PrintSettings
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadButton
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes.Pref)
		  
		  if f = nil then Return
		  
		  dim b as BinaryStream = BinaryStream.Open(f)
		  
		  PrintSettings = b.Read(b.Length)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PrinterPageDialogButton
	#tag Event
		Sub Action()
		  PrintPageToPrinterWithDialog
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
		Name="PrintSettings"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
