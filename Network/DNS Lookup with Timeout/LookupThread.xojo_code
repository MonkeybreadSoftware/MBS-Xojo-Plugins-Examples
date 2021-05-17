#tag Class
Protected Class LookupThread
Inherits Thread
	#tag Event
		Sub Run()
		  startTicks = ticks
		  System.DebugLog "Lookup in thread: "+query+" at "+str(startTicks)
		  
		  result = DNSLookupMBS.LookupHostbyNameMT(query, DNSLookupMBS.AddressTypeIPv4)
		  done = True
		  System.DebugLog "Lookup in thread: "+query+" end at "+str(ticks)
		  
		  if result<>Nil then
		    System.DebugLog "Thread got result after "+Format((ticks-startticks)/60.0,"0.0")+" seconds"
		    
		    dim c as integer = result.AddressesCount-1
		    for i as integer = 0 to c
		      dim ss as string = result.Addresses(i)
		      System.DebugLog "Address: "+str(result.FormatIP(ss))
		    next
		  else
		    System.DebugLog "Thread got no result after "+Format((ticks-startticks)/60.0,"0.0")+" seconds"
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		done As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		query As string
	#tag EndProperty

	#tag Property, Flags = &h0
		result As DNSLookupMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		startticks As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
		#tag EndViewProperty
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
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="query"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="startticks"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="done"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
