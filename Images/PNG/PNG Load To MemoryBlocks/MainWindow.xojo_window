#tag Window
Begin Window MainWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   628
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   532654079
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "PNG Load To MemoryBlocks"
   Visible         =   True
   Width           =   982
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   5
      ColumnsResizable=   False
      ColumnWidths    =   "30%,15%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   628
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "ColorType	Bit Depth	Interlace Type	Image Format	Row Bytes"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      ShowDropIndicator=   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   571
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Output
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   628
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   583
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   399
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CreateTestImage
		  
		  
		  Test GMImageMBS.GrayscaleType,     False, "Gray"
		  Test GMImageMBS.GrayscaleMatteType, True, "Gray+Alpha"
		  Test GMImageMBS.BilevelType,       False, "1 bit"
		  Test GMImageMBS.TrueColorType,     False,  "RGB"
		  Test GMImageMBS.TrueColorMatteType, True, "RGB+Alpha"
		  
		  Test GMImageMBS.PaletteType,       False, "Palette"
		  Test GMImageMBS.PaletteMatteType,   True, "Palette+Alpha"
		  Test GMImageMBS.PaletteType,       False, "Palette", 16
		  Test GMImageMBS.PaletteMatteType,   True, "Palette+Alpha", 16
		  Test GMImageMBS.PaletteType,       False, "Palette", 4
		  Test GMImageMBS.PaletteMatteType,   True, "Palette+Alpha", 4
		  Test GMImageMBS.PaletteType,       False, "Palette", 2
		  Test GMImageMBS.PaletteMatteType,   True, "Palette+Alpha", 2
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateTestImage()
		  Dim p As Picture = LogoMBS(500)
		  
		  Dim n As New Picture(500, 500, 32)
		  Dim m As Picture = n.Mask
		  
		  n.Graphics.DrawPicture p, 0, 0
		  
		  // make outside area transparent
		  m.Graphics.ForeColor = &cFFFFFF
		  m.Graphics.FillRect 0, 0, 500, 500
		  m.Graphics.ForeColor = &c000000
		  m.Graphics.FillOval 0, 0, 500, 500
		  
		  
		  
		  pic = n
		  
		  logo = n
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Test(type as integer, withAlpha as Boolean, name as string, ColorCount as integer = 0)
		  // we compress test images with GraphicsMagick
		  
		  Dim g As New GMImageMBS(logo)
		  
		  g.matte = withAlpha
		  g.backgroundColor = GMColorMBS.White
		  
		  If type = g.PaletteType Or type = g.PaletteMatteType Then
		    // reduce number of colors
		    
		    If ColorCount > 0 then
		      g.quantizeColors =  ColorCount
		    End If
		    
		    g.quantize
		  End If
		  
		  g.type = type
		  
		  
		  // save as PNG
		  g.magick = "png"
		  
		  Dim blob As New GMBlobMBS
		  Dim filename As String = "test "+Str(type)+" "+name+".png"
		  Dim file As FolderItem = SpecialFolder.Desktop.child(filename)
		  
		  g.write blob
		  g.write file
		  
		  Dim pngData As String = blob.CopyString
		  
		  
		  
		  
		  // now read it!
		  Dim png As New PNGReaderMBS
		  If png.OpenData(pngData) Then
		    
		    // needed for our MemoryBlocks
		    png.InvertAlpha = True
		    
		    // false -> RGBX or RGBA
		    // true -> Gray, Gray+Alpha, RGB or RGBA
		    png.ExpandGrayToRGB = True
		    
		    If png.ApplyOptions(0, -1) Then 
		      
		      Dim ColorType As String = Str(png.OriginalColorType)
		      Dim BitDepth As String = Str(png.BitDepth)
		      Dim InterlaceType As String = Str(png.InterlaceType)
		      
		      
		      //* These describe the color_type field In png_info. */
		      //* Color type masks */
		      Const PNG_COLOR_MASK_PALETTE = 1
		      Const PNG_COLOR_MASK_COLOR = 2
		      Const PNG_COLOR_MASK_ALPHA = 4
		      
		      //* Color types.  Note that Not all combinations are legal */
		      Const PNG_COLOR_TYPE_GRAY = 0
		      Const PNG_COLOR_TYPE_PALETTE = (PNG_COLOR_MASK_COLOR + PNG_COLOR_MASK_PALETTE)
		      Const PNG_COLOR_TYPE_RGB = (PNG_COLOR_MASK_COLOR)
		      Const PNG_COLOR_TYPE_RGB_ALPHA = (PNG_COLOR_MASK_COLOR + PNG_COLOR_MASK_ALPHA)
		      Const PNG_COLOR_TYPE_GRAY_ALPHA = (PNG_COLOR_MASK_ALPHA)
		      
		      
		      Select Case png.OriginalColorType
		      Case PNG_COLOR_TYPE_GRAY
		        ColorType = "Gray"
		      Case PNG_COLOR_TYPE_PALETTE
		        ColorType = "Palette"
		      Case PNG_COLOR_TYPE_RGB
		        ColorType = "RGB"
		      Case PNG_COLOR_TYPE_RGB_ALPHA
		        ColorType = "RGB+Alpha"
		      Case PNG_COLOR_TYPE_GRAY_ALPHA
		        ColorType = "Gray+Alpha"
		      Else
		        ColorType = Str(png.ColorType)
		      End Select
		      
		      If png.ColorType <> png.OriginalColorType Then
		        // if ApplyOptions changed type, show both
		        Select Case png.ColorType
		        Case PNG_COLOR_TYPE_GRAY
		          ColorType = ColorType + "/Gray"
		        Case PNG_COLOR_TYPE_PALETTE
		          ColorType = ColorType + "/Palette"
		        Case PNG_COLOR_TYPE_RGB
		          ColorType = ColorType + "/RGB"
		        Case PNG_COLOR_TYPE_RGB_ALPHA
		          ColorType = ColorType + "/RGB+Alpha"
		        Case PNG_COLOR_TYPE_GRAY_ALPHA
		          ColorType = ColorType + "/Gray+Alpha"
		        Else
		          ColorType = Str(png.ColorType)
		        End Select
		      end if
		      
		      //* These are For the interlacing type.  These values should Not be changed. */
		      Const PNG_INTERLACE_NONE  = 0 //* Non-interlaced image */
		      Const PNG_INTERLACE_ADAM7 = 1 //* Adam7 interlacing */
		      Const PNG_INTERLACE_LAST  = 2 //* Not a valid value */
		      
		      Select Case png.ColorType
		      Case PNG_INTERLACE_NONE
		        InterlaceType = "none"
		      Case PNG_INTERLACE_ADAM7
		        InterlaceType = "Adam7"
		      End Select
		      
		      
		      List.AddRow ColorType, BitDepth, InterlaceType, "", Str(png.RowBytes)
		      
		      
		      If False Then
		        // read via plugin
		        If png.ReadPicture Then
		          Dim p As Picture = png.CombinePictureWithMask
		          list.RowTag(list.LastIndex) = p 
		          List.Cell(List.LastIndex, 3) = ""
		        End If
		        
		      Else
		        // read via PictureMBS
		        Dim imgSource As PictureMBS
		        
		        Select Case png.ColorType
		        Case PNG_COLOR_TYPE_GRAY
		          
		          imgSource = New PictureMBS(png.Width, png.Height, PictureMBS.ImageFormatG)
		          
		          ' Read row by row the file and puts it in a PictureMBS instance
		          
		          Dim nMax As Integer = png.Height - 1
		          For nInd As Integer = 0 To nMax
		            Dim m As MemoryBlock = png.ReadRow
		            imgSource.RowInFormat(nInd, PictureMBS.ImageFormatG) = m
		          Next 
		          
		        Case PNG_COLOR_TYPE_RGB
		          
		          If png.UseFiller = False Then
		            // we expand to RGB
		            imgSource = New PictureMBS(png.Width, png.Height, PictureMBS.ImageFormatRGB)
		            
		            ' Read row by row the file and puts it in a PictureMBS instance
		            
		            Dim nMax As Integer = png.Height - 1
		            For nInd As Integer = 0 To nMax
		              imgSource.RowInFormat(nInd, PictureMBS.ImageFormatRGB) = png.ReadRow
		            Next 
		            
		          Else
		            // we expand to RGBX
		            imgSource = New PictureMBS(png.Width, png.Height, PictureMBS.ImageFormatRGBX)
		            
		            ' Read row by row the file and puts it in a PictureMBS instance
		            
		            Dim nMax As Integer = png.Height - 1
		            For nInd As Integer = 0 To nMax
		              imgSource.RowInFormat(nInd, PictureMBS.ImageFormatRGBX) = png.ReadRow
		            Next 
		            
		          end if
		          
		        Case PNG_COLOR_TYPE_RGB_ALPHA
		          
		          imgSource = New PictureMBS(png.Width, png.Height, PictureMBS.ImageFormatRGBA)
		          
		          ' Read row by row the file and puts it in a PictureMBS instance
		          
		          Dim nMax As Integer = png.Height - 1
		          For nInd As Integer = 0 To nMax
		            // alpha is swapped before
		            imgSource.RowInFormat(nInd, PictureMBS.ImageFormatRGBA) = png.ReadRow
		          Next 
		          
		        Case PNG_COLOR_TYPE_GRAY_ALPHA
		          
		          imgSource = New PictureMBS(png.Width, png.Height, PictureMBS.ImageFormatGA)
		          
		          ' Read row by row the file and puts it in a PictureMBS instance
		          
		          Dim nMax As Integer = png.Height - 1
		          For nInd As Integer = 0 To nMax
		            imgSource.RowInFormat(nInd, PictureMBS.ImageFormatGA) = png.ReadRow
		          Next 
		        End Select
		        
		        ' show Picture 
		        If imgSource <> Nil then
		          Dim p As Picture = imgSource.CopyPictureWithMask
		          list.RowTag(list.LastIndex) = p 
		          List.Cell(List.LastIndex, 3) = imgSource.ImageFormatString
		        End If
		      end if
		    End If
		  End If
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		logo As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		pic As Picture
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub Change()
		  If Me.ListIndex >= 0 Then
		    pic = Me.RowTag(Me.ListIndex)
		  Else
		    pic = Nil
		  End If
		  
		  output.Invalidate
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Output
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If pic <> Nil Then
		    
		    Dim faktor As Double = Min( g.Height / Pic.Height, g.Width / Pic.Width)
		    
		    // Calculate new size
		    Dim w As Integer = Pic.Width * faktor
		    Dim h As Integer = Pic.Height * faktor
		    
		    g.DrawPicture Pic, 0, 0, w, h, 0, 0, Pic.Width, Pic.Height
		    
		  End If
		  
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
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="logo"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
