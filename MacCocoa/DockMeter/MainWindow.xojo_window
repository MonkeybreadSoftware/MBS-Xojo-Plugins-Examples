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
   Height          =   167
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   167
   MaximizeButton  =   False
   MaxWidth        =   512
   MenuBar         =   845627224
   MenuBarVisible  =   True
   MinHeight       =   167
   MinimizeButton  =   False
   MinWidth        =   512
   Placement       =   0
   Resizeable      =   False
   Title           =   "Dock Meter"
   Visible         =   True
   Width           =   512
   Begin Timer MainTimer
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   2
      Period          =   2000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   192
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   10
      Minimum         =   1
      PageStep        =   2
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   1
      Top             =   22
      Transparent     =   True
      Value           =   1
      Visible         =   True
      Width           =   248
   End
   Begin Label Label1
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
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Update Frequency:"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   160
   End
   Begin Label Label2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   90
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Adjust the update interval using the slider. Choose between intervals from 1 to 10 seconds. The more often the Meter is updated, the higher the CPU Load the Dock Meter generates by itself, will be."
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   57
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   472
   End
   Begin Label Label3
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
      Left            =   452
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If appQuitting Then
		    Return False
		  Else
		    self.Hide
		    Return True
		  End If
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.Hide
		  
		  #if TargetCocoa then
		    dim w as NSWindowMBS = self.NSWindowMBS
		    w.FrameAutosaveName = App.LongVersion + " Main Window"
		    
		  #Else
		    self.Top = (Screen(0).AvailableHeight/2)-(self.Height/2)
		    self.Left = (Screen(0).AvailableWidth/2)-(self.Width/2)
		  #endif
		  
		  Render
		  Update
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function AboutItem() As Boolean Handles AboutItem.Action
			
			NSApplicationMBS.sharedApplication.orderFrontStandardAboutPanel
			
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub Render()
		  Dim f As FolderItem
		  f = App.ExecutableFile.Parent.Parent.Child("Resources").Child("BackgroundImage.png")
		  
		  dim m as new CDAngularMeterMBS(256, 256, CDBaseChartMBS.kTransparent, CDBaseChartMBS.kTransparent, 0)
		  m.setMeter(128, 128, 108, -135, 135)
		  m.setScale(0, 100, 10)
		  m.setLineWidth(0, 3, 0)
		  
		  If f<>Nil Then
		    If f.Exists Then
		      m.setWallpaper(f)
		    End If
		  End If
		  
		  call m.addPointer(value, &c19191900, &c19191900)
		  
		  Dim CPUChartPicture As Picture = m.makeChartPicture
		  Dim CPUChartMask as Picture = CPUChartPicture.mask
		  CPUChartMask.Graphics.ForeColor = &cFFFFFF
		  CPUChartMask.Graphics.FillRect(0,0, CPUChartMask.Width, CPUChartMask.Height)
		  CPUChartMask.Graphics.ForeColor = &c000000
		  CPUChartMask.Graphics.FillOval(2, 2, 252, 252)
		  
		  
		  dim g as Graphics = App.DockItem.Graphics
		  g.ClearRect(0, 0, g.Width, g.Height)
		  g.DrawPicture(CPUChartPicture, 0, 0, g.Width, g.Height)
		  App.DockItem.UpdateNow
		  
		  #if DebugBuild then
		    'DebugWindow.Backdrop = CPUChartPicture
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  dim totalticks,systicks, idleticks, niceticks, userticks as integer
		  dim d as DarwinVMStatisticsMBS
		  
		  if last=nil then
		    last=GetDarwinVMStatisticsMBS
		    
		  else
		    d=GetDarwinVMStatisticsMBS
		    
		    systicks =abs(d.CPUTicksSystem-last.CPUTicksSystem)
		    userticks=abs(d.CPUTicksUser-last.CPUTicksUser)
		    idleticks=abs(d.CPUTicksIdle-last.CPUTicksIdle)
		    niceticks=abs(d.CPUTicksNice-last.CPUTicksNice)
		    
		    totalticks=userticks+idleticks+niceticks+systicks
		    
		    value = (systicks/totalticks) * 100
		    
		    last=d
		    
		    Render
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected last As darwinVMStatisticsMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		value As Double
	#tag EndProperty


#tag EndWindowCode

#tag Events MainTimer
	#tag Event
		Sub Action()
		  update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  MainTimer.Period = Me.Value * 1000
		  Label3.Text = Str(Me.Value)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  MainTimer.Period = Me.Value * 1000
		  
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
		Name="value"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Double"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
