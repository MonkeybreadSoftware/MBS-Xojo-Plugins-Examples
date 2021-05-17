#tag Class
Protected Class MyScriptCallback
Inherits WebScriptCallbackMBS
	#tag Event
		Function Callback(Name as string) As variant
		  System.DebugLog "Function: "+name
		  
		  Select case name
		  case "MsgBox"
		    MsgBox me.ArgumentValue(0)
		  case "PrintDialog"
		    call MainWindow.web.PrintDialogMBS
		  case "SetText"
		    MainWindow.Output.text=ArgumentValue(0)
		  end Select
		  
		End Function
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
