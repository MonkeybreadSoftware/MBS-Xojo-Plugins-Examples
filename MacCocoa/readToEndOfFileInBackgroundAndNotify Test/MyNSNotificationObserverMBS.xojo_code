#tag Class
Protected Class MyNSNotificationObserverMBS
Inherits NSNotificationObserverMBS
	#tag Event
		Sub GotNotification(notification as NSNotificationMBS)
		  Select Case Notification.Name
		  Case NSFileHandleMBS.NSFileHandleReadToEndOfFileCompletionNotification
		    Dim xUserInfo as Dictionary = Notification.UserInfo
		    Dim xData As NSFileHandleMBS = notification.objectVariant
		    Dim sData As String = xUserInfo.Value(NSFileHandleMBS.NSFileHandleNotificationDataItem)
		    
		    If me.DataForHandle.HasKey(xData.Handle) Then
		      'Dim sExisting As String = me.DataForHandle.Value(xData.Handle)
		      'Break
		    Else
		      me.DataForHandle.Value(xData.Handle) = sData
		    End if
		  End Select
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  me.DataForHandle = New Dictionary
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DataForHandle As Dictionary
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
