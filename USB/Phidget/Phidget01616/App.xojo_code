#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  ' call loadPhidgetFrameworkMBS, LoadPhidgetWindowsDLLMBS or LoadPhidgetLinuxLibraryMBS
		  
		  
		  #if TargetMacOS
		    //Mac
		    Dim f as FolderItem
		    f = FrameworksFolderMBS(-32765).Child("Phidget21.framework")
		    if LoadPhidgetFrameworkMBS(f) Then
		      MsgBox("Framework loaded")
		    Else
		      MsgBox("Failed to load Mac Framework")
		    End if
		  #endif
		  
		  //For Linix, see LoadPhidgetLinuxLibraryMBS
		  //I have not tested this application on Linux
		  
		  #if TargetWin32
		    'Windows: (Your file path to the DLLmay be different.)
		    if LoadPhidgetWindowsDLLMBS("C:\Program Files\Phidgets\phidget21.dll") Then
		      MsgBox("Framework loaded")
		    Else
		      MsgBox("Failed to load Windows Framework")
		    End if
		  #endif
		  
		  p = new MyPhidgetInterfaceKitMBS
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Note, Name = ReadMe
		This application was developed on WindowsXp SP2, RealBasic 2007 R4, with a Phidgets Interface Kit 0-16-16.
		
		It requires the following MBS plugins:
		     MBS REALbasic USB Plugin
		     MBS Main Plugin (for Macintosh) for the invocation of  FrameworksFolderMBS
		
		The Windows version is hardcoded for the Phidgets library: C:\Program Files\Phidgets\phidget21.dll.
		
		I wrote it to detect if fewer than 16 inputs or outputs are available and to hide the excess input & output controls and indicators.
		However, I do not have a lesser input/output device like an 8-8-8 or an 0-0-4 to test with.
		I also have no analog Phidgets, so this program tests only Digital Inputs and Outputs.
		
		All display items show the 1-based input/output number, not the 0-based index.
		
		This program only handles a single Phidget at a time.
		
		Tested on:
		Windows XP SP2, Core 2 Duo, USB2
		Mac OS X 10.4.x, PPC, USB 1.1(?)
		
		Not Tested on:
		Linux
		
		jackD  codeman@cox.net
	#tag EndNote


	#tag Property, Flags = &h0
		p As MyPhidgetInterfaceKitMBS
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
