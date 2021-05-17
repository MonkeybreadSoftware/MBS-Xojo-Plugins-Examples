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
   Height          =   678
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1024636862
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   721
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   678
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   358
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   363
   End
   Begin CheckBox CheckBoxes
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Show boxes"
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
      Scope           =   "0"
      State           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   638
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   124
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Print"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   266
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   638
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim platform as string
		  
		  if TargetCocoa then
		    platform = "Cocoa"
		  elseif TargetMachO then
		    platform = "Carbon"
		  elseif TargetWin32 then
		    platform = "Win32"
		  elseif TargetLinux then
		    platform = "Linux"
		  else
		    break
		  end if
		  
		  Title = platform+" - "+RBVersionString+" - MBS "+mbs.VersionString
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  draw g
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub draw(g as Graphics)
		  g.TextSize = 10
		  g.TextFont = "Times"
		  Draw g, 0, "Times 10pt", 200,100
		  
		  g.TextSize = 12
		  g.Bold = true
		  g.TextFont = "Times"
		  Draw g, 0, "Times 12pt bold", 200,200
		  
		  g.TextSize = 14
		  g.Bold = false
		  g.TextFont = "Times"
		  Draw g, 0, "Times 14pt", 200,300
		  
		  g.TextSize = 18
		  g.italic = true
		  g.TextFont = "Times"
		  Draw g, 0, "Times 18pt italic", 200,400
		  
		  g.TextSize = 10
		  g.TextFont = "Times"
		  Draw g, 30, "Times 10pt", 150,100
		  
		  g.TextSize = 12
		  g.Bold = true
		  g.TextFont = "Times"
		  Draw g, 30, "Times 12pt bold", 150,200
		  
		  g.TextSize = 14
		  g.Bold = false
		  g.TextFont = "Times"
		  Draw g, 30, "Times 14pt", 150,300
		  
		  g.TextSize = 18
		  g.italic = true
		  g.TextFont = "Times"
		  Draw g, 30, "Times 18pt italic", 150,400
		  
		  
		  g.TextSize = 10
		  g.TextFont = "Arial"
		  Draw g, 45, "Arial 10pt", 100,100
		  
		  g.TextSize = 12
		  g.Bold = true
		  g.TextFont = "Arial"
		  Draw g, 45, "Arial 12pt bold", 100,200
		  
		  g.TextSize = 14
		  g.Bold = false
		  g.TextFont = "Arial"
		  Draw g, 45, "Arial 14pt", 100,300
		  
		  g.TextSize = 18
		  g.italic = true
		  g.TextFont = "Arial"
		  Draw g, 45, "Arial 18pt italic", 100,400
		  
		  g.TextSize = 10
		  g.TextFont = "Verdana"
		  Draw g, 70, "Verdana 10pt", 50,100
		  
		  g.TextSize = 12
		  g.Bold = true
		  g.TextFont = "Verdana"
		  Draw g, 70, "Verdana 12pt bold", 50,200
		  
		  g.TextSize = 14
		  g.Bold = false
		  g.TextFont = "Verdana"
		  Draw g, 70, "Verdana 14pt", 50,300
		  
		  g.TextSize = 18
		  g.italic = true
		  g.TextFont = "Verdana"
		  Draw g, 70, "Verdana 18pt italic", 50,400
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, rotation as double, text as string, x as integer, y as integer)
		  
		  if ShowRectangles then
		    dim width, height as Double
		    if g.MeasureRotatedTextMBS(text, width, height) then
		      g.DrawRect x, y-height, width, height
		    end if
		  end if
		  
		  g.DrawRotatedTextMBS rotation, text, x, y
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ShowRectangles As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Open()
		  dim p as new Picture(me.Width, me.Height, 32)
		  dim g as Graphics = p.Graphics
		  
		  draw g
		  
		  me.Backdrop = p
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBoxes
	#tag Event
		Sub Action()
		  ShowRectangles = me.Value
		  
		  Refresh
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  dim g as Graphics = OpenPrinterDialog
		  
		  if g = nil then Return
		  
		  draw g
		  
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
	#tag ViewProperty
		Name="ShowRectangles"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
