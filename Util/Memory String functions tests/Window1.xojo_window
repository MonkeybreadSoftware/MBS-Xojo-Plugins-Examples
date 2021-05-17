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
   MenuBar         =   -1152248263
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Untitled"
   Visible         =   True
   Width           =   300
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim m,n as MemoryBlock
		  
		  m=StringToMemoryBlockMBS("Hallo")
		  
		  n=m.LeftMBS(50)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 1 failed"
		  end if
		  
		  n=m.LeftMBS(5)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 2 failed"
		  end if
		  
		  n=m.LeftMBS(3)
		  
		  if "Hal"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 3 failed"
		  end if
		  
		  n=m.LeftMBS(0)
		  
		  if n<>nil then
		    MsgBox "Test 4 failed"
		  end if
		  
		  n=m.RightMBS(50)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 5 failed"
		  end if
		  
		  n=m.RightMBS(5)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 6 failed"
		  end if
		  
		  n=m.RightMBS(3)
		  
		  if "llo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 7 failed"
		  end if
		  
		  n=m.RightMBS(0)
		  
		  if n<>nil then
		    MsgBox "Test 8 failed"
		  end if
		  
		  n=m.MidMBS(0,50)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 9 failed"
		  end if
		  
		  n=m.MidMBS(0,5)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 10 failed"
		  end if
		  
		  n=m.MidMBS(0,3)
		  
		  if "Hal"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 11 failed"
		  end if
		  
		  n=m.MidMBS(0,0)
		  
		  if n<>nil then
		    MsgBox "Test 12 failed"
		  end if
		  
		  n=m.MidMBS(0,5)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 13 failed"
		  end if
		  
		  n=m.MidMBS(5,0)
		  
		  if n<>nil then
		    MsgBox "Test 14 failed"
		  end if
		  
		  n=m.MidMBS(0,8)
		  
		  if "Hallo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 15 failed"
		  end if
		  
		  n=m.MidMBS(8,0)
		  
		  if n<>nil then
		    MsgBox "Test 16 failed"
		  end if
		  
		  n=m.MidMBS(2,2)
		  
		  if "ll"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 17 failed"
		  end if
		  
		  n=m.MidMBS(2,4)
		  
		  if "llo"<>MemoryBlockToStringMBS(n) then
		    MsgBox "Test 18 failed"
		  end if
		  
		  
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
