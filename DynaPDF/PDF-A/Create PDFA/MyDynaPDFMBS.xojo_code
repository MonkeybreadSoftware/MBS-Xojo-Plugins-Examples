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
		Function OnFontNotFound(PDFFontRef as integer, FontName as string, Style as integer, StdFontIndex as integer, IsSymbolFont as boolean) As integer
		  // Here you could use your own mapping table.
		  // In this example we replace the font simply with Arial
		  
		  if (WeightFromStyle(Style) < 500) then
		    // Only the weights 500 and 700 of Arial are installed
		    // by default. If you have also light variants then it is
		    // not required to change the style.
		    Style = BitwiseAnd(Style, &h0F)
		    Style = BitwiseOr(Style, kfsRegular)
		  end if
		  
		  return ReplaceFont(PDFFontRef, "Arial", Style, true)
		  
		End Function
	#tag EndEvent

	#tag Event
		Function OnReplaceICCProfile(Type as integer, ColorSpace as integer) As integer
		  // provide missing ICC Profiles to DynaPDF
		  
		  // The ICC profiles which should normally be configured by the user.
		  
		  dim filename as string
		  
		  Select case type
		  case me.kictGray
		    filename = "Generic Gray Profile.icc"
		  case me.kictRGB
		    filename = "Generic RGB Profile.icc"
		  case me.kictCMYK
		    filename = "Generic CMYK Profile.icc"
		  case me.kictLab
		    // not yet needed, but maybe in future
		    filename = "Generic Lab Profile.icc"
		  else
		    break
		    Return -1 // new type we don't know?
		  end Select
		  
		  dim f as FolderItem = FindFile(filename)
		  
		  if f = nil or not f.Exists then
		    // file missing?
		    return -1
		  end if
		  
		  
		  dim e as integer = ReplaceICCProfile(ColorSpace, f)
		  if e < 0 then
		    // failed
		    break
		  end if
		  
		  // pass along success or failure
		  Return e
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FindFile(name as string) As FolderItem
		  // Look for file in parent folders from executable on
		  
		  dim parent as FolderItem = app.ExecutableFile.Parent
		  
		  while parent<>Nil
		    
		    dim file as FolderItem = parent.Child(name)
		    
		    if file<>Nil and file.Exists then
		      Return file
		    end if
		    
		    parent = parent.Parent
		  wend
		  
		End Function
	#tag EndMethod


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
