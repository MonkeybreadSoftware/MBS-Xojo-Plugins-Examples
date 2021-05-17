#tag Class
Protected Class App
Inherits Application
Implements LCMS2ErrorHandlerMBS
	#tag Event
		Sub Open()
		  LCMS2MBS.SetLogErrorHandler self
		  
		  
		  'OpenDocument SpecialFolder.Desktop.Child("test.icc")
		  
		  
		  dim h as LCMS2ProfileMBS = CreateFakeCMYK( false)
		  dim f as FolderItem = SpecialFolder.Desktop.Child("test.icc")
		  
		  
		  if h.SaveProfileToFile(f) then
		    
		  else
		    MsgBox "Failed"
		  end if
		  
		  dim w as new ProfileWindow
		  
		  w.Title = "fake"
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
		Function CreateFakeCMYK(lUseAboveRGB as Boolean) As LCMS2ProfileMBS
		  dim ContextID as Variant
		  dim AToB0, BToA0 as LCMS2PipelineMBS
		  dim CLUT as LCMS2StageMBS
		  dim ForwardSampler as new MyForwardSampler
		  dim ReverseSampler as new MyReverseSampler
		  dim hsRGB as LCMS2ProfileMBS
		  
		  // some transform to generate sample data
		  if (lUseAboveRGB) then
		    hsRGB = Create_AboveRGB
		  else
		    hsRGB = LCMS2ProfileMBS.CreateSRGBProfile(ContextID)
		  end if
		  
		  
		  // create profile
		  dim hICC as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateProfilePlaceholder
		  
		  if hICC = nil then
		    break
		    return nil
		  end if
		  
		  hICC.ProfileVersion = 4.3
		  hICC.DeviceClass = LCMS2MBS.kcmsSigOutputClass
		  hICC.ColorSpaceType = LCMS2MBS.kcmsSigCmykData
		  hICC.PCS = LCMS2MBS.kcmsSigLabData
		  
		  BToA0 = new LCMS2PipelineMBS(ContextID, 3, 4)
		  CLUT = LCMS2StageMBS.CreateStageWithCLut16bit(ContextID, 5, 3, 4)
		  if CLUT = nil then
		    break
		    return nil
		  end if
		  
		  call CLUT.SampleCLut16bit(ForwardSampler, 0) 
		  
		  // we need dummy curves, so make dummy one
		  dim curves(0) as LCMS2ToneCurveMBS
		  curves(0) = LCMS2ToneCurveMBS.BuildGamma(nil, 1.0)
		  Curves.append curves(0)
		  Curves.append curves(0)
		  
		  dim CurveStage3 as LCMS2StageMBS = LCMS2StageMBS.CreateStageWithToneCurves(ContextID, Curves)
		  Curves.append curves(0)
		  dim CurveStage4 as LCMS2StageMBS = LCMS2StageMBS.CreateStageWithToneCurves(ContextID, Curves)
		  
		  call BToA0.InsertStage BToA0.kAtBegin,   CurveStage3
		  call BToA0.InsertStage BToA0.kAtEnd,   CLUT 
		  call BToA0.InsertStage BToA0.kAtEnd,   CurveStage4
		  
		  if not hICC.WritePipeline(LCMS2MBS.kcmsSigBToA0Tag, BToA0) then
		    break
		    return nil
		  end if
		  
		  AToB0 = new LCMS2PipelineMBS(ContextID, 4, 3)
		  CLUT = LCMS2StageMBS.CreateStageWithCLut16bit(ContextID, 5, 4, 3)
		  if clut = nil then
		    break
		    return nil
		  end if
		  
		  call clut.SampleCLut16bit(ReverseSampler, 0)
		  
		  call AToB0.InsertStage AToB0.kAtBegin,   CurveStage4
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
		  
		  
		  dim DescriptionMLU as new LCMS2MLUMBS(nil, 1)
		  dim CopyrightMLU as new LCMS2MLUMBS(nil, 1)
		  
		  call DescriptionMLU.setUnicode "en", "US", "RGB built-in"
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
		Function Create_AboveRGB() As LCMS2ProfileMBS
		  dim Curve(3) as LCMS2ToneCurveMBS
		  dim hProfile as LCMS2ProfileMBS
		  dim d65 as LCMS2CIExyYMBS = LCMS2MBS.WhitePointFromTemp(6504)
		  dim Primaries as LCMS2CIExyYTripleMBS
		  
		  Primaries.Red = new LCMS2CIExyYMBS(0.64, 0.33, 1)
		  Primaries.Green = new LCMS2CIExyYMBS(0.21, 0.71, 1)
		  Primaries.Blue = new LCMS2CIExyYMBS(0.15, 0.06, 1)
		  
		  Curve(0) = LCMS2ToneCurveMBS.BuildGamma(nil, 2.19921875)
		  Curve(1) = curve(0)
		  Curve(2) = curve(0)
		  
		  
		  
		  hProfile = LCMS2ProfileMBS.CreateRGBProfile(nil, d65, Primaries, Curve)
		  
		  return hProfile
		  
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
