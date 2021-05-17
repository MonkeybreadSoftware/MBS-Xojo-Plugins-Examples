#tag Class
Protected Class MyNSWindowDelegateMBS
Inherits NSWindowDelegateMBS
	#tag Event
		Sub windowDidBecomeKey(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidBecomeMain(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidChangeScreen(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidChangeScreenProfile(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidDeminiaturize(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidEndLiveResize(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidEndSheet(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidEnterFullScreen(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidEnterVersionBrowser(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidExitFullScreen(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidExitVersionBrowser(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidExpose(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidFailToEnterFullScreen(win as NSWindowMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidFailToExitFullScreen(win as NSWindowMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidMiniaturize(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidMove(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidResignKey(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidResignMain(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidResize(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowDidUpdate(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillBeginSheet(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillClose(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillEnterFullScreen(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillEnterVersionBrowser(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillExitFullScreen(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillExitVersionBrowser(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillMiniaturize(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub windowWillMove(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function windowWillResize(win as NSWindowMBS, newFrameSize as NSSizeMBS, newSize as NSSizeMBS) As NSSizeMBS
		  Add CurrentMethodName, newFrameSize.String
		End Function
	#tag EndEvent

	#tag Event
		Sub windowWillStartLiveResize(notification as NSNotificationMBS)
		  Add CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Function windowWillUseStandardFrame(win as NSWindowMBS, newFrame as NSRectMBS) As NSRectMBS
		  Add CurrentMethodName, newFrame.String
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Add(name as string, data as string="")
		  dim c as integer = List.ListCount-1
		  for i as integer = 0 to c
		    if List.Cell(i,0) = name then
		      list.Cell(i,1) = str(ticks)
		      List.Cell(i,2) = data
		      Return
		    end if
		  next
		  
		  List.AddRow name
		  List.Cell(list.LastIndex,1) = str(ticks)
		  List.Cell(list.LastIndex,2) = data
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		list As Listbox
	#tag EndProperty


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
