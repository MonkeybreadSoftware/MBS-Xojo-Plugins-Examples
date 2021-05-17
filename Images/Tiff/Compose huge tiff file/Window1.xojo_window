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
   MenuBar         =   886541552
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Compose huge tiff file"
   Visible         =   True
   Width           =   600
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Create huge TIF image"
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   245
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Create smaller TIF image"
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   46
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   245
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Combine both into new TIF image"
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   78
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   245
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   107
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
      Multiline       =   True
      Scope           =   "0"
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "If you have a huge tif with a billion pixel in black&white, you can't simply load it in Xojo.\rBut with TiffPictureMBS class we can work scanline by scanline.\r\rThis example creates a big tif and a small barcode tif. Than it merges both into one big tif, row by row."
      TextAlign       =   0
      TextColor       =   
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   141
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   560
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub CreateBig()
		  // write big tiff row by row with a checkered pattern
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("testbig.tif")
		  
		  if f<>Nil then
		    dim t as new TiffPictureMBS
		    
		    if t.Create(f) then
		      const x = 30000 // big size
		      
		      t.Height=x
		      t.Width=x
		      
		      t.RowsPerStrip = 1
		      t.PlanarConfig = t.kPlanarConfigContig
		      t.Photometric = t.kPhotometricMinIsBlack
		      t.BitsPerSample = 1
		      t.SamplesPerPixel = 1
		      t.FillOrder = t.kFillOrderMSB2LSB
		      t.Orientation = t.kOrientationTopLeft
		      t.ResolutionUnit = t.kResUnitInch
		      t.VerticalResolution = 72.0
		      t.HorizontalResolution = 72.0
		      t.Compression = T.kCompressionLZW
		      
		      dim row1 as MemoryBlock = NewMemoryBlock( t.BytesPerRow + 8 )
		      dim row2 as MemoryBlock = NewMemoryBlock( t.BytesPerRow + 8 )
		      
		      dim u as integer = row1.size -1
		      for i as integer = 0 to u step 2
		        row1.UInt8Value(i  ) = 0
		        row1.UInt8Value(i+1) = 255
		        row2.UInt8Value(i  ) = 255
		        row2.UInt8Value(i+1) = 0
		      next
		      
		      dim h as integer = t.Height-1
		      for i as integer = 0 to h
		        dim n as integer = i mod 16
		        
		        if n > 7 then
		          t.Scanline(i)=row2
		        else
		          t.Scanline(i)=row1
		        end if
		      next
		      
		      t.Close
		      
		      MsgBox "Wrote TIFF file."
		      
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSmall()
		  // write small tiff row by row with a barcode
		  
		  dim z as new BarcodeGeneratorMBS
		  
		  z.Symbology = BarcodeGeneratorMBS.BarcodeUpca
		  z.Encode "72527270270+12345"
		  
		  dim pic as Picture = z.picture
		  
		  dim f as FolderItem = SpecialFolder.Desktop.Child("testsmall.tif")
		  
		  if f<>Nil then
		    dim t as new TiffPictureMBS
		    
		    if t.Create(f) then
		      
		      t.Height = pic.Height
		      t.Width = pic.Width
		      
		      t.RowsPerStrip = 1
		      t.PlanarConfig = t.kPlanarConfigContig
		      t.Photometric = t.kPhotometricMinIsBlack
		      t.BitsPerSample = 1
		      t.SamplesPerPixel = 1
		      t.FillOrder = t.kFillOrderMSB2LSB
		      t.Orientation = t.kOrientationTopLeft
		      t.ResolutionUnit = t.kResUnitInch
		      t.VerticalResolution = 72.0
		      t.HorizontalResolution = 72.0
		      t.Compression = T.kCompressionLZW
		      
		      dim r as RGBSurface = pic.RGBSurface
		      dim row as MemoryBlock = NewMemoryBlock(t.RowsPerStrip + 8)
		      
		      dim w as integer = t.Width -1
		      dim h as integer = t.Height-1
		      for y as integer = 0 to h
		        dim u as integer = row.size-7
		        for i as integer = 0 to u step 8
		          row.Int64Value(i) = 0
		        next
		        
		        dim pos as integer = 0
		        dim bit as integer = 128
		        for x as integer = 0 to w
		          dim v as integer
		          if r.Pixel(x, y).Red > 128 then
		            // white
		            v = 1
		            row.UInt8Value(pos) = row.UInt8Value(pos) + bit
		          else
		            v = 0
		          end if
		          
		          if bit = 1 then
		            // next byte
		            pos = pos + 1
		            bit = 128
		          else
		            bit = Bitwise.ShiftRight(Bit, 1)
		          end if
		        next
		        
		        t.Scanline(y) = row
		        
		      next
		      
		      t.Close
		      
		      MsgBox "Wrote TIFF file."
		      
		    end if
		  end if
		  
		  f = SpecialFolder.Desktop.Child("testsmall.png")
		  pic.Save(f, pic.SaveAsPNG)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Merge()
		  // write big tiff row by row with a checkered pattern
		  
		  dim f1 as FolderItem = SpecialFolder.Desktop.Child("testbig.tif")
		  dim f2 as FolderItem = SpecialFolder.Desktop.Child("testsmall.tif")
		  dim f3 as FolderItem = SpecialFolder.Desktop.Child("testresult.tif")
		  
		  dim t1 as new TiffPictureMBS
		  dim t2 as new TiffPictureMBS
		  dim t3 as new TiffPictureMBS
		  
		  if t1.Open(f1) then
		    if t2.Open(f2) then
		      if t3.Create(f3) then
		        
		        dim t2h as integer = t2.Height
		        t3.Height = t1.Height
		        t3.Width  = t1.Width
		        
		        t3.RowsPerStrip = t1.RowsPerStrip
		        t3.PlanarConfig = t1.PlanarConfig
		        t3.Photometric = t1.Photometric
		        t3.BitsPerSample = t1.BitsPerSample
		        t3.SamplesPerPixel = t1.SamplesPerPixel
		        t3.FillOrder = t1.FillOrder
		        t3.Orientation = t1.Orientation
		        t3.ResolutionUnit = t1.ResolutionUnit
		        t3.VerticalResolution = t1.VerticalResolution
		        t3.HorizontalResolution = t1.HorizontalResolution
		        t3.Compression = T1.kCompressionLZW
		        
		        dim row1 as MemoryBlock = NewMemoryBlock( t1.BytesPerRow)
		        dim row2 as MemoryBlock = NewMemoryBlock( t2.BytesPerRow)
		        
		        
		        
		        dim h as integer = t1.Height-1
		        for y as integer = 0 to h
		          // read
		          call t1.Scanline(row1, y)
		          
		          if y < t2h then
		            // put barcode on the huge tif
		            call t2.Scanline(row2, y)
		            
		            // CopyBytesMBS(srcOfs as Integer, numBytes as Integer, destBlk as memoryBlock, destOfs as Integer)
		            row2.CopyBytesMBS(0, row2.size, row1, 32)
		          end if
		          
		          t3.Scanline(y) = row1
		          
		        next
		        
		        t1.Close
		        t2.Close
		        t3.Close
		        
		        MsgBox "Wrote TIFF file."
		      end if
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  CreateBig
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  CreateSmall
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Merge
		  
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
