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
   Height          =   240
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   95408127
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "NSProgressIndicator with filter"
   Visible         =   True
   Width           =   600
   Begin ProgressWheel ProgressWheelNormal
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   84
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   89
      Transparent     =   False
      Visible         =   True
      Width           =   32
   End
   Begin ProgressWheel ProgressWheelWhite
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   184
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   89
      Transparent     =   False
      Visible         =   True
      Width           =   32
   End
   Begin ProgressWheel ProgressWheelRed
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   284
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   89
      Transparent     =   False
      Visible         =   True
      Width           =   32
   End
   Begin ProgressWheel ProgressWheelGreen
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   384
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   89
      Transparent     =   False
      Visible         =   True
      Width           =   32
   End
   Begin ProgressWheel ProgressWheelBlue
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   32
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   484
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   89
      Transparent     =   False
      Visible         =   True
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
#tag EndWindowCode

#tag Events ProgressWheelWhite
	#tag Event
		Sub Open()
		  dim lighten as new CIFilterColorControlsMBS
		  
		  lighten.SetDefaults
		  lighten.inputBrightness = 1
		  
		  dim indicator as NSProgressIndicatorMBS = me.NSProgressIndicatorMBS
		  
		  dim filters() as Variant
		  filters.Append lighten
		  
		  indicator.setContentFilters filters
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressWheelRed
	#tag Event
		Sub Open()
		  dim colorPoly as new CIFilterColorPolynomialMBS
		  
		  colorPoly.SetDefaults
		  
		  dim theColor as color = &cFF0000
		  
		  dim redVector   as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Red   / 255.0, 0, 0)
		  dim greenVector as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Green / 255.0, 0, 0)
		  dim blueVector  as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Blue  / 255.0, 0, 0)
		  
		  colorPoly.inputRedCoefficients = redVector
		  colorPoly.inputGreenCoefficients = greenVector
		  colorPoly.inputBlueCoefficients = blueVector
		  
		  dim indicator as NSProgressIndicatorMBS = me.NSProgressIndicatorMBS
		  
		  dim filters() as Variant
		  filters.Append colorPoly
		  
		  indicator.setContentFilters filters
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressWheelGreen
	#tag Event
		Sub Open()
		  dim colorPoly as new CIFilterColorPolynomialMBS
		  
		  colorPoly.SetDefaults
		  
		  dim theColor as color = &c00FF00
		  
		  dim redVector   as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Red   / 255.0, 0, 0)
		  dim greenVector as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Green / 255.0, 0, 0)
		  dim blueVector  as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Blue  / 255.0, 0, 0)
		  
		  colorPoly.inputRedCoefficients = redVector
		  colorPoly.inputGreenCoefficients = greenVector
		  colorPoly.inputBlueCoefficients = blueVector
		  
		  dim indicator as NSProgressIndicatorMBS = me.NSProgressIndicatorMBS
		  
		  dim filters() as Variant
		  filters.Append colorPoly
		  
		  indicator.setContentFilters filters
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressWheelBlue
	#tag Event
		Sub Open()
		  dim colorPoly as new CIFilterColorPolynomialMBS
		  
		  colorPoly.SetDefaults
		  
		  dim theColor as color = &c0000FF
		  
		  dim redVector   as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Red   / 255.0, 0, 0)
		  dim greenVector as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Green / 255.0, 0, 0)
		  dim blueVector  as CIVectorMBS = CIVectorMBS.vectorWithXYZ(theColor.Blue  / 255.0, 0, 0)
		  
		  colorPoly.inputRedCoefficients = redVector
		  colorPoly.inputGreenCoefficients = greenVector
		  colorPoly.inputBlueCoefficients = blueVector
		  
		  dim indicator as NSProgressIndicatorMBS = me.NSProgressIndicatorMBS
		  
		  dim filters() as Variant
		  filters.Append colorPoly
		  
		  indicator.setContentFilters filters
		  
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
