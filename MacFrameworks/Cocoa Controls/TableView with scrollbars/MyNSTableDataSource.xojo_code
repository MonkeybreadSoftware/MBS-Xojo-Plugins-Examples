#tag Class
Protected Class MyNSTableDataSource
Inherits NSTableDataSourceMBS
	#tag Event
		Function numberOfRowsInTableView() As Integer
		  Return 100
		End Function
	#tag EndEvent

	#tag Event
		Function objectValue(column as NSTableColumnMBS, row as Integer) As Variant
		  if column=c1 then
		    Return c1.data(row)
		  elseif column=c2 then
		    Return c2.data(row)
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Sub setObjectValue(value as Variant, column as NSTableColumnMBS, row as Integer)
		  if column=c1 then
		    c1.data(row)=value
		  elseif column=c2 then
		    c2.data(row)=value
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		c1 As mynsTablecolumn
	#tag EndProperty

	#tag Property, Flags = &h0
		c2 As mynsTablecolumn
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
