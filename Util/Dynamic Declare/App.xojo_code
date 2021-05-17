#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #if TargetMacOS then
		    
		    // change path if you like to try this on Windows or Linux
		    Dim d As New DeclareLibraryMBS("/usr/lib/libz.1.dylib")
		    
		    Dim lines() As String = d.SymbolNames
		    Break // look in list of functions
		    
		    
		    // zlibVersion
		    // ZEXTERN Const char * ZEXPORT zlibVersion Of((void));
		    
		    Dim p As ptr = d.Symbol("zlibVersion")
		    Dim f As New DeclareFunctionMBS("()Z", p)
		    
		    Dim n As String = f.Invoke
		    MsgBox "zlibVersion: "+n
		    
		    
		    // CRC
		    // ZEXTERN uLong ZEXPORT crc32   Of((uLong crc, Const Bytef *buf, uInt Len));
		    
		    // uLong is 32/64-bit on Mac, but may be always 32-bit on Windows, so we use long as type here
		    
		    Dim s As String = "Hello World"
		    Dim CRCStartValue As Integer = 0
		    
		    p = d.Symbol("crc32")
		    f = New DeclareFunctionMBS("(LpI)L", p)
		    
		    f.ParameterInteger(0) = CRCStartValue
		    f.ParameterString(1) = s
		    f.ParameterInteger(2) = s.LenB
		    Dim crc As UInt32 = f.Invoke
		    
		    Dim crcPlugin As UInt32 = CRC32StringMBS(CRCStartValue, s)
		    
		    MsgBox "Declare: "+str(crc)+EndOfLine+"Plugin: "+str(crcPlugin)
		    
		    
		  #EndIf
		  
		End Sub
	#tag EndEvent


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
