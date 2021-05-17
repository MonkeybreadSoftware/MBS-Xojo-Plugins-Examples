#tag Class
Class DragItemTV
	#tag Method, Flags = &h0
		Sub AddItem(x as Integer, y as Integer, w as Integer, h as Integer)
		  mItems.Append new NSPasteboardItemMBS
		  mCurrentItemIdx = mItems.Ubound
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BestType(paramarray t() as String) As String
		  return mItems(mCurrentItemIdx).availableTypeFromArray(t)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(pb as NSPasteboardMBS)
		  mPboard = pb
		  mItems = pb.pasteboardItems
		  if mItems.Ubound < 0 then
		    AddItem(0,0,0,0)
		  end if
		  Reset()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishAddedItems()
		  call mPboard.SetPasteboardItems mItems
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderItem() As FolderItem
		  dim f as FolderItem
		  dim item as NSPasteboardItemMBS = mItems(mCurrentItemIdx)
		  dim s as String = item.stringForType(NSPasteboardMBS.NSFilenamesPboardType).DefineEncoding(Encodings.UTF8)
		  if s <> "" then
		    f = PathToFolderItemMBS (s)
		  else
		    s = item.stringForType("public.file-url").DefineEncoding(Encodings.UTF8)
		    f = new FolderItem (s, FolderItem.PathTypeURL)
		  end if
		  return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FolderItem(assigns f as FolderItem)
		  mItems(mCurrentItemIdx).stringForType("public.file-url") = f.URLPath.ConvertEncoding(Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FolderItemAvailable() As Boolean
		  return HasType(NSPasteboardMBS.NSFilenamesPboardType, "public.file-url")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasType(paramarray t() as String) As Boolean
		  return mItems(mCurrentItemIdx).availableTypeFromArray(t) <> ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextItem() As Boolean
		  dim res as Boolean = true
		  mCurrentItemIdx = mCurrentItemIdx + 1
		  if mCurrentItemIdx > mItems.Ubound then
		    mCurrentItemIdx = 0
		    res = false
		  end
		  mTypes = mItems(mCurrentItemIdx).types
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pboard() As NSPasteboardMBS
		  return mPboard
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawData(type as String) As String
		  type = BestType (ListBoxTV_Support.convertOSType(type))
		  dim s as String = mItems(mCurrentItemIdx).stringForType(type)
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RawData(type as String, assigns s as String)
		  mItems(mCurrentItemIdx).stringForType(ListBoxTV_Support.convertOSType(type)) = s
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RawDataAvailable(type as String) As Boolean
		  return HasType (ListBoxTV_Support.convertOSType(type))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Reset()
		  mCurrentItemIdx = -1
		  call NextItem
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Text() As String
		  dim t as String = BestType (NSPasteboardMBS.NSPasteboardTypeString, NSPasteboardMBS.NSStringPboardType)
		  dim s as String = mItems(mCurrentItemIdx).stringForType(t).DefineEncoding(Encodings.UTF8)
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Text(assigns s as String)
		  mItems(mCurrentItemIdx).stringForType(NSPasteboardMBS.NSPasteboardTypeString) = s.ConvertEncoding(Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextAvailable() As Boolean
		  return HasType(NSPasteboardMBS.NSPasteboardTypeString, NSPasteboardMBS.NSStringPboardType)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCurrentItemIdx As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mItems() As NSPasteboardItemMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPboard As NSPasteboardMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTypes() As String
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
