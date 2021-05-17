#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub EnableMenuItems()
		  filehaSPDemo.enable
		  filenetHASPDemo.enable
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileHASPDemo() As Boolean Handles FileHASPDemo.Action
			haspWindow.show
			return true
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNetHASPDemo() As Boolean Handles FileNetHASPDemo.Action
			nethaspWindow.show
			return true
		End Function
	#tag EndMenuHandler


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
