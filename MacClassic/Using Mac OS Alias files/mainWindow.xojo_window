#tag Window
Begin Window mainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   360
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   2
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   False
   Title           =   "Alias Demo"
   Visible         =   True
   Width           =   330
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   50
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
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Drag an Alias File here to view the Alias,\ror drag any other item here to\rcreate a new Alias File on the Desktop."
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   12.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   290
   End
   Begin Label Infotext
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   117
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "Geneva"
      TextSize        =   9.0
      TextUnit        =   0
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   290
   End
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "When Resolving Alias Files ..."
      Enabled         =   True
      Height          =   73
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
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   205
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   290
      Begin CheckBox NoDlgChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "No Dialogs"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   183
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   235
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   114
      End
      Begin CheckBox MountChk
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Attempt Mount"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   235
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   132
      End
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
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "monkeybreadsoftware.de/realbasic"
      TextAlign       =   1
      TextColor       =   &c0000FF00
      TextFont        =   "Times"
      TextSize        =   14.0
      TextUnit        =   0
      Top             =   290
      Transparent     =   False
      Underline       =   True
      Visible         =   True
      Width           =   290
   End
   Begin CheckBox CheckIcon
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Copy icon"
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
      Scope           =   0
      State           =   1
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   322
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   290
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #Pragma unused action
		  
		  if obj.FolderItemAvailable then
		    DemoIt (obj.FolderItem)
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  FileOpen.enabled = true
		  FileSelectFolder.enabled = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  AcceptFileDrop "AnyFile"
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			Dim f As FolderItem
			f=GetOpenFolderItem("AnyFile")
			if f<>nil then
			DemoIt (f)
			end if
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSelectFolder() As Boolean Handles FileSelectFolder.Action
			Dim f as Folderitem
			f=SelectFolder
			If f<> Nil Then
			DemoIt (f)
			End If
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub CopyIcon(source as folderitem, dest as folderitem)
		  dim n as NSImageMBS = NSWorkspaceMBS.iconForFile(source)
		  
		  if n <> nil then
		    call NSWorkspaceMBS.setIcon(n, dest)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DemoIt(f as FolderItem)
		  Dim s, alisRsrc as String
		  Dim mode, err as Integer
		  Dim f1 as FolderItem, rf as ResourceForkMBS
		  Dim alias as MacAliasMBS
		  
		  if f.Alias then
		    // This is an Alias File - let's look at it
		    
		    // get the file's "alis" resource, which contains the Alias Record in binary format
		    rf = ResourceForkMBS.Open(f, false)
		    alisRsrc = rf.GetResource("alis", 0)
		    rf.Close
		    
		    // create an AliasRecord from it
		    alias = new MacAliasMBS
		    alias.SetRecord alisRsrc
		    
		    // get some path information from the AliasRecord without actually resolving it
		    s = "Alias File's name: " + f.Name + Chr(13)
		    s = s + Chr(13)
		    dim info as AliasInfoMBS = alias.AliasInfo
		    s = s + "Destination target name: " + info.TargetName + Chr(13)
		    s = s + "Destination volume name: " + info.VolumeName + Chr(13)
		    s = s + "Destination Path: " + info.PathString + Chr(13)
		    
		    // now let's resolve the Alias
		    mode = 0
		    if self.MountChk.value then
		      mode = mode + alias.attemptMount
		      if self.NoDlgChk.value then
		        mode = mode + alias.noDialogs
		      end
		    end
		    f1 = alias.Resolve(nil, mode)
		    s = s + Chr(13)
		    if f1 <> nil then
		      s = s + "Resolved path: " + f1.NativePath + Chr(13)
		    else
		      s = s + "Unable to resolve the alias." + Chr(13)
		    end
		    
		  else
		    // This is a file or folder (no Alias),
		    // let's create an Alias File for it on the Desktop
		    
		    alias = new MacAliasMBS
		    err = alias.Create(nil, f)
		    if err <> 0 then
		      s = "Oops - an error occured when creating the AliasRecord: " + Str(err)
		    else
		      f1 = SpecialFolder.Desktop.TrueChild(f.name+" Alias")
		      if f1.exists then
		        s = "Oops - Can't create the Alias File: there's already a file with the name “" + f1.name + "” on the Desktop."    // <-- CONVERTED
		      else
		        // create a new file in the boot volume's desktop folder
		        rf = ResourceForkMBS.Create(f1)
		        if rf = nil then
		          s = "Oops - Failed to create the Alias File “" + f1.NativePath + "”."    // <-- CONVERTED
		        else
		          
		          // add the AliasRecord to the file's resource
		          rf.AddResource alias.GetRecord(), "alis", 0, "Created by TT's Alias Mgr Plugin Demo"
		          
		          // set the file's type and creator codes
		          #If RBVersion < 2019 Then
		            If f.Directory Then
		              f1.MacType = "fdrp"
		              f1.MacCreator = "MACS"
		            Else
		              f1.MacType = f.MacType
		              f1.MacCreator = f.MacCreator
		            End
		          #endif
		          
		          // set the "isAlias" flag in the file's properties.
		          // RB does not provide a function for this (the Alias property of
		          // the FolderItem class is read-only), thus we use two methods
		          // from the MBS plugin here.
		          err = f1.SetFileFlagsMBS(BitwiseOr(f1.GetFileFlagsMBS, &H8000))
		          
		          
		          rf.Close
		          
		          if CheckIcon.Value then
		            CopyIcon f,f1
		          end if
		          
		          // make the newly created file known to the Finder immediately
		          UpdateItemInFinder f1
		          
		          s = "Alias to “" + f.name + "” successfully created on the Desktop."    // <-- CONVERTED
		        end
		      end
		    end
		    
		  end
		  
		  Infotext.Text = s
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Bindings
	#tag BeginBinding
		SourceItem = MountChk
		DestinationItem = NoDlgChk
		ItemType = enablingBinder
		ItemDescription = Enable NoDlgChk when MountChk checked
	#tag EndBinding
#tag EndBindings
#tag Events StaticText2
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #Pragma unused x
		  #Pragma unused y
		  
		  
		  Me.TextColor = RGB(0,0,255)
		  showurL "http://monkeybreadsoftware.de/realbasic"
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma unused x
		  #Pragma unused y
		  
		  
		  Me.TextColor = RGB(255,0,0)
		  return true
		  
		  
		End Function
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
