#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim ICCProfile as FolderItem = SpecialFolder.Desktop.Child("AdobeRGB.icc")
		  
		  dim InputFileGray as FolderItem = SpecialFolder.Desktop.Child("test-gray.jpg")
		  dim InputFileCMYK as FolderItem = SpecialFolder.Desktop.Child("test-cmyk.jpg")
		  dim InputFileRGB  as FolderItem = SpecialFolder.Desktop.Child("test-rgb.jpg")
		  
		  // please provide all the files, including default profiles in Convert2.
		  
		  
		  // simple version using picture for RGB only
		  dim OutputFile as FolderItem = SpecialFolder.Desktop.Child("output.jpg")
		  Convert1 InputFileRGB, OutputFile, ICCProfile
		  
		  OutputFile = SpecialFolder.Desktop.Child("output2.jpg")
		  
		  // Version 2 with CMYK/Gray support using memoryblock
		  dim OutputFileRGB  as FolderItem = SpecialFolder.Desktop.Child("output-rgb.jpg")
		  dim OutputFileCMYK as FolderItem = SpecialFolder.Desktop.Child("output-cmyk.jpg")
		  dim OutputFileGray as FolderItem = SpecialFolder.Desktop.Child("output-gray.jpg")
		  
		  Convert2 InputFileRGB,  OutputFileRGB,  ICCProfile
		  Convert2 InputFileCMYK, OutputFileCMYK, ICCProfile
		  Convert2 InputFileGray, OutputFileGray, ICCProfile
		  
		  
		  
		  quit
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Convert1(InputFile as FolderItem, OutputFile as FolderItem, ICCProfile as FolderItem)
		  // simple version using picture for RGB only
		  
		  // read picture from JPEG file
		  dim ji as new JPEGImporterMBS
		  
		  ji.ReadProfileData = true
		  ji.File = InputFile
		  ji.Import
		  
		  // we got picture and profile data from source JPEG
		  dim InputPicture as Picture = ji.Picture
		  dim InputProfileData as String = ji.ProfileData
		  
		  // read new profile into memory
		  dim OutputProfileData as string = ReadFile(ICCProfile)
		  dim OutputProfile as LCMS2ProfileMBS = LCMS2ProfileMBS.OpenProfileFromString(OutputProfileData)
		  
		  // now define our input profile
		  dim InputProfile  as LCMS2ProfileMBS
		  
		  if InputProfileData = "" then
		    // use SRGB profile
		    InputProfile = LCMS2ProfileMBS.CreateSRGBProfile
		    InputProfileData = InputProfile.SaveProfileToString
		  else
		    // use profile in file
		    InputProfile = LCMS2ProfileMBS.OpenProfileFromString(InputProfileData)
		  end if
		  
		  // now create input picture using given bitmap
		  dim bi as new LCMS2BitmapMBS(InputPicture)
		  
		  // and create RGB output bitmap with same size
		  dim bo as new LCMS2BitmapMBS(InputPicture.Width, InputPicture.Height, LCMS2MBS.kcmsSigRgbData)
		  
		  // pick formats
		  dim InputFormat  as integer = InputProfile.FormatterForColorspace(1)
		  dim OutputFormat as integer = OutputProfile.FormatterForColorspace(1)
		  
		  // now do transform
		  dim ct as LCMS2TransformMBS = LCMS2TransformMBS.CreateTransform(InputProfile, InputFormat, OutputProfile, OutputFormat, LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, 0)
		  
		  call ct.Transform(bi, bo)
		  
		  // we get back output picture
		  dim OutputPicture as Picture = bo.Picture
		  bo = nil
		  bi = nil
		  
		  // and write to disk
		  dim je as new JPEGExporterMBS
		  
		  je.Quality = 90
		  je.ProfileData = OutputProfileData
		  je.File = OutputFile
		  je.Picture = OutputPicture
		  je.Export
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Convert2(InputFile as FolderItem, OutputFile as FolderItem, ICCProfile as FolderItem)
		  // Version 2 with RGB/CMYK/Gray support using memoryblock
		  
		  
		  // read picture from JPEG file
		  dim ji as new JPEGImporterMBS // needs JPEG plugin
		  
		  ji.Mode = ji.ModeRaw
		  ji.ReadProfileData = true
		  ji.File = InputFile
		  ji.Import
		  
		  dim InputData as MemoryBlock = ji.PictureData
		  if InputData = nil then
		    Break // no data?
		    Return
		  end if
		  
		  // we got picture and profile data from source JPEG
		  dim InputPicture as Picture = ji.Picture
		  dim InputProfileData as String = ji.ProfileData
		  
		  
		  // read new profile into memory
		  dim OutputProfileData as string = ReadFile(ICCProfile)
		  dim OutputProfile as LCMS2ProfileMBS = LCMS2ProfileMBS.OpenProfileFromString(OutputProfileData)
		  
		  // now define our input profile
		  
		  dim InputProfile  as LCMS2ProfileMBS
		  
		  if InputProfileData = "" then
		    // use default profile
		    
		  else
		    // use profile in file
		    InputProfile = LCMS2ProfileMBS.OpenProfileFromString(InputProfileData)
		  end if
		  
		  dim RowBytes as integer
		  dim InputColorSpace as integer
		  dim InputJPEGColorSpace as integer = ji.ColorSpace
		  
		  Select case InputJPEGColorSpace
		  case ji.ColorSpaceCMYK, ji.ColorSpaceYCCK
		    
		    // swap bytes
		    InputData.InvertBytesMBS(0, InputData.size)
		    
		    RowBytes = ji.Width * 4
		    InputColorSpace = LCMS2MBS.kcmsSigCmykData
		    if InputProfile = nil then
		      dim CMYKProfileFile as folderitem = SpecialFolder.Desktop.Child("Generic CMYK Profile.icc")
		      InputProfileData = ReadFile(CMYKProfileFile)
		      InputProfile = LCMS2ProfileMBS.OpenProfileFromFile(CMYKProfileFile)
		    end if
		  case ji.ColorSpaceGrayScale
		    RowBytes = ji.Width * 1
		    InputColorSpace = LCMS2MBS.kcmsSigGrayData
		    if InputProfile = nil then
		      dim GrayProfileFile as folderitem = SpecialFolder.Desktop.Child("Generic Gray Profile.icc")
		      InputProfileData = ReadFile(GrayProfileFile)
		      InputProfile = LCMS2ProfileMBS.OpenProfileFromFile(GrayProfileFile)
		    end if
		  case ji.ColorSpaceRGB, ji.ColorSpaceYCbCr
		    RowBytes = ji.Width * 3
		    InputColorSpace = LCMS2MBS.kcmsSigRgbData
		    if InputProfile = nil then
		      InputProfile = LCMS2ProfileMBS.CreateSRGBProfile
		      InputProfileData = InputProfile.SaveProfileToString
		    end if
		  case ji.ColorSpaceUnknown
		    Break
		  else
		    Break // other types are not handled here
		    Return
		  end Select
		  
		  // now create input picture using given bitmap
		  dim bi as new LCMS2BitmapMBS(ji.Width, ji.Height, InputColorSpace, RowBytes, InputData)
		  
		  // and create RGB output bitmap with same size
		  dim bo as new LCMS2BitmapMBS(ji.Width, ji.Height, LCMS2MBS.kcmsSigRgbData)
		  
		  // pick formats
		  dim InputFormat  as integer = InputProfile.FormatterForColorspace(1)
		  dim OutputFormat as integer = OutputProfile.FormatterForColorspace(1)
		  
		  // now do transform
		  dim ct as LCMS2TransformMBS = LCMS2TransformMBS.CreateTransform(InputProfile, InputFormat, OutputProfile, OutputFormat, LCMS2MBS.kINTENT_RELATIVE_COLORIMETRIC, 0)
		  
		  call ct.Transform(bi, bo)
		  
		  // we get back output picture
		  dim OutputPicture as Picture = bo.Picture
		  bo = nil
		  bi = nil
		  
		  // and write to disk
		  dim je as new JPEGExporterMBS
		  
		  je.Quality = 90
		  je.ProfileData = OutputProfileData
		  je.File = OutputFile
		  je.Picture = OutputPicture
		  je.Export
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReadFile(f as FolderItem) As string
		  dim b as BinaryStream = BinaryStream.Open(f)
		  return b.Read(b.Length)
		  
		  
		  
		End Function
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
