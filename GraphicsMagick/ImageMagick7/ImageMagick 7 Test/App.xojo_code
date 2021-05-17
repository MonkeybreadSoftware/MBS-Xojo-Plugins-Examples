#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  
		  #If TargetMacOS Then
		    
		    Dim f As FolderItem = GetFolderItem("libMagickCore-7.Q16HDRI.7.dylib")
		    
		    If ImageMagick7MBS.LoadLibraryFile(f) Then
		      
		      'MsgBox "loaded"
		      
		    Else
		      
		      MsgBox "failed to load: "+ImageMagick7MBS.LoadErrorString
		      
		    End If
		    
		  #Else
		    If ImageMagick7MBS.LoadLibrary("CORE_RL_MagickCore_.dll") Then
		      
		      'MsgBox "loaded"
		      
		    Else
		      
		      MsgBox "failed to load: "+ImageMagick7MBS.LoadErrorString
		      
		    End If
		  #EndIf
		  
		  
		  
		  
		  Dim quantumDepth    As Integer = ImageMagick7MBS.QuantumDepth
		  Dim quantumRange    As UInt32  = ImageMagick7MBS.QuantumRange
		  Dim QuantumSize     As Integer = ImageMagick7MBS.QuantumSize // bytes per value
		  Dim HDRI            As Boolean = ImageMagick7MBS.HDRI
		  Dim Epsilon         As Double  = ImageMagick7MBS.Epsilon
		  Dim MaxColormapSize As Integer = ImageMagick7MBS.MaxColormapSize
		  Dim MaxMap          As Integer = ImageMagick7MBS.MaxMap
		  
		  Break // read in debugger
		  
		  'MsgBox str(IMImage7MBS.ScaleQuantumToChar(65535.0))+" "+str(IMImage7MBS.ScaleQuantumToChar(0.0))
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
