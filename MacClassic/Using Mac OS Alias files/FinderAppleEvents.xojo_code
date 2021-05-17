#tag Module
Protected Module FinderAppleEvents
	#tag Method, Flags = &h0
		Sub BringFinderToFront()
		  Dim ok as Boolean
		  Dim ae as AppleEvent
		  ae = New AppleEvent ("misc", "actv", "MACS") // kAEActivate
		  if ae <> nil then
		    ok = ae.Send
		  end
		  if not ok then
		    'MsgBox "Oops, Activate failed unexpectedly"
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FinderSupportsOSL() As Boolean
		  Dim l as Integer
		  if not System.Gestalt("fndr", l) then
		    l = 0
		  end
		  return BitwiseAnd(l, 8) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RevealItemInFinder(f as FolderItem)
		  Dim ok as Boolean
		  ok = sendItemAE ("misc", "mvis", "MACS", f) // kAEMakeItemVisible
		  if not ok then
		    'MsgBox "Oops, Reveal failed unexpectedly"
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function sendItemAE(s1 as String, s2 as String, s3 as String, f as FolderItem) As Boolean
		  Dim ae as AppleEvent
		  Dim list as AppleEventDescList
		  if FinderSupportsOSL() then
		    ae = New AppleEvent (s1, s2, s3)
		    if ae <> nil then
		      list = New AppleEventDescList
		      list.AppendFolderItem (f)
		      ae.DescListParam("----") = list
		      return ae.Send
		    end
		  end
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateItemInFinder(f as FolderItem)
		  Dim ok as Boolean
		  
		  ok = sendItemAE ("fndr", "fupd", "MACS", f.Parent) // kAESync
		  if ok then
		    ok = sendItemAE ("fndr", "fupd", "MACS", f) // kAESync
		  end
		  if not ok then
		    'MsgBox "Oops, Update failed unexpectedly"
		  end
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
			InitialValue="2147483648"
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
