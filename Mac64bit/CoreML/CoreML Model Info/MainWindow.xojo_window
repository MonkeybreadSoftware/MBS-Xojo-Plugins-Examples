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
   MenuBar         =   478947327
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "CoreML Model Info"
   Visible         =   True
   Width           =   600
   Begin Listbox List
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
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   402
      HelpTag         =   ""
      Hierarchical    =   True
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
	#tag Method, Flags = &h0
		Function KeyType(type as integer) As string
		  dim t as string
		  
		  Select case type
		  case MLFeatureValueMBS.TypeDictionary
		    t = "Dictionary"
		  case MLFeatureValueMBS.TypeDouble
		    t = "Double"
		  case MLFeatureValueMBS.TypeImage
		    t = "Image"
		  case MLFeatureValueMBS.TypeInt64
		    t = "Int64"
		  case MLFeatureValueMBS.TypeInvalid
		    t = "Invalid"
		  case MLFeatureValueMBS.TypeMultiArray
		    t = "MultiArray"
		  case MLFeatureValueMBS.TypeString
		    t = "String"
		  case MLFeatureValueMBS.TypeSequence
		    t = "Sequence"
		  end Select
		  
		  return t
		  
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim v As Variant = Me.RowTag(row)
		  
		  if v isa NSRangeMBS then
		    dim k as NSRangeMBS = v
		    list.AddRow "Location", str(k.Location)
		    list.AddRow "Length", str(k.Length)
		    
		  elseif v isa MLImageConstraintMBS then
		    dim k as MLImageConstraintMBS = v
		    list.AddRow "pixelsWide", str(k.pixelsWide)
		    list.AddRow "pixelsHigh", str(k.pixelsHigh)
		    list.AddRow "pixelFormatType", hex(k.pixelFormatType)
		    list.addFolder "sizeConstraint", k.sizeConstraint
		    
		  elseif v isa MLImageSizeConstraintMBS then
		    dim k as MLImageSizeConstraintMBS = v
		    list.AddRow "pixelsWideRange", k.pixelsWideRange
		    list.AddRow "pixelsHighRange", k.pixelsHighRange
		    
		    dim t as string
		    Select case k.type
		    case MLImageSizeConstraintMBS.TypeUnspecified
		      t = "Unspecified"
		    case MLImageSizeConstraintMBS.TypeEnumerated
		      t = "Enumerated"
		    case MLImageSizeConstraintMBS.TypeRange
		      t = "Range"
		    end Select
		    list.AddRow "type", str(k.type)+" "+t
		    
		    dim enumeratedImageSizes() as MLImageSizeMBS = k.enumeratedImageSizes
		    dim u as integer = enumeratedImageSizes.Ubound
		    for i as integer = 0 to u
		      dim a as MLImageSizeMBS = enumeratedImageSizes(i)
		      List.addFolder "size "+str(i), a 
		    next
		    
		  elseif v isa MLDictionaryConstraintMBS then
		    dim k as MLDictionaryConstraintMBS = v
		    
		    dim t as string = KeyType(k.keyType)
		    List.AddRow "keyType", str(k.keyType)+" "+t
		    
		  elseif v isa MLMultiArrayConstraintMBS then
		    dim k as MLMultiArrayConstraintMBS = v
		    dim t as string
		    Select case k.dataType
		    case MLMultiArrayMBS.DataTypeFloat32
		      t = "Float32"
		    case MLMultiArrayMBS.DataTypeDouble
		      t = "Double"
		    case MLMultiArrayMBS.DataTypeInt32
		      t = "Int32"
		    end select
		    list.AddRow "dataType", hex(k.dataType)+" "+t
		    
		    dim shapes() as string
		    dim shape() as Integer = k.shape
		    for each s as integer in shape
		      shapes.Append str(s)
		    next
		    
		    list.AddRow "shape", join(shapes, ", ")
		    list.addFolder "shapeConstraint", k.shapeConstraint
		    
		  elseif v isa MLNumericConstraintMBS then
		    dim k as MLNumericConstraintMBS = v
		    list.AddRow "minNumber", str(k.minNumber)
		    list.AddRow "maxNumber", str(k.maxNumber)
		    
		    dim enumeratedNumberss() as string
		    dim enumeratedNumbers() as Double = k.enumeratedNumbers
		    for each s as integer in enumeratedNumbers
		      enumeratedNumberss.Append str(s)
		    next
		    
		    list.AddRow "Numbers", join(enumeratedNumberss, ", ")
		    
		  elseif v isa MLSequenceConstraintMBS then
		    dim k as MLSequenceConstraintMBS = v
		    list.AddRow "countRange", k.countRange
		    list.addFolder "valueDescription", k.valueDescription
		    
		  elseif v isa MLSequenceMBS then
		    
		    dim k as MLSequenceMBS = v
		    dim t as string = KeyType(k.type)
		    List.AddRow "type", str(k.Type)+" "+t
		    
		    dim int64Valuess() as string
		    dim int64Values() as Integer = k.int64Values
		    for each s as integer in int64Values
		      int64Valuess.Append str(s)
		    next
		    
		    list.AddRow "int64Values", join(int64Valuess, ", ")
		    
		    dim stringValues() as string = k.stringValues
		    list.AddRow "stringValues", join(stringValues, ", ")
		    
		    
		  elseif v isa MLKeyMBS then
		    
		    dim k as MLKeyMBS = v
		    list.AddRow "Name", k.Name
		    list.AddRow "Scope", k.Scope
		    
		  elseif v isa MLImageSizeMBS then
		    dim k as MLImageSizeMBS = v
		    list.AddRow "pixelsWide", str(k.pixelsWide)
		    list.AddRow "pixelsHigh", str(k.pixelsHigh)
		    
		  elseif v isa MLParameterDescriptionMBS then
		    
		    dim k as MLParameterDescriptionMBS = v
		    list.AddFolder "Key", k.key
		    list.AddRow "defaultValue", k.defaultValue
		    list.AddFolder "numericConstraint", k.numericConstraint
		    
		  elseif v isa MLFeatureDescriptionMBS then
		    dim md as MLFeatureDescriptionMBS = v
		    if md <> nil then
		      
		      List.AddRow "name", md.Name
		      
		      dim t as string = KeyType(md.type)
		      List.AddRow "type", str(md.Type)+" "+t
		      
		      dim o as string
		      if md.isOptional then
		        o = "Yes"
		      else
		        o = "No"
		      end if
		      List.AddRow "optional", o
		    end if
		    
		    List.AddFolder "imageConstraint", md.imageConstraint
		    List.AddFolder "dictionaryConstraint", md.dictionaryConstraint
		    List.AddFolder "multiArrayConstraint", md.multiArrayConstraint
		    List.AddFolder "sequenceConstraint", md.sequenceConstraint
		    
		  elseif v isa Dictionary then
		    dim d as Dictionary = v
		    
		    for each key as Variant in d.keys
		      dim val as Variant = d.Value(key)
		      
		      if VarType(val) = Variant.TypeObject then
		        list.AddFolder key, val
		      else
		        List.AddRow key, val
		      end if
		    next
		    
		  else
		    Break
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
