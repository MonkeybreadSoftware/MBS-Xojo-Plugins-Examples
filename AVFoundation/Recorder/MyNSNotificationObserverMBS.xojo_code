#tag Class
Protected Class MyNSNotificationObserverMBS
Inherits NSNotificationObserverMBS
	#tag Event
		Sub GotNotification(notification as NSNotificationMBS)
		  n.Invoke(notification)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Clear()
		  n = nil
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(target as NotiifcationDelegate)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  n = Target
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		n As NotiifcationDelegate
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
