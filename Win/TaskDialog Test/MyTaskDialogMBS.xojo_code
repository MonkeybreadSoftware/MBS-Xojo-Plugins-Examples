#tag Class
Protected Class MyTaskDialogMBS
Inherits TaskDialogMBS
	#tag Event
		Function ButtonClicked(ID as Integer) As boolean
		  logwindow.Log CurrentMethodName+" ID: "+str(id)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  logwindow.Log CurrentMethodName
		End Sub
	#tag EndEvent

	#tag Event
		Sub Constructed()
		  logwindow.Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandButtonClicked(Expanded as Boolean)
		  logwindow.Log CurrentMethodName+" Expanded: "+str(expanded)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Help()
		  logwindow.Log CurrentMethodName
		  
		  
		  MsgBox "Sorry, there is no help yet."
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub HyperlinkClicked(link as string)
		  logwindow.Log CurrentMethodName
		  logwindow.Log "Link: "+link
		  
		  ShowURL link
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Navigated()
		  logwindow.Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  logwindow.Log CurrentMethodName
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function RadioButtonClicked(ID as Integer) As boolean
		  logwindow.Log CurrentMethodName+" ID: "+str(id)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Timer(Time as Integer)
		  logwindow.Log CurrentMethodName+" Time: "+str(time)
		  
		  if ProgressbarState > 0 then
		    if me.ProgressbarValue = me.ProgressbarMax then
		      // done
		    else
		      me.ProgressbarValue = me.ProgressbarValue + 1
		    end if
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub VerificationClicked(Checked as Boolean)
		  logwindow.Log CurrentMethodName+" Checked: "+str(Checked)
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		logWindow As MainWindow
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
