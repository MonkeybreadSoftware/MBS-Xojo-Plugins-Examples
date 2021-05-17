#tag Class
Protected Class Customer
	#tag Method, Flags = &h0
		Sub Constructor(pCompany as string, pContactPerson as string, pStreet as string, pZip as string, pCity as string, pCustomerNr as integer, pOrderNr as string, pTaxID as string)
		  city = pCity
		  company = pCompany
		  ContactPerson = pContactPerson
		  CustomerNr = pCustomerNr
		  OrderNr = pOrderNr
		  Street = pStreet
		  TaxID = pTaxID
		  Zip = pZip
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		City As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Company As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ContactPerson As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CustomerNr As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		OrderNr As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Street As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TaxID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Zip As String
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
			Name="Company"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContactPerson"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Street"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Zip"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="City"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomerNr"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="OrderNr"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TaxID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
