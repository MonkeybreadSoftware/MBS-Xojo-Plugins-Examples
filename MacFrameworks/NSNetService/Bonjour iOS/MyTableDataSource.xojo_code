#tag Class
Protected Class MyTableDataSource
Implements iOSTableDataSource
	#tag Method, Flags = &h0
		Function RowCount(table as iOSTable, section As Integer) As Integer
		  // Part of the iOSTableDataSource interface.
		  
		  Return 5
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RowData(table as iOSTable, section As Integer, row As Integer) As iOSTableCellData
		  // Part of the iOSTableDataSource interface.
		  
		  Dim s As NetworkService = Services(section)
		  Dim n As iosTableCellData = table.createCell
		  
		  Select Case row
		  Case 0
		    n.Text = s.name.ToText
		    n.DetailText = "Name"
		    
		    Return n
		  Case 1
		    
		    n.Text = s.Type.ToText
		    n.DetailText = "Type"
		    
		    Return n
		  Case 2
		    
		    n.Text = s.HostName.ToText
		    n.DetailText = "HostName"
		    
		    Return n
		  Case 3
		    
		    If s.resolving Then
		      n.Text = "..."
		    Elseif s.resolveError Then
		      n.Text = "failed"
		    Else
		      n.Text = s.addressIPv4.ToText
		    End If
		    
		    n.DetailText = "Address"
		    
		    Return n
		  Case 4
		    
		    If s.resolveDone Then
		      n.Text = s.Port.ToText
		    Else
		      n.Text = ""
		    End If
		    
		    n.DetailText = "Port"
		    
		    Return n
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionCount(table as iOSTable) As Integer
		  // Part of the iOSTableDataSource interface.
		  
		  return UBound(Services)+1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SectionTitle(table as iOSTable, section As Integer) As Text
		  // Part of the iOSTableDataSource interface.
		  
		  Dim n As Integer = section + 1
		  
		  Dim t As Text
		  
		  Select Case n Mod 10
		  Case 1
		    t = "st"
		  Case 2
		    t = "nd"
		  Else
		    t = "th"
		  End Select
		  
		  Return n.ToText+t+" service"
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Services() As NetworkService
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
