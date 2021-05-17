#tag Class
Protected Class WinPhotoAcquireProgressCallBack
Inherits WinPhotoAcquireProgressCallBackMBS
	#tag Event
		Sub Cancelled(byref Cancelled as Boolean)
		  'log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub DirectoryCreated(Directory as String)
		  log CurrentMethodName+": "+Directory
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndDelete(Result as Integer)
		  log CurrentMethodName+": "+str(result)
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndEnumeration(Result as Integer)
		  log CurrentMethodName+": "+str(result)
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndItemDelete(ItemIndex as Integer, Item as WinPhotoAcquireItemMBS, Result as Integer)
		  log CurrentMethodName+": "+str(result)
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndItemTransfer(ItemIndex as Integer, Item as WinPhotoAcquireItemMBS, Result as Integer)
		  log CurrentMethodName+": "+str(result)
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndSession(Result as Integer)
		  log CurrentMethodName+": "+str(result)
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndTransfer(Result as Integer)
		  log CurrentMethodName+": "+str(result)
		End Sub
	#tag EndEvent

	#tag Event
		Sub ErrorAdvise(Result as Integer, ErrorMessage as String, MessageType as Integer, byref ErrorAdviseResult as Integer)
		  log CurrentMethodName+": "+str(result)
		  
		  msgbox ErrorMessage
		  
		  // you can ask user and decide what to do
		  ErrorAdviseResult = me.AdviseResultAbort
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function FoundItem(Item as WinPhotoAcquireItemMBS) As Boolean
		  log CurrentMethodName+": "+item.ItemName
		  
		  FoundCounter = FoundCounter + 1
		  if FoundCounter > 5 then
		    // let's ignore more than 5 files, so our example doesn't take ages to run an import
		    SkipCounter = SkipCounter + 1
		    return true 
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub GetDeleteAfterAcquire(byref DeleteAfterAcquire as Boolean)
		  log CurrentMethodName
		  
		  // we don't want to delete files in this example
		  DeleteAfterAcquire = false
		End Sub
	#tag EndEvent

	#tag Event
		Sub StartDelete(Source as WinPhotoAcquireSourceMBS)
		  log CurrentMethodName+": "+Source.FriendlyName
		End Sub
	#tag EndEvent

	#tag Event
		Sub StartEnumeration(Source as WinPhotoAcquireSourceMBS)
		  log CurrentMethodName+": "+Source.FriendlyName
		End Sub
	#tag EndEvent

	#tag Event
		Sub StartItemDelete(ItemIndex as Integer, Item as WinPhotoAcquireItemMBS)
		  log CurrentMethodName+": "+item.ItemName
		End Sub
	#tag EndEvent

	#tag Event
		Sub StartItemTransfer(ItemIndex as Integer, Item as WinPhotoAcquireItemMBS)
		  log CurrentMethodName+": "+item.ItemName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub StartTransfer(Source as WinPhotoAcquireSourceMBS)
		  log CurrentMethodName + ": "+Source.FriendlyName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub UpdateDeletePercent(Percent as Integer)
		  log CurrentMethodName + ": "+str(Percent)
		End Sub
	#tag EndEvent

	#tag Event
		Sub UpdateTransferPercent(Overall as Boolean, Percent as Integer)
		  log CurrentMethodName + ": "+str(Percent)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Log(s as string)
		  List.AddRow s
		  List.ScrollPosition = list.ListCount
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FoundCounter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		list As listbox
	#tag EndProperty

	#tag Property, Flags = &h0
		SkipCounter As Integer
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
		#tag ViewProperty
			Name="FoundCounter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SkipCounter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
