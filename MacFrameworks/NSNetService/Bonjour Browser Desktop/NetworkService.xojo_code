#tag Class
Protected Class NetworkService
Inherits NSNetServiceMBS
	#tag Event
		Sub DidNotPublish(Error as Dictionary)
		  
		  Dim ErrorCode  As Integer = error.Lookup(NSNetServicesErrorCode, "")
		  'Dim errorDomain As String = error.Lookup(NSNetServicesErrorDomain, "")
		  
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Did not publish with errorcode: "+str(ErrorCode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidNotResolve(Error as Dictionary)
		  
		  Dim ErrorCode  As Integer = error.Lookup(NSNetServicesErrorCode, "")
		  'Dim errorDomain As String = error.Lookup(NSNetServicesErrorDomain, "")
		  
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Did not resolve with errorcode: "+str(ErrorCode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidPublish()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Did publish"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidResolveAddress()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Did resolve address for "+Me.name+" with type "+Me.type+": "+Join(me.addresses, ", ")+":"+Str(Me.port)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidStop()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Did stop"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateTXTRecordData(data as MemoryBlock)
		  System.DebugLog CurrentMethodName
		  
		  dim s as string = data
		  
		  if encodings.UTF8.IsValidData(s) then
		    s = DefineEncoding(S, encodings.UTF8)
		  else
		    s = DefineEncoding(s, encodings.ISOLatin1)
		  end if
		  
		  List.AddRow "Did update text record: "+s
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillPublish()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Will publish"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillResolve()
		  System.DebugLog CurrentMethodName
		  
		  List.AddRow "Will resolve "+me.name+" of type "+me.type
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		List As Listbox
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
			InitialValue="-2147483648"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
