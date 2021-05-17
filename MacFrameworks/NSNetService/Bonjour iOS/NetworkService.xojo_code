#tag Class
Protected Class NetworkService
Inherits NSNetServiceMBS
	#tag Event
		Sub DidNotResolve(Error as Dictionary)
		  System.DebugLog CurrentMethodName
		  
		  resolving = False
		  resolveError = true
		  resolveDone = False
		  
		  table.ReloadData
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidResolveAddress()
		  System.DebugLog CurrentMethodName
		  
		  resolveError = false
		  resolving = false
		  resolveDone = true
		  
		  table.ReloadData
		End Sub
	#tag EndEvent

	#tag Event
		Sub WillResolve()
		  System.DebugLog CurrentMethodName
		  
		  resolving = true
		  resolveError = false
		  resolveDone = False
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		dataSource As MyTableDataSource
	#tag EndProperty

	#tag Property, Flags = &h0
		resolveDone As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		resolveError As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		resolving As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		table As iOSTable
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
		#tag ViewProperty
			Name="resolving"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="resolveError"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="resolveDone"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
