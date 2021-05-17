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
   Height          =   250
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Sending Keys"
   Visible         =   True
   Width           =   483
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   0
      Scope           =   "0"
      TabPanelIndex   =   "0"
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
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Ohne Titel"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Timer Timer2
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   2
      Period          =   1000
      Scope           =   "0"
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  
		  client.close
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  
		  InitMIDI
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetDeviceNames(ep as MIDIEndpointMBS) As string
		  dim externalIDs as CFBinaryDataMBS
		  dim theID as integer
		  dim i, j, l as integer
		  dim mb as memoryBlock
		  dim o as MIDIObjectMBS
		  dim s as string
		  dim names(0) as string
		  dim displayName as string
		  dim n as integer
		  
		  externalIDs = ep.BinaryProperty(ep.kMIDIPropertyConnectionUniqueID)
		  
		  if externalIDs <> nil then
		    l = externalIDs.len
		    mb = externalIDs.Mem
		    for i = 0 to externalIDs.len-1 step 4
		      theID = mb.Long(i)
		      if theID <> 0 then
		        o = client.FindObjectByUniqueID(theID)
		        if o <> nil then
		          names.append o.stringProperty(o.kMIDIPropertyName).str
		          exit
		        end
		      end
		    next
		    
		    n = UBound(names) 
		    if n > 0 then
		      displayName = ""
		      for i = 1 to n
		        displayName = displayName + names(i)
		        if i < n then
		          displayName = displayName + ", "
		        end
		      next
		      'realDObjects.append o
		      return displayName
		    end
		  end
		  
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitMIDI()
		  dim i as integer
		  
		  
		  client = new MIDIClientMBS
		  client.init(NewCFStringMBS("CoreMIDI"))
		  
		  if client.handle=0 then
		    msgbox "Couldn't create a MIDI Client..."
		    quit
		  end
		  
		  outport = new MIDIPortMBS
		  client.CreateOutputPort(NewCFStringMBS("outport"), outport)
		  
		  SetupDestinations
		  
		  if currentDest = nil then
		    MsgBox "Please launch other app first."
		    quit
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendNoteOff(noteValue as integer)
		  dim pack as MIDIPacketMBS
		  dim list as MIDIPacketListMBS
		  dim packs(-1) as MIDIPacketMBS
		  dim num as integer
		  dim data as memoryBlock
		  
		  
		  pack = new MIDIPacketMBS
		  list = new MIDIPacketListMBS
		  data = newmemoryBlock(3)
		  
		  data.byte(0) = &h80    'note off
		  data.byte(1) = noteValue + 48  'take it up a few octaves
		  data.byte(2) = &h7C    'velocity
		  pack.datamemory = data
		  pack.timeStamp = nil   'now
		  
		  packs.append pack
		  if not list.FillList(packs) then
		    msgBox "bad"
		  end
		  
		  client.Send(outport, currentDest, list)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendNoteOn(noteValue as integer)
		  dim pack as MIDIPacketMBS
		  dim list as MIDIPacketListMBS
		  dim packs(-1) as MIDIPacketMBS
		  dim num as integer
		  dim data as memoryBlock
		  
		  
		  pack = new MIDIPacketMBS
		  list = new MIDIPacketListMBS
		  data = newmemoryBlock(3)
		  
		  data.byte(0) = &h90    'note on
		  data.byte(1) = noteValue + 48  'take it up a few octaves
		  data.byte(2) = &h7C    'velocity
		  pack.datamemory = data
		  pack.timeStamp = nil   'now
		  
		  packs.append pack
		  if not list.FillList(packs) then
		    msgBox "bad"
		  end
		  
		  client.Send(outport, currentDest, list)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupDestinations()
		  dim i, n as integer
		  dim dest as MIDIEndpointMBS
		  dim s as string
		  dim name, model as string
		  
		  n = client.NumberOfDestinations
		  if n <> 0 then
		    for i = 0 to n-1
		      dest = client.getDestination(i)
		      
		      name =CFString(dest.stringProperty(dest.kMIDIPropertyName))
		      model=CFString(dest.stringProperty(dest.kMIDIPropertyModel))
		      
		      s = GetDeviceNames(dest)
		      
		      if instr(name, "MyDestination") > 0 then
		        currentDest = dest
		      end if
		    next
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		client As MIDIClientMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		counter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		currentDest As MIDIEndpointMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		outport As MIDIPortMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  counter = counter + 1
		  
		  SendNoteOn(counter mod 13)
		  SendNoteOff(counter mod 13)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer2
	#tag Event
		Sub Action()
		  label1.text = str(counter*2)
		  
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
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
	#tag ViewProperty
		Name="counter"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
