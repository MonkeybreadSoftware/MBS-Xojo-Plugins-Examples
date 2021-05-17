#tag WebPage
Begin WebPage MainPage
   AllowTabOrderWrap=   True
   Compatibility   =   ""
   ControlID       =   ""
   Enabled         =   True
   Height          =   696
   ImplicitInstance=   True
   Index           =   0
   Indicator       =   0
   IsImplicitInstance=   False
   LayoutDirection =   0
   LayoutType      =   0
   Left            =   283
   LockBottom      =   False
   LockHorizontal  =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   LockVertical    =   False
   MinimumHeight   =   400
   MinimumWidth    =   600
   TabIndex        =   0
   Title           =   "PDF Viewer with Real Studio Web Edition"
   Top             =   284
   Visible         =   True
   Width           =   952
   _ImplicitInstance=   False
   _mDesignHeight  =   0
   _mDesignWidth   =   0
   _mName          =   ""
   _mPanelIndex    =   -1
   Begin WebListBox FileList
      ColumnCount     =   2
      ColumnWidths    =   "80%,20%"
      ControlID       =   ""
      Enabled         =   True
      HasHeader       =   False
      Height          =   293
      HighlightSortedColumn=   True
      Index           =   -2147483648
      Indicator       =   ""
      InitialValue    =   "Name	Pages"
      LastAddedRowIndex=   0
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      NoRowsMessage   =   ""
      RowCount        =   0
      RowSelectionType=   1
      Scope           =   0
      SearchCriteria  =   ""
      SelectedRowColor=   &c0272D300
      SelectedRowIndex=   0
      TabIndex        =   1
      Tooltip         =   ""
      Top             =   48
      Visible         =   True
      Width           =   226
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label1
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   2
      Text            =   "PDFs available:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   226
      _mPanelIndex    =   -1
   End
   Begin WebFileUploader Uploader
      Caption         =   "Select"
      ControlID       =   ""
      Enabled         =   True
      Filter          =   ""
      Height          =   269
      Hint            =   ""
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      MaximumBytes    =   0
      MaximumFileCount=   0
      Scope           =   0
      TabIndex        =   3
      Tooltip         =   ""
      Top             =   387
      UploadTimeout   =   0
      Visible         =   True
      Width           =   226
      _mPanelIndex    =   -1
   End
   Begin WebLabel Label2
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   4
      Text            =   "Upload your own test file:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   353
      Underline       =   False
      Visible         =   True
      Width           =   226
      _mPanelIndex    =   -1
   End
   Begin WebImageViewer View
      ControlID       =   ""
      Enabled         =   True
      Height          =   578
      HorizontalAlignment=   2
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   258
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Picture         =   0
      Scope           =   0
      SVGData         =   ""
      TabIndex        =   5
      Tooltip         =   ""
      Top             =   48
      URL             =   ""
      VerticalAlignment=   2
      Visible         =   True
      Width           =   659
      _mPanelIndex    =   -1
      _ProtectImage   =   False
   End
   Begin WebLabel Label3
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   258
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   5
      Text            =   "Current PDF:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   123
      _mPanelIndex    =   -1
   End
   Begin WebLabel PDFINfo
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   393
      LockBottom      =   False
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   6
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   14
      Underline       =   False
      Visible         =   True
      Width           =   512
      _mPanelIndex    =   -1
   End
   Begin WebButton UploadButton
      AllowAutoDisable=   False
      Cancel          =   False
      Caption         =   "Upload"
      ControlID       =   ""
      Default         =   False
      Enabled         =   False
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   143
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Scope           =   0
      TabIndex        =   7
      Tooltip         =   ""
      Top             =   632
      Visible         =   True
      Width           =   100
      _mPanelIndex    =   -1
   End
   Begin WebSlider MySlider
      ControlID       =   ""
      Enabled         =   True
      Height          =   18
      Index           =   -2147483648
      Indicator       =   ""
      Left            =   258
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      MaximumValue    =   1
      MinimumValue    =   1
      Scope           =   0
      StepValue       =   1
      TabIndex        =   8
      Tooltip         =   ""
      Top             =   638
      Value           =   1
      Visible         =   True
      Width           =   507
      _mPanelIndex    =   -1
   End
   Begin WebLink Link1
      Appearance      =   0
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   9
      Target          =   2
      Text            =   "©2010-2014 by Monkeybread Software. Visit our blog for news"
      TextAlignment   =   ""
      TextColor       =   &c0000FF00
      Tooltip         =   ""
      Top             =   666
      Underline       =   False
      URL             =   "http://www.mbsplugins.de/"
      Visible         =   True
      Width           =   421
      _mPanelIndex    =   -1
   End
   Begin WebLink Link2
      Appearance      =   0
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   529
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   10
      Target          =   2
      Text            =   "Raster PDF using MBS Real Studio DynaPDF Pro Plugin"
      TextAlignment   =   ""
      TextColor       =   &c0000FF00
      Tooltip         =   ""
      Top             =   666
      Underline       =   False
      URL             =   "http://www.monkeybreadsoftware.de/realbasic/plugin-dynapdf.shtml"
      Visible         =   True
      Width           =   403
      _mPanelIndex    =   -1
   End
   Begin WebLabel PageInfo
      Bold            =   False
      ControlID       =   ""
      Enabled         =   True
      FontName        =   ""
      FontSize        =   0.0
      Height          =   22
      Index           =   -2147483648
      Indicator       =   ""
      Italic          =   False
      Left            =   777
      LockBottom      =   True
      LockedInPosition=   False
      LockHorizontal  =   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      LockVertical    =   False
      Multiline       =   False
      Scope           =   0
      TabIndex        =   11
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   634
      Underline       =   False
      Visible         =   True
      Width           =   155
      _mPanelIndex    =   -1
   End
End
#tag EndWebPage

#tag WindowCode
	#tag Event
		Sub Close()
		  ClearPDF
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  LoadSamples
		  ClearPDF
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearPDF()
		  if work<>Nil then
		    work.CancelClear
		  end if
		  
		  view.Picture = nil
		  MySlider.Enabled = false
		  MySlider.Value = 1
		  MySlider.Maximum = 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadPDF(file as FolderItem, name as string)
		  
		  MySlider.Enabled = false
		  
		  if work<>Nil then
		    work.CancelClear
		  end if
		  
		  if CurrentPDF = nil then
		    CurrentPDF = new MyDynaPDFMBS
		    
		    call CurrentPDF.CreateNewPDF(nil)
		    call CurrentPDF.SetImportFlags(CurrentPDF.kifImportAsPage)
		    call CurrentPDF.SetJPEGQuality(80)
		    
		    dim profiles as new DynaPDFColorProfilesMBS
		    
		    Profiles.DefInCMYK = nil // default
		    Profiles.DefInGray = nil // default
		    Profiles.DefInRGB = nil // default
		    Profiles.DeviceProfile = nil // sRGB
		    Profiles.SoftProof = nil // default
		    
		    call CurrentPDF.InitColorManagement(profiles, CurrentPDF.kcsDeviceRGB, CurrentPDF.kicmBPCompensation) 
		    
		  end if
		  
		  if CurrentPDF.OpenImportFile(file, 0, "")>=0 then
		    PageCount = CurrentPDF.GetInPageCount
		    CurrentPage = 1
		    
		    MySlider.Value = 1
		    MySlider.Maximum = PageCount
		    MySlider.Enabled = true
		    
		    PageInfo.text = str(CurrentPage)+" of "+str(pagecount)
		    CurrentFilename = name
		    
		    Title = CurrentFilename + " - "+str(CurrentPage)+" of "+str(pagecount)
		    
		    PDFINfo.text = CurrentFilename
		    
		    RenderView true
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSamples()
		  dim u as integer = UBound(app.SampleFiles)
		  
		  for i as integer = 0 to u
		    FileList.AddRow app.SampleNames(i)
		    FileList.Cell(FileList.LastIndex,1) = str(app.SamplePageCount(i))
		    FileList.RowTag(FileList.LastIndex) = app.SampleFiles(i)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RenderView(DocChanged as Boolean = false)
		  if CurrentPDF<>Nil then
		    if work = nil then
		      work = new WorkThread(session)
		    end if
		    
		    work.Render self, CurrentPDF, DocChanged
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CurrentFilename As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentPage As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentPDF As MyDynaPDFMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		PageCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Work As WorkThread
	#tag EndProperty


#tag EndWindowCode

#tag Events FileList
	#tag Event
		Sub SelectionChanged(Rows() as Integer)
		  if me.ListIndex < 0 then
		    ClearPDF
		  else
		    LoadPDF me.RowTag(me.ListIndex), me.Cell(me.ListIndex,0)
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Opening()
		  me.ColumnStyle(1) = RightAlignStyle
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Uploader
	#tag Event
		Sub FileAdded(Filename As String, Bytes as UInt64, MimeType as String)
		  
		  UploadButton.Enabled = me.FileCount>0
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileRemoved(Filename As String)
		  UploadButton.Enabled = me.FileCount>0
		End Sub
	#tag EndEvent
	#tag Event
		Sub UploadFinished(Files() As WebUploadedFile)
		  dim uploadFolder as FolderItem = FindFolder("uploads")
		  
		  for each file as WebUploadedFile in files
		    dim destfile as FolderItem = WriteUniqueFile(uploadFolder, file.Data, file.Name)
		    
		    if destfile<>Nil then
		      dim n as integer = GetPDFPageCount(destfile)
		      
		      if n>0 then
		        FileList.AddRow file.name
		        FileList.Cell(FileList.LastIndex,1) = str(n)
		        FileList.RowTag(FileList.LastIndex) = destfile
		      end if
		    end if
		  next
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events View
	#tag Event
		Sub Resized()
		  RenderView
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UploadButton
	#tag Event
		Sub Pressed()
		  me.Enabled = false
		  uploader.Upload
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MySlider
	#tag Event
		Sub ValueChanged()
		  if me.Enabled and me.value<=PageCount then
		    CurrentPage = me.Value
		    
		    // see how much we have rendered already
		    dim s as string = ""
		    if work<>nil then
		      if work.WebPictureCache<>nil then
		        dim n as integer = work.WebPictureCache.Count
		        s = " Cached: "+Format(n/PageCount, "0%")
		      end if
		    end if
		    
		    PageInfo.text = str(CurrentPage)+" of "+str(pagecount)+s
		    Title = CurrentFilename + " - "+str(CurrentPage)+" of "+str(pagecount)
		    
		    RenderView
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="_mPanelIndex"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutType"
		Visible=true
		Group="Behavior"
		InitialValue="LayoutTypes.Fixed"
		Type="LayoutTypes"
		EditorType="Enum"
		#tag EnumValues
			"0 - Fixed"
			"1 - Flex"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mDesignWidth"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_mName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabOrderWrap"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Visual Controls"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Indicator"
		Visible=false
		Group="Visual Controls"
		InitialValue=""
		Type="WebUIControl.Indicators"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Primary"
			"2 - Secondary"
			"3 - Success"
			"4 - Danger"
			"5 - Warning"
			"6 - Info"
			"7 - Light"
			"8 - Dark"
			"9 - Link"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="LayoutDirection"
		Visible=true
		Group="WebView"
		InitialValue="LayoutDirections.LeftToRight"
		Type="LayoutDirections"
		EditorType="Enum"
		#tag EnumValues
			"0 - LeftToRight"
			"1 - RightToLeft"
			"2 - TopToBottom"
			"3 - BottomToTop"
		#tag EndEnumValues
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
		Name="Index"
		Visible=false
		Group="ID"
		InitialValue=""
		Type="Integer"
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
		Name="Left"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockHorizontal"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockVertical"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Behavior"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Behavior"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="_ImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Behavior"
		InitialValue="Untitled"
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="IsImplicitInstance"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentPage"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PageCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CurrentFilename"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
