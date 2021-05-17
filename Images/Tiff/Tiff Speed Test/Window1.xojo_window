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
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   713098760
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim f as FolderItem = SpecialFolder.Desktop.Child("EX119-020.tif")
		  
		  if f=nil or f.Exists=false then
		    MsgBox "please change the path to point to another black/white tiff file!"
		    quit
		  end if
		  
		  dim i,t1,t2,t3,t4,t5,t6 as integer
		  dim b as Boolean
		  dim t as MyTiff
		  
		  // RGB
		  t=nil
		  t=new MyTiff
		  
		  if t.Open(f) then
		    
		    t3=Ticks
		    for i=1 to 10
		      b=t.ReadRGB
		    next
		    t3=ticks-t3
		    
		    if not b then
		      MsgBox "ReadRGB failed!"
		    end if
		    
		  else
		    Title="open failed"
		  end if
		  
		  // PreviewRGB with factor 2
		  t=nil
		  t=new MyTiff
		  
		  if t.Open(f) then
		    
		    t4=Ticks
		    for i=1 to 10
		      b=t.ReadPreviewRGB(2)
		    next
		    t4=ticks-t4
		    
		    if not b then
		      MsgBox "ReadPreviewRGB failed!"
		    else
		      title=str(t.Width)+" x "+str(T.Height)+" -> "+str(T.Pict.Width)+" x "+str(T.Pict.Height)
		      Backdrop=t.Pict
		    end if
		    
		  else
		    Title="open failed"
		  end if
		  
		  // PreviewRGB with factor 4
		  t=nil
		  t=new MyTiff
		  
		  if t.Open(f) then
		    
		    t5=Ticks
		    for i=1 to 10
		      b=t.ReadPreviewRGB(4)
		    next
		    t5=ticks-t5
		    
		    if not b then
		      MsgBox "ReadPreviewRGB failed!"
		    else
		      title=str(t.Width)+" x "+str(T.Height)+" -> "+str(T.Pict.Width)+" x "+str(T.Pict.Height)
		      Backdrop=t.Pict
		    end if
		    
		  else
		    Title="open failed"
		  end if
		  
		  // PreviewRGB with factor 10
		  t=nil
		  t=new MyTiff
		  
		  if t.Open(f) then
		    
		    t6=Ticks
		    for i=1 to 10
		      b=t.ReadPreviewRGB(10)
		    next
		    t6=ticks-t6
		    
		    if not b then
		      MsgBox "ReadPreviewRGB failed!"
		    else
		      title=str(t.Width)+" x "+str(T.Height)+" -> "+str(T.Pict.Width)+" x "+str(T.Pict.Height)
		      Backdrop=t.Pict
		    end if
		    
		  else
		    Title="open failed"
		  end if
		  
		  // BW
		  t=nil
		  t=new MyTiff
		  
		  if t.Open(f) then
		    
		    t1=Ticks
		    for i=1 to 10
		      b=t.ReadBW
		    next
		    t1=ticks-t1
		    
		    if not b then
		      MsgBox "ReadBW failed!"
		    end if
		    
		  else
		    Title="open failed"
		  end if
		  
		  // PreviewBW
		  t=nil
		  t=new MyTiff
		  
		  if t.Open(f) then
		    
		    t2=Ticks
		    for i=1 to 10
		      b=t.ReadPreviewBW
		    next
		    t2=ticks-t2
		    
		    
		    if not b then
		      MsgBox "ReadPreviewBW failed!"
		    end if
		    
		    if t.Pict=nil then
		      Title="nil!"
		    else
		      'title=str(t.Width)+" x "+str(T.Height)+" -> "+str(T.Pict.Width)+" x "+str(T.Pict.Height)
		      'Backdrop=t.Pict
		    end if
		    
		  else
		    Title="open failed"
		  end if
		  
		  MsgBox str(t1)+" ticks for ReadBW"+_
		  EndOfLine+stR(t2)+" ticks for ReadPreviewBW"+_
		  EndOfLine+stR(t3)+" ticks for ReadRGB"+_
		  EndOfLine+stR(t4)+" ticks for ReadPreviewRGB(2)"+_
		  EndOfLine+stR(t5)+" ticks for ReadPreviewRGB(4)"+_
		  EndOfLine+stR(t6)+" ticks for ReadPreviewRGB(10)"
		  
		  
		End Sub
	#tag EndEvent


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
