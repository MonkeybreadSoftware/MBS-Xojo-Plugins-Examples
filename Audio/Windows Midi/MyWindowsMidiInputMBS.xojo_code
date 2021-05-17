#tag Class
Protected Class MyWindowsMidiInputMBS
Inherits WindowsMidiInputMBS
	#tag Event
		Sub DeviceClose()
		  list.AddRow "Input: Close"
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceData(timestamp as integer, status as integer, data1 as integer, data2 as integer, RawData as integer)
		  list.AddRow "Input: Data "+hex(status)+" "+hex(data1)+" "+hex(data2)+" "+hex(timestamp)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceError(timestamp as integer, status as integer, data1 as integer, data2 as integer, RawData as integer)
		  list.AddRow "Input: Error "+hex(status)+" "+hex(data1)+" "+hex(data2)+" "+hex(timestamp)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceLongData(timestamp as integer, data as string, dataMemory as memoryblock)
		  list.AddRow "Input: Long Data "+hex(timestamp)+" "+EncodingToHexMBS(data)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceLongError(timestamp as integer, data as string, dataMemory as memoryblock)
		  list.AddRow "Input: Long Error "+hex(timestamp)+" "+EncodingToHexMBS(data)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DeviceOpen()
		  list.AddRow "Input: Open"
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		list As listbox
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
