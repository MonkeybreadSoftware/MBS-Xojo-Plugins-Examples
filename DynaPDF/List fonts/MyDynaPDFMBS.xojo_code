#tag Class
Protected Class MyDynaPDFMBS
Inherits DynaPDFMBS
	#tag Event
		Function EnumHostFontEx(FamilyName as string, PostScriptName as string, Style as integer, BaseType as integer, Embeddable as boolean, Flags as integer, FilePath as string) As integer
		  dim l as listbox
		  dim styles(-1) as string
		  
		  l=MainWindow.Liste
		  l.AddRow FamilyName
		  l.Cell(l.LastIndex,1)=PostScriptName
		  
		  if BitwiseAnd(style,kfsItalic)<>0 then
		    styles.Append "Italic"
		  end if
		  
		  if BitwiseAnd(style,kfsStriked)<>0 then
		    styles.Append "Striked"
		  end if
		  
		  if BitwiseAnd(style,kfsVerticalMode)<>0 then
		    styles.Append "VerticalMode"
		  end if
		  
		  if BitwiseAnd(style,kfsUnderlined)<>0 then
		    styles.Append "Underlined"
		  end if
		  
		  dim width as integer = WidthFromStyle(style)
		  styles.Append str(width)
		  
		  dim weight as integer = WeightFromStyle(style)
		  styles.Append str(weight)
		  
		  if style=kfsNone then
		    l.Cell(l.LastIndex,2)="None"
		  elseif UBound(styles)>=0 then
		    l.Cell(l.LastIndex,2)=Join(styles,", ")
		  else
		    l.Cell(l.LastIndex,2)=str(Style)
		  end if
		  
		  Select case BaseType
		  case kfbtTrueType
		    l.Cell(l.LastIndex,3)="TrueType"
		  case kfbtType1
		    l.Cell(l.LastIndex,3)="Type 1"
		  case kfbtOpenType
		    l.Cell(l.LastIndex,3)="OpenType"
		  case kfbtStdFont
		    l.Cell(l.LastIndex,3)="StdFont"
		  else
		    l.Cell(l.LastIndex,3)=str(BaseType)
		  end Select
		  
		  if Embeddable then
		    l.Cell(l.LastIndex,4)="yes"
		  else
		    l.Cell(l.LastIndex,4)="no"
		  end if
		  
		  l.Cell(l.LastIndex,5)=FilePath
		  
		  
		End Function
	#tag EndEvent

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
