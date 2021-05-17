#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim c As Integer = ScreenCount-1
		  
		  For i as integer = 0 To c
		    Dim w As New PicWindow
		    w.pic = ScreenshotDisplayMBS(i)
		    w.Title  = "Screen "+Str(i)
		    w.width  = Screen(0).Width/2
		    w.height = Screen(0).height/2
		  Next
		  
		  window2.show
		End Sub
	#tag EndEvent


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
