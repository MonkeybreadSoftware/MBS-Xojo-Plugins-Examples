#tag Class
Protected Class myProductsRequest
Inherits SKProductsRequestMBS
	#tag Event
		Sub didFailWithError(error as NSErrorMBS)
		  System.DebugLog CurrentMethodName
		  
		  MsgBox "Failed with error: "+error.localizedDescription
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinish()
		  System.DebugLog CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didReceiveResponse(products() as SKProductMBS, invalidProductIdentifiers() as string)
		  System.DebugLog CurrentMethodName
		  
		  dim l as listbox = winmain.List
		  
		  for each p as SKProductMBS in products
		    l.AddRow p.localizedTitle
		    l.RowTag(l.LastIndex) = p
		    l.Cell(l.LastIndex,1) = p.priceString
		    l.CellHelpTag(l.LastIndex,0) = p.localizedDescription
		    l.CellHelpTag(l.LastIndex,1) = p.localizedDescription
		    
		  next
		  
		  
		  for each i as string in invalidProductIdentifiers
		    l.Addrow "Invalid product identifier: "+i
		  next
		  
		  
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
