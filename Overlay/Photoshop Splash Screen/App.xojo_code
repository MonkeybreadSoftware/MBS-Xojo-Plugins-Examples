#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  dim w,h,x,y as integer
		  
		  w=SplashScreen.Width
		  h=SplashScreen.Height
		  
		  x=(screen(0).Width-w)/2
		  y=(screen(0).Height-h)/2
		  
		  o=new OverlayMBS(x,y,w,h)
		  
		  o.Pict=SplashScreen
		  o.mask=SplashScreenMask
		  
		  o.UpdateShow
		  
		  t = new MyTimer
		  t.Period = 60000 // one minute
		  t.Mode = 1
		  
		  me.AutoQuit = false // for Windows
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		o As overlaymbs
	#tag EndProperty

	#tag Property, Flags = &h0
		t As MyTimer
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
