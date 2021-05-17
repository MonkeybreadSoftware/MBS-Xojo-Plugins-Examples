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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   683784566
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "fstat"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   True
      ColumnWidths    =   "40%,100,100"
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
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Mode	Right	Flags"
      Italic          =   False
      Left            =   20
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
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  const IFMT = &o0170000           //* type of file */
		  const        IFIFO  = &o0010000  //* named pipe (fifo) */
		  const        IFCHR  = &o0020000  //* character special */
		  const        IFDIR  = &o0040000  //* directory */
		  const        IFBLK  = &o0060000  //* block special */
		  const        IFREG  = &o0100000  //* regular */
		  const        IFLNK  = &o0120000  //* symbolic link */
		  const        IFSOCK = &o0140000  //* socket */
		  const        IFWHT  = &o0160000  //* whiteout */
		  
		  const IRWXU    = &o0000700    // RWX mask for owner
		  const IRUSR    = &o0000400    // R for owner
		  const IWUSR    = &o0000200    // W for owner
		  const IXUSR    = &o0000100    // X for owner
		  const IRWXG    = &o0000070    // RWX mask for group
		  const IRGRP    = &o0000040    // R for group
		  const IWGRP    = &o0000020    // W for group
		  const IXGRP    = &o0000010    // X for group
		  const IRWXO    = &o0000007    // RWX mask for other
		  const IROTH    = &o0000004    // R for other
		  const IWOTH    = &o0000002    // W for other
		  const IXOTH    = &o0000001    // X for other
		  const ISUID    = &o0004000    // set user id on execution
		  const ISGID    = &o0002000    // set group id on execution
		  const ISVTX    = &o0001000    // save swapped text even after use
		  
		  
		  dim stat as new DarwinChmodMBS
		  dim folder as FolderItem = GetFolderItem("/tmp", FolderItem.PathTypeShell)
		  
		  dim c as integer=folder.Count
		  for i as integer=1 to c
		    dim file as FolderItem = folder.Trueitem(i)
		    
		    if file<>nil then
		      
		      
		      if stat.stat(file.UnixpathMBS)=0 then
		        dim modes(-1) as string
		        dim rights(-1) as string
		        dim mode as integer = stat.mode
		        
		        if BitwiseAnd(mode, IRUSR)<>0 then
		          rights.append "r"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IWUSR)<>0 then
		          rights.append "w"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IXUSR)<>0 then
		          rights.append "x"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IRGRP)<>0 then
		          rights.append "r"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IWGRP)<>0 then
		          rights.append "w"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IXGRP)<>0 then
		          rights.append "x"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IROTH)<>0 then
		          rights.append "r"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IWOTH)<>0 then
		          rights.append "w"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, IXOTH)<>0 then
		          rights.append "x"
		        else
		          rights.Append "-"
		        end if
		        
		        if BitwiseAnd(mode, ISUID)<>0 then
		          modes.append "set uid"
		        end if
		        
		        if BitwiseAnd(mode, ISGID)<>0 then
		          modes.append "set gid"
		        end if
		        
		        if BitwiseAnd(mode, ISVTX)<>0 then
		          modes.append "save swapped text even after use"
		        end if
		        
		        dim format as integer = BitwiseAnd(mode, IFMT)
		        Select case format
		        case IFIFO
		          modes.append "named pipe (fifo)"
		        case IFCHR
		          modes.append "character special"
		        case IFDIR
		          modes.append "directory"
		        case IFBLK
		          modes.append "block special"
		        case IFREG
		          modes.append "regular"
		        case IFLNK
		          modes.append "symbolic link"
		        case IFSOCK
		          modes.append "socket"
		        case IFWHT
		          modes.append "whiteout"
		        end Select
		        
		        List.AddRow file.DisplayName
		        List.Cell(List.LastIndex,1)=oct(mode)
		        
		        List.Cell(List.LastIndex,3)=Join(modes,", ")
		        List.Cell(List.LastIndex,2)=Join(rights,"")
		        
		        
		        
		      end if
		    end if
		    
		  next
		  
		  List.ColumnAlignment(1)=list.AlignRight
		End Sub
	#tag EndEvent


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
