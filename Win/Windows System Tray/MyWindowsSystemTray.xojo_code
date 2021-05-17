#tag Class
Protected Class MyWindowsSystemTray
Inherits WindowsSystemTrayMBS
	#tag Event
		Sub BalloonHide(id as integer, MouseX as integer, MouseY as integer)
		  w "BalloonHide",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub BalloonShow(id as integer, MouseX as integer, MouseY as integer)
		  w "BalloonShow",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub BalloonTimeout(id as integer, MouseX as integer, MouseY as integer)
		  w "BalloonTimeout",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub BalloonUserClick(id as integer, MouseX as integer, MouseY as integer)
		  w "BalloonUserClick",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub ContextMenu(id as integer, MouseX as integer, MouseY as integer)
		  w "ContextMenu",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub KeySelected(id as integer, MouseX as integer, MouseY as integer)
		  w "KeySelected",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseLeftButtonDoubleClick(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseLeftButtonDoubleClick",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseLeftButtonDown(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseLeftButtonDown",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseLeftButtonUp(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseLeftButtonUp",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMiddleButtonDoubleClick(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseMiddleButtonDoubleClick",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMiddleButtonDown(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseMiddleButtonDown",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMiddleButtonUp(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseMiddleButtonUp",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseMove",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseRightButtonDoubleClick(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseRightButtonDoubleClick",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseRightButtonDown(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseRightButtonDown",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseRightButtonUp(id as integer, MouseX as integer, MouseY as integer)
		  w "MouseRightButtonUp",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub PopupOpen(id as integer, MouseX as integer, MouseY as integer)
		  w "PopupOpen",id,Mousex,Mousey
		End Sub
	#tag EndEvent

	#tag Event
		Sub Selected(id as integer, MouseX as integer, MouseY as integer)
		  w "Selected",id,Mousex,Mousey
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub w(s as string,id as integer,x as integer, y as integer)
		  window1.list.insertrow 0,s+" in System Tray Icon ID "+str(id)+" x: "+str(x)+" y: "+str(y)
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
