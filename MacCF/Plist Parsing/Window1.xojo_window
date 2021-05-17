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
   Height          =   442
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1138268237
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Textedit File types from it's info.plist"
   Visible         =   True
   Width           =   658
   Begin ListBox List
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   5
      ColumnsResizable=   True
      ColumnWidths    =   "20%,15%,30%,15%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DisabledBalloonHelp=   ""
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      FontUnit        =   0
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasBorder       =   True
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   429
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Extensions	Iconfile	Name	Role	OSTypes"
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      ScrollBarHorizontal=   False
      ScrollBarVertical=   True
      ScrollPosition  =   "0"
      ScrollPositionX =   "0"
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   -2
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   660
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  dim b as BinaryStream
		  dim s as string
		  dim co as CFObjectMBS
		  dim cb as CFBinaryDataMBS
		  dim cd as CFDictionaryMBS
		  dim ca as CFArrayMBS
		  dim i,c as integer
		  dim extension as string
		  dim iconfile as string
		  dim name as string
		  dim role as string
		  dim OStypes as string
		  
		  if not RunningOnCarbonXMBS then
		    MsgBox "This example is only for Mac OS X!"
		  end if
		  
		  f=ApplicationsFolderMBS(-32767)
		  f=f.Child("textedit.app")
		  f=f.Child("Contents")
		  f=f.Child("Info.plist")
		  
		  b=f.OpenAsBinaryFile(false)
		  s=b.Read(b.Length)
		  
		  cb=NewCFBinaryDataMBSStr(s)
		  co=NewCFObjectMBSFromXML(cb)
		  
		  cd=CFDictionaryMBS(co) // it's a dictionary as seen on the console
		  
		  // get subdictionary
		  co=cd.Value(NewCFStringMBS("CFBundleDocumentTypes"))
		  ca=CFArrayMBS(co)
		  
		  c=ca.Count-1
		  
		  for i=0 to c
		    co=ca.Item(i)
		    cd=CFDictionaryMBS(co)
		    
		    Extension=MakeString(cd.Value(NewCFStringMBS("CFBundleTypeExtensions")))
		    iconfile=MakeString(cd.Value(NewCFStringMBS("CFBundleTypeIconFile")))
		    name=MakeString(cd.Value(NewCFStringMBS("CFBundleTypeName")))
		    role=MakeString(cd.Value(NewCFStringMBS("CFBundleTypeRole")))
		    OStypes=MakeString(cd.Value(NewCFStringMBS("CFBundleTypeOSTypes")))
		    
		    List.AddRow Extension
		    List.cell(List.LastIndex,1)=iconfile
		    List.cell(List.LastIndex,2)=name
		    List.cell(List.LastIndex,3)=role
		    List.cell(List.LastIndex,4)=OStypes
		    
		  next
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function MakeString(o as cfobjectMBS) As string
		  dim i,c as integer
		  dim ca as CFArrayMBS
		  dim cs as CFStringMBS
		  dim s as string
		  
		  if o<>Nil then
		    
		    if o isa CFStringMBS then
		      cs=CFStringMBS(o)
		      if cs<>nil then
		        Return cs.str
		      end if
		    end if
		    
		    if o isa CFArrayMBS then
		      
		      ca=CFArrayMBS(o)
		      if ca<>nil then
		        c=ca.Count-1
		        s=MakeString(ca.Item(0))
		        for i=1 to c
		          s=s+", "+MakeString(ca.Item(i))
		        next
		      end if
		    end if
		    
		    Return s
		  end if
		  
		End Function
	#tag EndMethod


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
