#tag Class
Protected Class IOBluetoothServiceBrowserController
Inherits IOBluetoothServiceBrowserControllerMBS
	#tag Event
		Sub SheetDone(returnCode as Integer, tag as Variant)
		  
		  select case returnCode 
		  case me.kIOBluetoothUISuccess 
		    Log "Success"
		    
		  case me.kIOBluetoothUIUserCanceledErr
		    Log "Cancelled"
		    
		  end Select
		  
		  
		  dim serviceRecords() as IOBluetoothSDPServiceRecordMBS = me.Results
		  
		  if UBound(serviceRecords) >= 0 then
		    
		    parent.OpenService serviceRecords(0)
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  parent.List.AddRow s
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if weakParent <> nil then
			    dim v as variant = weakParent.value
			    return v
			  end if
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  if value <> nil then
			    weakParent = new weakRef(value)
			  end if
			  
			End Set
		#tag EndSetter
		parent As MainWindow
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private weakParent As WeakRef
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
