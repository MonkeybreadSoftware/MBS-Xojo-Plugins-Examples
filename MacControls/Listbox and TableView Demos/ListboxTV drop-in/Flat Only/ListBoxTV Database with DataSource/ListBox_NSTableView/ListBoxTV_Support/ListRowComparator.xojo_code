#tag Class
Protected Class ListRowComparator
Inherits NSSortDescriptorMBS
	#tag Event
		Function Comparator(obj1 as variant, obj2 as variant) As Integer
		  dim c1 as ListCellTV = obj1
		  dim c2 as ListCellTV = obj2
		  
		  #if DebugBuild
		    if c1._internalUse.Right <> column.ColumnIndex or c1._internalUse.Right <> c2._internalUse.Right then raise new RuntimeException ' is this happens, we forgot up update the Column somewhere
		  #endif
		  
		  dim res as integer
		  if owner._compareRows (c1, c2, res) then
		    return res
		  end
		  
		  declare function compareObjectTo lib "Cocoa" selector "compareObject:toObject:" (h as Integer, o1 as CFStringRef, o2 as CFStringRef) as Integer
		  
		  try
		    res = compareObjectTo (mSorter.Handle, c1.Text, c2.Text)
		  catch exc as ObjCException
		    break
		  end try
		  
		  return res
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function column() As ListColumnTV
		  return ListColumnTV (mColumn.Value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ownerRef as WeakRef, column as ListColumnTV, sorter as NSSortDescriptorMBS)
		  super.Constructor (column.identifier, true)
		  
		  mOwner = ownerRef
		  mColumn = new WeakRef(column)
		  mSorter = sorter
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function owner() As ListBoxTV
		  return ListBoxTV (mOwner.Value)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		#tag Note
			ListColumnTV
		#tag EndNote
		Private mColumn As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			ListBoxTV
		#tag EndNote
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSorter As NSSortDescriptorMBS
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
