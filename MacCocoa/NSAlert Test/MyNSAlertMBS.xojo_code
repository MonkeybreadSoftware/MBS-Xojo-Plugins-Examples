#tag Class
Protected Class MyNSAlertMBS
Inherits NSAlertMBS
	#tag Event
		Sub SheetDidEnd(returnCode as integer)
		  MainWindow.result.Text = str(returnCode) + ": " + TextForReturnCode(returnCode)+": "+buttonText(returnCode)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function ShowHelp() As boolean
		  MsgBox "Show my help"
		  Return true
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function buttonText(n as integer) As string
		  dim buttons() as Variant = me.buttons
		  Select case n
		  case NSAlertMBS.NSAlertFirstButtonReturn
		    dim b as NSButtonMBS = buttons(0)
		    Return b.title
		  case NSAlertMBS.NSAlertSecondButtonReturn
		    dim b as NSButtonMBS = buttons(1)
		    Return b.title
		  case NSAlertMBS.NSAlertThirdButtonReturn
		    dim b as NSButtonMBS = buttons(2)
		    Return b.title
		  else
		    Return "?"
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function TextForReturnCode(n as integer) As string
		  Select case n
		  case NSAlertMBS.NSAlertFirstButtonReturn
		    Return "First Button"
		  case NSAlertMBS.NSAlertSecondButtonReturn
		    Return "Second Button"
		  case NSAlertMBS.NSAlertThirdButtonReturn
		    Return "Third Button"
		  else
		    Return "?"
		  end Select
		End Function
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
