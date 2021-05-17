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
   Height          =   379
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1689799889
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Carbon vs Cocoa"
   Visible         =   True
   Width           =   664
   Begin Canvas CanvasCarbon
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   101
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas CanvasCocoaSlow
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
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   101
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Canvas CanvasCocoaFast
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
      Left            =   444
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   "0"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   101
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label TestLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Carbon (not color managed)"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   339
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label TestLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cocoa-slow"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   339
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label TestLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   444
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Cocoa-fast"
      TextAlign       =   1
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   339
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   200
   End
   Begin Label RGBlabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label RGBlabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   72
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label RGBlabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   332
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   2
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   307
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label RGBlabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   232
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   307
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton SelectProfileButton
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Select profile..."
      Default         =   False
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
      Scope           =   "0"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   150
   End
   Begin Label ProfileNameLabel
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
      Left            =   182
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "(default: Generic RGB for Carbon; sRGB assigned to Cocoa)"
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   462
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
		Sub Open()
		  Dim i As Integer
		  
		  'load the 4 patches colors; these values presume that they were computed to correspond to a specific RGB space
		  'Note: the ICC computation for the "Carbon" case are not included; the "Cocoa" case requires that the user selects an external profile
		  patchColors(0,0) = 65
		  patchColors(1,0) = 135
		  patchColors(2,0) = 164
		  
		  patchColors(0,1) = 165
		  patchColors(1,1) = 85
		  patchColors(2,1) = 147
		  
		  patchColors(0,2) = 227
		  patchColors(1,2) = 198
		  patchColors(2,2) = 53
		  
		  patchColors(0,3) = 182
		  patchColors(1,3) = 148
		  patchColors(2,3) = 129
		  
		  ' write the patch RGB values in the window
		  for i = 0 to 3
		    RGBlabel(i).text = Str(patchColors(0, i)) + ", " + Str(patchColors(1, i)) + ", " + Str(patchColors(2, i))
		  next i
		  
		  ' set the patch size
		  patchDim = 100
		  
		  'set the patch qty
		  patchQty = 4
		  
		  'set the number of rows
		  patchRows = 2
		  
		  ' refresh only CanvasCarbon since the other two canvases require that a profile be loaded beforehand
		  CanvasCarbon.Refresh
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DrawCanvasBackground()
		  Dim i, xpos, ypos As Integer
		  
		  'define a new Canvas background
		  CanvasBackground = New Picture(CanvasCarbon.width, CanvasCarbon.height, 32)
		  
		  'define a new Canvas Picture
		  CanvasPict = New Picture(CanvasCarbon.width, CanvasCarbon.height, Screen(0).Depth)
		  
		  ' draw the patches on the Canvas background
		  for i = 0 to patchQty -1
		    ypos = (i Mod patchRows) * patchDim
		    xpos = Floor(i / patchRows) * patchDim
		    CanvasBackground.Graphics.ForeColor = RGB(patchColors(0,i), patchColors(1,i), patchColors(2,i))
		    CanvasBackground.Graphics.FillRect(xpos, ypos, patchDim, patchDim)
		  next i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawCanvasPict()
		  Dim sampleRow, sampleColumn As Integer
		  
		  'check if the canvas picture was defined
		  'Note: it will not be defined when this Method is called during window initialization
		  if CanvasPict = nil then
		    Return
		  end if
		  
		  'transfer the Canvas background to the Canvas Picture
		  CanvasPict.Graphics.DrawPicture CanvasBackground, 0, 0
		  
		  '*****************************************************
		  ' add a border to the patch under the mouse; check if the mouse is over a patch
		  if newPatchNumber <> -1 then
		    'the mouse is over a patch; select the border color (black)
		    CanvasPict.Graphics.foreColor = RGB(0,0,0)
		    
		    'draw the patch border
		    sampleRow = newPatchNumber Mod patchRows
		    sampleColumn = floor (newPatchNumber / patchRows)
		    CanvasPict.Graphics.drawRect (sampleColumn * patchDim), (sampleRow * patchDim), patchDim, patchDim
		    CanvasPict.Graphics.drawRect (sampleColumn * patchDim)+1, (sampleRow * patchDim)+1, patchDim-2, patchDim-2
		  end if
		  
		  'assign the new patch number as the old number
		  oldPatchNumber = newPatchNumber
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		This example is provided by Danny Pascal
		
		dpascale@babelcolor.com
		
		
		It shows various ways to draw color measurement patch fields using color spaces.
		
	#tag EndNote


	#tag Property, Flags = &h1
		Protected CanvasBackground As Picture
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected CanvasPict As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		newPatchNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		oldPatchNumber As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		profileFolderItem As FolderItem
	#tag EndProperty


#tag EndWindowCode

#tag Events CanvasCarbon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  // Note: This event redraws the canvas picture (CanvasPict).
		  //           The canvas background (CanvasBackground) is made (Method/DrawCanvasBackground) only when
		  //                  the canvas is resized or the patches positions are changed (these events cannot happen in this demo).
		  //          The canvas picture is made from the canvas background picture to which is added the borders of the patch
		  //                 under the mouse cursor in Method/DrawCanvasPict.
		  //           The canvas picture is redrawn when the mouse cursor moves to another patch or out of the canvas.
		  //           Because the background does not need to be redrawn each time, this method can rapidly refresh the canvas
		  //                 for many thousand patches.
		  //           The code is based on the Carbon Framework and the colors are NOT displayed accurately in relation to the monitor profile.
		  
		  'check if this is the first instance of the event
		  if CanvasBackground = nil then
		    'prepare the buffer and redraw the canvas picture; this is a picture with all the patches
		    DrawCanvasBackground
		    
		    'add a frame indicating over which patch the mouse is located
		    DrawCanvasPict
		  end if
		  
		  'transfer the canvas picture to the canvas
		  g.DrawPicture CanvasPict, 0, 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim column, row As Integer
		  
		  'determine row
		  row = floor(Y / patchDim)
		  
		  'determine column
		  column = floor(X / patchDim)
		  
		  'check if the mouse if over a patch
		  newPatchNumber = (column * patchRows) + row
		  
		  if newPatchNumber < 0 then
		    'the mouse position corresponds to a negative patch number; assign an out-of-range value
		    newPatchNumber = -1
		    
		  elseif newPatchNumber < patchQTY then
		    ' the mouse is over a patch; check if the patch number changed since the last move
		    if newPatchNumber <> oldPatchNumber then
		      'redraw the canvas picture and update the canvas
		      'Note : the old patch number will be re-assigned when redrawing the canvas
		      DrawCanvasPict
		      me.Invalidate
		    end if
		    
		  else
		    'the patch number is higher than the patch quantity
		    newPatchNumber = -1
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  'set the patch number out-of-range
		  newPatchNumber = -1
		  
		  'redraw the canvas picture and update the canvas
		  DrawCanvasPict
		  me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  ' assign an out-of-range value to the index of the patch under the mouse
		  newPatchNumber = -1
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CanvasCocoaSlow
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim CanvasGraphics as new NSGraphicsMBS
		  dim NSspace as NSColorSpaceMBS
		  dim c1 as NSColorMBS
		  Dim RectMBS As NSRectMBS
		  dim row, column As Integer
		  Dim sampleRow, sampleColumn As Integer
		  
		  // Note: This event redraws the canvas background AND the borders of the patch under the mouse cursor at every refresh.
		  //           It is fast enough up to many hundred patches but will show delays for more patches.
		  //           The code is optimized for the Cocoa Framework and the colors are displayed accurately in relation to the monitor profile.
		  
		  // define the data color space
		  // Note: we assign the display profile since we computed the display RGB for this profile
		  if profileFolderItem = nil then
		    // a display profile was not found; use sRGB as a default space
		    NSspace = NSColorSpaceMBS.sRGBColorSpace
		  else
		    'NSspace = NSColorSpaceMBS.adobeRGB1998ColorSpace
		    NSspace = NSColorSpaceMBS.ColorSpaceWithICCProfileData(profileFolderItem)
		  end if
		  
		  'define a rectangle to be filled with the color of each patch
		  RectMBS = New NSRectMBS
		  RectMBS.Width = patchDim
		  RectMBS.Height = patchDim
		  
		  for row = 0 to 1
		    for column = 0 to 1
		      'set the patch/rectangle position
		      RectMBS.X = patchDim * column
		      RectMBS.Y = (CanvasCocoaSlow.Height - patchDim) - (patchDim * row)
		      
		      'define and set the patch color
		      c1 = NSColorMBS.colorWithColorSpace(NSspace, patchColors(0, row+2*column)/255, patchColors(1, row+2*column)/255, patchColors(2, row+2*column)/255,1.0)
		      CanvasGraphics.setColor(c1)
		      
		      'draw the filled rectangle
		      CanvasGraphics.fillRect(RectMBS)
		    next column
		  next row
		  
		  ' add a border to the patch under the mouse; check if the mouse is over a patch
		  if newPatchNumber <> -1 then
		    'the mouse is over a patch; define and set the border color (black)
		    c1 = NSColorMBS.colorWithColorSpace(NSspace, 0/255, 0/255, 0/255,1.0)
		    CanvasGraphics.setColor(c1)
		    
		    'derive the patch row and column
		    // Note: computing the row must take into account the reversed Y origin of the Cocoa canvas relative to how the patches are displayed (from top to bottom)
		    // sampleRow = (NumberOfRows - 1) - newPatchNumber Mod patchRows
		    sampleRow = 1 - newPatchNumber Mod patchRows
		    sampleColumn = floor (newPatchNumber / patchRows)
		    
		    'draw the patch border
		    CanvasGraphics.drawRect(sampleColumn * patchDim, sampleRow * patchDim, patchDim, patchDim)
		    CanvasGraphics.drawRect((sampleColumn * patchDim)+1, (sampleRow * patchDim)+1, patchDim-2, patchDim-2)
		  end if
		  
		  'assign the new patch number as the old number
		  oldPatchNumber = newPatchNumber
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim column, row As Integer
		  
		  'determine row
		  row = floor(Y / patchDim)
		  
		  'determine column
		  column = floor(X / patchDim)
		  
		  'check if the mouse if over a patch
		  newPatchNumber = (column * patchRows) + row
		  
		  if newPatchNumber < 0 then
		    'the mouse position corresponds to a negative patch number; assign an out-of-range value
		    newPatchNumber = -1
		    
		  elseif newPatchNumber < patchQTY then
		    ' the mouse is over a patch; check if the patch number changed since the last move
		    if newPatchNumber <> oldPatchNumber then
		      'redraw the canvas picture and update the canvas
		      'Note : the old patch number will be re-assigned when redrawing the canvas
		      me.Invalidate
		    end if
		    
		  else
		    'the patch number is higher than the patch quantity
		    newPatchNumber = -1
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  'set the patch number out-of-range
		  newPatchNumber = -1
		  
		  'redraw the canvas picture and update the canvas
		  me.Invalidate
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  ' assign an out-of-range value to the index of the patch under the mouse
		  newPatchNumber = -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CanvasCocoaFast
	#tag Event
		Sub MouseExit()
		  'set the patch number out-of-range
		  newPatchNumber = -1
		  
		  'redraw the canvas picture and update the canvas
		  DrawCanvasPict
		  CanvasCocoaFast.Invalidate
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  Dim column, row As Integer
		  
		  'determine row
		  row = floor(Y / patchDim)
		  
		  'determine column
		  column = floor(X / patchDim)
		  
		  'check if the mouse if over a patch
		  newPatchNumber = (column * patchRows) + row
		  
		  if newPatchNumber < 0 then
		    'the mouse position corresponds to a negative patch number; assign an out-of-range value
		    newPatchNumber = -1
		    
		  elseif newPatchNumber < patchQTY then
		    ' the mouse is over a patch; check if the patch number changed since the last move
		    if newPatchNumber <> oldPatchNumber then
		      'redraw the canvas picture and update the canvas
		      'Note : the old patch number will be re-assigned when redrawing the canvas
		      DrawCanvasPict
		      CanvasCocoaFast.Invalidate
		    end if
		    
		  else
		    'the patch number is higher than the patch quantity
		    newPatchNumber = -1
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  
		  ' assign an out-of-range value to the index of the patch under the mouse
		  newPatchNumber = -1
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Dim BitmapContext As CGBitmapContextMBS
		  Dim BitmapImageCG As CGImageMBS
		  Dim BitmapMB As MemoryBlock
		  dim ICCProfileData as memoryblock
		  dim ICCProfile As LCMS2ProfileMBS
		  dim w as CGContextMBS // of window
		  
		  // Note: This event redraws the canvas picture (CanvasPict).
		  //           The canvas background (CanvasBackground) is made (Method/DrawCanvasBackground) only when
		  //                  the canvas is resized or the patches positions are changed (these events cannot happen in this demo).
		  //          The canvas picture is made from the canvas background picture to which is added the borders of the patch
		  //                 under the mouse cursor in Method/DrawCanvasPict.
		  //           The canvas picture is redrawn when the mouse cursor moves to another patch or out of the canvas.
		  //           Because the background does not need to be redrawn each time, this method can rapidly refresh the canvas
		  //                 for many thousand patches.
		  //           The code is optimized for the Cocoa Framework and the colors are displayed accurately in relation to the monitor profile.
		  
		  // get profile info in MemoryBlock form in order to define the color space
		  if profileFolderItem = nil then
		    // a display profile was not found; define an sRGB profile
		    ICCProfile = LCMS2ProfileMBS.CreateSRGBProfile()
		  else
		    ICCProfile = LCMS2ProfileMBS.OpenProfileFromFile(profileFolderItem)
		  end if
		  ICCProfileData = ICCProfile.SaveProfileToMemory
		  
		  // define the color space
		  dim colorspace as CGColorSpaceMBS = CGColorSpaceMBS.CreateWithICCProfile(ICCProfileData)
		  
		  'check if this is the first instance of the event
		  if CanvasBackground = nil then
		    'prepare the buffer and redraw the canvas picture; this is a picture with all the patches
		    DrawCanvasBackground
		    
		    'add a frame indicating over which patch the mouse is located
		    DrawCanvasPict
		  end if
		  
		  // define a MemoryBlock for the bitmap
		  BitmapMB = new MemoryBlock(200*3*200)
		  
		  // Method-A
		  // paint the Canvas Picture (using CGImageMBS)
		  // Note: drawing is done through CGContextMBS
		  if CanvasPict.CopyRGBtoMemoryblockMBS(BitmapMB, 0, 0, -1, 0, 0) then
		    BitmapContext = CGBitmapContextMBS.CreateRGB(BitmapMB, 200, 200, 600, colorspace)
		    BitmapImageCG = BitmapContext.CGImage(False, 0)
		    w=window1.CGContextMBS // we are inside paint event!
		    w.DrawPicture(BitmapImageCG, CGMakeRectMBS(0,0,200,200))
		  end if
		  
		  // Method-B
		  // paint the Canvas Picture (using NSImageMBS)
		  // Note: drawing is done through the Paint event g (Graphics) class
		  // if CanvasPict.CopyRGBtoMemoryblockMBS(BitmapMB, 0, 0, -1, 0, 0) then
		  // BitmapContext = CGBitmapContextMBS.CreateRGB(BitmapMB, 200, 200, 600, colorspace)
		  // BitmapImageCG = BitmapContext.CGImage(False, 0)
		  // // create an instance of the NSImageMBS with the content of CGImageMBS
		  // BitmapImageNS = NSImageMBS.imageWithCGImage(BitmapImageCG)
		  // g.DrawPicture BitmapImageNS.CopyPicture, 0, 0
		  // end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SelectProfileButton
	#tag Event
		Sub Action()
		  dim f As FolderItem
		  dim dlg As OpenDialog
		  
		  ' let the user browse for an external profile
		  
		  
		  '*************************
		  ' define a new OpenDialog
		  dlg= New OpenDialog
		  #If TargetMachO Then
		    dlg.Filter = MiscFileTypes.ICCProfileICC + MiscFileTypes.ICCProfileICM
		  #else
		    ' for Windows
		    dlg.Filter = MiscFileTypes.AllProfiles + MiscFileTypes.ICCProfileICC + MiscFileTypes.ICCProfileICM //  All profiles or separate categories
		  #endif
		  dlg.Title = "Open an RGB profile (*.icc, *.icm)"
		  
		  '*************************
		  ' open the dialog
		  f = dlg.ShowModal
		  
		  If f = Nil then
		    ' the user did not select a file
		    Return
		  End if
		  
		  if Not f.IsReadable then
		    ' the file cannot be read; it may be locked by another application
		    MsgBox "ERROR: The < " + f.DisplayName + " > file cannot be read!" + EndOfLine + "It may be opened in another program."
		    
		    Return
		  end if
		  
		  '*************************
		  '*************************
		  profileFolderItem = f
		  
		  ProfileNameLabel.Text = f.DisplayName
		  
		  // update the display
		  CanvasCarbon.Invalidate
		  CanvasCocoaSlow.Invalidate
		  CanvasCocoaFast.Invalidate
		  
		  
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
		Name="newPatchNumber"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="oldPatchNumber"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
