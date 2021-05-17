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


	#tag Method, Flags = &h0
		Function CalcHeight(MediaBox as DynaPDFRectMBS, CropBox as DynaPDFRectMBS, destwidth as double) As double
		  dim bbox as DynaPDFRectMBS
		  
		  if CropBox = nil then
		    bbox = MediaBox
		  else
		    bbox = CropBox
		  end if
		  
		  dim w as double = bbox.Right - bbox.Left
		  dim h as double = bbox.Top - bbox.Bottom
		  
		  return me.CalcWidthHeight(w, h, DestWidth, 0.0)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlaceCentered(tmpl as integer, MediaBox as DynaPDFRectMBS, CropBox as DynaPDFRectMBS, DestX as double, DestY as double, DestWidth as double, DestHeight as double) As boolean
		  dim bbox as DynaPDFRectMBS
		  dim x, y, w, h, sx as Double
		  dim haveCropBox as Boolean
		  
		  if CropBox = nil then
		    bbox        = MediaBox
		    haveCropBox = false
		  else
		    bbox        = CropBox
		    haveCropBox = true
		  end if
		  
		  w  = bbox.Right - bbox.Left
		  h  = bbox.Top - bbox.Bottom
		  sx = DestWidth / w
		  if (h * sx <= DestHeight) then
		    
		    h = h * sx
		    w = (MediaBox.Right - MediaBox.Left) * sx
		    x = DestX - bbox.Left   * sx
		    y = DestY - bbox.Bottom * sx + (DestHeight - h) / 2.0
		    if (haveCropBox) then
		      
		      call me.SaveGraphicState
		      call me.Rectangle(DestX, DestY, DestWidth, DestHeight, me.kfmNoFill)
		      call me.ClipPath(me.kcmWinding, me.kfmNoFill)
		      call me.PlaceTemplate( Tmpl, x, y, w, 0.0)
		      return me.RestoreGraphicState
		    else
		      return me.PlaceTemplate( Tmpl, x, y, w, 0.0)
		    end if
		  else
		    
		    sx = DestHeight / h
		    w = w * sx
		    h = (MediaBox.Top - MediaBox.Bottom) * sx
		    x = DestX - bbox.Left   * sx + (DestWidth - w) / 2.0
		    y = DestY - bbox.Bottom * sx
		    
		    if (haveCropBox) then
		      
		      call me.SaveGraphicState
		      call me.Rectangle(DestX, DestY, DestWidth, DestHeight, me.kfmNoFill)
		      call me.ClipPath( me.kcmWinding, me.kfmNoFill)
		      call me.PlaceTemplate( Tmpl, x, y, 0.0, h)
		      return me.RestoreGraphicState
		    else
		      return me.PlaceTemplate( Tmpl, x, y, 0.0, h)
		    end if
		  end if
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
