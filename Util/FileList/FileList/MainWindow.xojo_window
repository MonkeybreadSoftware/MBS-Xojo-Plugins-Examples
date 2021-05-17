#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   567
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1104133176
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "FileList"
   Visible         =   True
   Width           =   1200
   Begin ListBox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   9
      ColumnsResizable=   False
      ColumnWidths    =   "20%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   501
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Length	Flags	ModDate	CreateDate	LastAccessDate	Type/Creator	Mac File ID	Is Hard Linked?"
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
      Top             =   52
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   1202
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin CheckBox CheckSkipFiles
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Skip Files"
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
      Scope           =   2
      State           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   150
   End
   Begin CheckBox CheckSkipFolders
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Skip Folders"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   182
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      State           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   150
   End
   Begin CheckBox CheckSkipHiddenFiles
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Skip Hidden Files"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   344
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      State           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   150
   End
   Begin CheckBox CheckSkipHiddenFolders
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Skip Hidden Folders"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   506
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      State           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   150
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  MakeTestFile // Make a test file to test unicode
		  
		  run
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Fix(s as string) As string
		  dim i,c as integer
		  dim z,t as string
		  
		  // removes non printable characters
		  
		  c=len(s)
		  for i=1 to c
		    z=mid(s,i,1)
		    if asc(z)<32 then
		      t=T+" "
		    else
		      t=T+z
		    end if
		  next
		  Return t
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub MakeTestFile()
		  // create a test file with a special unicode file name
		  
		  Dim s As String = "ƋƋƴǊƮƏ.txt"
		  Dim f As FolderItem = SpecialFolder.Desktop.Child(s)
		  If f <> Nil Then
		    Dim t As TextOutputStream = f.CreateTextFile
		    If t <> Nil Then
		      t.Write "Hello"
		    End If
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub run()
		  Dim list As listbox = Self.List
		  
		  list.DeleteAllRows
		  
		  
		  Dim SkipMode As Integer
		  
		  If CheckSkipFiles.Value Then
		    SkipMode = BitwiseOr(SkipMode, FileListMBS.SkipFiles)
		  end if
		  
		  If CheckSkipFolders.Value Then
		    SkipMode = BitwiseOr(SkipMode, FileListMBS.SkipFolders)
		  End If
		  
		  If CheckSkipHiddenFiles.Value Then
		    SkipMode = BitwiseOr(SkipMode, FileListMBS.SkipHiddenFiles)
		  End If
		  
		  If CheckSkipHiddenFolders.Value Then
		    SkipMode = BitwiseOr(SkipMode, FileListMBS.SkipHiddenFolders)
		  End If
		  
		  
		  f = New FileListMBS(SpecialFolder.Desktop, "", SkipMode)
		  
		  Dim c As Integer = f.Count
		  Title=Str(c)+" items on the desktop"
		  
		  c=c-1
		  For i As Integer = 0 To c
		    Dim s As String = f.Name(i)
		    List.AddRow s'+" "+str(len(s))+" "+str(lenb(s))
		    
		    If Not f.Directory(i) Then
		      List.Cell(List.LastIndex,1)=Format((f.PhysicalDataLength(i)+f.PhysicalResourceLength(i))/1024,"0")+" KB"
		    End If
		    
		    If f.Visible(i) Then
		      s="visible"
		    Else
		      s="invisible"
		    End If
		    
		    If f.Directory(i) Then
		      s=s+", directory"
		    End If
		    
		    List.Cell(List.LastIndex,2)=s
		    
		    Dim d As date = f.ModificationDate(i, False)
		    
		    If d = Nil Then
		      List.Cell(List.LastIndex,3)="?"
		    Else
		      List.Cell(List.LastIndex,3)=d.ShortDate+" "+d.ShortTime
		    End If
		    
		    d=New date
		    d=f.CreationDate(i, False)
		    If d = Nil Then
		      List.Cell(List.LastIndex,4)="?"
		    Else
		      List.Cell(List.LastIndex,4)=d.ShortDate+" "+d.ShortTime
		    End If
		    
		    d=f.LastAccessDate(i, False)
		    If d = Nil Then
		      List.Cell(List.LastIndex,5)="?"
		    Else
		      List.Cell(List.LastIndex,5)=d.ShortDate+" "+d.ShortTime
		    End If
		    
		    s=Fix(f.Type(i))+"/"+Fix(f.Creator(i))
		    If s<>"/" Then
		      List.Cell(List.LastIndex,6)=s
		    End If
		    
		    List.Cell(List.LastIndex,7)=Hex(f.NodeID(i))
		    
		    List.Cell(List.LastIndex,8)=Str(f.IsHardLinked(i))
		    
		    List.Celltag(List.LastIndex,0)=i // for double click
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected base As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected f As FileListMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub DoubleClick()
		  dim i as integer
		  
		  i=me.Celltag(me.ListIndex,0)
		  
		  f.item(i).Launch
		  
		  Exception
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  dim s as string
		  
		  if me.ListIndex=-1 then
		    Title=""
		  else
		    s=me.Cell(me.ListIndex,0)
		    Title=s+" "+str(len(s))+" "+str(lenb(s))
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckSkipFiles
	#tag Event
		Sub Action()
		  run
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckSkipFolders
	#tag Event
		Sub Action()
		  run
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckSkipHiddenFiles
	#tag Event
		Sub Action()
		  run
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckSkipHiddenFolders
	#tag Event
		Sub Action()
		  run
		  
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
