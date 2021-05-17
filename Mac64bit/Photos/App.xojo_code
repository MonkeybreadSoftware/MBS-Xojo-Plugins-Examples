#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim authorizationStatus As Integer = PHPhotoLibraryMBS.authorizationStatus
		  
		  Select Case authorizationStatus
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusAuthorized
		    'MsgBox "Authorized"
		    Start
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusDenied
		    MsgBox "Denied"
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusNotDetermined
		    'MsgBox "NotDetermined"
		    PhotoLibrary.requestAuthorization AddressOf AuthorizationCompleted
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusRestricted
		    MsgBox "Restricted"
		  End Select
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AuthorizationCompleted(Status as Integer, tag as Variant)
		  Select Case Status
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusAuthorized
		    'MsgBox "Authorized"
		    Start
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusDenied
		    MsgBox "Denied"
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusNotDetermined
		    MsgBox "NotDetermined"
		  Case PHPhotoLibraryMBS.PHAuthorizationStatusRestricted
		    MsgBox "Restricted"
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Start()
		  PhotoLibrary = new PHPhotoLibrary
		  
		  MainWindow.show
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		PhotoLibrary As PHPhotoLibraryMBS
	#tag EndProperty


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
