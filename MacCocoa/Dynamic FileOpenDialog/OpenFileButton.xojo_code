#tag Class
Protected Class OpenFileButton
Inherits NSButtonMBS
Implements Notifier
	#tag Event
		Sub Action()
		  NotifyAll
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddNotifier(recv As Receiver)
		  // Part of the Notifier interface.
		  
		  if me.Receivers.IndexOf(recv) = -1 Then
		    me.Receivers.Append recv
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(left as double, top as double, width as double, height as double, cmd As String, caption As String, r As Receiver)
		  // Constructor(left As double, top As double, width As double, height As double) -- From NSViewMBS
		  Super.Constructor(left, top, width, height)
		  me.Command = cmd
		  me.Title = caption
		  AddNotifier r
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Data() As Variant
		  // Part of the Notifier interface.
		  
		  Return me.Command
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NotifyAll()
		  // Part of the Notifier interface.
		  
		  for i As Integer = 0 to UBound(me.Receivers)
		    me.Receivers(i).DataChanged me
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveNotifier(rcv As Receiver)
		  // Part of the Notifier interface.
		  dim n As Integer = me.Receivers.IndexOf(rcv)
		  if n > -1 Then
		    me.Receivers.Remove n
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Command As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Receivers() As Receiver
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
