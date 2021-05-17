#tag Window
Begin Window Window1
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
   MenuBar         =   779706367
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Text List"
   Visible         =   True
   Width           =   600
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
      Height          =   360
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   0.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events TextArea1
	#tag Event
		Sub Open()
		  dim tab as string = encodings.UTF8.chr(9)
		  dim tv as NSTextViewMBS = me.NSTextViewMBS
		  dim ts as NSTextStorageMBS = tv.textStorage
		  dim items() as string = array("One", "Two", "Three", "Four")
		  
		  // build our four demo text lists
		  dim tl1 as new NSTextListMBS("{disc}")
		  dim tl2 as new NSTextListMBS("{decimal}")
		  dim tl3 as new NSTextListMBS("{upper-roman}")
		  dim tl4 as new NSTextListMBS("{diamond}")
		  
		  tl1.startingItemNumber = 1
		  tl2.startingItemNumber = 1
		  tl3.startingItemNumber = 1
		  tl4.startingItemNumber = 1
		  
		  // make editible Paragraph styles
		  dim ps1 as NSMutableParagraphStyleMBS = NSParagraphStyleMBS.defaultParagraphStyle.mutableCopy
		  dim ps2 as NSMutableParagraphStyleMBS = NSParagraphStyleMBS.defaultParagraphStyle.mutableCopy
		  dim ps3 as NSMutableParagraphStyleMBS = NSParagraphStyleMBS.defaultParagraphStyle.mutableCopy
		  dim ps4 as NSMutableParagraphStyleMBS = NSParagraphStyleMBS.defaultParagraphStyle.mutableCopy
		  
		  // assign our text lists
		  ps1.setTextLists array(tl1)
		  ps2.setTextLists array(tl2)
		  ps3.setTextLists array(tl3)
		  ps4.setTextLists array(tl4)
		  
		  // add paragraph styles 
		  'ts.addAttribute ts.NSParagraphStyleAttributeName, ps1, r1
		  'ts.addAttribute ts.NSParagraphStyleAttributeName, ps2, r2
		  'ts.addAttribute ts.NSParagraphStyleAttributeName, ps3, r3
		  'ts.addAttribute ts.NSParagraphStyleAttributeName, ps4, r4
		  
		  
		  ts.appendString "Normal Dots"
		  ts.appendString EndOfLine
		  ts.appendString EndOfLine
		  
		  dim n as integer = 1
		  tl1.startingItemNumber = n
		  for each it as string in items
		    dim a as new NSMutableAttributedStringMBS
		    call a.initWithString(tab+tl1.markerForItemNumber(n)+tab+it+EndOfLine)
		    a.addAttribute a.NSParagraphStyleAttributeName, ps1, a.Range
		    n = n + 1
		    ts.appendAttributedString a
		  next
		  
		  ts.appendString EndOfLine
		  ts.appendString "Arabic Numbers"
		  ts.appendString EndOfLine
		  ts.appendString EndOfLine
		  
		  tl2.startingItemNumber = n
		  for each it as string in items
		    dim a as new NSMutableAttributedStringMBS
		    call a.initWithString(tab+tl2.markerForItemNumber(n)+tab+it+EndOfLine)
		    a.addAttribute a.NSParagraphStyleAttributeName, ps2, a.Range
		    n = n + 1
		    ts.appendAttributedString a
		  next
		  
		  ts.appendString EndOfLine
		  ts.appendString "Roman Numbers"
		  ts.appendString EndOfLine
		  ts.appendString EndOfLine
		  
		  tl3.startingItemNumber = n
		  for each it as string in items
		    dim a as new NSMutableAttributedStringMBS
		    call a.initWithString(tab+tl3.markerForItemNumber(n)+tab+it+EndOfLine)
		    a.addAttribute a.NSParagraphStyleAttributeName, ps3, a.Range
		    n = n + 1
		    ts.appendAttributedString a
		  next
		  
		  ts.appendString EndOfLine
		  ts.appendString "Diamond Dots"
		  ts.appendString EndOfLine
		  ts.appendString EndOfLine
		  
		  tl4.startingItemNumber = n
		  for each it as string in items
		    dim a as new NSMutableAttributedStringMBS
		    call a.initWithString(tab+tl4.markerForItemNumber(n)+tab+it+EndOfLine)
		    a.addAttribute a.NSParagraphStyleAttributeName, ps4, a.Range
		    n = n + 1
		    ts.appendAttributedString a
		  next
		  
		  
		  'Break // inspect in debugger
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
