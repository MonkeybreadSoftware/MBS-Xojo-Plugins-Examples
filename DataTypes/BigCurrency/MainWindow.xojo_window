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
   MenuBar         =   1759858687
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // tests
		  
		  Dim b As New BigCurrency(20)
		  Dim c As New BigCurrency(10)
		  dim cc as BigCurrency = -c
		  
		  Dim d1 As BigCurrency = b + c
		  Dim e1 As BigCurrency = b - c
		  Dim f1 As BigCurrency = b * c
		  Dim g1 As BigCurrency = b / c
		  Dim h1 As BigCurrency = b \ c
		  
		  Dim dd As Double = d1.doubleValue
		  
		  Dim d2 As BigCurrency = b + 5
		  Dim e2 As BigCurrency = b - 5
		  Dim f2 As BigCurrency = b * 5
		  Dim g2 As BigCurrency = b / 5
		  Dim h2 As BigCurrency = b \ 5
		  
		  Dim d3 As BigCurrency = 5 + c
		  Dim e3 As BigCurrency = 5 - c
		  Dim f3 As BigCurrency = 5 * c
		  Dim g3 As BigCurrency = 5 / c
		  Dim h3 As BigCurrency = 5 \ c
		  
		  Dim d1s As String = d1.StringValue
		  Dim e1s As String = e1.StringValue
		  Dim f1s As String = f1.StringValue
		  Dim g1s As String = g1.StringValue
		  Dim h1s As String = h1.StringValue
		  
		  Dim d2s As String = d2.StringValue
		  Dim e2s As String = e2.StringValue
		  Dim f2s As String = f2.StringValue
		  Dim g2s As String = g2.StringValue
		  Dim h2s As String = h2.StringValue
		  
		  Dim d3s As String = d3.StringValue
		  Dim e3s As String = e3.StringValue
		  Dim f3s As String = f3.StringValue
		  Dim g3s As String = g3.StringValue
		  Dim h3s As String = h3.StringValue
		  
		  // todo double
		  'Dim d4 As BigCurrency = b + 5.5
		  'Dim e4 As BigCurrency = b - 5.5
		  'Dim f4 As BigCurrency = b * 5.5
		  'Dim g4 As BigCurrency = b / 5.5
		  'Dim h4 As BigCurrency = b \ 5.5
		  '
		  'Dim d5 As BigCurrency = 5.5 + c
		  'Dim e5 As BigCurrency = 5.5 - c
		  'Dim f5 As BigCurrency = 5.5 * c
		  'Dim g5 As BigCurrency = 5.5 / c
		  'Dim h5 As BigCurrency = 5.5 \ c
		  
		  Dim a As Currency = 5.5
		  Dim aa As New BigCurrency(a)
		  
		  Dim d6 As BigCurrency = b + a
		  Dim e6 As BigCurrency = b - a
		  Dim f6 As BigCurrency = b * a
		  Dim g6 As BigCurrency = b / a
		  Dim h6 As BigCurrency = b \ a
		  
		  Dim d7 As BigCurrency = a + c
		  Dim e7 As BigCurrency = a - c
		  Dim f7 As BigCurrency = a * c
		  Dim g7 As BigCurrency = a / c
		  Dim h7 As BigCurrency = a \ c
		  
		  If c > a Then
		    // okay
		  Else
		    Break
		  End If
		  
		  Break
		  
		  
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
