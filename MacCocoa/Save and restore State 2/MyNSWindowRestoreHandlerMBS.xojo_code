#tag Class
Protected Class MyNSWindowRestoreHandlerMBS
Inherits NSWindowRestoreHandlerMBS
	#tag Event
		Sub RestoreWindow(identifier as string, state as NSCoderMBS)
		  System.DebugLog CurrentMethodName
		  System.DebugLog identifier
		  
		  dim s as string = state.decodeString("lastrun")
		  System.DebugLog "Got text: "+s
		  app.lastrun = s
		  
		  MainWindow.Listbox1.AddRow "Got State with Lastrun="+s
		  
		  // pass back details
		  self.SetRestoredWindow MainWindow
		  self.SetError nil
		  
		  
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
