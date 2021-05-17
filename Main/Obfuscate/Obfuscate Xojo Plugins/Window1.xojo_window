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
   Height          =   179
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   677143370
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Obfuscate Plugins"
   Visible         =   True
   Width           =   348
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   75
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
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Please select plugin folder after you clicked the buttons. Do not forget to clean the project and plugin caches after you obfuscated the plugins.\n\nWritten by Christian Schmitz."
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   308
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Plugin Folder..."
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   160
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
      Top             =   107
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   168
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Xojo.App..."
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   160
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   135
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   168
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function ObfuscateDLLName(name as string) As string
		  if right(name, 4) = ".dll" then
		    CountDLLChanges = CountDLLChanges + 1
		    dim parts() as string = split(name, "/")
		    
		    parts(UBound(parts)) = PluginPrefix+format(CountDLLChanges,"000")+".dll"
		    
		    Return Join(parts, "/")
		    
		  elseif right(name, 6) = ".dylib" then
		    CountDLLChanges = CountDLLChanges + 1
		    dim parts() as string = split(name, "/")
		    
		    parts(UBound(parts)) = PluginPrefix+format(CountDLLChanges,"000")+".dylib"
		    
		    Return Join(parts, "/")
		  elseif right(name, 3) = ".so" then
		    CountDLLChanges = CountDLLChanges + 1
		    dim parts() as string = split(name, "/")
		    
		    parts(UBound(parts)) = PluginPrefix+format(CountDLLChanges,"000")+".so"
		    
		    Return Join(parts, "/")
		    
		  else
		    
		    Return name
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ObfuscatePluginName(name as string) As string
		  CountPluginChanges = CountPluginChanges + 1
		  Return PluginPrefix+Format(CountPluginChanges,"000")+".xojo_plugin"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Process(source as FolderItem, dest as FolderItem)
		  dim uz as new UnZipMBS(source)
		  dim z as new ZipMBS(dest,0)
		  
		  uz.GoToFirstFile
		  do
		    dim path as string = uz.FileName
		    dim info as UnZipFileInfoMBS = uz.FileInfo
		    dim buffer as string
		    
		    uz.OpenCurrentFile
		    if uz.Lasterror=0 then
		      
		      buffer = uz.ReadCurrentFile(50000000)
		      
		      
		      uz.CloseCurrentFile
		      
		      
		      dim finfo as new ZipFileInfoMBS
		      finfo.ExternalFileAttributes = info.ExternalFileAttributes
		      finfo.InternalFileAttributes = info.InternalFileAttributes
		      finfo.Day = info.Day
		      finfo.Hour = info.Hour
		      finfo.Minute = info.Minute
		      finfo.Month = info.Month
		      finfo.Second = info.Second
		      finfo.Year = info.Year
		      
		      
		      path = ObfuscateDLLName(path)
		      
		      z.CreateFile path, finfo, "", "", "", z.MethodDeflated, z.CompressionBestCompression
		      z.Write buffer
		      z.CloseFile
		      
		    end if
		    
		    
		    
		    
		    uz.GoToNextFile
		  loop until uz.Lasterror<>0
		  
		  z.Close("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFolder(f as FolderItem)
		  dim files() as FolderItem
		  
		  dim c as integer = f.Count
		  for i as integer = 1 to c
		    dim g as FolderItem = f.TrueItem(i)
		    if g<>Nil then
		      files.append g
		    end if
		  next
		  
		  for each item as FolderItem in files
		    if item.Directory then
		      ProcessFolder item
		    else
		      item.name = ObfuscateDLLName(item.name)
		    end if
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run()
		  
		  dim f as FolderItem
		  
		  CountPluginChanges = 0
		  CountDLLChanges = 0
		  PluginPrefix = "Lib_"
		  
		  f=SelectFolder
		  
		  if f=nil then Return
		  
		  WalkFolder f
		  
		  MsgBox "Changed "+str(CountPluginChanges)+" plugin names and "+str(CountDLLChanges)+" DLL names."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub run_Internal()
		  Dim MyTypes as New FileType
		  MyTypes.Name="App Types"
		  MyTypes.Extensions=".app"
		  
		  
		  dim f as FolderItem
		  
		  F = GetOpenFolderItem(MyTypes)
		  
		  if f=nil then Return
		  
		  
		  CountPluginChanges = 0
		  CountDLLChanges = 0
		  PluginPrefix = "iLib_"
		  
		  Dim G as FolderItem
		  G = F.Child("Contents")
		  If G <> nil And G.Exists then
		    G = G.Child("Resources")
		    If G <> nil And G.Exists then
		      G = G.Child("Internal Plugins")
		      If G <> nil And G.Exists then
		        WalkFolder G
		      Else
		        Return
		      End If
		    End If
		  End If
		  
		  
		  MsgBox "Changed "+str(CountPluginChanges)+" plugin names and "+str(CountDLLChanges)+" DLL names."
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WalkFolder(f as FolderItem)
		  dim g,files(-1) as FolderItem
		  dim i,c as integer
		  
		  c=f.Count
		  for i=1 to c
		    g=f.TrueItem(i)
		    if g<>Nil and right(g.name, 12)=".xojo_plugin" then
		      files.Append g
		    end if
		    
		  next
		  
		  for each g in files
		    dim name as string = ObfuscatePluginName(g.name)
		    
		    if g.Directory then
		      ProcessFolder g
		      g.name = name
		    else
		      dim dest as FolderItem = g.parent.Child(name)
		      Process g, dest
		      g.Delete
		    end if
		  next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CountDLLChanges As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CountPluginChanges As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PluginPrefix As String
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  // does not work right currently.
		  run_Internal
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
		Name="CountDLLChanges"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CountPluginChanges"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="PluginPrefix"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
