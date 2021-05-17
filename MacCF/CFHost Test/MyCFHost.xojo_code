#tag Class
Protected Class MyCFHost
Inherits CFHostMBS
	#tag Event
		Sub Error(ErrorDomain as integer, ErrorCode as integer)
		  MsgBox "Error "+str(ErrorCode)+" in domain "+str(ErrorDomain)
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotAddress(address as string, addressIndex as integer, count as integer)
		  dim l as Listbox
		  
		  l=Window1.List
		  
		  l.AddRow str(addressindex)
		  l.Cell(l.LastIndex,1)=str(count)
		  l.Cell(l.LastIndex,2)=address
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GotName(name as CFStringMBS, nameIndex as integer, count as integer)
		  dim l as Listbox
		  
		  l=Window1.List
		  
		  l.AddRow str(nameindex)
		  l.Cell(l.LastIndex,1)=str(count)
		  l.Cell(l.LastIndex,2)=name.str
		  
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
