#tag Window
Begin Window CMYKExample
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   BalloonHelp     =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   HasFullScreenButton=   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   "False"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   -1163866787
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "CMYK Example"
   Visible         =   True
   Width           =   600
   Begin Canvas originalc
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas cc
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   200
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas mc
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   400
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas yc
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   200
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   200
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas bc
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   400
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   200
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label StaticText1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   84
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
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Drop a picture into this window.\rIt will be converted from RGB to CMYK using Colorsync and than displayed in it's for colors on the right."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "SmallSystem"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   212
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   168
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
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Engine:"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   308
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   60
   End
   Begin PopupMenu PopupMenu1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "ColorMatching\rRB without black channel\rRB with black channel"
      Italic          =   False
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   340
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   168
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  dim f as FolderItem
		  
		  do
		    if obj.FolderItemAvailable then
		      f=obj.FolderItem
		      lastfile=F
		      run f
		    end if
		  loop until not obj.NextItem
		End Sub
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  FileLoadCMYKJPEG.Enable
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AcceptFileDrop "special/any"
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileLoadCMYKJPEG() As Boolean Handles FileLoadCMYKJPEG.Action
			dim f as FolderItem
			
			f=GetOpenFolderItem("special/any")
			if f<>nil then
			loadjpeg f
			end if
		End Function
	#tag EndMenuHandler


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
		Function getpictureCM(c as LCMS2bitmapMBS, s as string,nn as integer) As picture
		  // converts a CMBitmapMBS to a picture taking only one channel with offset nn
		  
		  dim p as Picture
		  dim r as RGBSurface
		  dim x,y as integer
		  dim m as MemoryBlock
		  dim n as integer
		  dim i as integer
		  
		  p = new Picture(200,200,32)
		  r=p.RGBSurface
		  m=c.Data
		  n=nn
		  
		  for x=0 to 199
		    for y=0 to 199
		      
		      i=m.UInt8Value(n)
		      
		      i=255-i
		      
		      r.Pixel(y,x)=rgb(i,i,i)
		      
		      n=n+4
		    Next
		  next
		  
		  p.Graphics.ForeColor=rgb(255,0,0)
		  p.Graphics.DrawString s,10,10
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getpictureJPEG(m as memoryblock, w as integer,h as integer, s as string,nn as integer,rowbytes as integer) As picture
		  // converts a JPEG memoryblock to a picture taking only one channel with offset nn
		  
		  dim p as Picture
		  dim r as RGBSurface
		  dim x,y as integer
		  dim n as integer
		  dim i as integer
		  dim ww,hh as integer
		  dim d as integer
		  
		  ww=w-1
		  hh=h-1
		  p = new Picture(w,h,32)
		  r=p.RGBSurface
		  d=nn
		  
		  for x=0 to ww
		    n=d
		    for y=0 to hh
		      
		      i=m.byte(n)
		      
		      r.Pixel(y,x)=rgb(i,i,i)
		      
		      n=n+4
		    Next
		    d=d+rowbytes
		  next
		  
		  p.Graphics.ForeColor=rgb(255,0,0)
		  p.Graphics.DrawString s,10,10
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getpictureRBCM(m as memoryblock, w as integer,h as integer, s as string,nn as integer) As picture
		  // converts a memoryblock to a picture taking only one channel with offset nn
		  
		  dim p as Picture
		  dim r as RGBSurface
		  dim x,y as integer
		  dim n as integer
		  dim i as integer
		  dim ww,hh as integer
		  
		  ww=w-1
		  hh=h-1
		  p = new Picture(w,h,32)
		  r=p.RGBSurface
		  n=nn
		  
		  for x=0 to ww
		    for y=0 to hh
		      
		      i=m.byte(n)
		      
		      i=255-i
		      
		      r.Pixel(y,x)=rgb(i,i,i)
		      
		      n=n+4
		    Next
		  next
		  
		  p.Graphics.ForeColor=rgb(255,0,0)
		  p.Graphics.DrawString s,10,10
		  
		  Return p
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadjpeg(f as folderItem)
		  dim j as JPEGImporterMBS
		  dim m as MemoryBlock
		  
		  j=new JPEGImporterMBS
		  
		  j.File=f
		  j.ImportCMYK
		  
		  Title=f.DisplayName+" ("+str(j.Width)+" x "+str(j.Height)+")"
		  
		  m=j.PictureData
		  
		  if m=nil then
		    MsgBox "No data imported!?"
		  else
		    cc.Backdrop=getpictureJPEG(m,min(200,j.Width),min(200,j.Height),"cyan",0,j.Width*4)
		    mc.Backdrop=getpictureJPEG(m,min(200,j.Width),min(200,j.Height),"magenta",1,j.Width*4)
		    yc.Backdrop=getpictureJPEG(m,min(200,j.Width),min(200,j.Height),"yellow",2,j.Width*4)
		    bc.Backdrop=getpictureJPEG(m,min(200,j.Width),min(200,j.Height),"black",3,j.Width*4)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub run(f as folderitem)
		  dim p as Picture
		  
		  if f<>nil then
		    p=f.OpenAsPicture
		    if p<>nil then
		      if PopupMenu1.ListIndex=0 then
		        runColorMatching p
		      elseif PopupMenu1.ListIndex=1 then
		        runRBCM p,true
		      else
		        runRBCM p,false
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runColorMatching(inputpic as picture)
		  dim p as Picture
		  dim m as MemoryBlock
		  dim cb,co as LCMS2BitmapMBS
		  dim cw as LCMS2TransformMBS
		  dim i,c as integer
		  dim ip,op as LCMS2ProfileMBS
		  dim n as String
		  dim e as integer
		  dim fi,fo as FolderItem
		  dim f as FolderItem
		  dim j as JPEGExporterMBS
		  
		  fi = FindFile("Generic RGB Profile.icc")
		  fo = FindFile("Generic CMYK Profile.icc")
		  
		  ip = LCMS2ProfileMBS.OpenProfileFromFile(fi)
		  op = LCMS2ProfileMBS.OpenProfileFromFile(fo)
		  
		  p = new Picture(200,200,32)
		  
		  p.Graphics.DrawPicture inputpic,0,0
		  
		  originalc.Backdrop=p
		  
		  // input bitmap
		  cb = new LCMS2BitmapMBS(p,8)
		  
		  // output bitmap
		  co = new LCMS2BitmapMBS(200, 200, LCMS2MBS.kcmsSigCmykData)
		  
		  
		  dim foi as integer = ip.FormatterForBitmap
		  dim foo as integer = op.FormatterForBitmap
		  
		  cw = LCMS2TransformMBS.CreateTransform(ip, foi, op, foo, 0)
		  
		  if cw.Transform(cb,co) then
		    
		    bc.Backdrop=getpictureCM(co,"black",3)
		    cc.Backdrop=getpictureCM(co,"cyan",0)
		    mc.Backdrop=getpictureCM(co,"magenta",1)
		    yc.Backdrop=getpictureCM(co,"yellow",2)
		    
		    f = SpecialFolder.Desktop.Child("CMYK Example output CM.jpg")
		    
		    j=new JPEGExporterMBS
		    
		    j.File=f
		    j.ExportCMYK (co.data), 200, 200, 200*4
		    
		    if j.ErrorCode <> 0 then
		      MsgBox str(j.ErrorCode)+" "+j.ErrorMessage
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub runRBCM(inputpic as picture, noblack as boolean)
		  dim p as Picture
		  dim m as MemoryBlock
		  dim f as FolderItem
		  dim j as JPEGExporterMBS
		  dim x,y,xx,yy as integer
		  dim r as RGBSurface
		  dim n as integer
		  dim c as color
		  dim rr,gg,bb as integer
		  dim kk as integer
		  
		  p = new Picture(200,200,32)
		  
		  p.Graphics.DrawPicture inputpic,0,0
		  
		  originalc.Backdrop=p
		  
		  m=New MemoryBlock(200*200*4)
		  
		  r=p.RGBSurface
		  xx=p.Width-1
		  yy=p.Height-1
		  
		  n=0
		  
		  if noblack then
		    for y=0 to yy
		      for x=0 to xx
		        
		        
		        c=r.Pixel(x,y)
		        
		        // without black part it's faster:
		        
		        m.Byte(n)=255-c.red // c
		        n=n+1
		        m.Byte(n)=255-c.green // m
		        n=n+1
		        m.Byte(n)=255-c.blue // y
		        n=n+1
		        m.Byte(n)=0 // k
		        n=n+1
		      next
		    next
		    
		  else
		    for y=0 to yy
		      for x=0 to xx
		        
		        // with black
		        
		        c=r.Pixel(x,y)
		        
		        rr=255-c.red
		        gg=255-c.green
		        bb=255-c.blue
		        kk=min(min(rr,gg),bb)
		        rr=rr-kk
		        gg=gg-kk
		        bb=bb-kk
		        
		        m.Byte(n)=rr // c
		        n=n+1
		        m.Byte(n)=gg // m
		        n=n+1
		        m.Byte(n)=bb // y
		        n=n+1
		        m.Byte(n)=kk // k
		        n=n+1
		        
		      next
		    next
		  end if
		  
		  cc.Backdrop=getpictureRBCM(m,p.Width,p.Height,"cyan",0)
		  mc.Backdrop=getpictureRBCM(m,p.Width,p.Height,"magenta",1)
		  yc.Backdrop=getpictureRBCM(m,p.Width,p.Height,"yellow",2)
		  bc.Backdrop=getpictureRBCM(m,p.Width,p.Height,"black",3)
		  
		  if noblack then
		    f=SpecialFolder.Desktop.Child("CMYK Example output CMRB1.jpg")
		  else
		    f=SpecialFolder.Desktop.Child("CMYK Example output CMRB2.jpg")
		  end if
		  
		  j=new JPEGExporterMBS
		  
		  j.File=f
		  j.ExportCMYK m,p.Width,p.Height,p.Width*4
		  
		  'MsgBox str(j.ErrorCode)+" "+j.ErrorMessage
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected lastfile As folderitem
	#tag EndProperty


#tag EndWindowCode

#tag Events PopupMenu1
	#tag Event
		Sub Change()
		  run lastfile
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
#tag EndViewBehavior
