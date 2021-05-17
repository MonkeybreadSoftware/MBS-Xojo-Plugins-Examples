#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   635
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1110570040
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "JPEG with LCMS"
   Visible         =   True
   Width           =   664
   Begin Canvas canGrayGeneric
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canRgbGeneric
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canCmykGeneric
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   444
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
      Width           =   200
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Gray"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label Label2
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
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "RGB"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
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
      Left            =   444
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "CMYK"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canGrayCMS
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   231
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canRgbCMS
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   231
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canCmykCMS
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   444
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   231
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label Label4
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
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Now with LCMS color matched to screen."
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   416
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   624
   End
   Begin Label lbProfileGray
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
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "???"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   386
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label lbProfileRGB
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
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "???"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   386
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label lbProfileCMYK
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
      Left            =   444
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "???"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   384
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label Label5
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
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Above the pixel put into a picture directly via Plugin."
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   199
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   624
   End
   Begin Canvas canGrayPO
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   448
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canRgbPO
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   448
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas canCmykPO
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   141
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   444
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   448
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label Label6
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
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Finally the pictures you get from Picture.Open"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   601
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   624
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  LoadCMYK
		  LoadRGB
		  LoadGray
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getScreenProfile() As FolderItem
		  #if TargetMacOS then
		    
		    dim screen as NSScreenMBS = NSScreenMBS.mainScreen
		    dim colorspace as NSColorSpaceMBS = screen.colorSpace
		    
		    return colorspace.file
		    
		  #elseif TargetWin32 then
		    
		    dim f as FolderItem = GetWindowsColorProfileMBS
		    Return f
		    
		  #else
		    // todo
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadCMYK()
		  dim file as FolderItem = FindFile("cmyk.jpg")
		  
		  canCmykPO.Backdrop = Picture.Open(file)
		  
		  // 1. simply code
		  dim jpeg as new JPEGImporterMBS
		  
		  jpeg.File = file
		  jpeg.Import
		  
		  canCmykGeneric.Backdrop = jpeg.Picture
		  
		  // 2. better code
		  jpeg = new JPEGImporterMBS
		  jpeg.Mode = jpeg.ModeRaw
		  jpeg.ReadProfileData = true
		  jpeg.File = file
		  jpeg.Import
		  
		  dim JPEGProfile as LCMS2ProfileMBS
		  
		  dim profile as string = jpeg.ProfileData
		  JPEGProfile = LCMS2ProfileMBS.OpenProfileFromString(profile)
		  
		  if JPEGProfile = nil then
		    // default profile
		    dim f as FolderItem = FindFile("Generic CMYK Profile.icc")
		    JPEGProfile = LCMS2ProfileMBS.OpenProfileFromFile(f)
		  else
		    lbProfileCMYK.Text = JPEGProfile.Name
		  end if
		  
		  dim ScreenProfile as LCMS2ProfileMBS
		  
		  #if TargetCocoa then
		    // for cocoa, we need to match to the picture color space
		    dim dummy as new Picture(10,10,32)
		    dim c as CGColorSpaceMBS = dummy.CGColorSpaceMBS
		    
		    dim data as string = c.ICCProfile
		    ScreenProfile = LCMS2ProfileMBS.OpenProfileFromString(data)
		    
		  #endif
		  
		  if ScreenProfile = nil then
		    
		    dim ScreenProfileFile as FolderItem = getScreenProfile
		    ScreenProfile = LCMS2ProfileMBS.OpenProfileFromFile(ScreenProfileFile)
		    
		    if ScreenProfile = nil then
		      // default profile
		      ScreenProfile = LCMS2ProfileMBS.CreateSRGBProfile
		    end if
		  end if
		  
		  dim InputFormat as integer = JPEGProfile.FormatterForBitmap
		  dim InputChannels as integer = LCMS2MBS.T_CHANNELS(InputFormat)
		  dim InputBytesPerSample as integer = LCMS2MBS.T_BYTES(InputFormat)
		  
		  dim OutputFormat as integer = ScreenProfile.FormatterForBitmap
		  dim OutputChannels as integer = LCMS2MBS.T_CHANNELS(OutputFormat)
		  dim OutputBytesPerSample as integer = LCMS2MBS.T_BYTES(OutputFormat)
		  
		  // now create a transform
		  dim Transform as LCMS2TransformMBS = LCMS2TransformMBS.CreateTransform(JPEGProfile, InputFormat, ScreenProfile, OutputFormat, LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, LCMS2MBS.kcmsFLAGS_BLACKPOINTCOMPENSATION)
		  
		  // Target picture
		  dim pic as new Picture(jpeg.Width, jpeg.Height, 32)
		  
		  // and bitmaps for it
		  dim inBitmap as new LCMS2BitmapMBS
		  dim outBitmap as new LCMS2BitmapMBS(pic,8)
		  
		  inBitmap.data = jpeg.PictureData
		  inBitmap.Height = jpeg.Height
		  inBitmap.Width = jpeg.Width
		  inBitmap.RowBytes = jpeg.width * 4
		  inBitmap.Bits = 8
		  inBitmap.Invert
		  
		  // and run it
		  if Transform.Transform(inBitmap, outBitmap) then
		    canCmykCMS.Backdrop = outBitmap.Picture
		  end if
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadGray()
		  dim file as FolderItem = FindFile("gray.jpg")
		  
		  canGrayPO.Backdrop = Picture.Open(file)
		  
		  // 1. simply code
		  dim jpeg as new JPEGImporterMBS
		  
		  jpeg.File = file
		  jpeg.Import
		  
		  canGrayGeneric.Backdrop = jpeg.Picture
		  
		  // 2. better code
		  jpeg = new JPEGImporterMBS
		  jpeg.Mode = jpeg.ModeRaw
		  jpeg.ReadProfileData = true
		  jpeg.File = file
		  jpeg.Import
		  
		  dim JPEGProfile as LCMS2ProfileMBS
		  
		  dim profile as string = jpeg.ProfileData
		  JPEGProfile = LCMS2ProfileMBS.OpenProfileFromString(profile)
		  
		  if JPEGProfile = nil then
		    // default profile
		    dim f as FolderItem = FindFile("Generic Gray Profile.icc")
		    JPEGProfile = LCMS2ProfileMBS.OpenProfileFromFile(f)
		  else
		    lbProfileGray.Text = JPEGProfile.Name
		  end if
		  
		  dim ScreenProfile as LCMS2ProfileMBS
		  
		  #if TargetCocoa then
		    // for cocoa, we need to match to the picture color space
		    dim dummy as new Picture(10,10,32)
		    dim c as CGColorSpaceMBS = dummy.CGColorSpaceMBS
		    
		    dim data as string = c.ICCProfile
		    ScreenProfile = LCMS2ProfileMBS.OpenProfileFromString(data)
		    
		  #endif
		  
		  if ScreenProfile = nil then
		    
		    dim ScreenProfileFile as FolderItem = getScreenProfile
		    ScreenProfile = LCMS2ProfileMBS.OpenProfileFromFile(ScreenProfileFile)
		    
		    if ScreenProfile = nil then
		      // default profile
		      ScreenProfile = LCMS2ProfileMBS.CreateSRGBProfile
		    end if
		  end if
		  
		  dim InputFormat as integer = JPEGProfile.FormatterForBitmap
		  dim OutputFormat as integer = ScreenProfile.FormatterForBitmap
		  
		  
		  // just looking on what's inside
		  dim InputChannels as integer = LCMS2MBS.T_CHANNELS(InputFormat)
		  dim OutputChannels as integer = LCMS2MBS.T_CHANNELS(OutputFormat)
		  
		  dim InputBytesPerSample as integer = LCMS2MBS.T_BYTES(InputFormat)
		  dim OutputBytesPerSample as integer = LCMS2MBS.T_BYTES(OutputFormat)
		  
		  dim t as LCMS2TransformMBS = LCMS2TransformMBS.CreateTransform(JPEGProfile, InputFormat, ScreenProfile, OutputFormat, LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, LCMS2MBS.kcmsFLAGS_BLACKPOINTCOMPENSATION)
		  
		  
		  dim pic as new Picture(jpeg.Width, jpeg.Height, 32)
		  
		  dim Bitmap1 as new LCMS2BitmapMBS(pic,8)
		  dim Bitmap2 as new LCMS2BitmapMBS
		  
		  Bitmap2.data = jpeg.PictureData
		  Bitmap2.Height = jpeg.Height
		  Bitmap2.Width = jpeg.Width
		  Bitmap2.RowBytes = jpeg.width
		  Bitmap2.Bits = 8
		  
		  if t.Transform(Bitmap2, Bitmap1) then
		    canGrayCMS.Backdrop = Bitmap1.Picture
		  end if
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadRGB()
		  dim file as FolderItem = FindFile("rgb.jpg")
		  
		  canRGBPO.Backdrop = Picture.Open(file)
		  
		  // 1. simply code
		  dim jpeg as new JPEGImporterMBS
		  
		  jpeg.File = file
		  jpeg.Import
		  
		  canRgbGeneric.Backdrop = jpeg.Picture
		  
		  // 2. better code
		  jpeg = new JPEGImporterMBS
		  jpeg.Mode = jpeg.ModeRaw
		  jpeg.File = file
		  jpeg.ReadProfileData = true
		  jpeg.Import
		  
		  dim JPEGProfile as LCMS2ProfileMBS
		  
		  dim profile as string = jpeg.ProfileData
		  JPEGProfile = LCMS2ProfileMBS.OpenProfileFromString(profile)
		  
		  if JPEGProfile = nil then
		    // default profile
		    JPEGProfile = LCMS2ProfileMBS.CreateSRGBProfile
		  else
		    lbProfileRGB.Text = JPEGProfile.Name
		  end if
		  
		  dim ScreenProfile as LCMS2ProfileMBS
		  
		  #if TargetCocoa then
		    // for cocoa, we need to match to the picture color space
		    dim dummy as new Picture(10,10,32)
		    dim c as CGColorSpaceMBS = dummy.CGColorSpaceMBS
		    
		    dim data as string = c.ICCProfile
		    ScreenProfile = LCMS2ProfileMBS.OpenProfileFromString(data)
		    
		  #endif
		  
		  if ScreenProfile = nil then
		    dim ScreenProfileFile as FolderItem = getScreenProfile
		    ScreenProfile = LCMS2ProfileMBS.OpenProfileFromFile(ScreenProfileFile)
		    
		    if ScreenProfile = nil then
		      // default profile
		      ScreenProfile = LCMS2ProfileMBS.CreateSRGBProfile
		    end if
		  end if
		  
		  dim InputFormat as integer = JPEGProfile.FormatterForBitmap
		  dim OutputFormat as integer = ScreenProfile.FormatterForBitmap
		  
		  // just looking on what's inside
		  dim InputChannels as integer = LCMS2MBS.T_CHANNELS(InputFormat)
		  dim OutputChannels as integer = LCMS2MBS.T_CHANNELS(OutputFormat)
		  
		  dim InputBytesPerSample as integer = LCMS2MBS.T_BYTES(InputFormat)
		  dim OutputBytesPerSample as integer = LCMS2MBS.T_BYTES(OutputFormat)
		  
		  dim t as LCMS2TransformMBS = LCMS2TransformMBS.CreateTransform(JPEGProfile, InputFormat, ScreenProfile, OutputFormat, LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, LCMS2MBS.kcmsFLAGS_BLACKPOINTCOMPENSATION)
		  
		  
		  dim pic as new Picture(jpeg.Width, jpeg.Height, 32)
		  
		  dim Bitmap1 as new LCMS2BitmapMBS(pic,8)
		  dim Bitmap2 as new LCMS2BitmapMBS
		  
		  Bitmap2.data = jpeg.PictureData
		  Bitmap2.Height = jpeg.Height
		  Bitmap2.Width = jpeg.Width
		  Bitmap2.RowBytes = jpeg.width * 3
		  Bitmap2.Bits = 8
		  
		  
		  if t.Transform(Bitmap2, Bitmap1) then
		    canRgbCMS.Backdrop = Bitmap1.Picture
		  end if
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
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
