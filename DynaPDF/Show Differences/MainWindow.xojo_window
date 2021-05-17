#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   832
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1285214207
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Compare PDFs"
   Visible         =   True
   Width           =   1200
   Begin Canvas CanvasPDF1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   390
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
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
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   290
   End
   Begin Canvas CanvasPDF2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   390
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   422
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   290
   End
   Begin Canvas CanvasDiff3
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   792
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   322
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   666
   End
   Begin PushButton LoadButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load First PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1000
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
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   180
   End
   Begin PushButton LoadButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load Second PDF"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1000
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   180
   End
   Begin PushButton NextButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Next page"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1000
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
      Top             =   84
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   180
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
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Results look better with a DynaPDF License as watermark is not disturbing analysis."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   812
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   968
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // init once
		  pdf = new MyDynaPDFMBS
		  
		  call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		  call pdf.SetJPEGQuality(90)
		  
		  
		  // for debugging load something right away
		  'LoadPDF1 FindFile("test1.pdf")
		  'LoadPDF2 FindFile("test2.pdf")
		  
		End Sub
	#tag EndEvent


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

	#tag Method, Flags = &h1
		Protected Sub LoadPDF1(f as FolderItem)
		  
		  if f <> nil and f.Exists then
		    PDFFile1 = f
		    
		    PageIndex1 = 1
		    PageCount1 = 1 // not yet known
		    RenderPDF1
		    
		    if PDFFile2 <> nil then
		      NextButton.Enabled = PageIndex2 < PageCount2 and PageIndex1 < PageCount1
		      showDifferences
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadPDF2(f as FolderItem)
		  
		  if f <> nil then
		    PDFFile2 = f
		    
		    PageIndex2 = 1
		    PageCount2 = 1 // not yet known
		    RenderPDF2
		    
		    if PDFFile1 <> nil then
		      NextButton.Enabled = PageIndex2 < PageCount2 and PageIndex1 < PageCount1
		      showDifferences
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RenderPDF1()
		  canvasPDF1.backdrop = nil
		  
		  dim r as integer
		  
		  // clear everything
		  call pdf.CreateNewPDF(nil)
		  
		  // open PDF
		  r = pdf.OpenImportFile(PDFFile1)
		  
		  if r >= 0 then 
		    // ok
		    
		    PageCount1 = pdf.GetInPageCount
		    
		    // get only the one page we need
		    call pdf.Append
		    r = pdf.ImportPageEx(PageIndex1)
		    call pdf.EndPage
		    
		    if r >= 0 then
		      // ok
		      
		      // render it
		      dim p as Picture = pdf.RenderPagePicture(1, CanvasPDF1.Width, CanvasPDF1.Height)
		      
		      CanvasPDF1.backdrop = p
		    end if
		  end if
		  
		  // cleanup
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  call pdf.FreePDF
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RenderPDF2()
		  canvasPDF2.backdrop = nil
		  
		  dim r as integer
		  
		  // clear everything
		  call pdf.CreateNewPDF(nil)
		  
		  // open PDF
		  r = pdf.OpenImportFile(PDFFile2)
		  
		  if r >= 0 then
		    // ok
		    
		    PageCount2 = pdf.GetInPageCount
		    
		    // get only the one page we need
		    call pdf.Append
		    r = pdf.ImportPageEx(PageIndex2)
		    call pdf.EndPage
		    
		    if r >= 0 then
		      // ok
		      
		      // render it
		      dim p as Picture = pdf.RenderPagePicture(1, CanvasPDF2.Width, CanvasPDF2.Height)
		      
		      
		      CanvasPDF2.backdrop = p
		    end if
		  end if
		  
		  // cleanup
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  call pdf.FreePDF
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub showDifferences()
		  CanvasDiff3.backdrop = nil
		  
		  dim r as integer
		  
		  // clear everything
		  call pdf.CreateNewPDF(nil)
		  
		  call pdf.SetImportFlags(pdf.kifImportAll + pdf.kifImportAsPage)
		  
		  // load CharacterMaps if you want to correctly process asian fonts
		  'call pdf.SetCMapDir(SpecialFolder.Desktop.Child("CMap"), pdf.klcmRecursive)
		  
		  
		  // open PDF
		  r = pdf.OpenImportFile(PDFFile1)
		  
		  if r >= 0 then
		    // ok
		    
		    // get only the one page we need
		    call pdf.Append
		    r = pdf.ImportPageEx(PageIndex1)
		    call pdf.EndPage
		    
		    if r >= 0 then
		      // ok
		      
		      // open PDF
		      r = pdf.OpenImportFile(PDFFile2)
		      
		      if r >= 0 then
		        // ok
		        
		        PageCount2 = pdf.GetInPageCount
		        
		        // get only the one page we need
		        call pdf.Append
		        r = pdf.ImportPageEx(PageIndex2)
		        call pdf.EndPage
		        
		        if r >= 0 then
		          // ok
		          
		          if pdf.ShowDifferences(1, pdf, 2, true) >= 0 then
		            
		            
		            // render it
		            dim p as Picture = pdf.RenderPagePicture(1, CanvasDiff3.Width, CanvasDiff3.Height)
		            
		            CanvasDiff3.backdrop = p
		          end if
		        end if
		      end if
		    end if
		  end if
		  
		  // cleanup
		  call pdf.CloseImportFile
		  call pdf.CloseFile
		  call pdf.FreePDF
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected PageCount1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageCount2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageIndex1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PageIndex2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PDF As MyDynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PDFFile1 As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PDFFIle2 As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events LoadButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  
		  LoadPDF1 f
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LoadButton2
	#tag Event
		Sub Action()
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  
		  LoadPDF2 f
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextButton
	#tag Event
		Sub Action()
		  PageIndex1 = PageIndex1 + 1
		  PageIndex2 = PageIndex2 + 1
		  
		  RenderPDF1
		  RenderPDF2
		  showDifferences
		  
		  
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
