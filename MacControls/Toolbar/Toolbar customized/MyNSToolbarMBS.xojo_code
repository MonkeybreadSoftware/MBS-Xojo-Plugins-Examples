#tag Class
Protected Class MyNSToolbarMBS
Inherits CustomNSToolbarMBS
	#tag Event
		Function itemForItemIdentifier(identifier as string, willBeInsertedIntoToolbar as boolean) As NSToolbarItemMBS
		  System.DebugLog CurrentMethodName+" "+str(willBeInsertedIntoToolbar)
		  
		  Select case identifier
		  case "info"
		    dim InfoItem as new MyNSToolbarItemMBS("info")
		    InfoItem.label = "Info"
		    dim logo as Picture = LogoMBS(500)
		    dim n as new NSImageMBS(logo)
		    InfoItem.image = n
		    myItems.Append InfoItem
		    return InfoItem
		  case "test"
		    dim TestItem as new MyNSToolbarItemMBS("test")
		    TestItem.label = "Test"
		    myItems.Append TestItem
		    Return TestItem
		  case "other"
		    dim OtherItem as new MyNSToolbarItemMBS("other")
		    OtherItem.label = "Other"
		    
		    myItems.Append OtherItem
		    Return OtherItem
		  case "sep"
		    dim SepItem as new NSToolbarItemMBS(NSToolbarItemMBS.NSToolbarSeparatorItemIdentifier)
		    myItems.Append SepItem
		    Return SepItem
		  end Select
		End Function
	#tag EndEvent

	#tag Event
		Function toolbarAllowedItemIdentifiers() As string()
		  System.DebugLog CurrentMethodName
		  
		  Return array("info", "test", "sep", "other")
		  
		End Function
	#tag EndEvent

	#tag Event
		Function toolbarDefaultItemIdentifiers() As string()
		  System.DebugLog CurrentMethodName
		  
		  Return array("info", "test", "sep", "other")
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub toolbarDidRemoveItem(item as NSToolbarItemMBS, notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		  if item<>nil then
		    System.DebugLog "item: "+item.label
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function toolbarSelectableItemIdentifiers() As string()
		  System.DebugLog CurrentMethodName
		  
		  
		  Return array("info", "test", "sep", "other")
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub toolbarWillAddItem(item as NSToolbarItemMBS, notification as NSNotificationMBS)
		  System.DebugLog CurrentMethodName
		  
		  if item<>nil then
		    System.DebugLog "item: "+item.label
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  System.DebugLog CurrentMethodName
		  
		  Super.Constructor("MyToolbar")
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		myItems() As Variant
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
