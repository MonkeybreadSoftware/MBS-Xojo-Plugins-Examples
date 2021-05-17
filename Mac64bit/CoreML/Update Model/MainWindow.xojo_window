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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1884944383
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Log"
   Visible         =   True
   Width           =   600
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
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   402
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
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // this example is to update a specific model.
		  // you need to change code if you have your own model
		  
		  dim InputFile as FolderItem = SpecialFolder.Desktop.Child("UpdatableDrawingClassifier.mlmodelc")
		  dim OutputFile as FolderItem = SpecialFolder.Desktop.Child("UpdatableDrawingClassifier 2.mlmodelc")
		  
		  
		  // read it
		  dim e1 as NSErrorMBS
		  Dim m As MLModelMBS = MLModelMBS.modelWithContentsOfFile(InputFIle, e1)
		  
		  if m = nil then
		    list.AddRow "Failed to load model."
		    list.AddRow e1.LocalizedDescription
		    return
		  end if
		  
		  // get description
		  dim md as MLModelDescriptionMBS = m.modelDescription
		  dim trainingInputDescriptionsByName as Dictionary = md.trainingInputDescriptionsByName
		  
		  // we need to update image and so look for the constrain, so the image can be scaled/converted to match
		  Dim imageConstraint As MLImageConstraintMBS 
		  For Each key As Variant In trainingInputDescriptionsByName.keys
		    Dim f As MLFeatureDescriptionMBS = trainingInputDescriptionsByName.Value(key)
		    
		    if f.Type = f.TypeImage then
		      imageConstraint = f.imageConstraint
		    end if
		  next
		  
		  if imageConstraint = nil then
		    list.AddRow "Failed to find image constraint."
		    return
		  end if
		  
		  dim ImageFile as FolderItem = SpecialFolder.Desktop.Child("mbslogo.png")
		  dim e2 as NSErrorMBS
		  Dim imageFeature As MLFeatureValueMBS = MLFeatureValueMBS.featureValueWithImageFile(ImageFile, imageConstraint, e2)
		  if e2 <> nil then
		    list.AddRow "Failed to read image."
		    list.AddRow e2.LocalizedDescription
		    return
		  end if
		  
		  dim interestedEvents as integer = _
		  MLUpdateProgressHandlersMBS.ProgressEventTrainingBegin+_
		  MLUpdateProgressHandlersMBS.ProgressEventMiniBatchEnd+_
		  MLUpdateProgressHandlersMBS.ProgressEventTrainingBegin
		  
		  ProgressHandler = new MLUpdateProgressHandlers(interestedEvents)
		  ProgressHandler.OutputFile = OutputFile
		  ProgressHandler.list = list
		  
		  dim dic as new Dictionary
		  
		  dic.Value("label") = "car"
		  dic.Value("drawing") = imageFeature
		  
		  dim e3 as NSErrorMBS
		  Dim feature As New MLDictionaryFeatureProviderMBS(dic, e3)
		  if e3 <> nil then
		    list.AddRow "Failed to create feature."
		    list.AddRow e3.LocalizedDescription
		    return
		  end if
		  
		  dim features() as MLFeatureProviderMBS
		  features.Append feature
		  Dim trainingData As New MLArrayBatchProviderMBS(features)
		  
		  
		  Dim configuration As New MLModelConfigurationMBS
		  configuration.computeUnits = configuration.ComputeUnitsAll
		  
		  dim error as NSErrorMBS
		  Dim task As New MLUpdateTaskMBS(InputFile, trainingData, configuration, ProgressHandler, error)
		  
		  if error <> nil then
		    list.AddRow error.LocalizedDescription
		    return
		  end if
		  
		  
		  dim parameters as new Dictionary
		  task.resumeWithParameters parameters
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ProgressHandler As MLUpdateProgressHandlers
	#tag EndProperty


#tag EndWindowCode

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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
