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
   Height          =   414
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   -1230298101
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Special folders"
   Visible         =   True
   Width           =   476
   Begin ListBox ListBox1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "30%,50%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   356
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Function	Result	Encoding"
      Italic          =   False
      Left            =   -1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   44
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   478
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   19
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   436
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub run()
		  dim n as integer
		  
		  n=popupMenu1.rowtag(popupMenu1.listindex)
		  listBox1.deleteAllRows
		  
		  'test AdminToolsFolderMBS(n),"AdminToolsFolder"
		  'test CookiesFolderMBS(n),"CookiesFolder"
		  'test HistoryFolderMBS(n),"HistoryFolder"
		  'test InternetCacheFolderMBS(n),"InternetCacheFolder"
		  test WindowsFolderMBS,"WindowsFolder"
		  test WindowsSystemFolderMBS,"WindowsSystemFolder"
		  
		  test SystemFolderMBS(n),"SystemFolder"
		  test DesktopFolderMBS(n),"DesktopFolder"
		  test SystemDesktopFolderMBS(n),"SystemDesktopFolder"
		  test TrashFolderMBS(n),"TrashFolder"
		  test SystemTrashFolderMBS(n),"SystemTrashFolder"
		  test WhereToEmptyTrashFolderMBS(n),"WhereToEmptyTrashFolder"
		  test PrintMonitorDocsFolderMBS(n),"PrintMonitorDocsFolder"
		  test StartupFolderMBS(n),"StartupFolder"
		  test ShutdownFolderMBS(n),"ShutdownFolder"
		  test AppleMenuFolderMBS(n),"AppleMenuFolder"
		  test ControlPanelFolderMBS(n),"ControlPanelFolder"
		  test SystemControlPanelFolderMBS(n),"SystemControlPanelFolder"
		  test ExtensionFolderMBS(n),"ExtensionFolder"
		  test FontsFolderMBS(n),"FontsFolder"
		  test PreferencesFolderMBS(n),"PreferencesFolder"
		  test SystemPreferencesFolderMBS(n),"SystemPreferencesFolder"
		  test TemporaryFolderMBS(n),"TemporaryFolder"
		  test ExtensionDisabledFolderMBS(n),"ExtensionDisabledFolder"
		  test ControlPanelDisabledFolderMBS(n),"ControlPanelDisabledFolder"
		  test SystemExtensionDisabledFolderMBS(n),"SystemExtensionDisabledFolder"
		  test StartupItemsDisabledFolderMBS(n),"StartupItemsDisabledFolder"
		  test ShutdownItemsDisabledFolderMBS(n),"ShutdownItemsDisabledFolder"
		  test ApplicationsFolderMBS(n),"ApplicationsFolder"
		  test DocumentsFolderMBS(n),"DocumentsFolder"
		  test VolumeRootFolderMBS(n),"VolumeRootFolder"
		  test ChewableItemsFolderMBS(n),"ChewableItemsFolder"
		  test ApplicationSupportFolderMBS(n),"ApplicationSupportFolder"
		  test TextEncodingsFolderMBS(n),"TextEncodingsFolder"
		  test StationeryFolderMBS(n),"StationeryFolder"
		  test OpenDocFolderMBS(n),"OpenDocFolder"
		  test OpenDocShellPlugInsFolderMBS(n),"OpenDocShellPlugInsFolder"
		  test EditorsFolderMBS(n),"EditorsFolder"
		  test OpenDocEditorsFolderMBS(n),"OpenDocEditorsFolder"
		  test OpenDocLibrariesFolderMBS(n),"OpenDocLibrariesFolder"
		  test GenEditorsFolderMBS(n),"GenEditorsFolder"
		  test HelpFolderMBS(n),"HelpFolder"
		  test InternetPlugInFolderMBS(n),"InternetPlugInFolder"
		  test ModemScriptsFolderMBS(n),"ModemScriptsFolder"
		  test PrinterDescriptionFolderMBS(n),"PrinterDescriptionFolder"
		  test PrinterDriverFolderMBS(n),"PrinterDriverFolder"
		  test ScriptingAdditionsFolderMBS(n),"ScriptingAdditionsFolder"
		  test SharedLibrariesFolderMBS(n),"SharedLibrariesFolder"
		  test VoicesFolderMBS(n),"VoicesFolder"
		  test ControlStripModulesFolderMBS(n),"ControlStripModulesFolder"
		  test AssistantsFolderMBS(n),"AssistantsFolder"
		  test UtilitiesFolderMBS(n),"UtilitiesFolder"
		  test AppleExtrasFolderMBS(n),"AppleExtrasFolder"
		  test ContextualMenuItemsFolderMBS(n),"ContextualMenuItemsFolder"
		  test MacOSReadMesFolderMBS(n),"MacOSReadMesFolder"
		  test ALMModulesFolderMBS(n),"ALMModulesFolder"
		  test ALMPreferencesFolderMBS(n),"ALMPreferencesFolder"
		  test ALMLocationsFolderMBS(n),"ALMLocationsFolder"
		  test ColorSyncProfilesFolderMBS(n),"ColorSyncProfilesFolder"
		  test ThemesFolderMBS(n),"ThemesFolder"
		  test FavoritesFolderMBS(n),"FavoritesFolder"
		  test InternetFolderMBS(n),"InternetFolder"
		  test AppearanceFolderMBS(n),"AppearanceFolder"
		  test SoundSetsFolderMBS(n),"SoundSetsFolder"
		  test DesktopPicturesFolderMBS(n),"DesktopPicturesFolder"
		  test InternetSearchSitesFolderMBS(n),"InternetSearchSitesFolder"
		  test FindSupportFolderMBS(n),"FindSupportFolder"
		  test FindByContentFolderMBS(n),"FindByContentFolder"
		  test InstallerLogsFolderMBS(n),"InstallerLogsFolder"
		  test ScriptsFolderMBS(n),"ScriptsFolder"
		  test FolderActionsFolderMBS(n),"FolderActionsFolder"
		  test LauncherItemsFolderMBS(n),"LauncherItemsFolder"
		  test RecentApplicationsFolderMBS(n),"RecentApplicationsFolder"
		  test RecentDocumentsFolderMBS(n),"RecentDocumentsFolder"
		  test RecentServersFolderMBS(n),"RecentServersFolder"
		  test SpeakableItemsFolderMBS(n),"SpeakableItemsFolder"
		  test KeychainFolderMBS(n),"KeychainFolder"
		  test QuickTimeExtensionsFolderMBS(n),"QuickTimeExtensionsFolder"
		  test DisplayExtensionsFolderMBS(n),"DisplayExtensionsFolder"
		  test MultiprocessingFolderMBS(n),"MultiprocessingFolder"
		  test PrintingPlugInsFolderMBS(n),"PrintingPlugInsFolder"
		  test DomainTopLevelFolderMBS(n),"DomainTopLevelFolder"
		  test DomainLibraryFolderMBS(n),"DomainLibraryFolder"
		  test ColorSyncFolderMBS(n),"ColorSyncFolder"
		  test ColorSyncCMMFolderMBS(n),"ColorSyncCMMFolder"
		  test ColorSyncScriptingFolderMBS(n),"ColorSyncScriptingFolder"
		  test PrintersFolderMBS(n),"PrintersFolder"
		  test SpeechFolderMBS(n),"SpeechFolder"
		  test CarbonLibraryFolderMBS(n),"CarbonLibraryFolder"
		  test DocumentationFolderMBS(n),"DocumentationFolder"
		  test DeveloperDocsFolderMBS(n),"DeveloperDocsFolder"
		  test DeveloperHelpFolderMBS(n),"DeveloperHelpFolder"
		  test ISSDownloadsFolderMBS(n),"ISSDownloadsFolder"
		  test UserSpecificTmpFolderMBS(n),"UserSpecificTmpFolder"
		  test CachedDataFolderMBS(n),"CachedDataFolder"
		  test FrameworksFolderMBS(n),"FrameworksFolder"
		  test PrivateFrameworksFolderMBS(n),"PrivateFrameworksFolder"
		  test ClassicDesktopFolderMBS(n),"ClassicDesktopFolder"
		  test DeveloperFolderMBS(n),"DeveloperFolder"
		  test SystemSoundsFolderMBS(n),"SystemSoundsFolder"
		  test ComponentsFolderMBS(n),"ComponentsFolder"
		  test QuickTimeComponentsFolderMBS(n),"QuickTimeComponentsFolder"
		  test CoreServicesFolderMBS(n),"CoreServicesFolder"
		  test PictureDocumentsFolderMBS(n),"PictureDocumentsFolder"
		  test MovieDocumentsFolderMBS(n),"MovieDocumentsFolder"
		  test MusicDocumentsFolderMBS(n),"MusicDocumentsFolder"
		  test InternetSitesFolderMBS(n),"InternetSitesFolder"
		  test PublicFolderMBS(n),"PublicFolder"
		  test AudioSupportFolderMBS(n),"AudioSupportFolder"
		  test AudioSoundsFolderMBS(n),"AudioSoundsFolder"
		  test AudioSoundBanksFolderMBS(n),"AudioSoundBanksFolder"
		  test AudioAlertSoundsFolderMBS(n),"AudioAlertSoundsFolder"
		  test AudioPlugInsFolderMBS(n),"AudioPlugInsFolder"
		  test AudioComponentsFolderMBS(n),"AudioComponentsFolder"
		  test KernelExtensionsFolderMBS(n),"KernelExtensionsFolder"
		  test DirectoryServicesFolderMBS(n),"DirectoryServicesFolder"
		  test DirectoryServicesPlugInsFolderMBS(n),"DirectoryServicesPlugInsFolder"
		  test InstallerReceiptsFolderMBS(n),"InstallerReceiptsFolder"
		  test FileSystemSupportFolderMBS(n),"FileSystemSupportFolder"
		  test AppleShareSupportFolderMBS(n),"AppleShareSupportFolder"
		  test AppleShareAuthenticationFolderMBS(n),"AppleShareAuthenticationFolder"
		  test MIDIDriversFolderMBS(n),"MIDIDriversFolder"
		  test LocalesFolderMBS(n),"LocalesFolder"
		  test FindByContentPluginsFolderMBS(n),"FindByContentPluginsFolder"
		  test UsersFolderMBS(n),"UsersFolder"
		  test CurrentUserFolderMBS(n),"CurrentUserFolder"
		  test CurrentUserRemoteFolderLocationFolderMBS(n),"CurrentUserRemoteFolderLocationFolder"
		  test CurrentUserRemoteFolderMBS(n),"CurrentUserRemoteFolder"
		  test SharedUserDataFolderMBS(n),"SharedUserDataFolder"
		  test VolumeSettingsFolderMBS(n),"VolumeSettingsFolder"
		  
		  // new in Mac OS X 10.3:
		  
		  test dictionariesFolderMBS(n),"DictionariesFolder"
		  test LogsFolderMBS(n),"LogsFolder"
		  test DeveloperApplicationsFolderMBS(n),"DeveloperApplicationsFolder"
		  test PreferencePanesFolderMBS(n),"PreferencePanesFolder"
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub test(f as folderItem,name as string)
		  dim s as string
		  dim e as TextEncoding
		  
		  listBox1.addrow name
		  
		  if f<>nil then
		    s=f.UnixpathMBS
		    
		    listBox1.cell(listbox1.lastindex,1)=s
		  end if
		  
		  e=s.Encoding
		  ListBox1.Cell(ListBox1.LastIndex,2)=e.internetName+" "+str(len(s))+" "+str(lenb(s))
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PopupMenu1
	#tag Event
		Sub Open()
		  me.addrow "On System Disk"
		  me.rowTag(0)=kOnSystemDisk
		  
		  me.addrow "On Appropriate Disk"
		  me.rowTag(1)=kOnAppropriateDisk
		  
		  me.addrow "System Domain"
		  me.rowTag(2)=kSystemDomain
		  
		  me.addrow "Local Domain"
		  me.rowTag(3)=kLocalDomain
		  
		  me.addrow "Network Domain"
		  me.rowTag(4)=knetworkDomain
		  
		  me.addrow "User Domain"
		  me.rowTag(5)=kuserDomain
		  
		  me.addrow "Classic Domain"
		  me.rowTag(6)=kclassicDomain
		  
		  'me.listindex=0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  run
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
		InitialValue="False"
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
