#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   710
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   20371455
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CoreML Test"
   Visible         =   True
   Width           =   954
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
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
      Height          =   638
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "2"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   336
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load Model..."
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
      Scope           =   "2"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin PushButton PictureButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load Picture..."
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   159
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "2"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
   Begin Canvas PicCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   446
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   368
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "2"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   52
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   566
   End
   Begin Listbox OutputList
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
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
      Height          =   180
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   368
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   "2"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   510
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   566
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  // models are here: https://developer.apple.com/machine-learning/
		  // must be put in Xcode project to compile and get c variant
		  
		  dim f as FolderItem = GetFolderItem("Resnet50.mlmodelc")
		  
		  if f.Exists then
		    LoadModel f
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddFolder(name as string, value as Variant)
		  List.AddFolder name
		  List.RowTag(List.LastIndex) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadModel(f as FolderItem)
		  
		  if f.Name.Right(8) = ".mlmodel" then
		    
		    dim e as NSErrorMBS
		    f = MLModelMBS.compileModelFile(f, e)
		    
		    if e <> nil then
		      MsgBox "Failed to compile model."+EndOfLine+EndOfLine+e.LocalizedDescription
		      Return
		    end if
		    
		  end if
		  
		  
		  
		  // load model, to be specific: a mlmodelc folder
		  dim e as NSErrorMBS
		  dim m as MLModelMBS = MLModelMBS.modelWithContentsOfFile(f, e)
		  
		  if m = nil then
		    MsgBox "Failed to load model."+EndOfLine+EndOfLine+e.LocalizedDescription
		    return
		  end if
		  
		  // show what we know
		  
		  dim d as MLModelDescriptionMBS = m.modelDescription
		  
		  List.DeleteAllRows
		  List.AddRow "predictedFeatureName", d.predictedFeatureName
		  List.AddRow "predictedProbabilitiesName", d.predictedProbabilitiesName
		  
		  AddFolder "inputDescriptionsByName", d.inputDescriptionsByName
		  AddFolder "metadata", d.metadata
		  AddFolder "outputDescriptionsByName", d.outputDescriptionsByName
		  
		  model = m
		  PictureButton.Enabled = true
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OutputAddFolder(name as string, value as Variant)
		  OutputList.AddFolder name
		  OutputList.RowTag(OutputList.LastIndex) = value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Run(PictureFile as FolderItem)
		  dim p as Picture = Picture.Open(PictureFile)
		  
		  if p = nil then
		    break
		    MsgBox "Failed to load picture."
		    Return
		  end if
		  
		  pic = p
		  PicCanvas.Refresh
		  
		  
		  // Convert to bitmap
		  // our test model needs smaller images, e.g. 224 width/height
		  // seen in Xcode: Image<BGR,224,224>
		  dim n as new Picture(224,224)  // p.Width, p.Height)
		  n.Graphics.DrawPicture p, 0, 0, n.Width, n.Height, 0, 0, p.Width, p.Height
		  p = n
		  
		  
		  dim f as MLFeatureValueMBS = MLFeatureValueMBS.featureValueWithPicture(p)
		  if f = nil then
		    break
		    return
		  end if
		  
		  dim dic as new Dictionary
		  
		  dic.Value("image") = f
		  dim e as NSErrorMBS
		  dim d as new MLDictionaryFeatureProviderMBS(dic, e)
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription
		    Return
		  end if
		  
		  #if DebugBuild
		    'dim inputFeatureNames() as string = d.featureNames
		    dim inputImage as MLFeatureValueMBS = d.featureValueForName("image")
		    if inputImage.Type <> f.TypeImage then
		      break
		    end if
		    
		    // test write image back to disk to see if it'S correct
		    dim c as CIImageMBS = f.CIImageValue
		    dim cc as Picture = c.RenderPicture
		    dim fff as FolderItem = SpecialFolder.Desktop.Child("input1.jpg")
		    cc.Save(fff, cc.SaveAsJPEG)
		    
		    // test same with PictureValue
		    dim q as Picture = f.PictureValue
		    dim ff as FolderItem = SpecialFolder.Desktop.Child("input2.jpg")
		    q.Save(ff, q.SaveAsJPEG)
		  #endif
		  
		  dim o as MLFeatureProviderMBS = model.predictionFromFeatures(d, e)
		  
		  if e <> nil then
		    MsgBox e.LocalizedDescription
		    Return
		  end if
		  
		  dim outputFeatureNames() as string = o.featureNames
		  OutputList.DeleteAllRows
		  for each name as string in outputFeatureNames
		    dim v as MLFeatureValueMBS = o.featureValueForName(name)
		    dim type as integer = v.Type
		    Select case type
		    case v.TypeDictionary
		      dim dd as Dictionary = v.dictionaryValue
		      OutputAddFolder name, dd
		    case v.TypeString
		      OutputList.AddRow name, v.stringValue
		    case v.TypeDouble
		      OutputList.AddRow name, str(v.doubleValue)
		    case v.TypeInt64
		      OutputList.AddRow name, str(v.int64Value)
		    case v.TypeMultiArray
		      break // TODO
		    case v.TypeImage
		      Break // TODO
		    case v.TypeInvalid
		      OutputList.AddRow name
		    end Select
		  next
		  
		  
		  Exception ne as NSExceptionMBS
		    Break
		    
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Model As MLModelMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private pic As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  
		  
		  if v isa MLFeatureDescriptionMBS then
		    dim d as MLFeatureDescriptionMBS = v
		    
		    dim t as string
		    Select case d.Type
		    case d.TypeDictionary
		      t = "Dictionary"
		    case d.TypeDouble
		      t = "Double"
		    case d.TypeImage
		      t = "Image"
		    case d.TypeInt64
		      t = "Int64"
		    case d.TypeInvalid
		      t = "Invalid"
		    case d.TypeMultiArray
		      t = "MultiArray"
		    case d.TypeString
		      t = "String"
		    end Select
		    
		    List.AddRow "name", d.Name
		    List.AddRow "type", str(d.Type)+" "+t
		    
		    dim o as string
		    if d.isOptional then
		      o = "Yes"
		    else
		      o = "No"
		    end if
		    List.AddRow "optional", o
		    
		  elseif v isa Dictionary then
		    dim d as Dictionary = v
		    
		    for each key as Variant in d.keys
		      dim val as Variant = d.Value(key)
		      
		      if VarType(val) = Variant.TypeObject then
		        AddFolder key, val
		      else
		        List.AddRow key, val
		      end if
		    next
		    
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim f as FolderItem = SelectFolder
		  
		  if f <> nil then
		    LoadModel f
		  end if
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PictureButton
	#tag Event
		Sub Action()
		  
		  
		  dim f as FolderItem = GetOpenFolderItem(FileTypes1.All)
		  if f = nil then Return
		  
		  run f
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PicCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if pic <> nil then
		    
		    dim faktor as Double = min( g.Height / Pic.Height, g.Width / Pic.Width)
		    
		    // Calculate new size
		    dim w as Integer = Pic.Width * faktor
		    dim h as Integer = Pic.Height * faktor
		    
		    
		    // draw picture in the new size
		    g.DrawPicture Pic, 0, 0, w, h, 0, 0, Pic.Width, Pic.Height
		    
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
