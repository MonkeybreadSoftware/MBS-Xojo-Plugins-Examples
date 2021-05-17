#tag Class
Protected Class MyDynapdfMBS
Inherits DynapdfMBS
	#tag Event
		Function Error(ErrorCode as integer, ErrorMessage as string, ErrorType as integer) As integer
		  // output all messages on the console:
		  MsgBox str(ErrorCode)+": "+ErrorMessage
		  
		  
		  IgnoreWarnings = true
		  Return 0 // ignore
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PageBreak(LastPosX as double, LastPosY as double, PageBreak as boolean) As integer
		  call endpage
		  call append
		  call SetPageCoords(kpcTopDown) // we use top down coordinates
		  call placeTemplate(Template, 0, 0, getpagewidth,getpageheight) // scale to fit
		  return 0
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		IgnoreWarnings As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		template As integer
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
			Name="template"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IgnoreWarnings"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
