#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1389869898
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "JavaScript"
   Visible         =   False
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "20%,60%"
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
      Height          =   195
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "ID	Field Name	Action"
      Italic          =   False
      Left            =   0
      LockBottom      =   False
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
      Top             =   0
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea TextArea1
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   194
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   0.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   206
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   601
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub run(file as FolderItem)
		  Title = file.DisplayName
		  
		  dim p as new MyDynapdfMBS
		  
		  p.SetLicenseKey "Lite" // For this example you can use Lite, Pro or Enterprise License
		  
		  call p.CreateNewPDF(nil)
		  
		  // Skip anything that is not required
		  call p.SetImportFlags p.kifImportAll+p.kifImportAsPage
		  
		  // From which PDF file do you want to extract the images?
		  call p.OpenImportFile(file, p.kptOpen, "")
		  
		  // import pages
		  call p.ImportPDFFile(1, 1.0, 1.0)
		  
		  call p.CloseImportFile
		  
		  // lookup all links
		  dim u as integer = p.GetJavaScriptCount-1
		  for i as integer = 0 to u
		    dim name as string = p.GetJavaScriptName(i)
		    dim code as string = p.GetJavaScriptEx(name)
		    
		    list.AddRow Str(i), name
		    List.RowTag(list.LastIndex) = code
		  next
		  
		  
		  // check fields
		  u = p.GetFieldCount-1
		  For i As Integer = 0 To u
		    Dim f As DynaPDFFieldExMBS = p.GetFieldEx(i)
		    
		    If f = Nil Then
		      Break // error?
		    Else
		      Dim Action As Integer = f.Action
		      Dim ActionType As Integer = f.ActionType
		      
		      If action <> -1 Then
		        ShowAction p, action, "Field "+Str(i)+" action", f.FieldName
		      End If
		      
		      Dim e As DynaPDFObjEventMBS = f.Events
		      While e <> Nil
		        
		        action = e.Action
		        ActionType = f.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Field "+Str(i)+" event", f.FieldName
		        End If
		        
		        e = e.NextObject
		      Wend
		      
		    End If
		  Next
		  
		  
		  
		  // check pages
		  u = p.GetPageCount
		  For i As Integer = 1 To u
		    Dim f As DynaPDFObjActionsMBS
		    Dim r As Integer = p.GetObjActions(p.kotPage, i, f)
		    
		    If r > 0 Then
		      If f <> Nil then
		        Dim Action As Integer = f.Action
		        Dim ActionType As Integer = f.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Page "+Str(i)+" action"
		        End If
		        
		      End If
		      
		      Dim e As DynaPDFObjEventMBS = f.Events
		      While e <> Nil 
		        Dim Action As Integer = e.Action
		        Dim ActionType As Integer = e.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Page "+Str(i)+" event"
		        End If
		        
		        
		        e = e.NextObject
		      Wend
		      
		    end if
		  Next
		  
		  
		  
		  
		  // check annotations
		  u = p.GetAnnotCount-1
		  For i As Integer = 0 To u
		    Dim f As DynaPDFObjActionsMBS
		    Dim r As Integer = p.GetObjActions(p.kotAnnotation, i, f)
		    
		    If r > 0 Then
		      If f <> Nil Then
		        Dim Action As Integer = f.Action
		        Dim ActionType As Integer = f.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Annotation "+Str(i)+" action"
		        End If
		        
		      End If
		      
		      Dim e As DynaPDFObjEventMBS = f.Events
		      While e <> Nil 
		        Dim Action As Integer = e.Action
		        Dim ActionType As Integer = e.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Annotation "+Str(i)+" event"
		        End If
		        
		        
		        e = e.NextObject
		      Wend
		      
		    End If
		  Next
		  
		  
		  
		  
		  // check bookmark
		  u = p.GetBookmarkCount-1
		  For i As Integer = 0 To u
		    Dim f As DynaPDFObjActionsMBS
		    Dim r As Integer = p.GetObjActions(p.kotBookmark, i, f)
		    
		    If r > 0 Then
		      If f <> Nil Then
		        Dim Action As Integer = f.Action
		        Dim ActionType As Integer = f.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Bookmark "+Str(i)+" action"
		        End If
		        
		      End If
		      
		      Dim e As DynaPDFObjEventMBS = f.Events
		      While e <> Nil 
		        Dim Action As Integer = e.Action
		        Dim ActionType As Integer = e.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Bookmark "+Str(i)+" event"
		        End If
		        
		        
		        e = e.NextObject
		      Wend
		      
		    End If
		  Next
		  
		  
		  
		  // check catalog
		  If True Then
		    Dim f As DynaPDFObjActionsMBS
		    Dim r As Integer = p.GetObjActions(p.kotCatalog, 0, f)
		    
		    If r > 0 Then
		      If f <> Nil Then
		        Dim Action As Integer = f.Action
		        Dim ActionType As Integer = f.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Catalog action"
		        End If
		        
		      End If
		      
		      Dim e As DynaPDFObjEventMBS = f.Events
		      While e <> Nil 
		        Dim Action As Integer = e.Action
		        Dim ActionType As Integer = e.ActionType
		        
		        If action <> -1 Then
		          ShowAction p, action, "Catalog event"
		        End If
		        
		        
		        e = e.NextObject
		      Wend
		      
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowAction(p as DynaPDFMBS, Action as integer, LabelText as string, FieldName as string = "")
		  Dim a As DynaPDFJavaScriptActionMBS = p.GetJavaScriptActionEx(Action)
		  If a <> Nil Then
		    
		    list.AddRow LabelText, FieldName, Str(Action)
		    List.RowTag(list.LastIndex) = a.Script
		    
		    // look for more...
		    While a.NextAction <> -1 
		      
		      a = p.GetJavaScriptActionEx(a.NextAction)
		      
		      If a <> Nil Then
		        list.AddRow LabelText, FieldName, Str(a.NextAction)
		        List.RowTag(list.LastIndex) = a.Script
		      Else
		        Exit While // end of list
		      End If
		    Wend
		  Else
		    Break // error?
		    
		  End If
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  if me.ListIndex = -1 then
		    TextArea1.Text = ""
		  else
		    TextArea1.Text = me.RowTag(me.ListIndex)
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
