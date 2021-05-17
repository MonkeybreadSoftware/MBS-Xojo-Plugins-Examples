#tag Window
Begin Window ini
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   748
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1687129707
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Math Function Plot"
   Visible         =   True
   Width           =   917
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Draw"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   817
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField xmin
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   555
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "-10"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   119
   End
   Begin TextField xmax
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   686
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "+10"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   119
   End
   Begin TextField ec0
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   57
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "x^3"
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   486
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
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
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "y = "
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   37
   End
   Begin RbScript RbScript1
      EncodingFont    =   ""
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   "0"
      Source          =   ""
      State           =   0
      TabPanelIndex   =   "0"
   End
   Begin ChartDirectorControl out
      AcceptFocus     =   False
      AcceptTabs      =   False
      AllowMove       =   False
      AllowZoom       =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      border          =   True
      CleanGraphicsBeforeDrawing=   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      Height          =   680
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Overlay         =   0
      RectangleHeight =   0
      RectangleLeft   =   0
      RectangleTop    =   0
      RectangleWidth  =   0
      Scope           =   "0"
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   48
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   877
      zoomInRatio     =   1.25
      zoomOutRatio    =   0.75
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   100
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Label StaticText2
      AutoDeactivate  =   True
      Bold            =   False
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
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "You can use variables x, y, e, pi and functions like sin, cos, sqrt and others."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   726
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   877
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  ec0.SetFocus
		  
		  render
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function PrintA1() As Boolean Handles PrintA1.Action
			out.Print
			Return (True)
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub render()
		  dim xminValue  as Double = val(xmin.Text)
		  dim xmaxValue  as Double = val(xmax.Text)
		  
		  dim line as string
		  
		  if ec0.Text = "" then
		    beep
		    Return
		  end if
		  
		  //-------------------------------------------------------------------
		  //Pasamos lo que el usuario ha escrito en el ec0.Text al line invisible
		  line = "y = " + ec0.Text
		  //-------------------------------------------------------------------
		  //Ahota vamos a poner los asteriscos(signos por)
		  
		  Dim r as New RegEx
		  Dim myMatch as RegEXMatch
		  
		  // Replace 2x with 2*x
		  
		  //Donde buscar lo que hay que cambiar
		  MyMatch = r.Search(line)
		  
		  //Qué cambiar
		  r.SearchPattern="(\d+)([a-z])"
		  
		  //Qué debe aparecer
		  r.ReplacementPattern="\1*\2"
		  
		  //Todas las veces
		  r.Options.ReplaceAllMatches = True
		  
		  //Donde poner el cambio
		  line = r.replace
		  
		  
		  
		  Dim s as New RegEx
		  Dim myMatch1 as RegEXMatch
		  
		  // replace (1)(2) with (1)*(2)
		  
		  //Donde buscar lo que hay que cambiar
		  MyMatch1 = s.Search(line)
		  
		  //Qué cambiar
		  s.SearchPattern="([)]+)([(])"
		  
		  //Qué debe aparecer
		  s.ReplacementPattern="\1*\2"
		  
		  //Todas las veces
		  s.Options.ReplaceAllMatches = True
		  
		  //Donde poner el cambio
		  line = s.replace
		  
		  
		  
		  // special variables
		  dim c as new ScriptContext
		  
		  c.e = 2.7182818284
		  c.pi = 3.14159265
		  
		  line = ReplaceAll(line, "π", "pi")
		  
		  //--------------------------------------------------------------------
		  
		  redim Datax0(-1)
		  redim Datay0(-1)
		  
		  //Establecemos ini como contexto del RBScript
		  RbScript1.Context = c
		  //Decimos donde se encuentra el código del Script dentro de ini
		  RbScript1.Source = line
		  HasError = false
		  
		  //Definimos lo que queremos hacer con el Rbscript
		  dim p as integer
		  dim d as Double = xmaxValue - xminValue
		  if d<1 then d = 1.0
		  for p = 0 to 500
		    dim x as Double = xminValue + (p/500.0) * d
		    c.x = x
		    Datax0.Append x
		    RbScript1.Run    //Ejecuta el código del RBScript (TxtField1.Text)
		    if HasError then 
		      beep
		      Return
		    end if
		    Datay0.append c.y  //Añadimos el resultado en el array Datay0
		  next
		  //---------------------------------------------------
		  
		  
		  
		  //------------------------------------------------------------------------
		  
		  out.Redraw
		  
		  //------------------------------------------------------------------------
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Datax0(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Datay0(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		e As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		HasError As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		pi As Double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected x As double
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected y As double
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  render
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events xmin
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If asc(Key) = 13 or asc(Key) = 3 then
		    render
		    Return true
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events xmax
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If asc(Key) = 13 or asc(Key) = 3 then
		    render
		    Return true
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ec0
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If asc(Key) = 13 or asc(Key) = 3 then
		    render
		    Return true
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events RbScript1
	#tag Event
		Sub CompilerError(line As Integer, errorNumber As Integer, errorMsg As String)
		  HasError = true
		  
		  MsgBox "Syntax error. Please change formula."
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events out
	#tag Event
		Function Render(ViewPort As CDViewPortManagerMBS, Factor As Double, Width As Integer, Height As Integer) As CDBaseChartMBS
		  
		  
		  // Create a XYChart object of size ....
		  dim c as new CDXYChartMBS(width*factor, height*factor)
		  
		  // Set the plotarea at (55, 65) and of size ...... pixels, with white
		  // background and a light grey border (0xc0c0c0). Turn on both horizontal and
		  // vertical grid lines with light grey color (0xc0c0c0)
		  call c.setPlotArea(75*factor, 55*factor, (width-150)*factor, (height-150)*factor, c.linearGradientColor(0, 55, 0, 335, &hf9fcff, &haaccff), -1, c.kTransparent, &hffffff).setGridColor(&hFF0000, &hFF0000)
		  call c.setClipping
		  
		  
		  // Add a legend box at (50, 30) (top of the chart) with horizontal layout. Use 12
		  // pts Times Bold Italic font. Set the background and border color to
		  // Transparent.
		  c.addLegend(50, 30, false, "timesbi.ttf", 12).setBackground(c.kTransparent)
		  
		  // Add a title to the chart using 18 pts Times Bold Itatic font
		  call c.addTitle("y = " + ini.ec0.Text, "timesbi.ttf", 18)
		  
		  // Add a title to the y axis using 12 pts Arial Bold Italic font
		  call c.yAxis.setTitle("Y", "arialbi.ttf", 12)
		  
		  // Set the y axis line width to 3 pixels
		  c.yAxis.setWidth(3)
		  
		  // Add a title to the x axis using 12 pts Arial Bold Italic font
		  call c.xAxis.setTitle("X", "arialbi.ttf", 12)
		  
		  // Set the x axis line width to 3 pixels
		  c.xAxis.setWidth(3)
		  
		  // Add a red (0xff3333) line layer using dataX0 and dataY0
		  dim layer1 as CDLineLayerMBS
		  layer1 = c.addLineLayer(ini.dataY0, &hff3333, "")
		  layer1.setXData(ini.dataX0)
		  
		  // Set the line width to 3 pixels
		  layer1.setLineWidth(3)
		  
		  
		  
		  
		  Return c
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  out.UpdateMouseCursor
		  
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
		Name="e"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pi"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasError"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
