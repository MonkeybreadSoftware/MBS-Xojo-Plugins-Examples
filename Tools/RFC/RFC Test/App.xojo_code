#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  // Mac APP gets killed if DYLD_LIBRARY_PATH is not set to point to folder of libraries
		  // or maybe works if libraries are embedded
		  
		  #If TargetWin32
		    Const path = "sapnwrfc.dll"
		  #Else
		    
		    Dim path As FolderItem = GetFolderItem("libsapnwrfc.dylib")
		    Dim LibPath As String = path.parent.NativePath
		    
		    Call RFCModuleMBS.SetCurrentWorkingDirectory(libPath)
		  #EndIf
		  
		  
		  If RFCModuleMBS.LoadLibrary(path) Then
		    MsgBox "Library loaded."
		  Else
		    MsgBox "Failed to load library"+EndOfLine+EndOfLine+RFCModuleMBS.LibraryLoadErrorMessage
		    quit
		  End If
		  
		  
		  'MsgBox RFCModuleMBS.Version
		  'Break
		  
		  
		  Dim loginParams As New Dictionary
		  loginParams.Value("ashost") = "hostname"
		  loginParams.Value("sysnr") = "05"
		  loginParams.Value("client") = "800"
		  loginParams.Value("user") = "user"
		  loginParams.Value("passwd") = "****"
		  loginParams.Value("lang") = "EN"
		  
		  Dim connection As New RFCConnectionMBS(loginParams)
		  
		  Dim fd As RFCFunctionDescriptionMBS = connection.FunctionDescription("BAPI_COMPANY_GETDETAIL")
		  Dim f As RFCFunctionMBS = fd.CreateFunction
		  
		  f.StringValue("COMPANYID") = "000007"
		  f.Invoke
		  
		  Dim s As RFCStructureMBS = f.StructureValue("RETURN")
		  Dim t As String = s.StringValue("MESSAGE")
		  
		  MsgBox t
		  
		  Exception r As RFCErrorExceptionMBS
		    MsgBox r.message
		    
		    
		    
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
