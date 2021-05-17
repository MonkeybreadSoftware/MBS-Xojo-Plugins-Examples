#tag Window
Begin Window ProfileWindow
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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   867633408
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Ohne Titel"
   Visible         =   False
   Width           =   600
   Begin Listbox List
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "200"
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
      Height          =   387
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Key	Value"
      Italic          =   False
      Left            =   -1
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
      Top             =   -1
      Transparent     =   True
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   602
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Add(tag as Uint32, name as string)
		  dim c as Variant = p.ReadTag(tag)
		  
		  if c<>Nil then
		    List.AddFolder name
		    List.RowTag(List.LastIndex) = c
		  else
		    AddRaw tag, name
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add(v as Variant)
		  if v = nil then
		    // ignore
		  elseif v isa LCMS2CIEXYZMBS then
		    AddCIEXYZ v
		  elseif v isa LCMS2SequenceMBS then
		    AddSequence v
		  elseif v isa LCMS2PipelineMBS then
		    AddPipeline v
		  elseif v isa LCMS2NamedColorListMBS then
		    AddNamedColorList v
		  elseif v isa LCMS2ScreeningMBS then
		    AddScreening v
		  elseif v isa LCMS2ICCDataMBS then
		    AddICCData v
		  elseif v isa LCMS2MLUMBS then
		    AddMLU v
		  elseif v isa LCMS2CIExyYTripleMBS then
		    AddCIExyYTriple v
		  elseif v isa MemoryBlock then
		    AddMemoryblock v
		  elseif v isa LCMS2SequenceDescriptionMBS then
		    AddSequenceDescription v
		  elseif v isa LCMS2ToneCurveMBS then
		    AddToneCurve v
		  elseif v isa LCMS2StageMBS then
		    AddStage v
		  elseif v.IsArray then
		    
		  else
		    break // some type is missing here
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCIExyYTriple(v as LCMS2CIExyYTripleMBS)
		  List.AddRow "CIE xyY Triple"
		  
		  dim r as LCMS2CIExyYMBS = v.Red
		  dim g as LCMS2CIExyYMBS = v.Green
		  dim b as LCMS2CIExyYMBS = v.Blue
		  
		  List.AddRow "Red", str(r.x)+"/"+str(r.y)+"/"+str(r.yy)
		  List.AddRow "Green", str(g.x)+"/"+str(g.y)+"/"+str(g.yy)
		  List.AddRow "Blue", str(b.x)+"/"+str(b.y)+"/"+str(b.yy)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddCIEXYZ(x as LCMS2CIEXYZMBS)
		  List.AddRow "CIE XYZ"
		  
		  List.AddRow "xyz point", str(x.x)+"/"+str(x.y)+"/"+str(x.z)
		  
		  dim l as LCMS2CIELabMBS = x.Lab
		  if l<>Nil then
		    List.AddRow "as lab", str(l.l)+"/"+str(l.a)+"/"+str(l.b)
		  end if
		  
		  dim y as LCMS2CIExyYMBS = x.xyY
		  if y<>Nil then
		    List.AddRow "as xyY", str(y.x)+"/"+str(y.Y)+"/"+str(y.yy)
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddICCData(n as LCMS2ICCDataMBS)
		  List.AddRow "ICC Data"
		  
		  List.AddRow "Length",str(n.Size)
		  List.AddRow "Flags",str(n.Flags)
		  
		  dim m as MemoryBlock = n.Data
		  if m<>Nil then
		    dim size as integer = m.size
		    if size > 100 then
		      size = 100
		    end if
		    
		    dim s as string = m.StringValue(0,size)
		    List.AddRow "Data", EncodingToHexMBS(s)
		    List.AddRow "Text", ClearText(s)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddMemoryblock(m as MemoryBlock)
		  dim size as integer = m.size
		  
		  List.AddRow "Length",str(Size)
		  
		  if size > 100 then
		    size = 100
		  end if
		  
		  dim s as string = m.StringValue(0,size)
		  List.AddRow "Data", EncodingToHexMBS(s)
		  List.AddRow "Text", ClearText(s)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddMLU(n as LCMS2MLUMBS)
		  List.AddRow "MLU"
		  dim s as string = n.getUnicode("en", n.kNoCountry)
		  
		  if s<>"" then
		    List.AddRow "Unicode Text", s
		  else
		    s = n.getASCII("en", n.kNoCountry)
		    
		    if s<>"" then
		      List.AddRow "ASCII Text", s
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNamedColorList(n as LCMS2NamedColorListMBS)
		  List.AddRow "Named Color List"
		  dim c as integer = n.Count
		  
		  List.AddRow "Color Count", str(c)
		  
		  dim u as integer = n.Count-1
		  
		  for i as integer = 0 to u
		    List.AddRow "Name "+str(i), n.Name(i)
		    List.AddRow "Prefix "+str(i), n.Prefix(i)
		    List.AddRow "Suffix "+str(i), n.Suffix(i)
		    
		    dim PCSs(-1) as string
		    dim colorants(-1) as string
		    
		    dim PCS(-1) as integer = n.PCS(i)
		    dim Colorant(-1) as integer = n.Colorant(i)
		    
		    for each xx as integer in PCS
		      PCSs.Append str(xx)
		    next
		    
		    for each xx as integer in Colorant
		      Colorants.Append str(xx)
		    next
		    
		    List.AddRow "PCS "+str(i), Join(PCSs, ", ")
		    
		    dim l as LCMS2CIELabMBS
		    
		    if p.ProfileVersion = 4 then
		      l = LCMS2MBS.LabEncoded2Float(PCS(0), PCS(1), PCS(2))
		    else
		      l = LCMS2MBS.LabEncoded2FloatV2(PCS(0), PCS(1), PCS(2))
		    end if
		    
		    if l<>nil then
		      List.AddRow "PCS as Lab "+str(i), str(l.l)+"/"+str(l.a)+"/"+str(l.b)
		    end if
		    
		    dim ll as LCMS2CIEXYZMBS
		    ll = LCMS2MBS.XYZEncoded2Float(PCS(0), PCS(1), PCS(2))
		    
		    if ll<>nil then
		      List.AddRow "PCS as XYZ "+str(i), str(ll.x)+"/"+str(ll.y)+"/"+str(ll.z)
		    end if
		    
		    List.AddRow "Colorant "+str(i), Join(colorants, ", ")
		    
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPipeline(v as LCMS2PipelineMBS)
		  List.AddRow "Pipeline"
		  List.AddRow "InputChannels", str(v.InputChannels)
		  List.AddRow "OutputChannels", str(v.OutputChannels)
		  List.AddRow "StageCount", str(v.StageCount)
		  
		  
		  dim stages() as LCMS2StageMBS = v.Stages
		  
		  for each stage as LCMS2StageMBS in stages
		    List.AddFolder "Stage"
		    List.RowTag(List.LastIndex) = stage
		  next
		  
		  dim m1 as new MemoryBlock(4*16)
		  dim m2 as new MemoryBlock(4*16)
		  
		  for i as integer = 0 to 15
		    m1.SingleValue(i*4) = 1.0
		  next
		  
		  v.EvalFloat m1,m2
		  
		  dim u as integer = v.OutputChannels-1
		  for i as integer = 0 to u
		    List.AddRow "Channel "+str(i)+" with 1.0 gives", str(m2.SingleValue(4*i))
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRaw(tag as UInt32, name as string)
		  dim c as MemoryBlock = p.ReadRawTag(tag)
		  
		  if c<>Nil then
		    List.AddFolder name
		    List.RowTag(List.LastIndex) = c
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddScreening(v as LCMS2ScreeningMBS)
		  List.AddRow "Screening"
		  List.AddRow "Channels", str(v.Channels)
		  List.AddRow "Flags", str(v.Flag)
		  
		  dim u as integer = v.Channels-1
		  for i as integer = 0 to u
		    dim s as LCMS2ScreeningChannelMBS = v.Channel(i)
		    
		    List.AddRow "Channel "+str(i), str(s.Frequency)+"/"+str(s.ScreenAngle)+"/"+str(s.SpotShape)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSequence(v as LCMS2SequenceMBS)
		  List.AddRow "Sequence"
		  List.AddRow "Count", str(v.Count)
		  
		  dim u as integer = v.Count-1
		  for i as integer = 0 to u
		    dim c as LCMS2SequenceDescriptionMBS = v.Description(i)
		    
		    List.AddFolder str(i)+". description"
		    List.RowTag(List.LastIndex) = c
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSequenceDescription(v as LCMS2SequenceDescriptionMBS)
		  List.AddRow "AttributeFlags", hex(v.AttributeFlags)
		  
		  List.AddFolder "Description"
		  List.RowTag(List.LastIndex) = v.Description
		  
		  List.AddRow "DeviceMfg", hex(v.DeviceMfg)
		  List.AddRow "DeviceModel", hex(v.DeviceModel)
		  
		  List.AddFolder "Manufacturer"
		  List.RowTag(List.LastIndex) = v.Manufacturer
		  
		  List.AddFolder "Model"
		  List.RowTag(List.LastIndex) = v.Model
		  
		  List.AddRow "ProfileID", EncodingToHexMBS(v.ProfileID)
		  List.AddRow "Technology", hex(v.Technology)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddStage(stage as LCMS2StageMBS)
		  dim s as string = ""
		  
		  Select case stage.Type
		  case LCMS2MBS.kcmsSigCurveSetElemType
		    s = ": CurveSet"
		  case LCMS2MBS.kcmsSigMatrixElemType
		    s = ": Matrix"
		  case LCMS2MBS.kcmsSigCLutElemType
		    s = ": CLut"
		  case LCMS2MBS.kcmsSigBAcsElemType
		    s = ": BAcs"
		  case LCMS2MBS.kcmsSigEAcsElemType
		    s = ": EAcs"
		  end Select
		  
		  List.AddRow "Stage.Type", hex(stage.Type)+s
		  List.AddRow "Stage.InputChannels", str(stage.InputChannels)
		  List.AddRow "Stage.OutputChannels", str(stage.OutputChannels)
		  
		  Select case stage.Type
		  case LCMS2MBS.kcmsSigCurveSetElemType
		    dim t(-1) as LCMS2ToneCurveMBS = stage.ToneCurves
		    for each tt as LCMS2ToneCurveMBS in t
		      List.AddFolder "Tone Curve"
		      List.RowTag(List.LastIndex) = tt
		    next
		  case LCMS2MBS.kcmsSigMatrixElemType
		    
		  case LCMS2MBS.kcmsSigCLutElemType
		    
		    List.AddRow "CLutEntries", str(stage.CLutEntries)
		    
		    List.AddRow "Average Gridpoints", str(pow(stage.CLutEntries/stage.OutputChannels, 1/stage.InputChannels))
		    
		    
		  case LCMS2MBS.kcmsSigBAcsElemType
		    
		  case LCMS2MBS.kcmsSigEAcsElemType
		    
		  end Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddToneCurve(v as LCMS2ToneCurveMBS)
		  List.AddRow "Tone Curve"
		  List.AddRow "IsDescending", str(v.IsDescending)
		  List.AddRow "IsLinear", str(v.IsLinear)
		  List.AddRow "IsMonotonic", str(v.IsMonotonic)
		  List.AddRow "IsMultisegment", str(v.IsMultisegment)
		  List.AddRow "ParametricType", str(v.ParametricType)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClearText(s as string) As string
		  dim m as MemoryBlock = s
		  
		  dim u as integer = m.Size-1
		  
		  for i as integer = 0 to u
		    if m.Byte(i)<32 then
		      m.Byte(i) = asc(".")
		    elseif m.Byte(i)>127 then
		      m.Byte(i) = asc(".")
		    end if
		  next
		  
		  Return m
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColorSpaceTypeName(x as integer) As string
		  Select case x
		  case LCMS2MBS.kcmsSigXYZData
		    return "XYZ"
		  case LCMS2MBS.kcmsSigLabData
		    return "Lab"
		  case LCMS2MBS.kcmsSigLuvData
		    return "Luv"
		  case LCMS2MBS.kcmsSigYCbCrData
		    return "YCbCr"
		  case LCMS2MBS.kcmsSigYxyData
		    return "Yxy"
		  case LCMS2MBS.kcmsSigRgbData
		    return "Rgb"
		  case LCMS2MBS.kcmsSigGrayData
		    return "Gray"
		  case LCMS2MBS.kcmsSigHsvData
		    return "Hsv"
		  case LCMS2MBS.kcmsSigHlsData
		    return "Hls"
		  case LCMS2MBS.kcmsSigCmykData
		    return "Cmyk"
		  case LCMS2MBS.kcmsSigCmyData
		    return "Cmy"
		  case LCMS2MBS.kcmsSigMCH1Data
		    return "MCH1"
		  case LCMS2MBS.kcmsSigMCH2Data
		    return "MCH2"
		  case LCMS2MBS.kcmsSigMCH3Data
		    return "MCH3"
		  case LCMS2MBS.kcmsSigMCH4Data
		    return "MCH4"
		  case LCMS2MBS.kcmsSigMCH5Data
		    return "MCH5"
		  case LCMS2MBS.kcmsSigMCH6Data
		    return "MCH6"
		  case LCMS2MBS.kcmsSigMCH7Data
		    return "MCH7"
		  case LCMS2MBS.kcmsSigMCH8Data
		    return "MCH8"
		  case LCMS2MBS.kcmsSigMCH9Data
		    return "MCH9"
		  case LCMS2MBS.kcmsSigMCHAData
		    return "MCHA"
		  case LCMS2MBS.kcmsSigMCHBData
		    return "MCHB"
		  case LCMS2MBS.kcmsSigMCHCData
		    return "MCHC"
		  case LCMS2MBS.kcmsSigMCHDData
		    return "MCHD"
		  case LCMS2MBS.kcmsSigMCHEData
		    return "MCHE"
		  case LCMS2MBS.kcmsSigMCHFData
		    return "MCHF"
		  case LCMS2MBS.kcmsSigNamedData
		    return "Named"
		  case LCMS2MBS.kcmsSig1colorData
		    return "1color"
		  case LCMS2MBS.kcmsSig2colorData
		    return "2color"
		  case LCMS2MBS.kcmsSig3colorData
		    return "3color"
		  case LCMS2MBS.kcmsSig4colorData
		    return "4color"
		  case LCMS2MBS.kcmsSig5colorData
		    return "5color"
		  case LCMS2MBS.kcmsSig6colorData
		    return "6color"
		  case LCMS2MBS.kcmsSig7colorData
		    return "7color"
		  case LCMS2MBS.kcmsSig8colorData
		    return "8color"
		  case LCMS2MBS.kcmsSig9colorData
		    return "9color"
		  case LCMS2MBS.kcmsSig10colorData
		    return "10color"
		  case LCMS2MBS.kcmsSig11colorData
		    return "11color"
		  case LCMS2MBS.kcmsSig12colorData
		    return "12color"
		  case LCMS2MBS.kcmsSig13colorData
		    return "13color"
		  case LCMS2MBS.kcmsSig14colorData
		    return "14color"
		  case LCMS2MBS.kcmsSig15colorData
		    return "15color"
		  case LCMS2MBS.kcmsSigLuvKData
		    return "LuvK"
		  else
		    Return "?"
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDeviceClassName(x as uint32) As string
		  
		  select case x
		  case LCMS2MBS.kcmsSigInputClass
		    return "Input"
		  case LCMS2MBS.kcmsSigDisplayClass
		    return "Display"
		  case LCMS2MBS.kcmsSigOutputClass
		    return "Output"
		  case LCMS2MBS.kcmsSigLinkClass
		    return "Link"
		  case LCMS2MBS.kcmsSigAbstractClass
		    return "Abstract"
		  case LCMS2MBS.kcmsSigColorSpaceClass
		    return "ColorSpace"
		  case LCMS2MBS.kcmsSigNamedColorClass
		    return "NamedColor"
		  else
		    Return "?"
		  end Select
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run(p as LCMS2ProfileMBS)
		  self.p = p
		  
		  'List.AddRow "Handle", hex(p.Handle)
		  
		  // EncodingToHexMBS from Util plugin
		  
		  List.AddRow "Name", p.name
		  List.AddRow "HeaderProfileID", EncodingToHexMBS(p.HeaderProfileID)
		  List.AddRow "ProfileICCversion", hex(p.ProfileICCversion)
		  List.AddRow "ProfileVersion", hex(p.ProfileVersion)
		  List.AddRow "PCS", str(p.PCS)
		  List.AddRow "DeviceClass", hex(p.DeviceClass)+": "+GetDeviceClassName(p.DeviceClass)
		  List.AddRow "TagCount", str(p.TagCount)
		  List.AddRow "HeaderFlags", str(p.HeaderFlags)
		  List.AddRow "HeaderAttributes", str(p.HeaderAttributes)
		  List.AddRow "RenderingIntent", str(p.RenderingIntent)
		  List.AddRow "ColorSpaceType", hex(p.ColorSpaceType)+": "+GetColorSpaceTypeName(p.ColorSpaceType)
		  List.AddRow "ChannelCount", str(p.ChannelCount)
		  List.AddRow "HeaderManufacturer", str(p.HeaderManufacturer)
		  List.AddRow "HeaderModel", str(p.HeaderModel)
		  List.AddRow "IsMatrixShaper",str(p.IsMatrixShaper)
		  
		  dim d as LCMS2DateMBS = p.HeaderCreationDateTime
		  if d = nil then
		    List.AddRow "HeaderCreationDateTime", "n/a"
		  else
		    dim da as new date
		    da.Year = d.Year+1900
		    da.Month = d.Month
		    da.day = d.Day
		    da.Minute = d.Minute
		    da.Hour = d.Hour
		    da.Second = d.Second
		    List.AddRow "HeaderCreationDateTime", da.SQLDateTime
		  end if
		  
		  Add LCMS2MBS.kcmsSigAToB0Tag, "A to B 0"
		  Add LCMS2MBS.kcmsSigAToB1Tag, "A to B 1"
		  Add LCMS2MBS.kcmsSigAToB2Tag, "A to B 2"
		  Add LCMS2MBS.kcmsSigBlueColorantTag, "BlueColorant"
		  Add LCMS2MBS.kcmsSigBlueMatrixColumnTag, "BlueMatrixColumn"
		  Add LCMS2MBS.kcmsSigBlueTRCTag, "BlueTRC"
		  Add LCMS2MBS.kcmsSigBToA0Tag, "B to A 0"
		  Add LCMS2MBS.kcmsSigBToA1Tag, "B to A 1"
		  Add LCMS2MBS.kcmsSigBToA2Tag, "B to A 2"
		  Add LCMS2MBS.kcmsSigCalibrationDateTimeTag, "CalibrationDateTime"
		  Add LCMS2MBS.kcmsSigCharTargetTag, "CharTarget"
		  Add LCMS2MBS.kcmsSigChromaticAdaptationTag, "ChromaticAdaptation"
		  Add LCMS2MBS.kcmsSigChromaticityTag, "Chromaticity"
		  Add LCMS2MBS.kcmsSigColorantOrderTag, "ColorantOrder"
		  Add LCMS2MBS.kcmsSigColorantTableTag, "ColorantTable"
		  Add LCMS2MBS.kcmsSigColorantTableOutTag, "ColorantTableOut"
		  Add LCMS2MBS.kcmsSigColorimetricIntentImageStateTag, "ColorimetricIntentImageState"
		  Add LCMS2MBS.kcmsSigCopyrightTag, "Copyright"
		  Add LCMS2MBS.kcmsSigCrdInfoTag, "CrdInfo"
		  Add LCMS2MBS.kcmsSigDataTag, "Data"
		  Add LCMS2MBS.kcmsSigDateTimeTag, "DateTime"
		  Add LCMS2MBS.kcmsSigDeviceMfgDescTag, "DeviceMfgDesc"
		  Add LCMS2MBS.kcmsSigDeviceModelDescTag, "DeviceModelDesc"
		  Add LCMS2MBS.kcmsSigDeviceSettingsTag, "DeviceSettings"
		  Add LCMS2MBS.kcmsSigDToB0Tag, "D to B 0"
		  Add LCMS2MBS.kcmsSigDToB1Tag, "D to B 1"
		  Add LCMS2MBS.kcmsSigDToB2Tag, "D to B 2"
		  Add LCMS2MBS.kcmsSigDToB3Tag, "D to B 3"
		  Add LCMS2MBS.kcmsSigBToD0Tag, "B to D 0"
		  Add LCMS2MBS.kcmsSigBToD1Tag, "B to D 1"
		  Add LCMS2MBS.kcmsSigBToD2Tag, "B to D 2"
		  Add LCMS2MBS.kcmsSigBToD3Tag, "B to D 3"
		  Add LCMS2MBS.kcmsSigGamutTag, "Gamut"
		  Add LCMS2MBS.kcmsSigGrayTRCTag, "GrayTRC"
		  Add LCMS2MBS.kcmsSigGreenColorantTag, "GreenColorant"
		  Add LCMS2MBS.kcmsSigGreenMatrixColumnTag, "GreenMatrixColumn"
		  Add LCMS2MBS.kcmsSigGreenTRCTag, "GreenTRC"
		  Add LCMS2MBS.kcmsSigLuminanceTag, "Luminance"
		  Add LCMS2MBS.kcmsSigMeasurementTag, "Measurement"
		  Add LCMS2MBS.kcmsSigMediaBlackPointTag, "MediaBlackPoint"
		  Add LCMS2MBS.kcmsSigMediaWhitePointTag, "MediaWhitePoint"
		  Add LCMS2MBS.kcmsSigNamedColorTag, "NamedColor"
		  Add LCMS2MBS.kcmsSigNamedColor2Tag, "NamedColor2"
		  Add LCMS2MBS.kcmsSigOutputResponseTag, "OutputResponse"
		  Add LCMS2MBS.kcmsSigPerceptualRenderingIntentGamutTag, "PerceptualRenderingIntentGamut"
		  Add LCMS2MBS.kcmsSigPreview0Tag, "Preview0"
		  Add LCMS2MBS.kcmsSigPreview1Tag, "Preview1"
		  Add LCMS2MBS.kcmsSigPreview2Tag, "Preview2"
		  Add LCMS2MBS.kcmsSigProfileDescriptionTag, "ProfileDescription"
		  Add LCMS2MBS.kcmsSigProfileSequenceDescTag, "ProfileSequenceDesc"
		  Add LCMS2MBS.kcmsSigProfileSequenceIdTag, "ProfileSequenceId"
		  Add LCMS2MBS.kcmsSigPs2CRD0Tag, "PS 2 CRD 0"
		  Add LCMS2MBS.kcmsSigPs2CRD1Tag, "PS 2 CRD 1"
		  Add LCMS2MBS.kcmsSigPs2CRD2Tag, "PS 2 CRD 2"
		  Add LCMS2MBS.kcmsSigPs2CRD3Tag, "PS 2 CRD 3"
		  Add LCMS2MBS.kcmsSigPs2CSATag, "PS 2 CSA"
		  Add LCMS2MBS.kcmsSigPs2RenderingIntentTag, "PS 2 RenderingIntent"
		  Add LCMS2MBS.kcmsSigRedColorantTag, "RedColorant"
		  Add LCMS2MBS.kcmsSigRedMatrixColumnTag, "RedMatrixColumn"
		  Add LCMS2MBS.kcmsSigRedTRCTag, "RedTRC"
		  Add LCMS2MBS.kcmsSigSaturationRenderingIntentGamutTag, "SaturationRenderingIntentGamut"
		  Add LCMS2MBS.kcmsSigScreeningDescTag, "ScreeningDesc"
		  Add LCMS2MBS.kcmsSigScreeningTag, "Screening"
		  Add LCMS2MBS.kcmsSigTechnologyTag, "Technology"
		  Add LCMS2MBS.kcmsSigUcrBgTag, "UcrBg"
		  Add LCMS2MBS.kcmsSigViewingCondDescTag, "ViewingCondDesc"
		  Add LCMS2MBS.kcmsSigViewingConditionsTag, "ViewingConditions"
		  Add LCMS2MBS.kcmsSigVcgtTag, "Vcgt"
		  Add LCMS2MBS.kcmsSigMetaTag, "Meta"
		  
		  
		  
		  dim c as integer = List.ListCount-1
		  for i as integer = c DownTo 0
		    List.Expanded(i) = true
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		p As LCMS2ProfileMBS
	#tag EndProperty


#tag EndWindowCode

#tag Events List
	#tag Event
		Sub ExpandRow(row As Integer)
		  dim v as Variant = me.RowTag(row)
		  
		  Add v
		  
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
