#tag Class
Protected Class MyDynaPDFMBS
Inherits DynaPDFMBS
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
		Sub InitProgress(ProgType as integer, MaxCount as integer)
		  ProgressMaxCount = MaxCount
		  ProgressPrinting = (ProgType = kptPrintPage)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function Progress(ActivePage as integer) As integer
		  if printing then
		    
		    if g <> nil then
		      // draw something on each page
		      dim m as string = "Xojo Page "+str(ActivePage-1) + " of " + str(ProgressMaxCount)
		      g.DrawString m, 50, 50
		      
		      // next page?
		      if ActivePage > 1 then
		        // start new page
		        'System.DebugLog "nextpage"
		        g.NextPage
		      end if
		    end if
		    
		    // now we are on ActivePage
		    
		    
		    // show progress
		    CurrentPage = ActivePage
		    app.YieldToNextThread
		    
		  end if
		  
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		CurrentPage As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		g As Graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		IgnoreWarnings As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		mode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberOfPages As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PrinterFlags As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PrinterHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PrinterMargin As DynaPDFRectMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		printerName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		printing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		PrintingDone As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressMaxCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgressPrinting As Boolean
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
		#tag ViewProperty
			Name="printing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentPage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumberOfPages"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrinterHandle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrinterFlags"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PrintingDone"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProgressPrinting"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ProgressMaxCount"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="printerName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
