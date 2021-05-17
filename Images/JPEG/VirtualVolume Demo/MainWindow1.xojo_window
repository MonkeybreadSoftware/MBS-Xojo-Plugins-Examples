#tag Window
Begin Window MainWindow1
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   463
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1203949000
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "VV Demo"
   Visible         =   True
   Width           =   449
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      BalloonHelp     =   ""
      DisabledBalloonHelp=   ""
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   382
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   14
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   417
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   360
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      Top             =   408
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Open"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   283
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      Top             =   408
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   69
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   35
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   12
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MultiLine       =   True
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Drop a picture above to put it in the Canvas. Click Save to save into a Virtual Volume, and Open to read it back."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   10.0
      Top             =   408
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   259
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      BalloonHelp     =   ""
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear Canvas"
      Default         =   False
      DisabledBalloonHelp=   ""
      Enabled         =   True
      FontUnit        =   0
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   283
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   10.0
      Top             =   436
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   146
   End
End
#tag EndWindow

#tag WindowCode
	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub BinaryLoad()
		  dim BinIn as binaryStream
		  dim f, VVFile as folderItem
		  dim vv As VirtualVolume
		  dim s as String
		  
		  ' Start by selecting out Virtual Volume, and getting a FolderItem
		  ' to ClipArt within it.
		  VVFile = SpecialFolder.Desktop.Child("VV File")
		  vv = VVFile.OpenAsVirtualVolume
		  f = vv.Root.Child("ClipArt.jpg")
		  
		  ' Check our FolderItems were created ok.
		  if f <> nil then
		    
		    ' Get a Binary Stream to read from ClipArt from within the VV.
		    BinIn = f.OpenAsBinaryFile(false)
		    if BinIn <> nil then
		      ' Creat a Binary Stream to write to.
		      
		      s=BinIn.read(BinIn.Length)
		      if s<>"" then
		        Canvas1.backdrop = JPEGStringToPictureMBS(s,true)
		      end if
		      
		      BinIn.close
		    end if ' in = nil
		  end if ' f =  nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BinarySave()
		  dim BinOut as binaryStream
		  dim f, VVFile, SaveFile as folderItem
		  dim i, n as integer
		  dim vv As VirtualVolume
		  dim s as String
		  dim p as Picture
		  
		  ' Basic Process:
		  ' We can't save directly to a virtual volume as a picture file
		  ' but a picture file is simply a binary file, and that we can do.
		  ' But to get the directy binary data out of the picture we need to first
		  ' save it somewhere, such as the TemporaryFolder. Then we just need
		  ' to read everything from that file as a binary stream and write it into
		  ' our Virtual Volume.
		  
		  ' Start by creating the VirtualVolume and setting up our FolderItem
		  ' to save the pic to.
		  VVFile = SpecialFolder.Desktop.Child("VV File")
		  vv = VVFile.CreateVirtualVolume
		  f = vv.Root.Child("ClipArt.jpg")
		  
		  p=Canvas1.Backdrop
		  if p<>Nil then
		    p=p.BitmapMBS // Make sure it's a bitmap picture.
		    s=PictureToJPEGStringMBS(p,100)
		  end if
		  
		  ' Check that both FolderItems have been created ok.
		  if s<>"" and f <> nil then
		    
		    ' Create our binary stream to save to.
		    BinOut = f.CreateBinaryFile("myBinary")
		    if BinOut <> nil then
		      
		      BinOut.write s
		    end if
		    
		    BinOut.close
		  end if  ' f =  nil
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		totalwords As integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.drawRect(0, 0, g.width - 1, g.height - 1)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.acceptPictureDrop
		  me.acceptFileDrop("image/gif")
		  me.acceptFileDrop("image/jpeg")
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  if obj.pictureAvailable then
		    me.backdrop = obj.picture
		  end if
		  
		  if obj.folderItemAvailable then
		    me.backdrop = obj.folderItem.openAsPicture
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  if canvas1.backdrop <> nil then
		    BinarySave
		  else
		    beep
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  BinaryLoad
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Canvas1.Backdrop = Nil
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
		Name="totalwords"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
