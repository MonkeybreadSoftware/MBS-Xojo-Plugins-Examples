#tag Window
Begin Window TestWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   534
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   410277764
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Graphics Transform Benchmark"
   Visible         =   True
   Width           =   1276
   Begin TextArea fldResult
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
      Height          =   156
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   358
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   True
      Visible         =   True
      Width           =   1236
   End
   Begin Canvas cvsPic
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   300
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas cvsPic
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   300
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin Canvas cvsPic
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   300
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Left            =   644
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin PushButton btnOriginal
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Load Original"
      Default         =   False
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   162
   End
   Begin PushButton btnPixels
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Use RGBSurface.Pixels"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   162
   End
   Begin PushButton btnTransform
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Use Transform"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   644
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   162
   End
   Begin Canvas cvsPic
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   300
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Left            =   956
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   300
   End
   Begin PushButton btnPlugin
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Use Plugin"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   956
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   162
   End
   Begin CheckBox checkThreaded
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Threaded"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1130
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      State           =   1
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  redim Pics( 2 )
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddToResult(msg As String)
		  fldResult.AppendText msg
		  fldResult.AppendText EndOfLine
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CopyOfPicture(pic As Picture) As Picture
		  if pic is nil then return nil
		  
		  dim r as new Picture( pic.Width, pic.Height, pic.Depth )
		  r.Graphics.DrawPicture( pic, 0, 0 )
		  return r
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInvertMap() As Integer()
		  const kLastIndex = 255
		  
		  static map() as integer
		  
		  if map.Ubound <> kLastIndex then
		    redim map( kLastIndex )
		    for i as integer = 0 to kLastIndex
		      map( i ) = kLastIndex - i
		    next
		  end if
		  
		  return map
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInvertMapMB() As MemoryBlock
		  static mb as MemoryBlock
		  if mb is nil then
		    mb = new MemoryBlock( 256 )
		    dim p as Ptr = mb
		    dim map() as integer = GetInvertMap
		    for i as integer = 0 to 255
		      p.Byte( i ) = map( i )
		    next
		  end if
		  return mb
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPicture(index As Integer) As Picture
		  if Pics.Ubound = -1 then
		    return nil
		  elseif index <=  Pics.Ubound and Pics( index ) <> nil then
		    return Pics( index )
		  else
		    return Pics( 0 )
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StorePicture(index As Integer, Assigns pic As Picture)
		  if pic = nil then return
		  
		  if Pics.Ubound < index then
		    redim Pics( index )
		  end if
		  Pics( index ) = pic
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Pics() As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events cvsPic
	#tag Event
		Sub Paint(index as Integer, g As Graphics, areas() As REALbasic.Rect)
		  if Pics.Ubound < index then return
		  
		  dim pic as Picture = Pics( index )
		  if pic <> nil then
		    g.DrawPicture( pic, 0, 0, g.Width, g.Height, 0, 0, pic.Width, pic.Height )
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnOriginal
	#tag Event
		Sub Action()
		  dim pic as Picture = LogoMBS(5000)
		  
		  if pic <> nil then
		    if Pics.Ubound = -1 then
		      redim Pics( 0 )
		    end if
		    Pics( 0 ) = pic
		    
		    AddToResult "Image loaded: " + str( pic.Width ) + " X " + str( pic.Height )
		    
		    btnPixels.Enabled = true
		    btnTransform.Enabled = true
		    btnPlugin.Enabled = true
		    
		    me.Enabled = false
		  end if
		  
		  self.Refresh(False)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPixels
	#tag Event
		Sub Action()
		  #pragma BackgroundTasks False
		  #pragma BoundsChecking False
		  
		  const kPicIndex = 1
		  
		  dim pic as Picture = GetPicture( kPicIndex )
		  if pic <> nil then
		    
		    dim startTime, diffTime as double
		    dim msg as string
		    
		    dim invertedPic as Picture = CopyOfPicture( pic )
		    
		    // Invert with RGBSurface.Pixel
		    dim map() as integer = GetInvertMap
		    startTime = microseconds
		    
		    dim srcRGB as RGBSurface = invertedPic.RGBSurface
		    dim lastX as integer = pic.Width - 1
		    dim lastY as integer = pic.Height - 1
		    
		    dim thisColor as color
		    dim newRed, newGreen, newBlue as integer
		    for y as integer = 0 to lastY
		      for x as integer = 0 to lastX
		        thisColor = srcRGB.Pixel( x, y )
		        
		        newRed = map(thisColor.Red)
		        newGreen = map(thisColor.Green)
		        newBlue = map(thisColor.Blue)
		        
		        srcRGB.Pixel( x, y ) = RGB( newRed, newGreen, newBlue )
		      next x
		    next y 
		    
		    diffTime = microseconds - startTime
		    msg = "Pixel: " + format( diffTime / 10000., "#,0.000" ) + " ms"
		    AddToResult msg
		    
		    StorePicture( kPicIndex ) = invertedPic
		  end if
		  
		  self.Refresh
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnTransform
	#tag Event
		Sub Action()
		  #pragma BackgroundTasks False
		  #pragma BoundsChecking False
		  
		  const kPicIndex = 2
		  
		  dim pic as Picture = GetPicture( kPicIndex )
		  if pic <> nil then
		    
		    dim startTime, diffTime as double
		    dim msg as string
		    
		    dim map() as integer = GetInvertMap
		    dim invertedPic as Picture = CopyOfPicture( pic )
		    
		    // Invert with RGBSurface
		    startTime = microseconds
		    
		    for i as integer = 1 to 10
		      invertedPic.RGBSurface.Transform( map )
		    next
		    
		    diffTime = microseconds - startTime
		    msg = "RGBSurface: " + format( diffTime / 10000.0, "#,0.000" ) + " ms"
		    AddToResult msg
		    
		    StorePicture( kPicIndex ) = invertedPic
		  end if
		  
		  self.Refresh
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPlugin
	#tag Event
		Sub Action()
		  #pragma BackgroundTasks False
		  #pragma BoundsChecking False
		  
		  const kPicIndex = 3
		  
		  dim pic as Picture = GetPicture( kPicIndex )
		  if pic <> nil then
		    
		    dim startTime, diffTime as double
		    dim msg as string
		    dim invertedPic as Picture = CopyOfPicture( pic )
		    
		    if checkThreaded.Value then
		      dim map() as integer = GetInvertMap
		      
		      // Invert with Plugin
		      startTime = microseconds
		      
		      for i as integer = 1 to 10
		        invertedPic = pic.ThreadedTransformMBS( 0, map, map, map, invertedPic )
		      next
		      
		    else
		      dim map as MemoryBlock = GetInvertMapMB
		      
		      // Invert with Plugin
		      startTime = microseconds
		      
		      for i as integer = 1 to 10
		        invertedPic = pic.TransformColorsMBS( map, map, map, invertedPic )
		      next
		      
		    end if
		    
		    diffTime = microseconds - startTime
		    msg = "Plugin: " + format( diffTime / 10000.0, "#,0.000" ) + " ms "
		    AddToResult msg
		    
		    StorePicture( kPicIndex ) = invertedPic
		  end if
		  
		  self.Refresh
		  
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
