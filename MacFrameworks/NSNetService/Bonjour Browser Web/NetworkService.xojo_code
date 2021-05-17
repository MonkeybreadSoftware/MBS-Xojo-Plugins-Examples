#tag Class
Protected Class NetworkService
Inherits NSNetServiceMBS
	#tag Event
		Sub DidNotResolve(Error as Dictionary)
		  System.DebugLog CurrentMethodName
		  
		  dim index as integer = FindIndex(list, self)
		  
		  if index >= 0 then
		    List.Cell(index, 3) = "failed"
		    List.Cell(index, 4) = ""
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidResolveAddress()
		  System.DebugLog CurrentMethodName
		  
		  dim index as integer = FindIndex(list, self)
		  
		  if index >= 0 then
		    List.Cell(index, 2) = me.hostName
		    List.Cell(index, 3) = me.addressIPv4
		    List.Cell(index, 4) = str(me.port)
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillResolve()
		  System.DebugLog CurrentMethodName
		  
		  dim index as integer = FindIndex(list, self)
		  
		  if index >= 0 then
		    List.Cell(index, 4) = "..."
		  end if
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		List As WebListBox
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
