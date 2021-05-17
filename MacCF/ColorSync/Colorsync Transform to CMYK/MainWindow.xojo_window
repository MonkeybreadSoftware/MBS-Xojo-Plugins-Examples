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
   Height          =   534
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1812503333
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "ColorSync Transform RGB to CMYK"
   Visible         =   True
   Width           =   1052
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   500
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
   End
   Begin Canvas Canvas2
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   500
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   532
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   500
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim p As Picture = LogoMBS(500)
		  canvas1.Backdrop = p
		  
		  // Xojo pictures are in Generic RGB usually.
		  
		  Dim SourceProfileFile As FolderItem = GetFolderItem("/System/Library/ColorSync/Profiles/Generic RGB Profile.icc",  FolderItem.PathTypeShell)
		  Dim DestinProfileFile As FolderItem = GetFolderItem("/System/Library/ColorSync/Profiles/Generic CMYK Profile.icc", FolderItem.PathTypeShell)
		  
		  If SourceProfileFile.Exists = False Then
		    break
		    MsgBox "Failed to locate source profile."
		    Return
		  end if
		  
		  if DestinProfileFile.Exists = false then
		    break
		    MsgBox "Failed to locate destination profile."
		    Return
		  end if
		  
		  dim SourceProfile as new CSProfileMBS(SourceProfileFile)
		  dim DestinProfile as new CSProfileMBS(DestinProfileFile)
		  
		  if SourceProfile.Handle = 0 then
		    break
		    MsgBox "Failed to load source profile."
		    Return
		  end if
		  
		  if DestinProfile.Handle = 0 then
		    break
		    MsgBox "Failed to load destination profile."
		    Return
		  end if
		  
		  Dim options As New Dictionary
		  options.Value(CSTransformMBS.kColorSyncConvertQuality) = CSTransformMBS.kColorSyncBestQuality
		  
		  dim profilesequence(-1) as Dictionary
		  
		  dim SourceProfileDic as new Dictionary
		  dim DestinProfileDic as new Dictionary
		  
		  SourceProfileDic.Value(CSTransformMBS.kColorSyncProfile) = SourceProfile
		  DestinProfileDic.Value(CSTransformMBS.kColorSyncProfile) = DestinProfile
		  SourceProfileDic.Value(CSTransformMBS.kColorSyncRenderingIntent) = CSTransformMBS.kColorSyncRenderingIntentRelative
		  DestinProfileDic.Value(CSTransformMBS.kColorSyncRenderingIntent) = CSTransformMBS.kColorSyncRenderingIntentRelative
		  SourceProfileDic.Value(CSTransformMBS.kColorSyncTransformTag) = CSTransformMBS.kColorSyncTransformDeviceToPCS
		  DestinProfileDic.Value(CSTransformMBS.kColorSyncTransformTag) = CSTransformMBS.kColorSyncTransformPCSToDevice
		  SourceProfileDic.Value(CSTransformMBS.kColorSyncBlackPointCompensation) = True
		  DestinProfileDic.Value(CSTransformMBS.kColorSyncBlackPointCompensation) = True
		  
		  profilesequence.Append SourceProfileDic
		  profilesequence.Append DestinProfileDic
		  
		  Dim t As New CSTransformMBS(profilesequence, options)
		  
		  if t.Handle = 0 then
		    MsgBox "Failed to initialize the transformation."
		  else
		    
		    Dim toptions As New Dictionary
		    
		    toptions.Value(t.kColorSyncConvertQuality) = t.kColorSyncBestQuality
		    
		    Dim dstHeight As Integer = p.Height
		    Dim dstWidth As Integer = p.Width
		    Dim dstBytesPerPixel As Integer = 4 // CMYK
		    Dim dstBytesPerRow As Integer = dstWidth * dstBytesPerPixel
		    Dim dstDepth  As Integer = t.kColorSync8BitInteger
		    Dim dstLayout As Integer = t.kColorSyncAlphaNone
		    
		    Dim dest As New MemoryBlock(dstBytesPerRow * Height)
		    
		    If t.Convert(dest, dstDepth, dstLayout, dstBytesPerRow, p, toptions) Then
		      // read ICC Profile to embed it in JPEG file
		      Dim ProfileStream As BinaryStream = BinaryStream.Open(DestinProfileFile)
		      Dim ProfileData As String = ProfileStream.Read(ProfileStream.Length)
		      
		      
		      // save memory block as jpeg with CMYK
		      Dim je As New JPEGExporterMBS
		      
		      je.File = SpecialFolder.Desktop.Child("outputCMYK.jpg")
		      je.ProfileData = ProfileData
		      je.ExportCMYK(dest, dstWidth, dstHeight, dstBytesPerRow)
		      
		      // save memory block as jpeg with RGB
		      'dim je as New JPEGExporterMBS
		      'je.File = SpecialFolder.Desktop.Child("outputRGB.jpg")
		      'je.ExportRGB(dest, dstWidth, dstHeight, dstBytesPerRow)
		      
		      
		      canvas2.Backdrop = Picture.Open(je.file)
		      
		      
		    else
		      MsgBox "Failed to convert."
		    end if
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CopyCMYKChannel(m as MemoryBlock, width as integer, height as integer, offset as integer) As Picture
		  dim p as new Picture(width, height, 32)
		  
		  dim h as integer = height-1
		  dim w as integer = width-1
		  dim r as RGBSurface = p.RGBSurface
		  dim c as color
		  dim n as integer
		  
		  for y as integer = 0 to h
		    for x as integer = 0 to w
		      n = m.UInt8Value(width*4*y+x*4+offset)
		      c = rgb(n,n,n)
		      r.Pixel(x,y)=c
		    next
		  next
		  
		  Return p
		  
		End Function
	#tag EndMethod


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
