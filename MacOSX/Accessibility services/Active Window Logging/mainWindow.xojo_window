#tag Window
Begin Window mainWindow
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
   MenuBar         =   -1154169717
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Accessibility Observer"
   Visible         =   True
   Width           =   600
   Begin ListBox List
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   287
      HelpTag         =   ""
      Hierarchical    =   False
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
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   302
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin ListBox Liste
      AllowAutoHideScrollbars=   True
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
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
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   287
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   313
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   288
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  
		  if AccessibilityMBS.Available then
		    if AccessibilityMBS.AXAPIEnabled then
		      List.InsertRow 0,"Listing..."
		    else
		      List.InsertRow 0,"Accessibility API is not enabled."
		    end if
		    
		    ce=new MyCarbonEvents
		    ce.Listen
		  else
		    MsgBox "This test requires Mac OS X 10.2"
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Switched(processSerial as memoryBlock)
		  // Application switched
		  
		  dim p as ProcessMBS
		  dim e as AXUIElementMBS
		  dim v as AXValueMBS
		  dim f as AXUIElementMBS
		  dim pid,error,err as integer
		  dim i,c as integer
		  
		  p=new ProcessMBS
		  p.GetProcess(processSerial)
		  
		  pid=p.ProcessID
		  
		  c=UBound(apps)
		  for i=1 to c
		    if pid=apps(i) then
		      Return // allready observing
		    end if
		  next
		  
		  e=AccessibilityMBS.SystemWideAXUIElement
		  if e<>nil then
		    v=e.AttributeValue(AccessibilityMBS.kAXFocusedApplicationAttribute)
		    
		    if v<>Nil and v.Type=AccessibilityMBS.kAXUIElementMBSTypeID then
		      
		      o=new MyObserver
		      
		      error=o.Create(pid)
		      
		      f=new AXUIElementMBS
		      f.Handle=v.Handle // just clone for the one line:
		      err=o.AddNotification(f,AccessibilityMBS.kAXApplicationDeactivatedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXApplicationActivatedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXApplicationHiddenNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXApplicationShownNotification)
		      
		      err=o.AddNotification(f,AccessibilityMBS.kAXWindowCreatedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXWindowDeminiaturizedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXWindowMiniaturizedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXWindowMovedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXWindowResizedNotification)
		      
		      err=o.AddNotification(f,AccessibilityMBS.kAXFocusedUIElementChangedNotification)
		      err=o.AddNotification(f,AccessibilityMBS.kAXFocusedWindowChangedNotification)
		      
		      'List.InsertRow 0,"Observing application """+p.Name+"""."
		      apps.Append pid
		    end if
		  end if
		  
		  Update
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  dim e1,e2,e3 as AXUIElementMBS
		  dim a1,a2,a3,a4 as AXValueMBS
		  dim typ as integer
		  dim s as String
		  
		  e1=AccessibilityMBS.SystemWideAXUIElement
		  a1=e1.AttributeValue(AccessibilityMBS.kAXFocusedApplicationAttribute)
		  
		  typ=a1.Type
		  
		  if typ=AccessibilityMBS.kAXUIElementMBSTypeID then
		    e2=new AXUIElementMBS
		    e2.Handle=a1.Handle
		    e2.RetainObject
		    
		    a2=e2.AttributeValue(AccessibilityMBS.kAXTitleAttribute)
		    if a2<>nil and a2.Type=kCFStringMBSTypeID then
		      s=a2.CFStringMBS.str
		    end if
		    
		    a3=e2.AttributeValue(AccessibilityMBS.kAXFocusedWindowAttribute)
		    
		    if a3<>nil then
		      typ=a3.Type
		      if typ=AccessibilityMBS.kAXUIElementMBSTypeID then
		        e3=new AXUIElementMBS
		        e3.Handle=a3.Handle
		        e3.RetainObject
		        
		        a4=e3.AttributeValue(AccessibilityMBS.kAXTitleAttribute)
		        if a4<>nil and a4.Type=kCFStringMBSTypeID then
		          
		          if s<>"" then
		            s=s+" - "
		          end if
		          s=s+a4.CFStringMBS.str
		        end if
		      end if
		    end if
		  end if
		  
		  if last<>s then
		    List.InsertRow 0,s
		    last=s
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected apps(0) As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ce As mycarbonEvents
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected last As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected o As myObserver
	#tag EndProperty


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
