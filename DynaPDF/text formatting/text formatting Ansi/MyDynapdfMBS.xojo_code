#tag Class
Protected Class MyDynapdfMBS
Inherits DynapdfMBS
	#tag Event
		Function Error(ErrorCode as integer, ErrorMessage as string, ErrorType as integer) As integer
		  // output all messages on the console:
		  System.DebugLog str(ErrorCode)+": "+ErrorMessage
		  
		  // and display dialog:
		  Dim d as New MessageDialog //declare the MessageDialog object
		  Dim b as MessageDialogButton //for handling the result
		  
		  d.icon=MessageDialog.GraphicCaution //display warning icon
		  d.ActionButton.Caption="Continue"
		  d.CancelButton.Visible=True    //show the Cancel button
		  
		  // a warning or an error?
		  
		  if BitAnd(ErrorType, me.kE_WARNING) = me.kE_WARNING then
		    // if user decided to ignore, we'll ignore
		    if IgnoreWarnings then Return 0
		    
		    d.Message="A warning occurred while processing your PDF code."
		    
		    // we add a third button to display all warnings
		    d.AlternateActionButton.Caption = "Ignore warnings"
		    d.AlternateActionButton.Visible = true
		  else
		    d.Message="An error occurred while processing your PDF code."
		  end if
		  
		  d.Explanation = str(ErrorCode)+": "+ErrorMessage
		  
		  b=d.ShowModal //display the dialog
		  
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    Return 0 // ignore
		  Case d.AlternateActionButton
		    IgnoreWarnings = true
		    Return 0 // ignore
		  Case d.CancelButton
		    Return -1 // stop
		  End select
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Function PageBreak(LastPosX as double, LastPosY as double, PageBreak as boolean) As integer
		  
		  dim r as TOutRect = current
		  
		  call SetPageCoords(kpcTopDown) // we use top down coordinates
		  r.Column=r.Column+1
		  
		  // PageBreak is true if the string contains a page break tag (see help file for further information).
		  if (not PageBreak and r.Column < r.ColCount) then
		    // Calulate the x-coordinate of the column
		    dim posX as double = r.PosX + r.Column * (r.Width + r.Distance)
		    // change the output rectangle, do not close the page!
		    call SetTextRect(posX, r.PosY, r.Width, r.Height)
		    return 0 // we do not change the alignment
		  else
		    // the page is full, close the current one and append a new page
		    call EndPage
		    call Append
		    call SetTextRect(r.PosX, r.PosY, r.Width, r.Height)
		    r.Column = 0
		    return 0
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		current As toutRect
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoreWarnings As Boolean
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
