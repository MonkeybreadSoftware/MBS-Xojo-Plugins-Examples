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
   Height          =   134
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   751305347
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Sample"
   Visible         =   True
   Width           =   300
   Begin BevelButton BevelButton1
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Print"
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
      Left            =   120
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MenuValue       =   "0"
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   56
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   60
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Str(p as cgrectMBS) As string
		  Return str(p.Left)+" "+str(p.top)+" "+str(p.Width)+" "+str(p.Height)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Str(p as cpmrectMBS) As string
		  Return str(p.Left)+" "+str(p.top)+" "+str(p.Width)+" "+str(p.Height)
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events BevelButton1
	#tag Event
		Sub Action()
		  Dim File As FolderItem
		  dim thePrintSession as CPMPrintSessionMBS
		  dim thePageFormat as CPMPageFormatMBS
		  dim thePrintSettings as CPMPrintSettingsMBS
		  dim thePdfDocument as CGPDFDocumentMBS
		  dim LastPage as Integer
		  dim AdjustedPageSize as CPMRectMBS
		  dim AdjustedPaperSize as CPMRectMBS
		  dim UnadjustedPageSize as CPMRectMBS
		  dim UnadjustedPaperSize as CPMRectMBS
		  dim DrawRect as CGRectMBS
		  dim thePrintContext as CGContextMBS
		  dim TrimBox as CGRectMBS
		  dim cropbox as CGRectMBS
		  
		  File=FindFile("sample.pdf")
		  if file.Exists then
		    thePdfDocument = file.OpenAsCGPDFDocumentMBS
		    if thePdfDocument=nil then Return
		    
		    thePrintSession  = NewCPMPrintSessionMBS
		    if thePrintSession=nil then Return
		    
		    thePageFormat = NewCPMPageFormatMBS
		    if thePageFormat=nil then Return
		    
		    thePrintSettings  = NewCPMPrintSettingsMBS
		    if thePrintSettings=nil then Return
		    
		    thePrintSession.DefaultPageFormat thePageFormat
		    thePrintSession.DefaultPrintSettings thePrintSettings
		    
		    'if not thePrintSession.PageSetupDialog(thePageFormat) then return
		    if not thePrintSession.PrintDialog(thePrintSettings,thePageFormat) then return
		    
		    LastPage = thePdfDocument.PageCount
		    if thePrintSettings.LastPage<lastpage then
		      lastpage=thePrintSettings.LastPage
		    end if
		    
		    thePrintSettings.LastPage=lastpage
		    
		    thePrintSession.BeginDocument(thePrintSettings, thePageFormat)
		    
		    for currentCopy as Integer = 1 to thePrintSettings.Copies
		      
		      for currentPage as Integer = thePrintSettings.FirstPage to LastPage
		        
		        cropbox=thePdfDocument.CropBox(currentPage)
		        TrimBox=thePdfDocument.TrimBox(currentPage)
		        
		        thePrintSession.BeginPage(thePageFormat, nil)
		        thePrintContext = thePrintSession.PageContext
		        if thePrintContext = Nil then return
		        
		        AdjustedPageSize=thePageFormat.AdjustedPageSize
		        AdjustedPaperSize=thePageFormat.AdjustedPaperSize
		        UnadjustedPageSize=thePageFormat.UnadjustedPageSize
		        UnadjustedPaperSize=thePageFormat.UnadjustedPaperSize
		        
		        dim s(-1) as string
		        s.append "AdjustedPageSize: "+str(AdjustedPageSize)
		        s.append "AdjustedPaperSize: "+str(AdjustedPaperSize)
		        s.append "UnadjustedPageSize: "+str(UnadjustedPageSize)
		        s.append "UnadjustedPaperSize: "+str(UnadjustedPaperSize)
		        s.append "Cropbox: "+str(Cropbox)
		        s.append "TrimBox: "+str(TrimBox)
		        
		        MsgBox Join(s,EndOfLine)
		        
		        DrawRect =CGMakeRectMBS(UnadjustedPaperSize.left, -(UnadjustedPaperSize.Height-AdjustedPageSize.Height+UnadjustedPaperSize.top), UnadjustedPaperSize.Width, UnadjustedPaperSize.Height)
		        
		        thePrintContext.DrawCGPDFDocument thePdfDocument,DrawRect, currentPage
		        
		        thePrintContext = nil
		        thePrintSession.EndPage
		      next
		    next
		    thePrintSession.EndDocument
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
