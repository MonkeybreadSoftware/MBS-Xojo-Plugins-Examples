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
   MenuBar         =   1240722797
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   True
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   3
      ColumnsResizable=   False
      ColumnWidths    =   "20%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   366
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Tag	Value"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   "0"
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  'dim f as FolderItem = GetOpenFolderItem("")
		  dim f as FolderItem = FindFile("test.jpg")
		  
		  
		  if f = nil then quit
		  
		  dim g as new GMImageMBS(f)
		  
		  Title = f.DisplayName
		  
		  dim ExifTags() as string = array("GPSLatitudeRef", "GPSLatitude", "GPSLongitudeRef", "GPSLongitude", "GPSAltitudeRef", "GPSAltitude", _
		  "GPSTimeStamp", "GPSSatellites", "GPSStatus", "GPSMeasureMode", "GPSDOP", "GPSSpeedRef", "GPSSpeed", "GPSTrackRef", "GPSTrack", _
		  "GPSImgDirectionRef", "GPSImgDirection", "GPSMapDatum", "GPSDestLatitudeRef", "GPSDestLatitude", "GPSDestLongitudeRef", "GPSDestLongitude", _
		  "GPSDestBearingRef", "GPSDestBearing", "GPSDestDistanceRef", "GPSDestDistance", "GPSDateStamp", "ImageWidth", "ImageLength", "BitsPerSample", _
		  "Compression", "PhotometricInterpretation", "FillOrder", "DocumentName", "ImageDescription", "Make", "Model", "StripOffsets", "Orientation", _
		  "SamplesPerPixel", "RowsPerStrip", "StripByteCounts", "MinSampleValue", "MaxSampleValue", "XResolution", "YResolution", "PlanarConfiguration", _
		  "PageName", "XPosition", "YPosition", "FreeOffsets", "FreeByteCounts", "GrayResponseUnit", "GrayResponseCurve", "T4Options", "T6Options", _
		  "ResolutionUnit", "TransferFunction", "Software", "DateTime", "Artist", "HostComputer", "Predictor", "WhitePoint", "PrimaryChromaticities", _
		  "ColorMap", "HalfToneHints", "TileWidth", "TileLength", "TileOffsets", "TileByteCounts", "SubIFD", "InkSet", "InkNames", "NumberOfInks", "DotRange", _
		  "TargetPrinter", "ExtraSample", "SampleFormat", "SMinSampleValue", "SMaxSampleValue", "TransferRange", "ClipPath", "XClipPathUnits", _
		  "YClipPathUnits", "Indexed", "JPEGTables", "OPIProxy", "JPEGProc", "JPEGInterchangeFormat", "JPEGInterchangeFormatLength", "JPEGRestartInterval", _
		  "JPEGLosslessPredictors", "JPEGPointTransforms", "JPEGQTables", "JPEGDCTables", "JPEGACTables", "YCbCrCoefficients", "YCbCrSubSampling", _
		  "YCbCrPositioning", "ReferenceBlackWhite", "ExtensibleMetadataPlatform", "Gamma", "ICCProfileDescriptor", "SRGBRenderingIntent", "ImageTitle", _
		  "ResolutionXUnit", "ResolutionYUnit", "ResolutionXLengthUnit", "ResolutionYLengthUnit", "PrintFlags", "PrintFlagsVersion", "PrintFlagsCrop", _
		  "PrintFlagsBleedWidth", "PrintFlagsBleedWidthScale", "HalftoneLPI", "HalftoneLPIUnit", "HalftoneDegree", "HalftoneShape", "HalftoneMisc", _
		  "HalftoneScreen", "JPEGQuality", "GridSize", "ThumbnailFormat", "ThumbnailWidth", "ThumbnailHeight", "ThumbnailColorDepth", "ThumbnailPlanes", _
		  "ThumbnailRawBytes", "ThumbnailSize", "ThumbnailCompressedSize", "ColorTransferFunction", "ThumbnailData", "ThumbnailImageWidth", _
		  "ThumbnailImageHeight", "ThumbnailBitsPerSample", "ThumbnailCompression", "ThumbnailPhotometricInterp", "ThumbnailImageDescription", _
		  "ThumbnailEquipMake", "ThumbnailEquipModel", "ThumbnailStripOffsets", "ThumbnailOrientation", "ThumbnailSamplesPerPixel", "ThumbnailRowsPerStrip", _
		  "ThumbnailStripBytesCount", "ThumbnailResolutionX", "ThumbnailResolutionY", "ThumbnailPlanarConfig", "ThumbnailResolutionUnit", _
		  "ThumbnailTransferFunction", "ThumbnailSoftwareUsed", "ThumbnailDateTime", "ThumbnailArtist", "ThumbnailWhitePoint", _
		  "ThumbnailPrimaryChromaticities", "ThumbnailYCbCrCoefficients", "ThumbnailYCbCrSubsampling", "ThumbnailYCbCrPositioning", "ThumbnailRefBlackWhite", _
		  "ThumbnailCopyRight", "LuminanceTable", "ChrominanceTable", "FrameDelay", "LoopCount", "PixelUnit", "PixelPerUnitX", "PixelPerUnitY", _
		  "PaletteHistogram", "RelatedImageFileFormat", "ImageID", "Matteing", "DataType", "ImageDepth", "TileDepth", "CFARepeatPatternDim", "CFAPattern", _
		  "BatteryLevel", "Copyright", "ExposureTime", "FNumber", "IPTC/NAA", "IT8RasterPadding", "IT8ColorTable", "ImageResourceInformation", "ExifOffset", _
		  "InterColorProfile", "ExposureProgram", "SpectralSensitivity", "GPSInfo", "ISOSpeedRatings", "OECF", "ExifVersion", "DateTimeOriginal", _
		  "DateTimeDigitized", "ComponentsConfiguration", "CompressedBitsPerPixel", "ShutterSpeedValue", "ApertureValue", "BrightnessValue", _
		  "ExposureBiasValue", "MaxApertureValue", "SubjectDistance", "MeteringMode", "LightSource", "Flash", "FocalLength", "MakerNote", "UserComment", _
		  "SubSecTime", "SubSecTimeOriginal", "SubSecTimeDigitized", "FlashPixVersion", "ColorSpace", "ExifImageWidth", "ExifImageLength", _
		  "InteroperabilityOffset", "FlashEnergy", "SpatialFrequencyResponse", "Noise", "FocalPlaneXResolution", "FocalPlaneYResolution", _
		  "FocalPlaneResolutionUnit", "ImageNumber", "SecurityClassification", "ImageHistory", "SubjectLocation", "ExposureIndex", "TIFF_EPStandardID", _
		  "SensingMethod", "FileSource", "SceneType", "CFAPattern", "CustomRendered", "ExposureMode", "WhiteBalance", "DigitalZoomRatio", _
		  "FocalLengthIn35mmFilm", "SceneCaptureType", "GainControl", "Contrast", "Saturation", "Sharpness", "DeviceSettingDescription", _
		  "SubjectDistanceRange", "ImageUniqueID")
		  
		  
		  ShowTags g, "Exif", "EXIF:", ExifTags
		  
		End Sub
	#tag EndEvent


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
		Sub ShowTags(g as GMImageMBS, label as string, prefix as string, tags() as string)
		  for each t as string in tags
		    
		    dim tag as string = prefix+t
		    dim value as string = g.attributeValue(tag)
		    
		    if value <> "unknown" then
		      list.AddRow label, tag, value
		    end if
		  next
		  
		  
		  
		End Sub
	#tag EndMethod


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
