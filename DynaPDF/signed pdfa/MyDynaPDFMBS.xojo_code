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
		Function OnReplaceICCProfile(Type as integer, ColorSpace as integer) As integer
		  
		  Select case type
		    
		  case kictGray
		    break
		  case kictRGB
		    
		    dim iccpath as folderitem = app.FindFile("ColorMatchRGB.icc")
		    
		    dim r as integer = ReplaceICCProfile(ColorSpace, iccpath)
		    
		  case kictCMYK
		    
		    Break
		  else
		    break
		  end Select
		End Function
	#tag EndEvent


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
