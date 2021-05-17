#tag Class
Protected Class MyHID
Inherits MacHIDMBS
	#tag Event
		Sub ReceivedData(data as string, size as integer)
		  
		  Window1.RxDataField.Text = Window1.RxDataField.Text + data 
		  App.mycount = App.mycount + 1
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Send(data As string)
		  dim m as New MemoryBlock(16)
		  
		  m.StringValue(0, 1) = data
		  me.SendMessageMemory m, 0, 16
		  
		  if me.Lasterror = -536854447 Then
		    MsgBox "The USB Receiver failed with a timeout to send an answer"
		    Quit
		  end if
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
