#tag Window
Begin Window Window1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   93
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   716670975
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Profile associated to window"
   Visible         =   True
   Width           =   356
   Begin TextArea ProfileTextArea
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
      Height          =   35
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LimitText       =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   38
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      UseFocusRing    =   False
      Visible         =   True
      Width           =   316
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
      Text            =   "Monitor profile (move window to update)"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   316
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  #if TargetMacOS then
		    Quit
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Moved()
		  Dim ICCprofile_Name As String
		  Dim ICCprofile_Display As LCMS2ProfileMBS
		  
		  // get the profile and the name of the profile associated to the monitor on which this dialog is shown
		  ICCprofile_Name = GetWindowProfile(self.Handle, Self.Left, Self.Top, Self.Width, Self.Height, ICCprofile_Display)
		  
		  // show the profile name in the text area
		  ProfileTextArea.Text = ICCprofile_Name
		  ProfileTextArea.Alignment = TextArea.AlignCenter
		  
		  // do something with the ICCprofile_Display profile if required...
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  #if TargetMacOS then
		    Dim ICCprofile_Name As String
		    Dim ICCprofile_Display As LCMS2ProfileMBS
		    
		    // get the profile and the name of the profile associated to the monitor on which this dialog is shown
		    ICCprofile_Name = GetWindowProfile(self.Handle, Self.Left, Self.Top, Self.Width, Self.Height, ICCprofile_Display)
		    
		    // show the profile name in the text area
		    ProfileTextArea.Text = ICCprofile_Name
		    ProfileTextArea.Alignment = TextArea.AlignCenter
		    
		    // do something with the ICCprofile_Display profile if required...
		    
		  #endif
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetWindowProfile(winHandle As Integer, winLeft As Integer, winTop As Integer, winWidth As Integer, winHeight As Integer, ByRef DisplayProfile As LCMS2ProfileMBS) As String
		  Dim RetValue As Integer
		  Dim profileName As String
		  
		  // GET THE PROFILE AND PROFILE NAME OF THE MONITOR IN WHICH THE WINDOW IS LOCATED
		  
		  // PROFILE is an LCMS2 Profile (MBS Class) returned ByRef
		  // PROFILE NAME is the String returned by the Function
		  
		  // MBS Plugin required for Windows: MBS LCMS2 Plugin
		  // MBS Plugins required for Mac: MBS LCMS2 Plugin, MBS CocoaBase Plugin
		  
		  #if TargetWin32 Then
		    Dim winDC, NSize, LastError As Integer
		    Dim profilePath As String
		    Dim mbPath, mbMonInfoEx, mbDeviceName As MemoryBlock
		    Dim HMONITOR As UInt32
		    Dim f As FolderItem
		    
		    // define the DLL calls
		    Soft Declare Function CreateDC Lib "gdi32" Alias "CreateDCA" (lpszDriver As Ptr, lpszDevice As Ptr, lpszOutput As Ptr, lpInitData As Ptr) As Integer
		    Soft Declare Function DeleteDC Lib "gdi32" (hdc As Integer) As Integer
		    Soft Declare Function GetICMProfile Lib "gdi32" Alias "GetICMProfileA" (hdc As Integer, ByRef dw As Integer, Pointer As Ptr) As Integer
		    Soft Declare Function GetLastError Lib "kernel32" Alias "GetLastError" () As Integer
		    
		    Soft Declare Function GetMonitorInfo Lib "user32" Alias "GetMonitorInfoA" (hMonitor As UInt32, lpmi As Ptr) As Integer
		    // Note: There are 2 options for the lpmi Structure: MONITORINFO or MONITORINFOEX defined respectively as shown below.
		    //            We use MONITORINFOEX
		    // https://msdn.microsoft.com/en-us/library/windows/desktop/dd144901(v=vs.85).aspx  // GetMonitorInfo
		    // https://msdn.microsoft.com/en-us/library/windows/desktop/dd145066(v=vs.85).aspx  // MONITORINFOEX structure
		    
		    // typedef struct tagMONITORINFO {
		    // DWORD cbSize;
		    // RECT  rcMonitor;
		    // RECT  rcWork;
		    // DWORD dwFlags;
		    // } MONITORINFO, *LPMONITORINFO;
		    
		    // typedef struct tagMONITORINFOEX {
		    // DWORD cbSize;
		    // RECT  rcMonitor;
		    // RECT  rcWork;
		    // DWORD dwFlags;
		    // TCHAR szDevice[CCHDEVICENAME];
		    // } MONITORINFOEX, *LPMONITORINFOEX;
		    
		    // Note: the structure components sizes are:
		    // DWORD cbSize;  // 4 bytes
		    // RECT  rcMonitor;  // (4*4) bytes
		    // RECT  rcWork;  // (4*4) bytes
		    // DWORD dwFlags;  // 4 bytes
		    // TCHAR szDevice[CCHDEVICENAME];  // 32 bytes
		    
		    Soft Declare Function MonitorFromWindow Lib "user32" (hwnd As UInt32, dwFlags As UInt32) As Integer
		    // dwFlags values
		    Const MONITOR_DEFAULTTONEAREST = &h00000002
		    Const MONITOR_DEFAULTTONULL = &h00000000
		    Const MONITOR_DEFAULTTOPRIMARY = &h00000001
		    
		    // define a Memoryblock for the device name
		    mbDeviceName = New MemoryBlock(32)
		    
		    // get the monitor handle
		    HMONITOR = MonitorFromWindow(winHandle, MONITOR_DEFAULTTONEAREST)
		    mbMonInfoEx = New MemoryBlock(72)  // = 4 + (4*4) + (4*4) + 4 + 32
		    
		    // set the cbSize member of the MONITORINFOEX structure before calling the GetMonitorInfo function
		    mbMonInfoEx.Int32Value(0) = mbMonInfoEx.Size
		    
		    // get the monitor info
		    RetValue = GetMonitorInfo(HMONITOR, mbMonInfoEx)
		    
		    // get the device name from the MONITORINFOEX structure
		    mbDeviceName.CString(0) = mbMonInfoEx.CString(40)
		    
		    // create a Device Context (DC) from the device name
		    winDC = CreateDC(mbDeviceName, mbDeviceName, nil, nil)
		    
		    // check if the DC is created
		    if winDC = 0 then
		      // DC NOT created
		      profileName = "(display 'Device Context' cannot be created)"
		      
		    else
		      // DC created; define a Memoryblock to get the profile PATH
		      mbPath = New MemoryBlock(256)
		      
		      // define a buffer size to be used to store the profile PATH Name
		      NSize = 256
		      
		      // get the profile from the DC
		      if GetICMProfile(winDC, NSize, mbPath) = 1 then
		        profilePath = mbPath.StringValue(0, 256)
		        
		        // get the profile PATH Name using the returned buffer size, minus the last character (which is NULL)
		        profilePath = Left(profilePath, NSize-1)
		        
		        // define a folder item for the default file profile
		        f = GetFolderItem(profilePath, FolderItem.PathTypeAbsolute)
		        
		        // check if the folder item is available
		        if f.Exists then
		          // the FolderItem is available; try to open it
		          DisplayProfile = LCMS2ProfileMBS.OpenProfileFromFile(f, False)
		          
		          // check if the profile was opened
		          if DisplayProfile <> nil then
		            // a profile was opened; get the profile name
		            profileName = DisplayProfile.Name
		          else
		            // profile NOT opened
		            profileName = "(profile cannot be opened)"
		          end if
		          
		        else
		          // folder item NOT available
		          profileName = "(profile folder not available)"
		        end if
		        
		      else
		        // there was an error while retrieving the display profile
		        LastError = GetLastError()
		        profileName = "(Get profile error # " + str(LastError) + ")"
		      end if
		      
		      // delete the DC
		      if DeleteDC(winDC) = 0 then
		        // the display DC could NOT be deleted
		        MsgBox "The display 'Device Context' could NOT be deleted!"
		      end if
		    end if
		  #endif
		  
		  
		  #if TargetMacOS then
		    Dim i, ScreenIndex, DisplayIDs(0), CurrentDisplayID As Integer
		    Dim windowCenterX, windowCenterY As Single
		    Dim maxNumDisplays, DisplayCnt, DisplayCntPoint As UInt32
		    Dim mbDisplayCnt, mbDisplayIDs As MemoryBlock
		    Dim NS_Screen() as NSScreenMBS
		    Dim NS_Space as NSColorSpaceMBS
		    
		    // define the "CoreGraphics" calls
		    
		    // SWIFT DECLARATION
		    'func CGGetDisplaysWithPoint(_ point: CGPoint,
		    '_ maxDisplays: UInt32,
		    '_ dspys: UnsafeMutablePointer<CGDirectDisplayID>,
		    '_ dspyCnt: UnsafeMutablePointer<UInt32>) -> CGError
		    
		    // Note: in this case, the point Ptr is not recognized as a CGPoint structure, a workaround is to use separate singles to define CGPoint
		    // declare function CGGetDisplaysWithPoint lib "CoreGraphics" (point As Ptr, maxDisplays as Uint32, dspys As Ptr, dspyCnt As Ptr) As Integer
		    declare function CGGetDisplaysWithPoint lib "CoreGraphics" (x As Single, y As Single, maxDisplays as Uint32, dspys As Ptr, dspyCnt As Ptr) As Integer
		    
		    'func CGGetDisplaysWithRect(_ rect: CGRect,
		    '_ maxDisplays: UInt32,
		    '_ dspys: UnsafeMutablePointer<CGDirectDisplayID>,
		    '_ dspyCnt: UnsafeMutablePointer<UInt32>) -> CGError
		    // Note: in this case, the rect Ptr is not recognized as a CGRect structure, a workaround is to use separate singles to define CGRect
		    declare function CGGetDisplaysWithRect lib "CoreGraphics" (x As Single, y As Single, xRect As Single, yRect As Single, maxDisplays as Uint32, dspys As Ptr, dspyCnt As Ptr) As Integer
		    
		    'func CGGetActiveDisplayList(_ maxDisplays: UInt32,
		    '_ activeDspys: UnsafeMutablePointer<CGDirectDisplayID>,
		    '_ dspyCnt: UnsafeMutablePointer<UInt32>) -> CGError
		    declare function CGGetActiveDisplayList lib "CoreGraphics" (maxDisplays as Uint32, dspys As Ptr, dspyCnt As Ptr) As Integer
		    
		    // get the current display ID from the window center position
		    maxNumDisplays = 32 // max number of monitors in the returned ID array
		    mbDisplayIDs = New MemoryBlock(4 * maxNumDisplays)
		    mbDisplayCnt = New MemoryBlock(4)
		    windowCenterX = winLeft + (winWidth/2)
		    windowCenterY = winTop + (winHeight/2)
		    
		    // Note: RetValue = 0 = Success
		    RetValue = CGGetDisplaysWithPoint(windowCenterX, windowCenterY, maxNumDisplays, mbDisplayIDs, mbDisplayCnt)
		    
		    // get the current display ID (the first array element)
		    CurrentDisplayID = mbDisplayIDs.UInt32Value(0)
		    DisplayCntPoint = mbDisplayCnt.UInt32Value(0)
		    
		    // check if we obtained a display ID
		    // Note: we can obtain a display ID=0 if the window center is outside of a monitor
		    if CurrentDisplayID = 0 then
		      // the window center is outside of a monitor; get the display ID from the window rectangle
		      RetValue = CGGetDisplaysWithRect(winLeft, winTop, winWidth, winHeight, maxNumDisplays, mbDisplayIDs, mbDisplayCnt)
		      
		      // get the current display ID (the first array element)
		      CurrentDisplayID = mbDisplayIDs.UInt32Value(0)
		      DisplayCntPoint = mbDisplayCnt.UInt32Value(0)
		    end if
		    
		    // get the active display list
		    RetValue = CGGetActiveDisplayList(maxNumDisplays, mbDisplayIDs, mbDisplayCnt)
		    
		    // get the number of active displays
		    DisplayCnt = mbDisplayCnt.UInt32Value(0)
		    
		    // get the display ID of all the active displays
		    Redim DisplayIDs(DisplayCnt-1)
		    for i = 0 to DisplayCnt-1
		      DisplayIDs(i) = mbDisplayIDs.UInt32Value(4*i)
		    next i
		    
		    // get the screen data of all the active displays
		    Redim NS_Screen(DisplayCnt-1)
		    NS_Screen() = NSScreenMBS.screens
		    
		    // find the screen index from the display ID array
		    // Note: the display ID list is in sync with the Screen(i) index
		    ScreenIndex = DisplayIDs.IndexOf(CurrentDisplayID)
		    
		    // get the color space data for the current screen
		    NS_Space = NS_Screen(ScreenIndex).colorSpace
		    
		    // get the display profile from the screen color space data
		    Dim mbProfile As MemoryBlock
		    mbProfile = New MemoryBlock(1024)  // the MemoryBlock will be resized
		    mbProfile = NS_Space.ICCProfileData
		    DisplayProfile = LCMS2ProfileMBS.OpenProfileFromMemory(mbProfile)
		    
		    // check if the profile was opened
		    if DisplayProfile <> nil then
		      // a profile was opened; get the profile name and path
		      profileName = DisplayProfile.Name
		    else
		      // profile NOT opened
		      profileName = "(profile cannot be opened)"
		    end if
		  #Endif
		  
		  // return the profile name
		  Return profileName
		  
		  // RUNTIME EXCEPTION CODE
		  Exception err
		    profileName = "(Cannot identify the monitor)"
		    Return profileName
		    
		End Function
	#tag EndMethod


	#tag Note, Name = About
		Hi,
		
		this is a project written by Danny Pascale <dpascale@babelcolor.com> 
		to show how to get current display profile for a current display.
		
		
		
	#tag EndNote


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
