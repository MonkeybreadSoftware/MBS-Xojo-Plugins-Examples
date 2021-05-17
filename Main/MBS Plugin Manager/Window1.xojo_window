#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   500
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1074322817
   MenuBarVisible  =   True
   MinHeight       =   300
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   0
   Resizeable      =   True
   Title           =   "MBS Plugin Manager"
   Visible         =   True
   Width           =   500
   Begin ListBox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "80%"
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
      Height          =   449
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Part"
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
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   502
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Save and Quit"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   361
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   119
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Reload"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   280
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "All on"
      Default         =   False
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
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "All off"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   101
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   460
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  
		  #if DebugBuild
		    // ignore IDE
		  #else
		    TestForIDE
		  #endif
		  
		  Load
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

	#tag Method, Flags = &h21
		Private Function GetName(f as folderitem, name as string, n as integer) As string
		  dim h,g as FolderItem
		  
		  g=f.TrueChild(name)
		  
		  if g<>Nil then
		    h=g.TrueItem(n)
		    if h<>nil then
		      Return h.Name
		    end if
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Load()
		  dim f as FolderItem
		  
		  #if DebugBuild
		    f=FindFile("PluginsTest")
		  #else
		    f=FindFile("Plugins")
		  #endif
		  
		  if f<>nil then
		    LoadDir f
		  end if
		  
		  Title="MBS Plugin Manager: "+str(List.ListCount)+" plugin parts"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadDir(f as folderitem)
		  dim i,c as integer
		  dim g as FolderItem
		  
		  c=f.Count
		  for i=1 to c
		    g=f.TrueItem(i)
		    
		    if g<>nil then
		      if g.Directory then
		        LoadDir g
		      elseif Right(g.Name,4)=".rbx" then
		        LoadRBXPlugin g
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LoadRBXPlugin(f as folderitem)
		  dim p as PluginPart
		  dim i,c as integer
		  dim id as integer
		  dim part,name as string
		  dim pl as Plugin
		  dim v as VirtualVolume
		  dim g,root,CarbonFolder,pluginroot,buildresources as FolderItem
		  
		  const kenn = "MBS Real Studio"
		  
		  if Left(f.Name,len(kenn))=kenn then
		    part=NthField(f.Name," ",4)
		    
		    pl=new Plugin
		    pl.file=f
		    pl.filedate=f.ModificationDate
		    
		    v=f.OpenAsVirtualVolume
		    if v<>Nil then
		      
		      root=v.Root
		      
		      // search first folder
		      i=1
		      pluginroot=root.TrueItem(1)
		      while pluginroot=nil or pluginroot.Directory=false
		        i=i+1
		        pluginroot=root.TrueItem(i)
		      wend
		      
		      buildresources=pluginroot.TrueChild("Build Resources")
		      
		      CarbonFolder=buildresources.TrueChild("Mac Carbon Mach-O Universal")
		      if CarbonFolder<>nil and CarbonFolder.Exists then
		        c=CarbonFolder.count
		        for i=1 to c
		          g=CarbonFolder.TrueItem(i)
		          
		          id=i
		          name=g.Name
		          
		          p=new PluginPart
		          p.file=f
		          p.id=id
		          p.name=name
		          p.buildresources=buildresources
		          p.StateBefore=true
		          p.WindowsName=GetName(buildresources,"Windows",i)
		          p.LinuxName=GetName(buildresources,"Linux X86",i)
		          p.MacCarbonMachOName=GetName(buildresources,"Mac Carbon Mach-O Universal",i)
		          p.MacCocoaName=GetName(buildresources,"Mac Cocoa",i)
		          
		          List.AddRow name
		          List.CellTag(List.LastIndex,0)=p
		          List.CellCheck(List.LastIndex,0)=p.StateBefore
		          List.Cell(List.LastIndex,1)=part
		        next
		      end if
		      
		      CarbonFolder=buildresources.TrueChild("Mac Carbon Disabled")
		      if CarbonFolder<>nil and CarbonFolder.Exists then
		        c=CarbonFolder.count
		        for i=1 to c
		          g=CarbonFolder.TrueItem(i)
		          
		          id=i
		          name=g.Name
		          
		          p=new PluginPart
		          p.file=f
		          p.id=id
		          p.name=name
		          p.StateBefore=false
		          p.buildresources=buildresources
		          p.WindowsName=GetName(buildresources,"Windows Disabled",i)
		          p.LinuxName=GetName(buildresources,"Linux X86 Disabled",i)
		          p.MacCarbonMachOName=GetName(buildresources,"Mac Carbon Mach-O Disabled",i)
		          p.MacCocoaName=GetName(buildresources,"Mac Cocoa Disabled",i)
		          
		          List.AddRow name
		          List.CellTag(List.LastIndex,0)=p
		          List.CellCheck(List.LastIndex,0)=p.StateBefore
		          List.Cell(List.LastIndex,1)=part
		        next
		      end if
		      
		      Plugins.Append pl
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RestoreDates()
		  dim p as plugin
		  
		  for each p in Plugins
		    p.RestoreDate
		  next
		  
		  redim plugins(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Save()
		  dim i,c as integer
		  dim p as PluginPart
		  dim State as Boolean
		  
		  c=List.ListCount-1
		  for i=c downto 0 // backwards so saveing RBX works
		    State=List.CellCheck(i,0)
		    p=List.CellTag(i,0)
		    
		    if state<>p.StateBefore then
		      p.Save state
		    end if
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub TestForIDE()
		  dim p as ProcessMBS
		  
		  p=new ProcessMBS
		  
		  p.GetFirstProcess
		  
		  do
		    if p.MacCreator="RBv2" then
		      MsgBox "Please Quit RB first!"
		      quit
		      Return
		    end if
		  loop until not p.GetNextProcess
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		plugins(-1) As plugin
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Open()
		  me.ColumnType(0)=2
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Save
		  
		  List.DeleteAllRows
		  
		  RestoreDates
		  
		  Quit
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  List.DeleteAllRows
		  RestoreDates
		  Load
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  dim i,c as integer
		  
		  c=List.ListCount-1
		  
		  for i=0 to c
		    List.CellCheck(i,0)=true
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  dim i,c as integer
		  
		  c=List.ListCount-1
		  
		  for i=0 to c
		    List.CellCheck(i,0)=false
		  next
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
