#tag Window
Begin ContainerControl OuterContainerControl
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   300
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   False
   Visible         =   True
   Width           =   500
   Begin ScrollBar VScrollBar
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   False
      Height          =   300
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   485
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   15
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  // setup inner container holding the items
		  innerContainer = New InnerContainerControl
		  
		  innerContainer.LockLeft = True
		  innerContainer.LockRight = True
		  innerContainer.LockTop = True
		  innerContainer.LockBottom = False // This control will be heigher if needed
		  
		  innerContainer.EmbedWithin(Self, 0, 0, Me.Width - VScrollBar.width, Me.Height)
		  
		  
		  #If TargetMacOS Then
		    
		    // this only works on macOS
		    
		    Dim outerView As NSViewMBS = Self.NSViewMBS
		    
		    // now build a scrollview to put between outer and inner containers
		    Dim frame As NSRectMBS = outerView.frame
		    
		    Dim ScrollView As New NSScrollViewMBS(frame.x, frame.y, frame.Width, frame.Height)
		    
		    ScrollView.hasVerticalScroller = True
		    ScrollView.hasHorizontalScroller = True
		    ScrollView.autoresizingMask = NSViewMBS.NSViewWidthSizable + NSViewMBS.NSViewHeightSizable
		    ScrollView.autoresizesSubviews = True
		    ScrollView.borderType = NSViewMBS.NSBezelBorder
		    ScrollView.pageScroll = frame.Height - 20
		    ScrollView.autohidesScrollers = False
		    
		    // optionally disable elastic scrolling
		    'ScrollView.verticalScrollElasticity = ScrollView.NSScrollElasticityNone
		    
		    Dim innerView As NSViewMBS = innerContainer.NSViewMBS
		    
		    innerView.removeFromSuperview
		    
		    ScrollView.documentView = innerView
		    
		    outerView.addSubview ScrollView
		    
		    // keep reference
		    Self.ScrollView = ScrollView 
		    
		  #Else
		    
		    // Windows, Linux or macOS with Scrollbar
		    
		    innerContainer.VScrollBar = VScrollBar
		    
		    VScrollBar.MinimumValue = 0
		    VScrollBar.MaximumValue = 0
		    VScrollBar.Value = 0
		    VScrollBar.Visible = True
		    VScrollBar.Enabled = True
		    
		    
		  #EndIf
		  
		  RaiseEvent Open
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  #If TargetMacOS Then
		    
		    If ScrollView <> Nil Then // may be called early
		      
		      Dim v As NSScrollViewMBS = ScrollView
		      
		      // adjust it
		      v.pageScroll = Me.Height - 20
		      
		    End If
		    
		  #Else
		    
		    If VScrollBar <> Nil Then // may be called early
		      
		      // adjust it
		      VScrollBar.PageStep = Me.Height - 20
		      
		      if innerContainer <> nil then
		        VScrollBar.MaximumValue = innerContainer.height - Me.Height
		      End If
		      
		    End If
		    
		  #endif
		  
		  RaiseEvent Resized
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddItem(c as ContainerControl)
		  InnerContainer.AddItem c
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateScrollbar(NewHeight as integer)
		  #If TargetMacOS Then
		    // nothing to do
		  #else
		    If VScrollBar <> Nil Then
		      VScrollBar.MaximumValue = NewHeight - Me.Height
		    End If
		  #EndIf
		  
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Resized()
	#tag EndHook


	#tag Property, Flags = &h0
		innerContainer As InnerContainerControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScrollView As Variant
	#tag EndProperty


#tag EndWindowCode

#tag Events VScrollBar
	#tag Event
		Sub ValueChanged()
		  innerContainer.top = - me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
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
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
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
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
