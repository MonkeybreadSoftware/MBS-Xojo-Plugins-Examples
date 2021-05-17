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
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   400942191
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
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
		  app.AutoQuit = true
		  
		  // let's see where documents folder is
		  dim docFolder as FolderItem = SpecialFolder.Documents
		  #if RBVersion < 2013
		    dim docPath as string = docFolder.UnixpathMBS
		  #else
		    dim docPath as string = docFolder.NativePath
		  #endif
		  
		  List.AddRow "Document folder: "+docPath
		  if docPath.instr("/Containers/") = 0 then
		    MsgBox "Please sandbox this app."
		    
		    // run command in command.txt file.
		    // you need to put your developer name in the command.txt file 
		    
		  end if
		  
		  // now our pref file
		  dim datafile as FolderItem = docFolder.Child("bookmark.pref")
		  
		  if datafile.Exists and datafile.Length>0 then
		    List.AddRow "Second run."
		    
		    // read bookmark
		    dim b as BinaryStream = BinaryStream.Open(datafile)
		    dim BookmarkData as string = b.Read(b.Length)
		    
		    // resolve bookmark
		    dim relativeURL as CFURLMBS = nil
		    dim isStale as Boolean = false
		    dim options as integer = CFBookmarkMBS.kResolutionWithoutUIMask + CFBookmarkMBS.kResolutionWithSecurityScope
		    dim url as CFURLMBS = CFBookmarkMBS.ResolveBookmarkDataToCFURLMBS(BookmarkData, options, relativeURL, isStale)
		    dim error as CFErrorMBS = CFBookmarkMBS.LastError
		    if error<>nil then
		      List.AddRow "Error: "+error.Description
		    end if
		    
		    // got something?
		    if url<>Nil then
		      dim UrlString as string = url.str.str
		      list.AddRow "URL: "+UrlString
		      
		      // start access
		      if CFBookmarkMBS.StartAccessingSecurityScopedResource(url) then
		        List.AddRow "StartAccessingSecurityScopedResource success."
		        
		        dim file as FolderItem = url.file 
		        #if RBVersion < 2013
		          dim filePath as string = file.UnixpathMBS
		        #else
		          dim filePath as string = file.NativePath
		        #endif
		        
		        List.AddRow "File: "+filePath
		        
		        // now read file
		        b = BinaryStream.Open(file)
		        dim data as string = b.Read(b.Length)
		        
		        List.AddRow "Data read: "+str(lenb(data))
		        
		        // stop access
		        CFBookmarkMBS.StopAccessingSecurityScopedResource url
		        
		        List.AddRow "Success."
		      else
		        List.AddRow "StartAccessingSecurityScopedResource failed."
		        
		      end if
		      
		    else
		      List.AddRow "failed to get URL from stored bookmark."
		    end if
		    
		  else
		    
		    
		    List.AddRow "Please select a file..."
		    
		    // pick a file
		    dim f as FolderItem = GetOpenFolderItem("")
		    if f = nil then Return
		    
		    list.AddRow "URL: "+f.URLPath
		    
		    // open file and see if we can read it
		    dim b as BinaryStream = BinaryStream.Open(f)
		    dim data as string = b.Read(b.Length)
		    
		    List.AddRow "Data read: "+str(lenb(data))
		    
		    // create bookmark data
		    dim options as integer = CFBookmarkMBS.kCreationWithSecurityScope
		    dim bookmarkData as string
		    
		    bookmarkData = CFBookmarkMBS.CreateBookmarkData(f, options)
		    dim error as CFErrorMBS = CFBookmarkMBS.LastError
		    if error<>nil then
		      List.AddRow "Error: "+error.Description
		    end if
		    
		    if lenb(bookmarkData) = 0 then
		      // failed? Maybe not sandboxed...
		      
		      List.AddRow "Failed to create bookmark."
		      Return
		      
		    end if
		    
		    // now write to data file
		    b = BinaryStream.Create(datafile, true)
		    
		    b.Write bookmarkData
		    b.Close
		    
		    List.AddRow "Saved bookmark. Please relaunch app."
		    
		  end if
		  
		  
		  
		  Exception io as IOException
		    List.AddRow "IOException: "+str(io.errorNumber)+" "+io.message
		    
		    
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
