#tag Class
Protected Class MyCBCentralManagerMBS
Inherits CBCentralManagerMBS
	#tag Event
		Sub DidDiscoverPeripheral(peripheral as CBPeripheralMBS, advertisementData as Dictionary, RSSI as String)
		  Dim l As listbox = MainWindow.List
		  
		  
		  Dim u As Integer = l.ListCount-1
		  For i As Integer = 0 To u
		    If l.RowTag(i) = peripheral Then
		      // same
		      
		      l.Cell(i, 1) = peripheral.Name
		      l.Cell(i, 2) = peripheral.RSSI
		      Return
		    End If
		  Next
		  
		  
		  l.AddRow Str(peripheral.Handle), peripheral.Name, peripheral.RSSI
		  l.RowTag(l.LastIndex) = peripheral
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DidUpdateState()
		  dim state as integer = me.State
		  
		  Select case state
		  case me.kStatePoweredOff
		    
		  case me.kStatePoweredOn
		    
		    me.scanForPeripheralsWithServices
		    
		  end Select
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
