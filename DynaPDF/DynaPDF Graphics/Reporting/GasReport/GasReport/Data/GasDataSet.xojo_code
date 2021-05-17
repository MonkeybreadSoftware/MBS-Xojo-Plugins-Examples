#tag Class
Protected Class GasDataSet
Implements Reports.DataSet
	#tag Method, Flags = &h0
		Function EOF() As Boolean
		  // Part of the Reports.DataSet interface.
		  
		  If mCurrentRecord > mData.Ubound Then Return True
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Field(idx As Integer) As Variant
		  #pragma unused idx
		  
		  // Part of the Reports.DataSet interface.
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Field(name As String) As Variant
		  // Part of the Reports.DataSet interface.
		  Static months() As String = Array( "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" )
		  
		  Dim data() As String = SplitB( mData(mCurrentRecord), "," )
		  
		  If name = "Year" Then
		    Return data(0)
		  Else
		    Dim idx As Integer = months.IndexOf( name )
		    If idx <> -1 Then Return val(data( idx + 1 ))
		  End If
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextRecord() As Boolean
		  // Part of the Reports.DataSet interface.
		  
		  mCurrentRecord = mCurrentRecord + 1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  // Part of the Reports.DataSet interface.
		  mData = SplitB( Price_of_Gasoline, ChrB(13) )
		  mCurrentRecord = 0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Type(fieldName as string) As integer
		  // Part of the Reports.DataSet interface.
		  // Types are defined here:
		  // http://docs.xojo.com/index.php/Database.FieldSchema
		  If fieldName = "Year" Then
		    Return 5 // Text
		  Else
		    return 7 // Double
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCurrentRecord As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mData() As String
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
