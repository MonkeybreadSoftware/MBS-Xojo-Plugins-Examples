#tag Class
Protected Class MyCGPSConverter
Inherits CGPSConverterMBS
	#tag Event
		Sub BeginDocument()
		  system.debuglog "BeginDocument"
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub BeginPage(PageNumber as integer, PageInfo as Dictionary)
		  system.debuglog "BeginPage "+str(PageNumber)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndDocument(success as boolean)
		  system.debuglog "EndDocument"
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub EndPage(PageNumber as integer, PageInfo as Dictionary)
		  system.debuglog "EndPage"
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Finished()
		  system.debuglog "Finished"
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Message(message as string)
		  system.debuglog "Message "
		  System.DebugLog message
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Progress()
		  system.debuglog "Progress"
		  
		  
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
