#tag Module
Protected Module AppStoreModule
	#tag Method, Flags = &h0
		Sub GetProductInfo(paramarray Identifier As String)
		  // Your application creates an SKProductsRequest object and initializes it with a set
		  // of product identifiers for the items you wish to sell, attaches a delegate to the
		  // request, and then starts it. The response holds the localized product information
		  // for all valid product identifiers. Your application cannot create a payment request
		  // unless you have first retrieved the product information for that product.
		  
		  
		  
		  ProductRequest=New myProductsRequest(Identifier)
		  ProductRequest.Start
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init()
		  // Register a transaction observer with the payment queue.
		  // Your application should instantiate a transaction observer and add it as an observer of the payment queue.
		  
		  // Your application should add the observer when your application launches.
		  // The App Store remembers queued transactions even if your application exited before completing
		  // all transactions. Adding an observer during initialization ensures that all previously
		  // queued transactions are seen by your application.
		  
		  
		  PaymentQueue = new myPaymentQueue
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		PaymentQueue As myPaymentQueue
	#tag EndProperty

	#tag Property, Flags = &h0
		ProductRequest As myProductsRequest
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
End Module
#tag EndModule
