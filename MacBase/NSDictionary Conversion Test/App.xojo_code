#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // create input Dictionary
		  dim inputDic as new Dictionary
		  
		  dim _int64 as Int64 = 1234567890
		  dim _int32 as Int32 = 1234567890
		  dim _boolean as boolean = true
		  dim _single as single = 1.2345678
		  dim _double as double = 1.2345678
		  dim _date as new date
		  dim _dic as new Dictionary("left" : 0, "top" : 10, "width" : 300, "height" : 300)
		  dim _string as string = "Hello World"
		  dim _mem as MemoryBlock = _string
		  dim _folderitem as FolderItem = SpecialFolder.Desktop
		  dim _nscolor as NSColorMBS = NSColorMBS.greenColor
		  dim _nsrect as new NSRectMBS(1,2,3,4)
		  dim _nspoint as new NSPointMBS(1,2)
		  dim _nssize as new NSSizeMBS(1,2)
		  dim _nsrange as new NSRangeMBS(1,2)
		  
		  dim _stringarray() as string = array(_string, "hello", "world")
		  dim _int32rarray() as int32 = array(_int32)
		  dim _int64rarray() as int64 = array(_int64, 1, 2, 3)
		  dim _doublearray() as double = array(_double, 1.0, 2.0, 3.0)
		  dim _singlearray() as single = array(_single)
		  dim _booleanarray() as boolean = array(_boolean, true, false, false)
		  dim _objectarray() as object = array(_nscolor, _nscolor)
		  
		  inputDic.Value("int64") = _int64
		  inputDic.Value("int32") = _int32
		  inputDic.Value("boolean") = _boolean
		  inputDic.Value("single") = _single
		  inputDic.Value("double") = _double
		  inputDic.Value("date") = _date
		  inputDic.Value("dic") = _dic
		  inputDic.Value("string") = _string
		  inputDic.Value("mem") = _mem
		  inputDic.Value("folderitem") = _folderitem
		  inputDic.Value("nscolor") = _nscolor
		  inputDic.Value("nsrect") = _nsrect
		  inputDic.Value("nspoint") = _nspoint
		  inputDic.Value("nssize") = _nssize
		  inputDic.Value("nsrange") = _nsrange
		  inputDic.Value("stringarray") = _stringarray
		  inputDic.Value("int32rarray") = _int32rarray
		  inputDic.Value("int64rarray") = _int64rarray
		  inputDic.Value("doublearray") = _doublearray
		  inputDic.Value("singlearray") = _singlearray
		  inputDic.Value("booleanarray") = _booleanarray
		  inputDic.Value("objectarray") = _objectarray
		  
		  // now convert to NSDictionary internally with creating the NSNotification
		  dim n as new NSNotificationMBS("test", "test", inputDic)
		  
		  // and convert back by querying the user info
		  dim outputDic as Dictionary = n.userInfo
		  
		  dim vint64 as Variant = outputDic.Value("int64")
		  dim vint32 as Variant = outputDic.Value("int32")
		  dim vboolean as Variant = outputDic.Value("boolean")
		  dim vsingle as Variant = outputDic.Value("single")
		  dim vdouble as Variant = outputDic.Value("double")
		  dim vdate as Variant = outputDic.Value("date")
		  dim vdic as Variant = outputDic.Value("dic")
		  dim vstring as Variant = outputDic.Value("string")
		  dim vmem as Variant = outputDic.Value("mem")
		  dim vfolderitem as Variant = outputDic.Value("folderitem")
		  dim vnscolor as Variant = outputDic.Value("nscolor")
		  dim vnsrect as Variant = outputDic.Value("nsrect")
		  dim vnspoint as Variant = outputDic.Value("nspoint")
		  dim vnssize as Variant = outputDic.Value("nssize")
		  dim vnsrange as Variant = outputDic.Value("nsrange")
		  dim vstringarray as Variant = outputDic.Value("stringarray")
		  dim vint32rarray as Variant = outputDic.Value("int32rarray")
		  dim vint64rarray as Variant = outputDic.Value("int64rarray")
		  dim vdoublearray as Variant = outputDic.Value("doublearray")
		  dim vsinglearray as Variant = outputDic.Value("singlearray")
		  dim vbooleanarray as Variant = outputDic.Value("booleanarray")
		  dim vobjectarray as Variant = outputDic.Value("objectarray")
		  
		  if vint64.Type <> Variant.TypeLong then break
		  if vint32.Type <> Variant.TypeInteger then break
		  if vboolean.Type <> Variant.TypeBoolean then break
		  if vsingle.Type <> Variant.TypeSingle then break
		  if vdouble.Type <> Variant.TypeDouble then break
		  if vstring.Type <> Variant.TypeString then break
		  if not (vmem isa MemoryBlock) then break
		  if not (vdate isa date) then break
		  if not (vdic isa Dictionary) then break
		  if not (vfolderitem isa folderitem) then break
		  if not (vnscolor isa NSColorMBS) then break
		  if not (vnsrect isa NSRectMBS) then break
		  if not (vnspoint isa NSPointMBS) then break
		  if not (vnssize isa NSSizeMBS) then break
		  if not (vnsrange isa NSRangeMBS) then break
		  
		  if vstringarray.IsArray = false then break
		  if vint32rarray.IsArray = false then break
		  if vint64rarray.IsArray = false then break
		  if vdoublearray.IsArray = false then break
		  if vsinglearray.IsArray = false then break
		  if vbooleanarray.IsArray = false then break
		  if vobjectarray.IsArray = false then break
		  
		  // conversion back gives always variant arrays
		  dim tstringarray() as variant = vstringarray 
		  dim tint32rarray() as variant = vint32rarray
		  dim tint64rarray() as variant = vint64rarray
		  dim tdoublearray() as variant = vdoublearray
		  dim tsinglearray() as variant = vsinglearray
		  dim tbooleanarray() as variant = vbooleanarray
		  dim tobjectarray() as variant = vobjectarray
		  
		  // check types of value in array
		  if tstringarray(0).Type <> Variant.TypeString then break
		  if tint32rarray(0).Type <> Variant.TypeInteger then break
		  if tint64rarray(0).Type <> Variant.TypeLong then break
		  if tdoublearray(0).Type <> Variant.TypeDouble then break
		  if tsinglearray(0).Type <> Variant.TypeSingle then break
		  if tbooleanarray(0).Type <> Variant.TypeBoolean then break
		  if not (tobjectarray(0) isa NSColorMBS) then break
		  
		  break
		  
		  MsgBox "OK"
		  quit
		  
		  
		  
		End Sub
	#tag EndEvent


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
