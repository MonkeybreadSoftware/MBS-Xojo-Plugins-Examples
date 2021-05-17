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
   Height          =   330
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1173863511
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Statusitem"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim f as FolderItem
		  
		  e=new MyCocoaStatusItemMBS
		  
		  if not e.Available then
		    MsgBox "Cocoa not loaded."
		  end if
		  
		  Create
		  AddMenu
		  AddMenuEntryWithPicture
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub AddMenu()
		  dim a,b,c,d as MyCocoaMenuItemMBS
		  dim m as MyNSMenuMBS
		  dim p as Picture
		  
		  m=new MyNSMenuMBS
		  
		  a=new MyCocoaMenuItemMBS
		  a.CreateMenuItem "Top menu entry"
		  a.Enabled=true
		  a.Tag=1
		  items.Append a // so RB doesn't free the object.
		  m.AddItem a
		  
		  b=new MyCocoaMenuItemMBS
		  b.CreateSeparator
		  items.Append b
		  m.AddItem b
		  
		  c=new MyCocoaMenuItemMBS
		  c.CreateMenuItem "Middle menu entry"
		  c.Enabled=true
		  c.Tag=2
		  c.state=1
		  items.Append c
		  m.AddItem c
		  
		  d=new MyCocoaMenuItemMBS
		  d.CreateMenuItem "Bottom menu entry"
		  d.Enabled=false
		  d.tag=3
		  items.Append d
		  m.AddItem d
		  
		  const NSShiftKeyMask=131072
		  const NSControlKeyMask=262144
		  const NSAlternateKeyMask=524288
		  const NSCommandKeyMask=1048576
		  const NSFunctionKeyMask=8388608
		  
		  const NSF1FunctionKey=&hF704 // From NSEvents.h
		  
		  d=new MyCocoaMenuItemMBS
		  d.CreateMenuItem "Function key test",""
		  d.Enabled=true
		  d.KeyEquivalent=encodings.UTF16.chr(NSF1FunctionKey)
		  d.KeyEquivalentModifierMask=NSCommandKeyMask+NSFunctionKeyMask
		  d.tag=4
		  items.Append d
		  m.AddItem d
		  
		  d=new MyCocoaMenuItemMBS
		  d.CreateMenuItem "Last menu entry",""
		  d.Enabled=true
		  d.KeyEquivalent="A"
		  d.KeyEquivalentModifierMask=NSShiftKeyMask+NSCommandKeyMask+NSAlternateKeyMask // command-option-shift
		  d.tag=5
		  
		  p = new picture(10,10,32)
		  p.Graphics.ForeColor=rgb(0,128,0)
		  p.Graphics.fillrect 0,0,10,10
		  p.Graphics.ForeColor=rgb(255,0,0)
		  p.Graphics.filloval 0,0,10,10
		  
		  d.Image=new NSImageMBS(p)
		  items.Append d
		  m.AddItem d
		  
		  e.Menu=m
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub AddMenuEntryWithPicture()
		  
		  view=new MyNSViewMBS(0,0,128+40,130)
		  view.needsDisplay=True
		  
		  dim d as new MyCocoaMenuItemMBS
		  d.CreateMenuItem "Last menu entry",""
		  d.Enabled=true
		  d.tag=6
		  
		  d.view = view
		  
		  items.Append d
		  e.Menu.insertItem d,3
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Create()
		  dim p,m as Picture
		  dim s as String
		  dim img as NSImageMBS
		  
		  System.DebugLog "Create"
		  
		  call e.CreateMenu(-1)
		  
		  e.HighlightMode=true // clickable
		  e.Title = "Hello"
		  
		  const NSLeftMouseDownMask    = &h00002
		  const NSLeftMouseUpMask      = &H00004
		  const NSLeftMouseDraggedMask = &h00040
		  const NSPeriodicMask         = &h10000
		  
		  e.SendActionOn NSLeftMouseDownMask+NSLeftMouseUpMask
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected e As MyCocoaStatusItemMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		i As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected items(0) As NSMenuitemMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected view As MyNSViewMBS
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
		Name="i"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
