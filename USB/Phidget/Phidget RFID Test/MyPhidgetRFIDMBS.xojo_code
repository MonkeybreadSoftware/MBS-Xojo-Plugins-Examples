#tag Class
Protected Class MyPhidgetRFIDMBS
Inherits PhidgetRFIDMBS
	#tag Event
		Sub Attach()
		  
		  MainWindow.ListBox1.AddRow "Attached"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Detach()
		  
		  MainWindow.ListBox1.AddRow "Detached"
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(errorCode as integer, errorDescription as string)
		  MainWindow.ListBox1.AddRow "Error "+str(errorCode)+": "+errorDescription
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Tag(tag as memoryblock)
		  
		  dim a As String
		  a= Left(EncodingToHexMBS(tag),10)
		  MainWindow.ListBox1.AddRow "Got tag on antena : " + Str(me.GetSerialNumber) +"  : " +a
		  
		  MainWindow.tagID = a
		  
		  setOutputState 1,True
		  
		  
		  MainWindow.EffEcran
		End Sub
	#tag EndEvent

	#tag Event
		Sub TagLost(tag as memoryblock)
		  
		  setOutputState 1,False
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
