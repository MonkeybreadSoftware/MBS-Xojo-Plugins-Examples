#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  // create folder with dummy images
		  
		  Dim I , Size As Integer
		  
		  Dim FramePicture As New Picture( 256 , 256 )
		  dim g as Graphics = FramePicture.Graphics
		  
		  dim folder as FolderItem = SpecialFolder.Desktop.Child( "NStask Frames" )
		  folder.CreateAsFolder
		  
		  For I = 1 To 48
		    
		    Size = 32 + I
		    
		    g.ForeColor = RGB( 0, 0 , 0 )
		    g.FillRect ( 0 , 0 , 256 , 256 )
		    
		    g.ForeColor = RGB( 255 , 255 , 0 )
		    g.FillRect( 128 - Size , 128 - Size , 2 * Size , 2 * Size )
		    
		    FramePicture.Save( folder.Child( "Viz" + Format( I , "00" ) + ".png" ) , Picture.SaveAsPNG )
		    
		  Next
		  
		  
		End Sub
	#tag EndEvent


	#tag Note, Name = Readme
		
		This example runs ffmpeg and is sandbox able.
		
		So please download ffmpeg and put in same folder as app.
		http://www.ffmpegmac.net
		
		
		Example with help from James (bailey1660@verizon.net)
		
		
	#tag EndNote


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
