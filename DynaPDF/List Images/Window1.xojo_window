#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   530
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1746382978
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "DynaPDF Images"
   Visible         =   True
   Width           =   801
   Begin PushButton PDFButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Choose PDF File..."
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
      Width           =   140
   End
   Begin PushButton ExportButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Export Image..."
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   172
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
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
      Width           =   140
   End
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   464
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Index	Width	Height	Byte Size"
      Italic          =   False
      Left            =   20
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   292
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Output
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   496
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   324
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   457
   End
End
#tag EndWindow

#tag WindowCode
	#tag Property, Flags = &h0
		CurrentPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pdf As MyDynaPDFMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events PDFButton
	#tag Event
		Sub Action()
		  dim file as FolderItem = GetOpenFolderItem(FileTypes1.Pdf)
		  
		  if file = nil then Return
		  
		  pdf = new MyDynaPDFMBS
		  
		  pdf.SetLicenseKey "Lite" // For this example you can use Lite, Pro or Enterprise License
		  
		  call pdf.CreateNewPDF(nil)
		  
		  // Skip anything that is not required
		  dim flags as integer = BitwiseOr(pdf.kifImportAll, pdf.kifImportAsPage)
		  
		  call pdf.SetImportFlags flags
		  
		  // From which PDF file do you want to extract the images?
		  call pdf.OpenImportFile(file)
		  
		  // import pages
		  call pdf.ImportPDFFile(1)
		  
		  call pdf.CloseImportFile
		  
		  dim u as integer = pdf.GetImageObjCount-1
		  for i as integer = 0 to u
		    
		    flags = pdf.kpfDecomprAllImages
		    
		    dim img as DynaPDFImageMBS = pdf.GetImageObj(i, flags)
		    
		    List.AddRow str(i), str(img.Width), str(img.Height), str(img.BufferSize)
		    List.RowTag(List.LastIndex) = img
		  next
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ExportButton
	#tag Event
		Sub Action()
		  if List.ListIndex < 0 then Return
		  
		  dim img as DynaPDFImageMBS = List.RowTag(List.ListIndex)
		  
		  if img = nil then Return
		  
		  dim filter as string
		  dim defaultName as string 
		  dim imageFormat as integer 
		  dim imageFilter as integer 
		  
		  Select case img.Filter
		  case DynaPDFMBS.kdfDCTDecode
		    // we can pass through jpeg
		    filter = FileTypes1.Jpeg
		    defaultname = "image.jpg"
		    imageFormat = DynaPDFMBS.kifmJPEG
		    imageFilter = DynaPDFMBS.kcfJPEG
		  else
		    // all other are converted to TIFF here
		    filter = FileTypes1.ImageTiff
		    defaultname = "image.tif"
		    imageFormat = DynaPDFMBS.kifmTIFF
		    imageFilter = DynaPDFMBS.kcfFlate
		  end Select
		  
		  
		  dim f as FolderItem = GetSaveFolderItem(filter, defaultname)
		  
		  if f <> nil then
		    
		    if pdf.CreateImage(f, imageFormat) then
		      if pdf.AddImage(imageFilter, DynaPDFMBS.kicNone, img) then
		        if pdf.CloseImage then
		          f.Launch
		        end if
		      end if
		    end if
		  end if
		  
		  
		  
		  Exception io as IOException
		    MsgBox "Failed to write file."
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events List
	#tag Event
		Sub Change()
		  CurrentPicture = nil
		  
		  if me.ListIndex >= 0 then
		    dim img as DynaPDFImageMBS = me.RowTag(me.ListIndex)
		    
		    if img <> nil then
		      
		      #if true then
		        
		        dim jpegData as string = img.PictureData
		        CurrentPicture = Picture.FromData(jpegData)
		        
		      #else
		        // do it in Xojo
		        if img.Filter = DynaPDFMBS.kdfDCTDecode then
		          // JPEG
		          
		          CurrentPicture = picture.FromData(img.Buffer)
		          
		        else
		          
		          // we convert to PNG here to open it
		          if pdf.CreateImage(nil, DynaPDFMBS.kifmPNG) then
		            if pdf.AddImage(DynaPDFMBS.kcfFlate, DynaPDFMBS.kicNone, img) then
		              if pdf.CloseImage then
		                dim buf as MemoryBlock = pdf.GetImageBufferMemory
		                
		                CurrentPicture = picture.FromData(buf)
		                
		              end if
		            end if
		          end if
		          
		        end if
		      #endif
		    end if
		    
		  end if
		  
		  output.Refresh
		  
		  ExportButton.Enabled = CurrentPicture <> nil
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Output
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if CurrentPicture <> nil then
		    
		    dim faktor as Double = min( Height / CurrentPicture.Height, Width / CurrentPicture.Width)
		    
		    if faktor > 1.0 then
		      faktor = 1.0
		    end if
		    
		    // Calculate new size
		    dim w as integer = CurrentPicture.Width * faktor
		    dim h as integer = CurrentPicture.Height * faktor
		    
		    // draw picture in the new size
		    g.DrawPicture CurrentPicture, 0, 0, w, h, 0, 0, CurrentPicture.Width, CurrentPicture.Height
		    
		    
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
	#tag ViewProperty
		Name="CurrentPicture"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
