#tag Module
Protected Module Module1
	#tag Method, Flags = &h0
		Function Items(extends f as FolderItem, IncludeInvisible as Boolean = true) As FolderItem()
		  // return all items in a folder
		  // resoloves aliases or links
		  // optionally filters hidden files
		  
		  Dim items() As FolderItem
		  
		  Dim c As Integer = f.Count
		  For i As Integer = 1 To c
		    Dim item As FolderItem = f.Item(i)
		    If item <> Nil Then
		      If IncludeInvisible Or item.Visible Then
		        items.Append item
		      end if
		    End If
		  Next
		  
		  Return items
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ItemsSorted(extends f as FolderItem, IncludeInvisible as Boolean = true) As FolderItem()
		  // return all items in a folder ordered by display name
		  // resoloves aliases or links
		  // optionally filters hidden files
		  
		  Dim items() As FolderItem
		  dim names() As string
		  
		  Dim c As Integer = f.Count
		  For i As Integer = 1 To c
		    Dim item As FolderItem = f.Item(i)
		    If item <> Nil Then
		      If IncludeInvisible Or item.Visible Then
		        items.Append item
		        names.Append item.DisplayName
		      end if
		    End If
		  Next
		  
		  names.SortWith items
		  Return items
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueItems(extends f as FolderItem, IncludeInvisible as Boolean = true) As FolderItem()
		  // return all true items in a folder 
		  // does not resolove aliases or links
		  // optionally filters hidden files
		  
		  Dim items() As FolderItem
		  
		  Dim c As Integer = f.Count
		  For i As Integer = 1 To c
		    Dim item As FolderItem = f.TrueItem(i)
		    if item <> nil then
		      If IncludeInvisible Or item.Visible Then
		        items.Append item
		      end if
		    end if
		  Next
		  
		  Return items
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrueItemsSorted(extends f as FolderItem, IncludeInvisible as Boolean = true) As FolderItem()
		  // return all true items in a folder ordered by display name
		  // does not resolove aliases or links
		  // optionally filters hidden files
		  
		  Dim items() As FolderItem
		  dim names() As string
		  
		  Dim c As Integer = f.Count
		  For i As Integer = 1 To c
		    Dim item As FolderItem = f.TrueItem(i)
		    If item <> Nil Then
		      If IncludeInvisible Or item.Visible Then
		        items.Append item
		        names.Append item.DisplayName
		      end if
		    End If
		  Next
		  
		  names.SortWith items
		  Return items
		  
		  
		  
		End Function
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
