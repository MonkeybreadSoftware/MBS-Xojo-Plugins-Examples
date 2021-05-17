#tag Class
Protected Class MySUUpdater
Inherits SUUpdaterMBS
	#tag Event
		Sub didAbortWithError(error as NSErrorMBS)
		  Log CurrentMethodName
		  
		  Log "Errorcode: "+Str(error.Code)
		  Log "LocalizedDescription: "+error.LocalizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didDownloadUpdate(item as SUAppcastItemMBS)
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub didExtractUpdate(item as SUAppcastItemMBS)
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFindValidUpdate(update as SUAppcastItemMBS)
		  Log CurrentMethodName
		  log "Title: "+update.title
		  log "Version: "+update.displayVersionString
		  'log "DSASignature: "+update.DSASignature
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub didFinishLoadingAppcast(update as SUAppcastMBS)
		  log CurrentMethodName
		  
		  'MsgBox update.incrementalData
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub failedToDownloadUpdate(item as SUAppcastItemMBS, error as NSErrorMBS)
		  Log CurrentMethodName
		  Log "Errorcode: "+Str(error.Code)
		  Log "LocalizedDescription: "+error.LocalizedDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub updaterDidNotFindUpdate()
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub willDownloadUpdate(item as SUAppcastItemMBS, request as Variant)
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub willExtractUpdate(item as SUAppcastItemMBS)
		  log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub willInstallUpdate(update as SUAppcastItemMBS)
		  log CurrentMethodName
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub log(s as string)
		  System.DebugLog s
		  
		  window1.List.AddRow s
		  
		  
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
