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
   Height          =   621
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   921445049
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Nil mask"
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
      Scope           =   "0"
      State           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox CheckBox2
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "No Backcolor"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   132
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   125
   End
   Begin CheckBox CheckBox3
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Nil Destimage"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   269
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   125
   End
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   "True"
      Height          =   555
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   46
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
   End
   Begin CheckBox CheckBox4
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Use Plugin"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   406
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   "0"
      State           =   1
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   125
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  source=LogoMBS(500)
		  
		  result = new Picture(500,500,32)
		  
		  dest = new Picture(500,500,32)
		  dest.Graphics.ForeColor=&c00FF00
		  dest.Graphics.FillRect 0,0,500,500
		  
		  MakeMask
		  
		  update
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BlendPicturesWithMask(pSourceImage As Picture, pDestImage As Picture, pMask As Picture) As Picture
		  #pragma disableBackgroundTasks
		  #pragma disableBoundsChecking
		  
		  const kTileSize=100
		  
		  Dim result As Picture
		  Dim tempSourceTile As Picture
		  Dim tempDestTile As Picture
		  Dim tempMaskTile As Picture
		  Dim tempResultTile As Picture
		  Dim tileX, tileY As Integer
		  Dim lastTileWidth, lastTileHeight As Integer
		  Dim tileWidth, tileHeight As Integer
		  Dim height, width As Integer
		  Dim origUseOldRenderer As Boolean
		  
		  If pMask <> Nil Then
		    height = pMask.Height
		    width = pMask.Width
		  Elseif pDestImage <> Nil Then
		    height = pDestImage.Height
		    width = pDestImage.Width
		  Else
		    height = pSourceImage.Height
		    width = pSourceImage.Width
		  End If
		  
		  result = new Picture(width, height, 32)
		  If TargetMacOS Then
		    origUseOldRenderer = result.graphics.UseOldRenderer
		    result.graphics.UseOldRenderer = True
		  End If
		  
		  tileY = 0
		  While tileY < result.Height
		    tileHeight = Min(kTileSize, result.Height - tileY)
		    
		    tileX = 0
		    While tileX < result.Width
		      tileWidth = Min(kTileSize, result.Width - tileX)
		      
		      If (tempSourceTile = Nil) Or (tileWidth <> lastTileWidth) Or (tileHeight <> lastTIleHeight) Then
		        tempSourceTile = new Picture(tileWidth, tileHeight, 32)
		        tempDestTile = new Picture(tileWidth, tileHeight, 32)
		        tempMaskTile = new Picture(tileWidth, tileHeight, 32)
		        lastTileWidth = tileWidth
		        lastTileHeight = tileHeight
		      End If
		      
		      'make sure the tiles are empty
		      
		      tempDestTile.graphics.ClearRect(0, 0, tileWidth, tileHeight)
		      
		      tempMaskTile.graphics.FillRect(0, 0, tileWidth, tileHeight)
		      
		      If TargetMacOS Then
		        tempSourceTile.graphics.UseOldRenderer = True
		      End If
		      tempSourceTile.graphics.DrawPicture(pSourceImage, 0, 0, tileWidth, tileHeight, tileX, tileY, tileWidth, tileHeight)
		      If pDestImage <> Nil Then
		        If TargetMacOS Then
		          tempDestTile.graphics.UseOldRenderer = True
		        End If
		        tempDestTile.graphics.DrawPicture(pDestImage, 0, 0, tileWidth, tileHeight, tileX, tileY, tileWidth, tileHeight)
		      End If
		      If pMask <> Nil Then
		        If TargetMacOS Then
		          tempMaskTile.graphics.UseOldRenderer = True
		        End If
		        tempMaskTile.graphics.DrawPicture(pMask, 0, 0, tileWidth, tileHeight, tileX, tileY, tileWidth, tileHeight)
		      End If
		      
		      tempResultTile = BlendPicturesWithMaskMBS(tempSourceTile, tempDestTile, tempMaskTile)
		      
		      'copy the tile into a 32 bit buffer then copy it into the result
		      tempSourceTile.graphics.DrawPicture(tempResultTile, 0, 0)
		      result.graphics.DrawPicture(tempSourceTile, tileX, tileY)
		      
		      tileX = tileX + tileWidth
		    Wend
		    
		    tileY = tileY + tileHeight
		  Wend
		  
		  If TargetMacOS Then
		    result.graphics.UseOldRenderer = origUseOldRenderer
		  End If
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BlendPicturesWithMask(pSourceImage As Picture, pDestImage As Picture, pMask As Picture, pBackgroundColour as color) As Picture
		  #pragma disableBackgroundTasks
		  #pragma disableBoundsChecking
		  
		  const kTileSize=100
		  
		  Dim result As Picture
		  Dim tempSourceTile As Picture
		  Dim tempDestTile As Picture
		  Dim tempMaskTile As Picture
		  Dim tempResultTile As Picture
		  Dim tileX, tileY As Integer
		  Dim lastTileWidth, lastTileHeight As Integer
		  Dim tileWidth, tileHeight As Integer
		  Dim height, width As Integer
		  Dim origUseOldRenderer As Boolean
		  
		  If pMask <> Nil Then
		    height = pMask.Height
		    width = pMask.Width
		  Elseif pDestImage <> Nil Then
		    height = pDestImage.Height
		    width = pDestImage.Width
		  Else
		    height = pSourceImage.Height
		    width = pSourceImage.Width
		  End If
		  
		  result = new Picture(width, height, 32)
		  If TargetMacOS Then
		    origUseOldRenderer = result.graphics.UseOldRenderer
		    result.graphics.UseOldRenderer = True
		  End If
		  
		  tileY = 0
		  While tileY < result.Height
		    tileHeight = Min(kTileSize, result.Height - tileY)
		    
		    tileX = 0
		    While tileX < result.Width
		      tileWidth = Min(kTileSize, result.Width - tileX)
		      
		      If (tempSourceTile = Nil) Or (tileWidth <> lastTileWidth) Or (tileHeight <> lastTIleHeight) Then
		        tempSourceTile = New Picture(tileWidth, tileHeight, 32)
		        tempDestTile = New Picture(tileWidth, tileHeight, 32)
		        tempMaskTile = New Picture(tileWidth, tileHeight, 32)
		        lastTileWidth = tileWidth
		        lastTileHeight = tileHeight
		      End If
		      
		      'make sure the tiles are empty
		      
		      tempDestTile.graphics.ForeColor = pBackgroundColour
		      tempDestTile.graphics.FillRect(0, 0, tileWidth, tileHeight)
		      
		      tempMaskTile.graphics.FillRect(0, 0, tileWidth, tileHeight)
		      
		      If TargetMacOS Then
		        tempSourceTile.graphics.UseOldRenderer = True
		      End If
		      tempSourceTile.graphics.DrawPicture(pSourceImage, 0, 0, tileWidth, tileHeight, tileX, tileY, tileWidth, tileHeight)
		      If pDestImage <> Nil Then
		        If TargetMacOS Then
		          tempDestTile.graphics.UseOldRenderer = True
		        End If
		        tempDestTile.graphics.DrawPicture(pDestImage, 0, 0, tileWidth, tileHeight, tileX, tileY, tileWidth, tileHeight)
		      End If
		      If pMask <> Nil Then
		        If TargetMacOS Then
		          tempMaskTile.graphics.UseOldRenderer = True
		        End If
		        tempMaskTile.graphics.DrawPicture(pMask, 0, 0, tileWidth, tileHeight, tileX, tileY, tileWidth, tileHeight)
		      End If
		      
		      tempResultTile = BlendPicturesWithMaskMBS(tempSourceTile, tempDestTile, tempMaskTile)
		      
		      'copy the tile into a 32 bit buffer then copy it into the result
		      tempSourceTile.graphics.DrawPicture(tempResultTile, 0, 0)
		      result.graphics.DrawPicture(tempSourceTile, tileX, tileY)
		      
		      tileX = tileX + tileWidth
		    Wend
		    
		    tileY = tileY + tileHeight
		  Wend
		  
		  If TargetMacOS Then
		    result.graphics.UseOldRenderer = origUseOldRenderer
		  End If
		  
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub makeMask()
		  mask = new Picture(500,500,32)
		  
		  dim g as Graphics=mask.Graphics
		  dim n as integer
		  
		  for x as integer=0 to 499
		    n=255-(x*255)\1000
		    g.ForeColor=rgb(n,n,n)
		    g.DrawLine x,0,0,x
		    
		  next
		  
		  for x as integer=0 to 499
		    n=127-(x*255)\1000
		    g.ForeColor=rgb(n,n,n)
		    g.DrawLine 499,x,x,499
		    
		  next
		  
		  'canvas1.Backdrop=mask
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub update()
		  dim m as Picture 
		  dim d as Picture
		  
		  if CheckBox1.Value then
		    m=nil
		  else
		    m=mask
		  end if
		  
		  if CheckBox2.Value then
		    d=nil
		  else
		    d=dest
		  end if
		  
		  if CheckBox4.Value then
		    
		    if CheckBox3.Value then
		      if BlendPicturesWithMaskWithBackgroundMBS(source,d,m,result,0,0,500,500) then
		        canvas1.Backdrop=result
		      else
		        beep
		        canvas1.Backdrop=nil
		      end if
		    else
		      if BlendPicturesWithMaskWithBackgroundMBS(source,d,m,result,0,0,500,500,&cFF0000) then
		        canvas1.Backdrop=result
		      else
		        beep
		        canvas1.Backdrop=nil
		      end if
		    end if
		    
		  else
		    
		    
		    if CheckBox3.Value then
		      canvas1.Backdrop=BlendPicturesWithMask(source,d,m)
		    else
		      canvas1.Backdrop=BlendPicturesWithMask(source,d,m,&cFF0000)
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dest As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		mask As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		result As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		source As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events CheckBox1
	#tag Event
		Sub Action()
		  update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox2
	#tag Event
		Sub Action()
		  update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox3
	#tag Event
		Sub Action()
		  update
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CheckBox4
	#tag Event
		Sub Action()
		  update
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
	#tag ViewProperty
		Name="mask"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="source"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="dest"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="result"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
