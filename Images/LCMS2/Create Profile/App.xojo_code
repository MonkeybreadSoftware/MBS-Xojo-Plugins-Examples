#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  lcms2mbs.SetLogErrorHandler ErrorLog
		  
		  CreateRGB1
		  CreateRGB2
		  CreateGray1
		  CreateGrayLab1
		  
		  if ErrorLog.Visible = false then
		    quit
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CreateGray1()
		  // A gamma-2.2 gray space
		  
		  dim curve as LCMS2ToneCurveMBS = LCMS2ToneCurveMBS.BuildGamma(nil, 2.2)
		  
		  dim profile as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateGrayProfile(nil, LCMS2MBS.D50_xyY, curve)
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("gray1.icc")
		  call profile.SaveProfileToFile(file)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateGrayLab1()
		  // A gamma-2.2 gray space
		  
		  dim curve as LCMS2ToneCurveMBS = LCMS2ToneCurveMBS.BuildGamma(nil, 1.0)
		  
		  dim profile as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateGrayProfile(nil, LCMS2MBS.D50_xyY, curve)
		  
		  profile.PCS = LCMS2MBS.kcmsSigLabData
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("graylab1.icc")
		  call profile.SaveProfileToFile(file)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRGB1()
		  dim Curve(2) as LCMS2ToneCurveMBS 
		  dim Primaries as new LCMS2CIExyYTripleMBS
		  
		  Primaries.Red = new LCMS2CIExyYMBS(0.64, 0.33, 1)
		  Primaries.Green = new LCMS2CIExyYMBS(0.21, 0.71, 1)
		  Primaries.Blue = new LCMS2CIExyYMBS(0.15, 0.06, 1)
		  
		  curve(0) = LCMS2ToneCurveMBS.BuildGamma(nil, 2.19921875)
		  Curve(1) = curve(0)
		  Curve(2) = curve(0)
		  
		  dim d65 as LCMS2CIExyYMBS = LCMS2MBS.WhitePointFromTemp(6504)
		  
		  dim profile as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateRGBProfile(nil, D65, Primaries, Curve)
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("rgb1.icc")
		  call profile.SaveProfileToFile(file)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateRGB2()
		  dim Curve(2) as LCMS2ToneCurveMBS 
		  dim Primaries as new LCMS2CIExyYTripleMBS
		  
		  Primaries.Red = new LCMS2CIExyYMBS(0.64, 0.33, 1)
		  Primaries.Green = new LCMS2CIExyYMBS(0.21, 0.71, 1)
		  Primaries.Blue = new LCMS2CIExyYMBS(0.15, 0.06, 1)
		  
		  curve(0) = LCMS2ToneCurveMBS.BuildGamma(nil, 2.19921875)
		  Curve(1) = curve(0)
		  Curve(2) = curve(0)
		  
		  dim whitepoint as LCMS2CIExyYMBS = LCMS2MBS.WhitePointFromTemp(6504)
		  
		  dim profile as LCMS2ProfileMBS = LCMS2ProfileMBS.CreateProfilePlaceholder
		  
		  profile.ProfileVersion = 4.3
		  profile.DeviceClass = LCMS2MBS.kcmsSigDisplayClass
		  profile.ColorSpaceType = LCMS2MBS.kcmsSigRgbData
		  profile.PCS = LCMS2MBS.kcmsSigXYZData
		  profile.renderingIntent = LCMS2MBS.kINTENT_PERCEPTUAL
		  
		  // Implement profile using following tags:
		  //
		  //  1 cmsSigProfileDescriptionTag
		  //  2 cmsSigMediaWhitePointTag
		  //  3 cmsSigRedColorantTag
		  //  4 cmsSigGreenColorantTag
		  //  5 cmsSigBlueColorantTag
		  //  6 cmsSigRedTRCTag
		  //  7 cmsSigGreenTRCTag
		  //  8 cmsSigBlueTRCTag
		  //  9 Chromatic adaptation Tag
		  // This conforms a standard RGB DisplayProfile as says ICC, and then I add (As per addendum II)
		  // 10 cmsSigChromaticityTag
		  
		  dim DescriptionMLU as new LCMS2MLUMBS(nil, 1)
		  dim CopyrightMLU as new LCMS2MLUMBS(nil, 1)
		  
		  call DescriptionMLU.setUnicode "en", "US", "RGB built-in"
		  call CopyrightMLU.setUnicode "en", "US", "No copyright, use freely"
		  
		  call profile.WriteMLU LCMS2MBS.kcmsSigProfileDescriptionTag, DescriptionMLU
		  call profile.WriteMLU LCMS2MBS.kcmsSigCopyrightTag, CopyrightMLU
		  
		  if whitepoint<>nil then
		    
		    call profile.WriteCIEXYZ LCMS2MBS.kcmsSigMediaWhitePointTag, LCMS2MBS.D50_XYZ
		    
		    dim WhitePointXYZ as LCMS2CIEXYZMBS = WhitePoint.XYZ
		    dim CHAD as LCMS2MAT3MBS 
		    
		    CHAD = LCMS2MBS.AdaptationMatrix(nil, WhitePointXYZ, LCMS2MBS.D50_XYZ)
		    
		    // This is a V4 tag, but many CMM does read and understand it no matter which version
		    call profile.WriteChromaticAdaptation(CHAD)
		    
		  end if
		  
		  if WhitePoint<>nil and Primaries<>nil then
		    dim MaxWhite as new LCMS2CIExyYMBS
		    
		    MaxWhite.x =  WhitePoint.x
		    MaxWhite.y =  WhitePoint.y
		    MaxWhite.YY =  1.0
		    
		    dim Colorants as new LCMS2CIEXYZTripleMBS
		    dim MColorants as LCMS2MAT3MBS
		    
		    MColorants = LCMS2MBS.BuildRGB2XYZtransferMatrix(MaxWhite, Primaries)
		    
		    Colorants.Red.X   = MColorants.value(0).value(0)
		    Colorants.Red.Y   = MColorants.value(1).value(0)
		    Colorants.Red.Z   = MColorants.value(2).value(0)
		    
		    Colorants.Green.X = MColorants.value(0).value(1)
		    Colorants.Green.Y = MColorants.value(1).value(1)
		    Colorants.Green.Z = MColorants.value(2).value(1)
		    
		    Colorants.Blue.X  = MColorants.value(0).value(2)
		    Colorants.Blue.Y  = MColorants.value(1).value(2)
		    Colorants.Blue.Z  = MColorants.value(2).value(2)
		    
		    call profile.WriteCIEXYZ LCMS2MBS.kcmsSigRedColorantTag, Colorants.Red
		    call profile.WriteCIEXYZ LCMS2MBS.kcmsSigGreenColorantTag, Colorants.Green
		    call profile.WriteCIEXYZ LCMS2MBS.kcmsSigBlueColorantTag, Colorants.blue
		  end if
		  
		  if UBound(curve)>=2 then
		    call profile.WriteToneCurve LCMS2MBS.kcmsSigRedTRCTag, curve(0)
		    call profile.WriteToneCurve LCMS2MBS.kcmsSigGreenTRCTag, curve(1)
		    call profile.WriteToneCurve LCMS2MBS.kcmsSigBlueTRCTag, curve(2)
		  end if
		  
		  
		  if Primaries<>Nil then
		    call profile.WriteChromaticity(Primaries)
		  end if
		  
		  dim file as FolderItem = SpecialFolder.Desktop.Child("rgb2.icc")
		  call profile.SaveProfileToFile(file)
		  
		  
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
