#tag Class
Protected Class App
Inherits Application
Implements LCMS2ErrorHandlerMBS
	#tag Event
		Sub Open()
		  // errors go to Error method 
		  LCMS2MBS.SetLogErrorHandler self
		  
		  dim h as LCMS2ProfileMBS = CreateTestProfile
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.icc")
		  
		  
		  if h.SaveProfileToFile(f) then
		    
		  else
		    MsgBox "Failed"
		  end if
		  
		  dim w as new ProfileWindow
		  
		  w.Title = "Test Profile"
		  w.run h
		  w.show
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim p as LCMS2ProfileMBS = LCMS2ProfileMBS.OpenProfileFromFile(item)
		  
		  if p = nil then
		    MsgBox "Failed to open profile."
		  else
		    dim w as new ProfileWindow
		    
		    w.Title = item.DisplayName
		    w.run p
		    w.show
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CreateTestProfile() As LCMS2ProfileMBS
		  
		  dim ContextID as Variant
		  dim AToB0, BToA0 as LCMS2PipelineMBS
		  dim CLUT as LCMS2StageMBS
		  dim ForwardSampler as new MyForwardSampler
		  dim ReverseSampler as new MyReverseSampler
		  
		  dim hICC as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateProfilePlaceholder
		  
		  if hICC = nil then
		    break
		    return nil
		  end if
		  
		  // setup header
		  hICC.ProfileVersion = 4.3
		  hICC.DeviceClass = LCMS2MBS.kcmsSigOutputClass
		  hICC.ColorSpaceType = LCMS2MBS.kcmsSig6colorData
		  hICC.PCS = LCMS2MBS.kcmsSigLabData
		  hICC.renderingIntent = LCMS2MBS.kINTENT_PERCEPTUAL
		  
		  // pipeline with CLUT, both with 3 input colors, 6 output colors
		  BToA0 = new LCMS2PipelineMBS(ContextID, 3, 6)
		  
		  // 9 grid points
		  CLUT = LCMS2StageMBS.CreateStageWithCLut16bit(ContextID, 7, 3, 6)
		  if CLUT = nil then
		    break
		    return nil
		  end if
		  
		  // fill clut with values using event in MyForwardSampler class
		  call CLUT.SampleCLut16bit(ForwardSampler, 0) 
		  
		  // three input curves
		  dim CurveStage3 as LCMS2StageMBS = LCMS2StageMBS.CreateStageWithToneCurves(ContextID, 3) 
		  // six input curves
		  dim CurveStage6 as LCMS2StageMBS = LCMS2StageMBS.CreateStageWithToneCurves(ContextID, 6) 
		  
		  call BToA0.InsertStage BToA0.kAtBegin, CurveStage3
		  call BToA0.InsertStage BToA0.kAtEnd,   CLUT 
		  call BToA0.InsertStage BToA0.kAtEnd,   CurveStage6
		  
		  if not hICC.WritePipeline(LCMS2MBS.kcmsSigBToA0Tag, BToA0) then
		    break
		    return nil
		  end if
		  
		  // pipeline with CLUT, both with 6 input colors, 3 output colors
		  AToB0 = new LCMS2PipelineMBS(ContextID, 6, 3)
		  // 5 grid points
		  CLUT = LCMS2StageMBS.CreateStageWithCLut16bit(ContextID, 7, 6, 3)
		  if clut = nil then
		    break
		    return nil
		  end if
		  
		  // fill clut with values using event in MyReverseSampler class
		  call clut.SampleCLut16bit(ReverseSampler, 0)
		  
		  // we reuse curves, but you could make new ones here
		  'CurveStage3 = LCMS2StageMBS.CreateStageWithToneCurves(ContextID, 3) 
		  'CurveStage6 = LCMS2StageMBS.CreateStageWithToneCurves(ContextID, 6)
		  
		  call AToB0.InsertStage AToB0.kAtBegin, CurveStage6
		  call AToB0.InsertStage AToB0.kAtEnd,   CLUT
		  call AToB0.InsertStage AToB0.kAtEnd,   CurveStage3
		  
		  if not hICC.WritePipeline(LCMS2MBS.kcmsSigAToB0Tag, AToB0) then
		    break
		    return nil
		  end if
		  
		  
		  if not hICC.LinkTag(LCMS2MBS.kcmsSigAToB1Tag, LCMS2MBS.kcmsSigAToB0Tag) then
		    break
		    Return nil
		  end if
		  
		  if not hICC.LinkTag(LCMS2MBS.kcmsSigAToB2Tag, LCMS2MBS.kcmsSigAToB0Tag) then
		    break
		    Return nil
		  end if
		  
		  if not hICC.LinkTag(LCMS2MBS.kcmsSigBToA1Tag, LCMS2MBS.kcmsSigBToA0Tag) then
		    break
		    Return nil
		  end if
		  
		  if not hICC.LinkTag(LCMS2MBS.kcmsSigBToA2Tag, LCMS2MBS.kcmsSigBToA0Tag) then
		    break
		    Return nil
		  end if
		  
		  dim colors as new LCMS2NamedColorListMBS(ContextID, 6, 3) // six colors, Lab has 3 channels
		  
		  call colors.Append "Color1"
		  call colors.Append "Color2"
		  call colors.Append "Color3"
		  call colors.Append "Color4"
		  call colors.Append "Color5"
		  call colors.Append "Color6"
		  
		  call hICC.WriteNamedColorList LCMS2MBS.kcmsSigNamedColor2Tag, colors
		  
		  dim DescriptionMLU as new LCMS2MLUMBS(nil, 1)
		  dim CopyrightMLU as new LCMS2MLUMBS(nil, 1)
		  
		  call DescriptionMLU.setUnicode "en", "US", "DeviceN test profile"
		  call CopyrightMLU.setUnicode "en", "US", "No copyright, use freely"
		  
		  call hICC.WriteMLU LCMS2MBS.kcmsSigProfileDescriptionTag, DescriptionMLU
		  call hICC.WriteMLU LCMS2MBS.kcmsSigCopyrightTag, CopyrightMLU
		  
		  dim whitepoint as LCMS2CIExyYMBS = LCMS2MBS.WhitePointFromTemp(6504)
		  if whitepoint<>nil then
		    
		    call hICC.WriteCIEXYZ LCMS2MBS.kcmsSigMediaWhitePointTag, LCMS2MBS.D50_XYZ
		    
		    dim WhitePointXYZ as LCMS2CIEXYZMBS = WhitePoint.XYZ
		    dim CHAD as LCMS2MAT3MBS
		    
		    CHAD = LCMS2MBS.AdaptationMatrix(nil, WhitePointXYZ, LCMS2MBS.D50_XYZ)
		    
		    // This is a V4 tag, but many CMM does read and understand it no matter which version
		    call hICC.WriteChromaticAdaptation(CHAD)
		    
		  end if
		  
		  
		  return hICC
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Error(context as LCMS2ContextMBS, ErrorCode as UInt32, Text as string)
		  // Teil des Interfaces von LCMS2ErrorHandlerMBS
		  
		  MsgBox text
		  
		End Sub
	#tag EndMethod


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&L\xC3\xB6schen", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&L\xC3\xB6schen"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&L\xC3\xB6schen"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Beenden"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
