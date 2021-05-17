#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if dis<>nil then
		    // Fade gamma out in 500 ticks
		    dis.FadeGammaTo(0, RGB(0, 0, 0), 500)
		    
		    // Set old resolution
		    If saveRes.Switch = False Then
		      Beep // An error occurred
		    End If
		    
		    // Hide windows
		    win.win.Hide
		    win.Hide
		    
		    // Fade back
		    dis.FadeGammaTo(1000, RGB(0, 0, 0), 500)
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim safe as boolean
		  
		  if not ResolutionLibraryPresentMBS then
		    msgBox "The library RezLib was not found. Please place this library into the Realbasic or after compiling into your application folder."
		  end if
		  'Get the display on which to operate
		  
		  dis = GetDisplayMBS(0)
		  
		  // Fade gamma out in 500 ticks
		  dis.FadeGammaTo(0, RGB(0, 0, 0), 500)
		  
		  safe=not targetcarbon // on Mac OS X all modes are unsafe
		  
		  // Save old resolution and set new one
		  saveRes = dis.GetCurrentResolution()
		  If dis.SwitchTo(640, 480, 8, safe) = False Then
		    // Fade back, beep and quit
		    dis.FadeGammaTo(1000, RGB(0, 0, 0), 500)
		    Beep
		    Quit
		  End If
		  
		  // Show window
		  win = New BlackWindow
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		dis As DisplayMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		saveRes As ResolutionMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		win As BlackWindow
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
