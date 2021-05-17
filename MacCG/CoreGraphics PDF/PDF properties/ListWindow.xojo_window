#tag Window
Begin Window ListWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1124353581
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Drop PDF"
   Visible         =   True
   Width           =   300
   Begin ListBox List
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
      Height          =   287
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
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   302
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  do
		    if obj.FolderItemAvailable then
		      run obj.FolderItem
		    end if
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AcceptFileDrop FileTypes.ApplicationPdf
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddArrayRows(a as cgpdfarrayMBS)
		  dim i,c,j as integer
		  dim co as CGPDFObjectMBS
		  dim b as Boolean
		  dim n as string
		  dim s as CGPDFStringMBS
		  dim r as double
		  dim st as CGPDFStreamMBS
		  dim d as CGPDFDictionaryMBS
		  dim aa as CGPDFArrayMBS
		  
		  c=a.Count
		  List.AddRow "array with "+str(c)+" items."
		  c=c-1
		  for i=0 to c
		     
		    if a.ArrayValue(i,aa) then 
		      List.addfolder "Array"
		      List.CellTag(List.LastIndex,0)=a
		    elseif a.DictionaryValue(i,d) then 
		      List.addfolder "Dictionary"
		      List.CellTag(List.LastIndex,0)=a
		    elseif a.ObjectValue(i,co) then 
		      AddRows co
		    elseif a.StringValue(i,s) then 
		      List.AddRow s.Text
		    elseif a.StreamValue(i,st) then 
		      addStream st
		    elseif a.BooleanValue(i,b) then 
		      List.AddRow str(b)
		    elseif a.IntegerValue(i,j) then 
		      List.AddRow str(j)
		    elseif a.SingleValue(i,r) then 
		      List.AddRow str(r)
		    elseif a.NullValue(i) then 
		      List.AddRow "null"
		    else
		      List.AddRow "?"
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDictionaryRows(cd as cgpdfdictionaryMBS)
		  dim cl as CGPDFDictionaryListMBS
		  dim i,c as integer
		  dim co as CGPDFObjectMBS
		  
		  cl=cd.List
		  
		  if cl<>nil then
		    c=cl.Count-1
		    for i=0 to c
		      co=cl.Value(i)
		      List.Addfolder cl.Key(i)
		      List.Celltag(List.LastIndex,0)=co
		    next
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRows(co as cgpdfobjectMBS)
		  const kCGPDFObjectTypeNull = 1
		  const kCGPDFObjectTypeBoolean = 2
		  const kCGPDFObjectTypeInteger = 3
		  const kCGPDFObjectTypeReal = 4
		  const kCGPDFObjectTypeName = 5
		  const kCGPDFObjectTypeString = 6
		  const kCGPDFObjectTypeArray = 7
		  const kCGPDFObjectTypeDictionary = 8
		  const kCGPDFObjectTypeStream = 9
		  
		  dim b as Boolean
		  dim i as integer
		  dim n as string
		  dim s as CGPDFStringMBS
		  dim r as double
		  dim st as CGPDFStreamMBS
		  dim d as CGPDFDictionaryMBS
		  dim a as CGPDFArrayMBS
		  
		  Select case co.Type
		  case kCGPDFObjectTypeNull
		    List.AddRow "null?"
		  case kCGPDFObjectTypeBoolean
		    if co.BooleanValue(b) then
		      if b then
		        List.AddRow "true"
		      else
		        List.AddRow "false"
		      end if
		    else
		      List.AddRow "boolean?"
		    end if
		  case kCGPDFObjectTypeInteger
		    if co.IntegerValue(i) then
		      List.AddRow str(i)
		    else
		      List.AddRow "integer?"
		    end if
		  case kCGPDFObjectTypeReal
		    if co.SingleValue(r) then
		      List.AddRow str(r)
		    else
		      List.AddRow "real?"
		    end if
		  case kCGPDFObjectTypeName
		    if co.NameValue(n) then
		      List.AddRow n
		    else
		      List.AddRow "name?"
		    end if
		  case kCGPDFObjectTypeString
		    if co.StringValue(s) then
		      List.AddRow s.Text
		    else
		      List.AddRow "string?"
		    end if
		  case kCGPDFObjectTypeArray
		    if co.ArrayValue(a) then
		      List.addfolder "Array"
		      List.CellTag(List.LastIndex,0)=a
		    else
		      List.AddRow "array?"
		    end if
		  case kCGPDFObjectTypeDictionary
		    if co.DictionaryValue(d) then
		      List.addfolder "Dictionary"
		      List.CellTag(List.LastIndex,0)=d
		    else
		      List.AddRow "dic?"
		    end if
		    
		  case kCGPDFObjectTypeStream
		    if co.StreamValue(st) then
		      AddStream st
		    else
		      List.AddRow "stream?"
		    end if
		  end Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addStream(st as CGPDFStreamMBS)
		  dim type as integer
		  dim n as string
		  
		  n=st.Data(type)
		  List.AddRow "Data: "+leftb(n,100)
		  if type=0 then
		    List.AddRow "raw"
		  elseif type=1 then
		    List.AddRow "jpeg"
		  end if
		  
		  List.AddFolder "Dictionary"
		  List.Celltag(List.LastIndex,0)=st.Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run(f as folderitem)
		  
		  if f<>nil and f.Exists then
		    p=f.OpenAsCGPDFDocumentMBS
		    
		    if p<>nil then
		      List.AddFolder "Catalog"
		      List.Celltag(List.LastIndex,0)=p.Catalog
		    end if
		    
		    dim c as integer=p.PageCount
		    for i as integer=1 to c
		      List.AddFolder "Page "+str(i)
		      List.Celltag(List.LastIndex,0)=p.Page(i)
		    next
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		p As cgpdfdocumentMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim co as CGPDFObjectMBS
		  dim i as integer
		  dim n as Variant
		  dim a as CGPDFArrayMBS
		  dim pa as CGPDFPageMBS
		  dim d as CGPDFDictionaryMBS
		  
		  n=me.CellTag(row,0)
		  
		  if n isa CGPDFObjectMBS then
		    co=CGPDFObjectMBS(n)
		    AddRows co
		  elseif n isa cgpdfarraymbs then
		    a=cgpdfarraymbs(n)
		    AddArrayRows a
		  elseif n isa CGPDFDictionaryMBS then
		    d=CGPDFDictionaryMBS(n)
		    AddDictionaryRows d
		  elseif n isa CGPDFPageMBS then
		    pa=CGPDFPageMBS(n)
		    AddDictionaryRows pa.Dictionary
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
