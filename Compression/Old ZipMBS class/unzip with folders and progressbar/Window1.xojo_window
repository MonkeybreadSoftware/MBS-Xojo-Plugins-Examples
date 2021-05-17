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
   Height          =   1005
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -988454450
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   893
   Begin ProgressBar bar
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Maximum         =   1000
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   965
      Transparent     =   True
      Value           =   0.0
      Visible         =   True
      Width           =   853
   End
   Begin Thread Thread1
      DebugIdentifier =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Priority        =   5
      Scope           =   "0"
      StackSize       =   0
      TabPanelIndex   =   "0"
      ThreadID        =   0
      ThreadState     =   ""
   End
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   939
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
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
      Width           =   853
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Thread1.run
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DoWork()
		  dim f as FolderItem
		  dim z as UnZipMBS
		  dim lines(-1) as string
		  dim s as string
		  dim info as UnZipFileInfoMBS
		  dim totalsize as Int64
		  
		  f=SpecialFolder.Desktop.Child("test.zip")
		  if f=nil or f.Exists=False then
		    MsgBox "You need a test.zip file on your desktop folder."
		    Return
		  end if
		  
		  totalsize = f.Length
		  
		  NewProgressValue = 0
		  
		  z=new UnZipMBS(f)
		  
		  NewProgressMaximum = z.Count
		  
		  dim destfolder as FolderItem = f.Parent.Child("test.zip folder")
		  
		  NewListRows.Append "FileCount: "+str(z.Count)
		  
		  z.GoToFirstFile
		  do
		    
		    dim isFolder as Boolean=false
		    dim path as string = z.FileName
		    
		    
		    // we need to know text encoding, so we guess ASCII here
		    path = DefineEncoding(path, encodings.ASCII)
		    
		    
		    NewListRows.Append "CurrentFileName: "+path
		    
		    if Right(path,1)="/" then
		      isFOlder=true
		    end if
		    
		    
		    if encodings.UTF8.IsValidData(path) then
		      path = DefineEncoding(path, encodings.UTF8)
		    end if
		    
		    f = getpath(destfolder, path)
		    
		    info=z.FileInfo
		    NewListRows.Append "uncompressedSize: "+str(info.uncompressedSize)
		    NewListRows.Append "compressedSize: "+str(info.compressedSize)
		    NewListRows.Append "date: "+info.date.ShortDate+" "+info.date.ShortTime
		    
		    if isfolder then
		      f.CreateAsFolder
		    else
		      dim b as BinaryStream=f.CreateBinaryFile("")
		      
		      if b<>nil then
		        z.OpenCurrentFile
		        if z.Lasterror=0 then
		          
		          while z.eof=0
		            s=z.ReadCurrentFile(1000000)
		            b.Write s
		          wend
		          
		          z.CloseCurrentFile
		          b.Close
		        end if
		      else
		        NewListRows.Append "Failed to create binary stream for "+f.NativePath
		      end if
		    end if
		    
		    f.ModificationDate=info.Date
		    #if not TargetLinux then
		      f.CreationDate=info.date
		    #endif
		    
		    NewProgressValue = NewProgressValue + 1
		    
		    z.GoToNextFile
		  loop until z.Lasterror<>0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getpath(parent as FolderItem, path as string) As FolderItem
		  dim i,c as integer
		  
		  c=CountFields(path,"/")
		  dim f as FolderItem = parent
		  
		  for i=1 to c
		    dim s as string = NthField(path,"/",i)
		    
		    if s<>"" then
		      if f.Exists=False then
		        f.CreateAsFolder
		      end if
		      
		      f=f.Child(s)
		    end if
		  next
		  
		  Return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function str(b as boolean) As string
		  if b then 
		    Return "true"
		  else
		    Return "false"
		  end if
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		NewListRows() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		NewProgressMaximum As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NewProgressValue As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Thread1
	#tag Event
		Sub Run()
		  DoWork
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  while NewListRows.Ubound >= 0
		    dim s as string = NewListRows(0)
		    NewListRows.Remove 0
		    
		    List.AddRow s
		  wend
		  
		  if NewProgressValue <> bar.Value then
		    bar.Value = NewProgressValue
		  end if
		  
		  if NewProgressMaximum <> bar.Maximum then
		    bar.Maximum = NewProgressMaximum
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
	#tag ViewProperty
		Name="NewProgressValue"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="NewProgressMaximum"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
