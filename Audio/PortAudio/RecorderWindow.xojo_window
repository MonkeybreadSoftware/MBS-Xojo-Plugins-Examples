#tag Window
Begin Window RecorderWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   300
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Recorder"
   Visible         =   True
   Width           =   800
   Begin Canvas outCanvas
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   266
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
      Width           =   760
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  Timer1.Mode = 0
		  
		  if SaveToFile then
		    save
		    
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddMemory(m as MemoryBlock, samples as integer)
		  dim p,q,c,i as integer
		  dim x as MemoryBlock
		  
		  x = New MemoryBlock(samples*2)
		  x.LittleEndian=true
		  
		  p=0
		  q=0
		  
		  c=samples-1
		  for i=0 to c
		    x.Short(q)=m.SingleValue(p)*32767.0
		    p=p+4
		    q=q+2
		  next
		  
		  data.Append x
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub init()
		  Dim d as New MessageDialog //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  d.icon=MessageDialog.GraphicCaution //display warning icon
		  d.ActionButton.Caption="Save"
		  d.CancelButton.Visible=True    //show the Cancel button
		  d.AlternateActionButton.Visible=True  //show the “Don’t Save” button
		  d.AlternateActionButton.Caption="Don’t Save"
		  d.Message="Do you want to save the recording when you close the window?"
		  
		  b=d.ShowModal //display the dialog
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    RecorderWindow.initialize true
		  Case d.AlternateActionButton
		    RecorderWindow.initialize false
		    //user pressed Don’t Save
		  Case d.CancelButton
		    Return
		    //user pressed Cancel
		  End select
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initialize(b as Boolean)
		  SaveToFile=b
		  
		  m = New MemoryBlock(4*10240) // read 10240 samples per timer loop
		  
		  p=new PortAudioStreamRecorderMBS(1024*1024)
		  
		  if p.OpenDefaultStream(1, Frequency)=0 then
		    if p.Start=0 then
		      timer1.Mode=timer1.ModeMultiple
		    else
		      MsgBox "Failed to start."
		    end if
		  else
		    MsgBox "Failed to initialize."
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFrames(m as MemoryBlock, l as integer)
		  dim b as Double
		  dim c as integer = l-1
		  dim mi,ma as Double
		  
		  // just find min and max and display it here
		  b=m.SingleValue(0)
		  ma=b
		  mi=b
		  
		  for i as integer=0 to c
		    b=m.SingleValue(4*i)
		    
		    if b>ma then
		      ma=b
		    end if
		    
		    if b<mi then
		      mi=b
		    end if
		  next
		  
		  // scale so we see more
		  ma=ma*2
		  mi=mi*2
		  
		  ma = abs(ma)
		  mi = abs(mi)
		  
		  // draw to the screen directly
		  
		  Dim w As Integer = OutCanvas.width
		  Dim h As Integer = OutCanvas.Height
		  Dim h2 As Integer = h/2
		  
		  
		  
		  If out = Nil Or out.Width <> w Or out.Height <> h Then
		    out = New Picture(w, h, 32)
		  End If
		  
		  dim g as Graphics = out.Graphics
		  
		  
		  g.ForeColor=&cFFFFFF
		  g.DrawLine index, 0, index, h
		  
		  g.ForeColor=&cFF0000
		  g.DrawLine index, h2, index, h2-ma*h2
		  
		  g.ForeColor=&c00FF00
		  g.DrawLine index, h2, index, h2+mi*h2
		  
		  OutCanvas.Invalidate
		  
		  // move to the next line
		  index=index+1
		  if index=w then
		    index=0
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub save()
		  // save as WAV
		  // for more options, please use SoundFileMBS class
		  
		  dim size as integer=0
		  
		  Dim f As FolderItem = GetSaveFolderItem(FileTypes1.AudioWav,"audio.wav")
		  If f <> Nil Then
		    Dim b As BinaryStream = f.CreateBinaryFile(FileTypes1.AudioWav)
		    
		    if b = nil then
		      
		      MsgBox "Failed to create file " + f.NativePath
		      
		    else
		      
		      for each m as MemoryBlock in data
		        size = size + m.size
		      next
		      
		      b.LittleEndian=true
		      
		      b.Write "RIFF"
		      b.WriteInt32 6+4+16+4+Size // size of file
		      b.Write "WAVE"
		      
		      b.Write "fmt "
		      b.WriteInt32 16 // size of following data
		      b.WriteInt16 1 // format, uncompressed
		      b.WriteInt16 1 // 1 Channel
		      b.WriteInt32 Frequency // Samples per Second
		      b.WriteInt32 Frequency*2 // Bytes per Second
		      b.WriteInt16 2 // Block align, Size of Sample in Bytes
		      b.WriteInt16 16 // bits per sample
		      
		      b.Write "data"
		      b.WriteInt32 Size
		      
		      for each m in data
		        b.Write m
		      next
		      
		      b.Close
		      
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Note, Name = Frequency
		
		you can set frequency to 8000 for phone quality or for example to 44100 for HiFi
	#tag EndNote


	#tag Property, Flags = &h1
		Protected data(-1) As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		m As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h0
		Out As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		p As PortAudioStreamRecorderMBS
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SaveToFile As Boolean
	#tag EndProperty


	#tag Constant, Name = Frequency, Type = Double, Dynamic = False, Default = \"8000", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events outCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #pragma unused areas
		  
		  If out <> Nil Then
		    g.DrawPicture out, 0, 0, g.Width, g.Height, 0, 0, out.Width, out.Height
		  End If
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  dim l as integer
		  
		  // we ask for samples in the buffer
		  l=p.ReadFrames(m, m.Size) 
		  
		  if l>0 then
		    
		    // process the l frames we got
		    ProcessFrames m, l
		    
		    if SaveToFile then
		      AddMemory M, l
		    end if
		    
		  end if
		  
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
		Name="index"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Out"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
