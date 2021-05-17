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
   MenuBar         =   -1152987447
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
		  dim s as StackObjectMBS
		  dim o as Object
		  
		  s=new StackObjectMBS
		  
		  if s.Deep<>0 then
		    MsgBox "1. Deep is not working correct."
		  end if
		  
		  if s.top<>nil then
		    MsgBox "2. Top is not working correct."
		  end if
		  
		  if s.pop<>nil then
		    MsgBox "3. Pop is not working correct."
		  end if
		  
		  if not s.Push(app) then
		    MsgBox "4. Push has a problem."
		  end if
		  
		  if s.Deep<>1 then
		    MsgBox "5. Deep is not working correct."
		  end if
		  
		  if s.top=nil then
		    MsgBox "6. Top is not working correct."
		  end if
		  
		  if not s.Push(self) then
		    MsgBox "7. Push has a problem."
		  end if
		  
		  if s.Deep<>2 then
		    MsgBox "8. Deep is not working correct."
		  end if
		  
		  if s.top=nil then
		    MsgBox "9. Top is not working correct."
		  end if
		  
		  o=s.pop
		  if o<>self then
		    MsgBox "10. Pop is not working correct."
		  end if
		  
		  o=s.pop
		  if o<>app then
		    MsgBox "11. Pop is not working correct."
		  end if
		  
		  if s.Deep<>0 then
		    MsgBox "12. Deep is not working correct."
		  end if
		  
		  if s.top<>nil then
		    MsgBox "13. Top is not working correct."
		  end if
		  
		  if s.pop<>nil then
		    MsgBox "14. Pop is not working correct."
		  end if
		  
		  if s.Deep<>0 then
		    MsgBox "15. Deep is not working correct."
		  end if
		  
		  if s.top<>nil then
		    MsgBox "16. Top is not working correct."
		  end if
		  
		  if s.Bottom<>nil then
		    MsgBox "17. Bottom is not working correct."
		  end if
		  
		  if s.pop<>nil then
		    MsgBox "18. Pop is not working correct."
		  end if
		  
		  if s.PopBottom<>nil then
		    MsgBox "19. Pop is not working correct."
		  end if
		  
		  if not s.Push(app) then
		    MsgBox "20. Push has a problem."
		  end if
		  
		  if s.Deep<>1 then
		    MsgBox "21. Deep is not working correct."
		  end if
		  
		  if s.top=nil then
		    MsgBox "22. Top is not working correct."
		  end if
		  
		  if s.Bottom=nil then
		    MsgBox "23. Top is not working correct."
		  end if
		  
		  if not s.Push(self) then
		    MsgBox "24. Push has a problem."
		  end if
		  
		  if s.Deep<>2 then
		    MsgBox "25. Deep is not working correct."
		  end if
		  
		  if s.top=nil then
		    MsgBox "26. Top is not working correct."
		  end if
		  
		  if s.Bottom=nil then
		    MsgBox "27. Top is not working correct."
		  end if
		  
		  if s.top<>self then
		    MsgBox "28 Top is not working correct."
		  end if
		  
		  if s.Bottom<>app then
		    MsgBox "29 Top is not working correct."
		  end if
		  
		  o=s.PopBottom
		  if o<>app then
		    MsgBox "30. Pop is not working correct."
		  end if
		  
		  o=s.PopBottom
		  if o<>self then
		    MsgBox "31. Pop is not working correct."
		  end if
		  
		  if s.Deep<>0 then
		    MsgBox "32. Deep is not working correct."
		  end if
		  
		  if s.top<>nil then
		    MsgBox "33. Top is not working correct."
		  end if
		  
		  if s.pop<>nil then
		    MsgBox "34. Pop is not working correct."
		  end if
		  
		  if s.Bottom<>nil then
		    MsgBox "35. Top is not working correct."
		  end if
		  
		  if s.PopBottom<>nil then
		    MsgBox "36. Pop is not working correct."
		  end if
		  
		  
		  MsgBox "If no msgbox before this one, everything is correct!"
		  
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
