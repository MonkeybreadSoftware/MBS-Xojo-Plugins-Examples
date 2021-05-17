#tag Class
Protected Class MySDAVAssetExportSessionMBS
Inherits SDAVAssetExportSessionMBS
	#tag Event
		Sub exportAsynchronouslyCompleted()
		  
		  If (Me.status = StatusCompleted) Then
		    
		    MsgBox "Video export succeeded"
		    
		  Elseif (Me.status = StatusCancelled) then
		    
		    MsgBox "Video export cancelled"
		    
		  Else
		    
		    MsgBox "Video export failed with error: " + me.error.localizedDescription
		    
		  end if
		  
		  
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
