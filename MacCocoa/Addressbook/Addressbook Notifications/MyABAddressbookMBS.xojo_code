#tag Class
Protected Class MyABAddressbookMBS
Inherits ABAddressBookMBS
	#tag Event
		Sub DatabaseChanged(Externally as boolean, InsertedRecords() as string, UpdatedRecords() as string, DeletedRecords() as string)
		  dim l as listbox
		  
		  l=MainWindow.List
		  
		  if Externally then
		    l.AddRow "DatabaseChanged externally"
		  else
		    l.AddRow "DatabaseChanged internally"
		  end if
		  
		  l.AddRow "InsertedRecords:"
		  ShowArray(InsertedRecords,l)
		  l.AddRow "UpdatedRecords:"
		  ShowArray(UpdatedRecords,l)
		  l.AddRow "DeletedRecords:"
		  ShowArray(DeletedRecords,l)
		  
		  l.ListIndex=l.LastIndex
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub ShowArray(a() as string, l as listbox)
		  
		  for each s as string in a
		    
		    l.AddRow s
		    
		    dim r as ABRecordMBS = self.recordForUniqueId(s)
		    
		    if r isa ABPersonMBS then
		      dim p as ABPersonMBS = ABPersonMBS(r)
		      dim firstname as string = p.valueForProperty(self.kABFirstNameProperty)
		      dim lastname as string = p.valueForProperty(self.kABLastNameProperty)
		      
		      l.AddRow firstname+" "+lastname
		    elseif r isa ABGroupMBS then
		      dim g as ABGroupMBS = ABGroupMBS(r)
		      dim name as string = g.valueForProperty(self.kABGroupNameProperty)
		      
		      l.AddRow name
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod


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
