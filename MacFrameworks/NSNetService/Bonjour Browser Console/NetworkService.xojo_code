#tag Class
Protected Class NetworkService
Inherits NSNetServiceMBS
	#tag Event
		Sub DidNotPublish(Error as Dictionary)
		  Print CurrentMethodName
		  
		  Dim ErrorCode  As Integer = error.Lookup(NSNetServicesErrorCode, "")
		  Dim errorDomain As String = error.Lookup(NSNetServicesErrorDomain, "")
		  
		  
		  Print "Did not publish with errorcode: "+Str(ErrorCode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidNotResolve(Error as Dictionary)
		  print CurrentMethodName
		  
		  Dim ErrorCode  As Integer = error.Lookup(NSNetServicesErrorCode, "")
		  Dim errorDomain As String = error.Lookup(NSNetServicesErrorDomain, "")
		  
		  
		  Print "Did not resolve with errorcode: "+Str(ErrorCode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidPublish()
		  print CurrentMethodName
		  
		  print "Did publish"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidResolveAddress()
		  print CurrentMethodName
		  
		  print "Did resolve address for "+me.name+" with type "+me.type+": "+me.addressIPv4+":"+str(me.port)
		  '+Join(me.addresses, ", ")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidStop()
		  print CurrentMethodName
		  
		  print "Did stop"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateTXTRecordData(data as MemoryBlock)
		  print CurrentMethodName
		  
		  dim s as string = data
		  
		  if encodings.UTF8.IsValidData(s) then
		    s = DefineEncoding(S, encodings.UTF8)
		  else
		    s = DefineEncoding(s, encodings.ISOLatin1)
		  end if
		  
		  print "Did update text record: "+s
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillPublish()
		  print CurrentMethodName
		  
		  print "Will publish"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillResolve()
		  print CurrentMethodName
		  
		  print "Will resolve "+me.name+" of type "+me.type
		  
		  
		End Sub
	#tag EndEvent


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
