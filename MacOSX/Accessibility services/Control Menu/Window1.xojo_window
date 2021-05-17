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
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1136216778
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   300
   Begin Label StaticText1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   116
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MultiLine       =   True
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "You should have seen a dialog box. Else Accessibility services are not running."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   260
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   1
      Period          =   1000
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub EnableMenuItems()
		  FileTest.Enable
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if asc(Key)=32 then
		    if OpenMenu("File") then
		      'ok
		    end if
		    Return true
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileTest() As Boolean Handles FileTest.Action
			MsgBox "Menu entry File:Test selected."
			Return true
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function AXUIElement(v as cfobjectMBS) As axuIElementMBS
		  dim e as AXUIElementMBS
		  
		  if v<>Nil then
		    if v.Type=AccessibilityMBS.kAXUIElementMBSTypeID then
		      e=new AXUIElementMBS
		      e.Handle=v.Handle
		      e.RetainObject
		      e.RetainObject
		      Return e
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CFString(c as cfobjectMBS) As cfstringMBS
		  dim s as CFStringMBS
		  
		  if c<>Nil then
		    
		    // that is the new easy way
		    if c isa CFStringMBS then
		      Return CFStringMBS(c)
		    end if
		    
		    // if it fails we have a strange CFObject containing a CFString without the plugins knowing that
		    if c.Type=kCFStringMBSTypeID then
		      s=new CFStringMBS
		      s.Handle=c.Handle
		      s.RetainObject
		      Return s
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenMenu(menuname as string) As boolean
		  dim e as AXUIElementMBS
		  dim applicationElement,MenubarElement,mie,fmie,ffmie as AXUIElementMBS
		  dim ca1,ca2,ca3 as CFArrayMBS
		  dim c1,i1,c2,i2,c3,i3 as integer
		  dim co as CFObjectMBS
		  dim cs as CFStringMBS
		  
		  // get frontmost application
		  e=AccessibilityMBS.SystemWideAXUIElement
		  co=e.AttributeValue(AccessibilityMBS.kAXFocusedApplicationAttribute)
		  applicationElement=AXUIElement(co)
		  
		  // get menubar
		  co=applicationElement.AttributeValue(AccessibilityMBS.kAXMenuBarAttribute)
		  MenubarElement=AXUIElement(co)
		  
		  // get items in menubar
		  c1=MenubarElement.GetAttributeValueCount(AccessibilityMBS.kAXChildrenAttribute)
		  ca1=MenubarElement.AttributeValues(AccessibilityMBS.kAXChildrenAttribute,0,c1)
		  c1=Ca1.Count-1
		  for i1=0 to c1
		    co=ca1.Item(i1)
		    
		    mie=AXUIElement(co)
		    co=mie.AttributeValue(AccessibilityMBS.kAXTitleAttribute)
		    cs=cfstring(co)
		    if cs<>nil and cs.str=menuname then
		      'We found the menu!
		      'CFShowMBS mie.ActionNames
		      mie.PerformAction AccessibilityMBS.kAXPickAction
		      
		      // Strange, but a menubar items seems to be able to have several menus
		      c2=mie.GetAttributeValueCount(AccessibilityMBS.kAXChildrenAttribute)
		      ca2=mie.AttributeValues(AccessibilityMBS.kAXChildrenAttribute,0,c2)
		      
		      c2=Ca2.Count-1
		      for i2=0 to c2
		        co=ca2.Item(i2)
		        fmie=AXUIElement(co)
		        
		        fmie.PerformAction AccessibilityMBS.kAXPickAction
		        
		        'CFShowMBS fmie.ActionNames
		        Return true
		      next
		      exit
		    end if
		  next
		  
		  Exception
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PressMenu(menuname as string, menuitem as string) As boolean
		  dim e as AXUIElementMBS
		  dim applicationElement,MenubarElement,mie,fmie,ffmie as AXUIElementMBS
		  dim ca1,ca2,ca3 as CFArrayMBS
		  dim c1,i1,c2,i2,c3,i3 as integer
		  dim co as CFObjectMBS
		  dim cs as CFStringMBS
		  
		  // get frontmost application
		  e=AccessibilityMBS.SystemWideAXUIElement
		  co=e.AttributeValue(AccessibilityMBS.kAXFocusedApplicationAttribute)
		  applicationElement=AXUIElement(co)
		  
		  CFShowMBS NewCFStringMBS("Application Element:")
		  CFShowMBS applicationElement
		  
		  // get menubar
		  co=applicationElement.AttributeValue(AccessibilityMBS.kAXMenuBarAttribute)
		  MenubarElement=AXUIElement(co)
		  
		  CFShowMBS NewCFStringMBS("Menubar Element:")
		  CFShowMBS MenubarElement
		  
		  // get items in menubar
		  c1=MenubarElement.GetAttributeValueCount(AccessibilityMBS.kAXChildrenAttribute)
		  ca1=MenubarElement.AttributeValues(AccessibilityMBS.kAXChildrenAttribute,0,c1)
		  c1=Ca1.Count-1
		  for i1=0 to c1
		    co=ca1.Item(i1)
		    
		    mie=AXUIElement(co)
		    co=mie.AttributeValue(AccessibilityMBS.kAXTitleAttribute)
		    CFShowMBS co
		    cs=cfstring(co)
		    if cs<>nil then
		      if cs.str=menuname then
		        'We found the menu!
		        
		        // Strange, but a menubar items seems to be able to have several menus
		        c2=mie.GetAttributeValueCount(AccessibilityMBS.kAXChildrenAttribute)
		        ca2=mie.AttributeValues(AccessibilityMBS.kAXChildrenAttribute,0,c2)
		        
		        c2=Ca2.Count-1
		        for i2=0 to c2
		          co=ca2.Item(i2)
		          fmie=AXUIElement(co)
		          
		          c3=fmie.GetAttributeValueCount(AccessibilityMBS.kAXChildrenAttribute)
		          ca3=fmie.AttributeValues(AccessibilityMBS.kAXChildrenAttribute,0,c3)
		          
		          c3=Ca3.Count-1
		          for i3=0 to c3
		            co=ca3.Item(i3)
		            ffmie=AXUIElement(co)
		            
		            co=ffmie.AttributeValue(AccessibilityMBS.kAXTitleAttribute)
		            
		            cs=cfstring(co)
		            if cs<>nil and cs.str=menuitem then
		              ffmie.PerformAction(AccessibilityMBS.kAXPressAction)
		              Return true // success
		            end if
		          next
		        next
		        exit
		      end if
		    end if
		  next
		  
		  Exception
		End Function
	#tag EndMethod


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  
		  if PressMenu("File","Test") then
		    'ok
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
