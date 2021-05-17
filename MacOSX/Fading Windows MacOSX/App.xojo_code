#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Window1.Hide
		  Window2.Show
		  
		  f=new FadingTimer
		  f.Period=100
		  f.Mode=2
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h1
		Protected f As fadingtimer
	#tag EndProperty


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
